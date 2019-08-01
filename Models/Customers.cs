using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class Customers
    {
        public string Id { get; set; }
        public string Gender { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public DateTime Dob { get; set; }
        public string Email { get; set; }
        public string Mainaddressid { get; set; }
        public string Telephone { get; set; }
        public string Fax { get; set; }
        public string Password { get; set; }
        public byte Newsletteropted { get; set; }
    }
}
