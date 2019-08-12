﻿using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class Customers
    {
        public Customers()
        {
            Id = Guid.NewGuid();
            AddressBook = new HashSet<AddressBook>();
            Cart = new HashSet<Cart>();
            CartAttributes = new HashSet<CartAttributes>();
            CustomerInfo = new HashSet<CustomerInfo>();
            Orders = new HashSet<Orders>();
        }

        public Guid Id { get; set; }
        public string Gender { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public DateTime Dob { get; set; }
        public string Email { get; set; }
        public Guid? Mainaddressid { get; set; }
        public string Telephone { get; set; }
        public string Fax { get; set; }
        public string Password { get; set; }
        public bool Newsletteropted { get; set; }

        public virtual ICollection<AddressBook> AddressBook { get; set; }
        public virtual ICollection<Cart> Cart { get; set; }
        public virtual ICollection<CartAttributes> CartAttributes { get; set; }
        public virtual ICollection<CustomerInfo> CustomerInfo { get; set; }
        public virtual ICollection<Orders> Orders { get; set; }
    }
}
