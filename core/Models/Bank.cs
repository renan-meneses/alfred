using System;
using System.Collections.Generic;

namespace core.Models
{
    public class Bank
    {
        public int Id { get; set; }
        public string Account { get; set; }
        public char Digit { get; set; }
        public string Type { get; set; }
        public string Sender { get; set; }
        public int UserId { get; set; }
        public decimal Balance { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public User User { get; set; }
    }
}
