using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class WhoIsOnline
    {
        public Guid Id { get; set; }
        public string Fullname { get; set; }
        public Guid Sessionid { get; set; }
        public string Ipaddress { get; set; }
        public DateTime Timeentry { get; set; }
        public string Lastpageurl { get; set; }
    }
}
