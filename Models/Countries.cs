﻿using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class Countries
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Isocode { get; set; }
        public Guid Currencyid { get; set; }

        public virtual Currencies Currency { get; set; }
    }
}
