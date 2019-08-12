using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class ConfigurationGroup
    {
        public ConfigurationGroup()
        {
            Configuration = new HashSet<Configuration>();
        }

        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int Order { get; set; }
        public sbyte Active { get; set; }

        public virtual ICollection<Configuration> Configuration { get; set; }
    }
}
