using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace coremerce.Models
{
    public partial class CoremerceContext : DbContext
    {
        public CoremerceContext()
        {
        }

        public CoremerceContext(DbContextOptions<CoremerceContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AddressBook> AddressBook { get; set; }
        public virtual DbSet<Cart> Cart { get; set; }
        public virtual DbSet<CartAttributes> CartAttributes { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Configuration> Configuration { get; set; }
        public virtual DbSet<ConfigurationGroup> ConfigurationGroup { get; set; }
        public virtual DbSet<Countries> Countries { get; set; }
        public virtual DbSet<Currencies> Currencies { get; set; }
        public virtual DbSet<CustomerInfo> CustomerInfo { get; set; }
        public virtual DbSet<Customers> Customers { get; set; }
        public virtual DbSet<Manufacturers> Manufacturers { get; set; }
        public virtual DbSet<ManufacturersInfo> ManufacturersInfo { get; set; }
        public virtual DbSet<OrderProductAttributes> OrderProductAttributes { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<OrdersProducts> OrdersProducts { get; set; }
        public virtual DbSet<OrdersStatus> OrdersStatus { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductsAttributes> ProductsAttributes { get; set; }
        public virtual DbSet<ProductsOptions> ProductsOptions { get; set; }
        public virtual DbSet<ProductsOptionsValues> ProductsOptionsValues { get; set; }
        public virtual DbSet<ProductsOptionsValuesMappings> ProductsOptionsValuesMappings { get; set; }
        public virtual DbSet<Productsdetail> Productsdetail { get; set; }
        public virtual DbSet<Reviews> Reviews { get; set; }
        public virtual DbSet<ReviewsDetail> ReviewsDetail { get; set; }
        public virtual DbSet<WhoIsOnline> WhoIsOnline { get; set; }

// Code is commented because we are applying dependency injection inside startup.
//         protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//         {
//             if (!optionsBuilder.IsConfigured)
//             {
// #warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                 optionsBuilder.UseMySQL("server=localhost;port=3306;user=root;password=password11;database=Coremerce");
//             }
//         }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AddressBook>(entity =>
            {
                entity.HasIndex(e => e.Customerid)
                    .HasName("FK_AddressBook_Customers");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.City)
                    .IsRequired()
                    .HasColumnName("city")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Company)
                    .IsRequired()
                    .HasColumnName("company")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Countryid)
                    .HasColumnName("countryid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Customerid)
                    .HasColumnName("customerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Firstname)
                    .IsRequired()
                    .HasColumnName("firstname")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Lastname)
                    .IsRequired()
                    .HasColumnName("lastname")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Postalcode)
                    .IsRequired()
                    .HasColumnName("postalcode")
                    .HasColumnType("varchar(10)");

                entity.Property(e => e.State)
                    .IsRequired()
                    .HasColumnName("state")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Streetaddress)
                    .IsRequired()
                    .HasColumnName("streetaddress")
                    .HasColumnType("varchar(65)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.AddressBook)
                    .HasForeignKey(d => d.Customerid)
                    .HasConstraintName("FK_AddressBook_Customers");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.HasIndex(e => e.Customerid)
                    .HasName("FK_Cart_Customers");

                entity.HasIndex(e => e.Productid)
                    .HasName("FK_Cart_Products");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Addedon)
                    .HasColumnName("addedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Customerid)
                    .HasColumnName("customerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Finalprice)
                    .HasColumnName("finalprice")
                    .HasColumnType("decimal(10,2)");

                entity.Property(e => e.Productid)
                    .HasColumnName("productid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Qty)
                    .HasColumnName("qty")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Cart)
                    .HasForeignKey(d => d.Customerid)
                    .HasConstraintName("FK_Cart_Customers");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Cart)
                    .HasForeignKey(d => d.Productid)
                    .HasConstraintName("FK_Cart_Products");
            });

            modelBuilder.Entity<CartAttributes>(entity =>
            {
                entity.HasIndex(e => e.Customerid)
                    .HasName("FK_CartAttributes_Customers");

                entity.HasIndex(e => e.Productid)
                    .HasName("FK_CartAttributes_Products");

                entity.HasIndex(e => e.Productoptionid)
                    .HasName("FK_CartAttributes_ProductsOptions");

                entity.HasIndex(e => e.Productoptionvalueid)
                    .HasName("FK_CartAttributes_ProductsOptionsValues");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Customerid)
                    .HasColumnName("customerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Productid)
                    .HasColumnName("productid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Productoptionid)
                    .HasColumnName("productoptionid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Productoptionvalueid)
                    .HasColumnName("productoptionvalueid")
                    .HasColumnType("char(36)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CartAttributes)
                    .HasForeignKey(d => d.Customerid)
                    .HasConstraintName("FK_CartAttributes_Customers");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.CartAttributes)
                    .HasForeignKey(d => d.Productid)
                    .HasConstraintName("FK_CartAttributes_Products");

                entity.HasOne(d => d.Productoption)
                    .WithMany(p => p.CartAttributes)
                    .HasForeignKey(d => d.Productoptionid)
                    .HasConstraintName("FK_CartAttributes_ProductsOptions");

                entity.HasOne(d => d.Productoptionvalue)
                    .WithMany(p => p.CartAttributes)
                    .HasForeignKey(d => d.Productoptionvalueid)
                    .HasConstraintName("FK_CartAttributes_ProductsOptionsValues");
            });

            modelBuilder.Entity<Categories>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Addedon)
                    .HasColumnName("addedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasColumnName("image")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Modifiedon)
                    .HasColumnName("modifiedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Order)
                    .HasColumnName("order")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Parentcatid)
                    .HasColumnName("parentcatid")
                    .HasColumnType("char(36)");
            });

            modelBuilder.Entity<Configuration>(entity =>
            {
                entity.HasIndex(e => e.Configurationgroupid)
                    .HasName("FK_Configuration_ConfigurationGroup");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Configurationgroupid)
                    .HasColumnName("configurationgroupid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnName("description")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Key)
                    .IsRequired()
                    .HasColumnName("key")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.ModifiedOn)
                    .HasColumnName("modifiedOn")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Order)
                    .HasColumnName("order")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasColumnName("title")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Value)
                    .IsRequired()
                    .HasColumnName("value")
                    .HasColumnType("varchar(255)");

                entity.HasOne(d => d.Configurationgroup)
                    .WithMany(p => p.Configuration)
                    .HasForeignKey(d => d.Configurationgroupid)
                    .HasConstraintName("FK_Configuration_ConfigurationGroup");
            });

            modelBuilder.Entity<ConfigurationGroup>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Active)
                    .HasColumnName("active")
                    .HasColumnType("tinyint(4)");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnName("description")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Order)
                    .HasColumnName("order")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasColumnName("title")
                    .HasColumnType("varchar(65)");
            });

            modelBuilder.Entity<Countries>(entity =>
            {
                entity.HasIndex(e => e.Currencyid)
                    .HasName("FK_Countries_Currencies");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Currencyid).HasColumnType("char(36)");

                entity.Property(e => e.Isocode)
                    .IsRequired()
                    .HasColumnName("ISOCode")
                    .HasColumnType("varchar(5)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(65)");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.Countries)
                    .HasForeignKey(d => d.Currencyid)
                    .HasConstraintName("FK_Countries_Currencies");
            });

            modelBuilder.Entity<Currencies>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasColumnName("code")
                    .HasColumnType("char(5)");

                entity.Property(e => e.Symboleleft)
                    .HasColumnName("symboleleft")
                    .HasColumnType("varchar(15)");

                entity.Property(e => e.Symbolright)
                    .HasColumnName("symbolright")
                    .HasColumnType("varchar(15)");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasColumnName("title")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<CustomerInfo>(entity =>
            {
                entity.HasIndex(e => e.Customerid)
                    .HasName("FK_CustomerInfo_Customers");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Accountcreatedon)
                    .HasColumnName("accountcreatedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Customerid)
                    .HasColumnName("customerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Lastlogon)
                    .HasColumnName("lastlogon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Lastmodifiedon)
                    .HasColumnName("lastmodifiedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Logoncount)
                    .HasColumnName("logoncount")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerInfo)
                    .HasForeignKey(d => d.Customerid)
                    .HasConstraintName("FK_CustomerInfo_Customers");
            });

            modelBuilder.Entity<Customers>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Dob)
                    .HasColumnName("dob")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasColumnType("varchar(110)");

                entity.Property(e => e.Fax)
                    .IsRequired()
                    .HasColumnName("fax")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Firstname)
                    .IsRequired()
                    .HasColumnName("firstname")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Gender)
                    .IsRequired()
                    .HasColumnName("gender")
                    .HasColumnType("char(1)");

                entity.Property(e => e.Lastname)
                    .IsRequired()
                    .HasColumnName("lastname")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Mainaddressid)
                    .HasColumnName("mainaddressid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Newsletteropted)
                    .HasColumnName("newsletteropted")
                    .HasColumnType("tinyint(4)");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasColumnName("password")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Telephone)
                    .IsRequired()
                    .HasColumnName("telephone")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<Manufacturers>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasColumnName("image")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<ManufacturersInfo>(entity =>
            {
                entity.HasIndex(e => e.Manufacturerid)
                    .HasName("FK_ManufacturersInfo_Manufacturers");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Addedon)
                    .HasColumnName("addedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Manufacturerid)
                    .HasColumnName("manufacturerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Url)
                    .IsRequired()
                    .HasColumnName("url")
                    .HasColumnType("varchar(255)");

                entity.HasOne(d => d.Manufacturer)
                    .WithMany(p => p.ManufacturersInfo)
                    .HasForeignKey(d => d.Manufacturerid)
                    .HasConstraintName("FK_ManufacturersInfo_Manufacturers");
            });

            modelBuilder.Entity<OrderProductAttributes>(entity =>
            {
                entity.HasIndex(e => e.Orderid)
                    .HasName("FK_OrderProductAttributes_Orders");

                entity.HasIndex(e => e.Orderproductid)
                    .HasName("FK_OrderProductAttributes_OrderProductAttributes");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Optionvalueprice)
                    .HasColumnName("optionvalueprice")
                    .HasColumnType("decimal(10,2)");

                entity.Property(e => e.Orderid)
                    .HasColumnName("orderid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Orderproductid)
                    .HasColumnName("orderproductid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.PricePrefix)
                    .IsRequired()
                    .HasColumnName("price_prefix")
                    .HasColumnType("char(1)");

                entity.Property(e => e.Productoptiobvalue)
                    .IsRequired()
                    .HasColumnName("productoptiobvalue")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Productoptions)
                    .IsRequired()
                    .HasColumnName("productoptions")
                    .HasColumnType("varchar(50)");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderProductAttributes)
                    .HasForeignKey(d => d.Orderid)
                    .HasConstraintName("FK_OrderProductAttributes_Orders");

                entity.HasOne(d => d.Orderproduct)
                    .WithMany(p => p.OrderProductAttributes)
                    .HasForeignKey(d => d.Orderproductid)
                    .HasConstraintName("FK_OrderProductAttributes_OrderProductAttributes");
            });

            modelBuilder.Entity<Orders>(entity =>
            {
                entity.HasIndex(e => e.Customerid)
                    .HasName("FK_Orders_Customers");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Comments)
                    .HasColumnName("comments")
                    .HasColumnType("longtext");

                entity.Property(e => e.Currency)
                    .IsRequired()
                    .HasColumnName("currency")
                    .HasColumnType("varchar(5)");

                entity.Property(e => e.CurrencyValue)
                    .HasColumnName("currency_value")
                    .HasColumnType("decimal(16,6)");

                entity.Property(e => e.CustomerStreetaddress)
                    .IsRequired()
                    .HasColumnName("customerStreetaddress")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Customercity)
                    .IsRequired()
                    .HasColumnName("customercity")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Customercountry)
                    .IsRequired()
                    .HasColumnName("customercountry")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Customeremail)
                    .IsRequired()
                    .HasColumnName("customeremail")
                    .HasColumnType("varchar(110)");

                entity.Property(e => e.Customerid)
                    .HasColumnName("customerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Customername)
                    .IsRequired()
                    .HasColumnName("customername")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Customerpostalcode)
                    .IsRequired()
                    .HasColumnName("customerpostalcode")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Customerstate)
                    .IsRequired()
                    .HasColumnName("customerstate")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Customertelephone)
                    .IsRequired()
                    .HasColumnName("customertelephone")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Datepurcahsed)
                    .HasColumnName("datepurcahsed")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Deliverycity)
                    .IsRequired()
                    .HasColumnName("deliverycity")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Deliverycountry)
                    .IsRequired()
                    .HasColumnName("deliverycountry")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Deliveryname)
                    .IsRequired()
                    .HasColumnName("deliveryname")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Deliverypostalcode)
                    .IsRequired()
                    .HasColumnName("deliverypostalcode")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Deliverystate)
                    .IsRequired()
                    .HasColumnName("deliverystate")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Deliverystreetaddress)
                    .IsRequired()
                    .HasColumnName("deliverystreetaddress")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Latsmodified)
                    .HasColumnName("latsmodified")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Orderdatefinished)
                    .HasColumnName("orderdatefinished")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Orderstatus)
                    .IsRequired()
                    .HasColumnName("orderstatus")
                    .HasColumnType("varchar(10)");

                entity.Property(e => e.Paymentmethodid)
                    .HasColumnName("paymentmethodid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Shipingmethodid)
                    .HasColumnName("shipingmethodid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Shippingcost)
                    .HasColumnName("shippingcost")
                    .HasColumnType("decimal(10,2)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Customerid)
                    .HasConstraintName("FK_Orders_Customers");
            });

            modelBuilder.Entity<OrdersProducts>(entity =>
            {
                entity.HasIndex(e => e.Orderid)
                    .HasName("FK_OrdersProducts_Orders");

                entity.HasIndex(e => e.Productid)
                    .HasName("FK_OrdersProducts_Products");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Finalprice)
                    .HasColumnName("finalprice")
                    .HasColumnType("decimal(10,2)");

                entity.Property(e => e.Orderid)
                    .HasColumnName("orderid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Productid)
                    .IsRequired()
                    .HasColumnName("productid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Productname)
                    .IsRequired()
                    .HasColumnName("productname")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Productprice)
                    .HasColumnName("productprice")
                    .HasColumnType("decimal(10,2)");

                entity.Property(e => e.Productqty)
                    .HasColumnName("productqty")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Productstax)
                    .HasColumnName("productstax")
                    .HasColumnType("decimal(9,4)");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrdersProducts)
                    .HasForeignKey(d => d.Orderid)
                    .HasConstraintName("FK_OrdersProducts_Orders");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrdersProducts)
                    .HasForeignKey(d => d.Productid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrdersProducts_Products");
            });

            modelBuilder.Entity<OrdersStatus>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<Products>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Addedon)
                    .HasColumnName("addedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasColumnName("image")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.ManufactureId)
                    .HasColumnName("manufactureId")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Model)
                    .IsRequired()
                    .HasColumnName("model")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Modifiedon)
                    .HasColumnName("modifiedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Price)
                    .HasColumnName("price")
                    .HasColumnType("decimal(10,2)");

                entity.Property(e => e.Qty)
                    .HasColumnName("qty")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Taxclassid)
                    .HasColumnName("taxclassid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Weight)
                    .HasColumnName("weight")
                    .HasColumnType("decimal(7,2)");
            });

            modelBuilder.Entity<ProductsAttributes>(entity =>
            {
                entity.HasIndex(e => e.Optionsid)
                    .HasName("FK_ProductsAttributes_ProductsOptions");

                entity.HasIndex(e => e.Optionvaluesid)
                    .HasName("FK_ProductsAttributes_ProductsOptionsValues");

                entity.HasIndex(e => e.Productsid)
                    .HasName("FK_ProductsAttributes_Products");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Optionsid)
                    .HasColumnName("optionsid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Optionvaluesid)
                    .HasColumnName("optionvaluesid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Price)
                    .HasColumnName("price")
                    .HasColumnType("decimal(10,2)");

                entity.Property(e => e.PricePrefix)
                    .IsRequired()
                    .HasColumnName("price_prefix")
                    .HasColumnType("char(1)");

                entity.Property(e => e.Productsid)
                    .HasColumnName("productsid")
                    .HasColumnType("char(36)");

                entity.HasOne(d => d.Options)
                    .WithMany(p => p.ProductsAttributes)
                    .HasForeignKey(d => d.Optionsid)
                    .HasConstraintName("FK_ProductsAttributes_ProductsOptions");

                entity.HasOne(d => d.Optionvalues)
                    .WithMany(p => p.ProductsAttributes)
                    .HasForeignKey(d => d.Optionvaluesid)
                    .HasConstraintName("FK_ProductsAttributes_ProductsOptionsValues");

                entity.HasOne(d => d.Products)
                    .WithMany(p => p.ProductsAttributes)
                    .HasForeignKey(d => d.Productsid)
                    .HasConstraintName("FK_ProductsAttributes_Products");
            });

            modelBuilder.Entity<ProductsOptions>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<ProductsOptionsValues>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(65)");
            });

            modelBuilder.Entity<ProductsOptionsValuesMappings>(entity =>
            {
                entity.HasIndex(e => e.Optionsid)
                    .HasName("FK_ProductsOptionsValuesMappings_productsdetail");

                entity.HasIndex(e => e.Valuesid)
                    .HasName("FK_ProductsOptionsValuesMappings_ProductsOptionsValues");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Optionsid)
                    .HasColumnName("optionsid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Valuesid)
                    .HasColumnName("valuesid")
                    .HasColumnType("char(36)");

                entity.HasOne(d => d.Options)
                    .WithMany(p => p.ProductsOptionsValuesMappings)
                    .HasForeignKey(d => d.Optionsid)
                    .HasConstraintName("FK_ProductsOptionsValuesMappings_productsdetail");

                entity.HasOne(d => d.Values)
                    .WithMany(p => p.ProductsOptionsValuesMappings)
                    .HasForeignKey(d => d.Valuesid)
                    .HasConstraintName("FK_ProductsOptionsValuesMappings_ProductsOptionsValues");
            });

            modelBuilder.Entity<Productsdetail>(entity =>
            {
                entity.ToTable("productsdetail");

                entity.HasIndex(e => e.Productid)
                    .HasName("FK_productsdetail_Products");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnName("description")
                    .HasColumnType("longtext");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasColumnName("name")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Productid)
                    .HasColumnName("productid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Url)
                    .IsRequired()
                    .HasColumnName("url")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Views)
                    .HasColumnName("views")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Productsdetail)
                    .HasForeignKey(d => d.Productid)
                    .HasConstraintName("FK_productsdetail_Products");
            });

            modelBuilder.Entity<Reviews>(entity =>
            {
                entity.HasIndex(e => e.Productid)
                    .HasName("FK_Reviews_Products");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Addedon)
                    .HasColumnName("addedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Customerid)
                    .HasColumnName("customerid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Customername)
                    .IsRequired()
                    .HasColumnName("customername")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Modifiedon)
                    .HasColumnName("modifiedon")
                    .HasColumnType("datetime(3)");

                entity.Property(e => e.Productid)
                    .HasColumnName("productid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Rating)
                    .HasColumnName("rating")
                    .HasColumnType("int(11)");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.Productid)
                    .HasConstraintName("FK_Reviews_Products");
            });

            modelBuilder.Entity<ReviewsDetail>(entity =>
            {
                entity.HasIndex(e => e.Reviewid)
                    .HasName("FK_ReviewsDetail_Reviews");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Reviewid)
                    .HasColumnName("reviewid")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Text)
                    .IsRequired()
                    .HasColumnName("text")
                    .HasColumnType("longtext");

                entity.HasOne(d => d.Review)
                    .WithMany(p => p.ReviewsDetail)
                    .HasForeignKey(d => d.Reviewid)
                    .HasConstraintName("FK_ReviewsDetail_Reviews");
            });

            modelBuilder.Entity<WhoIsOnline>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("char(36)");

                entity.Property(e => e.Fullname)
                    .IsRequired()
                    .HasColumnName("fullname")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Ipaddress)
                    .IsRequired()
                    .HasColumnName("ipaddress")
                    .HasColumnType("varchar(18)");

                entity.Property(e => e.Lastpageurl)
                    .IsRequired()
                    .HasColumnName("lastpageurl")
                    .HasColumnType("varchar(65)");

                entity.Property(e => e.Sessionid)
                    .IsRequired()
                    .HasColumnName("sessionid")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Timeentry)
                    .HasColumnName("timeentry")
                    .HasColumnType("datetime(3)");
            });
        }
    }
}
