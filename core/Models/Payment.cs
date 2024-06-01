using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace core.Models
{
    public class Payment
    {
        public int Id { get; set; } = default;
        public decimal Value { get; set; } = default;
        public DateTime? PayDate { get; set; } = default;
        public int TicketId { get; set; } = default;
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

        public Ticket Ticket { get; set; }
    }


}
