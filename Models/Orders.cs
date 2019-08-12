using System;
using System.Collections.Generic;

namespace coremerce.Models
{
    public partial class Orders
    {
        public Orders()
        {
            OrderProductAttributes = new HashSet<OrderProductAttributes>();
            OrdersProducts = new HashSet<OrdersProducts>();
        }

        public Guid Id { get; set; }
        public Guid Customerid { get; set; }
        public string Customername { get; set; }
        public string CustomerStreetaddress { get; set; }
        public string Customercity { get; set; }
        public string Customerstate { get; set; }
        public string Customerpostalcode { get; set; }
        public string Customercountry { get; set; }
        public string Customertelephone { get; set; }
        public string Customeremail { get; set; }
        public string Deliveryname { get; set; }
        public string Deliverystreetaddress { get; set; }
        public string Deliverycity { get; set; }
        public string Deliverystate { get; set; }
        public string Deliverypostalcode { get; set; }
        public string Deliverycountry { get; set; }
        public string Paymentmethodid { get; set; }
        public DateTime Latsmodified { get; set; }
        public DateTime Datepurcahsed { get; set; }
        public decimal? Shippingcost { get; set; }
        public string Shipingmethodid { get; set; }
        public string Orderstatus { get; set; }
        public DateTime Orderdatefinished { get; set; }
        public string Comments { get; set; }
        public string Currency { get; set; }
        public decimal CurrencyValue { get; set; }

        public virtual Customers Customer { get; set; }
        public virtual ICollection<OrderProductAttributes> OrderProductAttributes { get; set; }
        public virtual ICollection<OrdersProducts> OrdersProducts { get; set; }
    }
}
