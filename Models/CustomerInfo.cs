﻿using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class CustomerInfo
    {
        public Guid Id { get; set; }
        public Guid Customerid { get; set; }
        public DateTime Lastlogon { get; set; }
        public int Logoncount { get; set; }
        public DateTime Accountcreatedon { get; set; }
        public DateTime Lastmodifiedon { get; set; }

        public virtual Customers Customer { get; set; }
    }
}
