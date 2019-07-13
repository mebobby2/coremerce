using System.Collections.Generic;
using System.Threading.Tasks;
using coremerce.Domain;
using coremerce.Interfaces;
using Microsoft.AspNetCore.Mvc;
namespace coremerce.Controllers
{
  [Produces("application/json")]
  [Route("api/[Controller]")]
  public class ProductsController : Controller
  {
    public IProductService _productService {  get; set; }

    public ProductsController(IProductService productService)
    {
      _productService = productService;
    }

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

    [HttpGet("{id}")]
    public Task<Product> Get(int id) => _productService.GetOrderAsync(id);

    [HttpPost]
    public async Task<IActionResult> Post([FromBody]Product product)
      => (await _productService.CreateProductAsync(product))
        ? (IActionResult)Created($"api/products/{product.Id}", product)
        : StatusCode(500);
  }
}
