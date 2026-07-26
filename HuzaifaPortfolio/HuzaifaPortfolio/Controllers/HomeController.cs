using Microsoft.AspNetCore.Mvc;
using HuzaifaPortfolio.Models;
using System.Collections.Generic;

namespace HuzaifaPortfolio.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            var viewModel = new PortfolioViewModel
            {
                Name = "Huzaifa Shahbaz",
                Title = "Computer Engineer",
                Description = "Specializing in Embedded Systems, IoT Development, and Firmware Programming with hands-on experience in PCB design, circuit analysis, and mobile app development.",
                Email = "huzaifashahbaz767@gmail.com",
                Phone = "03015606731",
                Location = "Rawalpindi, Punjab, Pakistan",
                LinkedIn = "https://www.linkedin.com/in/huzaifa-shahbaz-0aab8b230",
                GitHub = "https://github.com/huzaifa786802",
                Instagram = "https://www.instagram.com/huzaifa.shahbaz.786",
                Facebook = "https://www.facebook.com/huzaifa.shahbaz.7758",
                
                Skills = new List<SkillCategory>
                {
                    new SkillCategory 
                    { 
                        Name = "Programming Languages", 
                        Skills = new[] { "C/C++", "Python", "Java", "Verilog HDL", "HTML/CSS", "PHP", "XML" } 
                    },
                    new SkillCategory 
                    { 
                        Name = "Hardware & Design", 
                        Skills = new[] { "PCB Design", "Embedded Systems", "AutoCAD", "Circuit Analysis" } 
                    },
                    new SkillCategory 
                    { 
                        Name = "Development Tools", 
                        Skills = new[] { "Arduino IDE", "ESP-IDF", "Android Studio", "VS Code", "MATLAB", "Proteus", "Xilinx Vivado" } 
                    },
                    new SkillCategory 
                    { 
                        Name = "Databases & Networks", 
                        Skills = new[] { "MySQL", "Cisco Packet Tracer", "Network Design" } 
                    }
                },
                
                Experience = new List<Experience>
                {
                    new Experience
                    {
                        Title = "Trainee - R&D Division",
                        Company = "MachaDev, Pakistan",
                        Period = "Sep 2025 - Nov 2025",
                        Description = new[]
                        {
                            "Working on Smart Water Monitoring & Purification Device under R&D division",
                            "Developing firmware using ESP-IDF for IoT-based water quality measurement modules",
                            "Conducting online and experimental research on purification technologies and water quality sensors",
                            "Managing documentation and project tracking using ClickUp"
                        }
                    },
                    new Experience
                    {
                        Title = "Engineering Intern",
                        Company = "MachaDev, Pakistan",
                        Period = "Jul 2025 - Present",
                        Description = new[]
                        {
                            "Assisted in IoT and embedded system development projects",
                            "Contributed to firmware coding and hardware-software integration"
                        }
                    },
                    new Experience
                    {
                        Title = "Engineering Intern",
                        Company = "RISETECH, Pakistan",
                        Period = "Jun 2024 - Aug 2024",
                        Description = new[]
                        {
                            "Supported team in PCB design, network configuration, and circuit simulations",
                            "Conducted testing and debugging for embedded projects"
                        }
                    }
                },
                
                Projects = new List<Project>
                {
                    new Project
                    {
                        Name = "IoT-Based Air Quality Index Meter System (FYP)",
                        Description = "Real-time air quality monitoring system using ESP32, MQ sensors, and Firebase for data logging and visualization.",
                        Technologies = new[] { "ESP32", "MQ Sensors", "Firebase", "IoT" }
                    },
                    new Project
                    {
                        Name = "Smart Water Monitoring & Purification Device",
                        Description = "Advanced water quality monitoring system with ESP32 and pH sensors for real-time water analysis.",
                        Technologies = new[] { "ESP32", "pH Sensor", "ESP-IDF", "IoT" }
                    },
                    new Project
                    {
                        Name = "Lung Segmentation from Chest X-rays",
                        Description = "Medical imaging analysis system for automated lung segmentation using Python and MATLAB.",
                        Technologies = new[] { "Python", "MATLAB", "Image Processing" }
                    },
                    new Project
                    {
                        Name = "Prayer Alarm Mobile App",
                        Description = "Android application for prayer time notifications developed with Java and XML.",
                        Technologies = new[] { "Java", "XML", "Android Studio" }
                    },
                    new Project
                    {
                        Name = "Traffic Control System",
                        Description = "Digital system design project implementing intelligent traffic management using Xilinx Vivado.",
                        Technologies = new[] { "Verilog HDL", "Xilinx Vivado", "Digital Design" }
                    },
                    new Project
                    {
                        Name = "Online Library Management System",
                        Description = "Full-stack web application for library operations with user authentication and book management.",
                        Technologies = new[] { "MySQL", "HTML/CSS", "PHP" }
                    },
                    new Project
                    {
                        Name = "4-bit Multiprocessor Design",
                        Description = "Verilog HDL-based processor design demonstrating computer architecture principles.",
                        Technologies = new[] { "Verilog HDL", "Digital Logic" }
                    },
                    new Project
                    {
                        Name = "Speech Recognition System",
                        Description = "Python-based voice recognition system for command processing.",
                        Technologies = new[] { "Python", "Machine Learning" }
                    }
                }
            };

            return View(viewModel);
        }

        // SEO: Generate sitemap.xml
        [Route("sitemap.xml")]
        public IActionResult SitemapXml()
        {
            var baseUrl = $"{Request.Scheme}://{Request.Host}";
            var sitemap = $@"<?xml version=""1.0"" encoding=""UTF-8""?>
<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">
    <url>
        <loc>{baseUrl}/</loc>
        <lastmod>{DateTime.UtcNow:yyyy-MM-dd}</lastmod>
        <changefreq>weekly</changefreq>
        <priority>1.0</priority>
    </url>
</urlset>";

            return Content(sitemap, "application/xml");
        }

        // SEO: Generate robots.txt
        [Route("robots.txt")]
        public IActionResult RobotsTxt()
        {
            var baseUrl = $"{Request.Scheme}://{Request.Host}";
            var robots = $@"User-agent: *
Allow: /
Sitemap: {baseUrl}/sitemap.xml";

            return Content(robots, "text/plain");
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
