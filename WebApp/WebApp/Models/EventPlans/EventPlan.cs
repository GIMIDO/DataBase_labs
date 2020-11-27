﻿using System;
using System.ComponentModel.DataAnnotations;

namespace WebApp.Models
{
    // Класс, представляющий собой модель записи в таблице Планы событий
    public class EventPlan
    {
        [Key]
        public int Id { get; set; }
        public int OrganizationId { get; set; }
        public int EventId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int PlanVolume { get; set; }
        public decimal PlanCost { get; set; }
        public double EconomicEffect { get; set; }
        public int EmployeeId { get; set; }
    }
}
