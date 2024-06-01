using System;
using System.Collections.Generic;

namespace core.Models
{
    public class Payment
    {
        public int Id { get; set; }
        public decimal Value { get; set; }
        public DateTime? PayDate { get; set; }
        public int TicketId { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public Ticket Ticket { get; set; }
    }


}
