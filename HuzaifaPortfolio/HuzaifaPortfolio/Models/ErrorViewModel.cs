namespace HuzaifaPortfolio.Models
{
    public class PortfolioViewModel
    {
        public string Name { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string Location { get; set; } = string.Empty;
        public string LinkedIn { get; set; } = string.Empty;
        public string GitHub { get; set; } = string.Empty;
        public string Instagram { get; set; } = string.Empty;
        public string Facebook { get; set; } = string.Empty;
        public List<SkillCategory> Skills { get; set; } = new();
        public List<Experience> Experience { get; set; } = new();
        public List<Project> Projects { get; set; } = new();
    }

    public class SkillCategory
    {
        public string Name { get; set; } = string.Empty;
        public string[] Skills { get; set; } = Array.Empty<string>();
    }

    public class Experience
    {
        public string Title { get; set; } = string.Empty;
        public string Company { get; set; } = string.Empty;
        public string Period { get; set; } = string.Empty;
        public string[] Description { get; set; } = Array.Empty<string>();
    }

    public class Project
    {
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string[] Technologies { get; set; } = Array.Empty<string>();
    }
}

