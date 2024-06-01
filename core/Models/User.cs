using System;
using System.Collections.Generic;

namespace core.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Lastname { get; set; }
        public string Phone { get; set; }
        public DateTime? Birthday { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public ICollection<Ticket> Tickets { get; set; }
        public ICollection<Bank> Banks { get; set; }
    }
}
