using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace HuzaifaPortfolio.Middleware
{
    /// <summary>
    /// Sets recommended security response headers and removes identifying headers.
    /// </summary>
    public class SecurityHeadersMiddleware
    {
        private readonly RequestDelegate _next;

        public SecurityHeadersMiddleware(RequestDelegate next) => _next = next;

        public async Task Invoke(HttpContext context)
        {
            // Remove Server header if present
            context.Response.Headers.Remove("Server");

            // Prevent MIME sniffing
            context.Response.Headers["X-Content-Type-Options"] = "nosniff";

            // Prevent clickjacking
            context.Response.Headers["X-Frame-Options"] = "SAMEORIGIN";

            // Referrer policy
            context.Response.Headers["Referrer-Policy"] = "no-referrer-when-downgrade";

            // Basic permissions policy (adjust as needed)
            context.Response.Headers["Permissions-Policy"] = "geolocation=(), microphone=()";

            // Strong Content-Security-Policy — adjust sources to your actual CDN/assets
            var csp = "default-src 'self'; " +
                      "script-src 'self' 'unsafe-inline' https://cdnjs.cloudflare.com; " +
                      "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; " +
                      "font-src 'self' https://fonts.gstatic.com; " +
                      "img-src 'self' data:; " +
                      "object-src 'none'; " +
                      "base-uri 'self'; " +
                      "frame-ancestors 'none';";
            context.Response.Headers["Content-Security-Policy"] = csp;

            // Preventing XSS in older browsers
            context.Response.Headers["X-XSS-Protection"] = "1; mode=block";

            await _next(context);
        }
    }

    public static class SecurityHeadersExtensions
    {
        public static IApplicationBuilder UseSecurityHeaders(this IApplicationBuilder app)
            => app.UseMiddleware<SecurityHeadersMiddleware>();
    }
}