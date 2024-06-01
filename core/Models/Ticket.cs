using System;
using System.Collections.Generic;

namespace core.Models
{
    public class Ticket
    {
        public int Id { get; set; }
        public decimal Value { get; set; }
        public DateTime? Maturity { get; set; }
        public string Issuer { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public User User { get; set; }
        public ICollection<Payment> Payments { get; set; }
    }

}
