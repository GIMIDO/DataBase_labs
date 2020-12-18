using Microsoft.EntityFrameworkCore;

namespace Lab6.Models
{
    // Класс контекста данных
    public class ApplicationDBContext : DbContext
    {
        public DbSet<EventPlan> EventPlans { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<Organization> Organizations { get; set; }
        public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options) : base(options) 
        {
        }
    }
}
