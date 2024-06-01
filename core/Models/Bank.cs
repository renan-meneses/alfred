using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace core.Models
{
    public class Bank
    {
        public int Id { get; set; } = default;
        public string Account { get; set; } = default;
        public char Digit { get; set; } = default;
        public string Type { get; set; } = default;
        public string Sender { get; set; } = default;
        public int UserId { get; set; } = default;
        public decimal Balance { get; set; } = default;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

        public User User { get; set; }
    }
}
