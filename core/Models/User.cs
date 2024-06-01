using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace core.Models
{
    public class User
    {
        public int Id { get; set; } = default;
        public string Name { get; set; } = default;
        public string Lastname { get; set; } = default;
        public string Phone { get; set; } = default;
        public DateTime? Birthday { get; set; } = default;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

        public ICollection<Ticket> Tickets { get; set; }
        public ICollection<Bank> Banks { get; set; }
    }
}
