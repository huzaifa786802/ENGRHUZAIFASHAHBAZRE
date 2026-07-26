using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.CookiePolicy;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Threading.RateLimiting;
using HuzaifaPortfolio.Middleware;

var builder = WebApplication.CreateBuilder(args);
var env = builder.Environment;

// Services: Razor Pages (preferred) + security services
builder.Services.AddRazorPages();

// Enforce antiforgery defaults (use with forms)
builder.Services.AddAntiforgery(options =>
{
    options.HeaderName = "X-CSRF-TOKEN";
    options.Cookie.Name = ".Huzaifa.AntiForgery";
    options.Cookie.SameSite = SameSiteMode.Strict;
    options.Cookie.HttpOnly = true;
});

// Persist data protection keys (so auth cookies remain valid across restarts / scaled instances).
var keysFolder = Path.Combine(env.ContentRootPath, "DataProtection-Keys");
Directory.CreateDirectory(keysFolder);
builder.Services.AddDataProtection()
    .SetApplicationName("HuzaifaPortfolio")
    .PersistKeysToFileSystem(new DirectoryInfo(keysFolder))
    // Protect keys at rest for local dev; for production protect with Azure Key Vault or similar
    .ProtectKeysWithDpapi();

// Cookie policy: strict and secure (fixed)
builder.Services.Configure<CookiePolicyOptions>(options =>
{
    options.MinimumSameSitePolicy = SameSiteMode.Strict;
    options.HttpOnly = HttpOnlyPolicy.Always;
    options.Secure = CookieSecurePolicy.Always;
});

// Optional: basic rate limiting
builder.Services.AddRateLimiter(options =>
{
    options.AddFixedWindowLimiter("global", _ =>
        new FixedWindowRateLimiterOptions
        {
            PermitLimit = 100, // requests
            Window = System.TimeSpan.FromMinutes(1),
            QueueProcessingOrder = QueueProcessingOrder.OldestFirst,
            QueueLimit = 0
        });
    options.RejectionStatusCode = 429;
});

// CORS: restrict to allowed origins (adjust list)
builder.Services.AddCors(options =>
{
    options.AddPolicy("DefaultCorsPolicy", policy =>
    {
        policy.WithOrigins("https://your-production-domain.example")
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

var app = builder.Build();

// Production-only security
if (!app.Environment.IsDevelopment())
{
    // HSTS (preload if you understand the consequences)
    app.UseHsts();
}

// Always redirect HTTP -> HTTPS
app.UseHttpsRedirection();

// Add our secure headers middleware before static files so static responses get headers
app.UseSecurityHeaders();

// Use static files
app.UseStaticFiles();

// Use cookie policy
app.UseCookiePolicy();

// Rate limiter middleware
app.UseRateLimiter();

// Remove Server header if Kestrel or reverse proxy leaked it earlier
app.Use(async (context, next) =>
{
    context.Response.OnStarting(() =>
    {
        context.Response.Headers.Remove("Server");
        return System.Threading.Tasks.Task.CompletedTask;
    });
    await next();
});

// Use routing, auth, and endpoints
app.UseRouting();

// Authentication/Authorization (if you add Identity or other auth)
app.UseAuthentication();
app.UseAuthorization();

app.UseCors("DefaultCorsPolicy");

app.MapRazorPages();
IApplicationBuilder appBuilder = app.UseRouting();
