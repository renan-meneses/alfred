using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace core.Models
{
    public class Ticket
    {
        public int Id { get; set; }
        public decimal Value { get; set; }
        public DateTime? Maturity { get; set; }
        public string Issuer { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

        public User User { get; set; }
        public ICollection<Payment> Payments { get; set; }
    }

}
