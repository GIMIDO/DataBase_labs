using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Lab6.Models;
using Lab6.ViewModels;

namespace Lab6.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventPlansController : ControllerBase
    {
        private readonly ApplicationDBContext db;

        public EventPlansController(ApplicationDBContext applicationContext)
        {
            db = applicationContext;
        }
        // GET: api/<EventPlansController>
        [HttpGet]
        public IEnumerable<EventPlanViewModel> Get()
        {
            var eventPlans = db.EventPlans.ToList();
            List<EventPlanViewModel> eventPlanViewModels = new List<EventPlanViewModel>();
            foreach (var eventPlan in eventPlans)
            {
                eventPlanViewModels.Add(new EventPlanViewModel
                {
                    Id = eventPlan.Id,
                    EndDate = eventPlan.EndDate,
                    EconomicEffect = eventPlan.EconomicEffect,
                    EmployeeFIO = db.Employees.Where(item => item.Id == eventPlan.EmployeeId).First().FIO,
                    EventName = db.Events.Where(item => item.Id == eventPlan.EventId).First().Name,
                    OrganizationName = db.Organizations.Where(item => item.Id == eventPlan.OrganizationId).First().Name,
                    PlanCost = eventPlan.PlanCost,
                    PlanVolume = eventPlan.PlanVolume,
                    StartDate = eventPlan.StartDate
                });
            }
            return eventPlanViewModels;
        }

        // GET api/<EventPlansController>/5
        [HttpGet("{id}")]
        public EventPlan Get(int id)
        {
            return db.EventPlans.Where(item => item.Id == id).First();
        }

        // GET api/values
        [HttpGet("empl")]
        public IEnumerable<Employee> GetEmployees()
        {
            return db.Employees.ToList();
        }

        // GET api/values
        [HttpGet("event")]
        public IEnumerable<Event> GetEvents()
        {
            return db.Events.ToList();
        }

        // GET api/values
        [HttpGet("organ")]
        public IEnumerable<Organization> GetOrganizations()
        {
            return db.Organizations.ToList();
        }

        // POST api/<EventPlansController>
        [HttpPost]
        public IActionResult Post([FromBody] EventPlan model)
        {
            if (model == null)
            {
                return BadRequest();
            }
            model.Id = db.EventPlans.Select(item => item.Id).Max() + 1;
            db.EventPlans.Add(model);
            db.SaveChanges();
            return Ok(model);
        }

        // PUT api/<EventPlansController>/5
        [HttpPut]
        public IActionResult Put([FromBody] EventPlan model)
        {
            if (model == null)
            {
                return BadRequest();
            }
            EventPlan eventPlan = db.EventPlans.Where(item => item.Id == model.Id).First();
            eventPlan.EndDate = model.EndDate;
            eventPlan.StartDate = model.StartDate;
            eventPlan.EconomicEffect = model.EconomicEffect;
            eventPlan.EmployeeId = model.EmployeeId;
            eventPlan.EventId = model.EventId;
            eventPlan.OrganizationId = model.OrganizationId;
            eventPlan.PlanCost = model.PlanCost;
            eventPlan.PlanVolume = model.PlanVolume;
            db.SaveChanges();
            return Ok(model);
        }

        // DELETE api/<EventPlansController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id = 0)
        {
            if (id == 0)
            {
                return BadRequest();
            }
            EventPlan eventPlan = db.EventPlans.Where(item => item.Id == id).First();
            db.EventPlans.Remove(eventPlan);
            db.SaveChanges();
            return Ok(id);
        }
    }
}
