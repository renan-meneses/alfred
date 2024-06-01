using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace core.Models
{
    public class Ticket
    {
        public int Id { get; set; } = default;
        public decimal Value { get; set; } = default;
        public DateTime? Maturity { get; set; } = default;
        public string Issuer { get; set; } = default;
        public int UserId { get; set; } = default;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

        public User User { get; set; }
        public ICollection<Payment> Payments { get; set; }
    }

}
