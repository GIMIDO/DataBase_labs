using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    // Контроллер представления страниц записей из таблиц
    public class TableController : Controller
    {
        // Объект контекста данных
        private readonly ApplicationDBContext db;

        public TableController(ApplicationDBContext applicationContext)
        {
            db = applicationContext;
        }

        // Метод получения страницы работников.
        [ResponseCache(CacheProfileName = "Cache")]
        public IActionResult GetEmployees()
        {
            List<Employee> employees = db.Employees.ToList();
            return View(employees);
        }

        // Метод получения страницы событий.
        [ResponseCache(CacheProfileName = "Cache")]
        public IActionResult GetEvents()
        {
            List<Event> events = db.Events.ToList();
            return View(events);
        }

        // Метод получения страницы организаций.
        [ResponseCache(CacheProfileName = "Cache")]
        public IActionResult GetOrganizations()
        {
            List<Organization> organizations = db.Organizations.ToList();
            List<OrganizationViewModel> models = new List<OrganizationViewModel>();
            foreach (var organization in organizations)
            {
                var directFIO = db.Employees.Where(elem => elem.Id == organization.DirectorId).FirstOrDefault().FIO;
                var mainFIO = db.Employees.Where(elem => elem.Id == organization.MainEnergeticId).First().FIO;
                models.Add(new OrganizationViewModel { Id = organization.Id, Name = organization.Name, Address = organization.Address, TypeOfOwnership = organization.TypeOfOwnership, DirectorFIO = directFIO, MainEnergeticFIO = mainFIO });
            }
            return View(models);
        }

        // Метод получения страницы планов событий.
        [ResponseCache(CacheProfileName = "Cache")]
        public IActionResult GetEventPlans()
        {
            List<EventPlan> eventPlans = db.EventPlans.ToList();
            List<EventPlanViewModel> models = new List<EventPlanViewModel>();
            foreach (var eventPlan in eventPlans)
            {
                var organName = db.Organizations.Where(elem => elem.Id == eventPlan.OrganizationId).First().Name;
                var eventName = db.Events.Where(elem => elem.Id == eventPlan.EventId).First().Name;
                var emplFIO = db.Employees.Where(elem => elem.Id == eventPlan.EmployeeId).First().FIO;
                models.Add(new EventPlanViewModel { Id = eventPlan.Id, OrganizationName = organName, EconomicEffect = eventPlan.EconomicEffect, EventName = eventName, StartDate = eventPlan.StartDate, EndDate = eventPlan.EndDate, PlanCost = eventPlan.PlanCost, EmployeeFIO = emplFIO, PlanVolume = eventPlan.PlanVolume });
            }
            return View(models);
        }

        // Метод получения страницы источников.
        [ResponseCache(CacheProfileName = "Cache")]
        public IActionResult GetSources()
        {
            List<Source> sources = db.Sources.ToList();
            List<SourceViewModel> models = new List<SourceViewModel>();
            foreach (var source in sources)
            {
                var organName = db.Organizations.Where(elem => elem.Id == source.OrganizationId).First().Name;
                var superOrganName = db.Organizations.Where(elem => elem.Id == source.SuperiorOrganization).First().Name;
                models.Add(new SourceViewModel { Id = source.Id, OrganizationName = organName, OrganizationFunds = source.OrganizationFunds, SuperiorOrganizationName = superOrganName, SuperiorOrganizationFunds = source.SuperiorOrganizationFunds, MinistryOfEnergyFund = source.MinistryOfEnergyFund, RepublicBudget = source.RepublicBudget, LocalBudget = source.LocalBudget });
            }
            return View(models);
        }
    }
}
