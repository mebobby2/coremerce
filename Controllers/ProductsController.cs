using System.Collections.Generic;
using coremerce.Models;
using Microsoft.AspNetCore.Mvc;
namespace coremerce.Controllers
{
  [Produces("application/json")]
  [Route("api/[Controller]")]
  public class ProductsController : Controller
  {
    [HttpGet]
    public IEnumerable<Product> Get()
    {
      return new Product[]
      {
        new Product(1, "Oats", new decimal(3.07)),
        new Product(1, "Toothpaste", new decimal(10.89)),
        new Product(1, "Television", new decimal(500.90))
      };
    }
  }
}
