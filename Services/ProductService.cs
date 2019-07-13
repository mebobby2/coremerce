using coremerce.Domain;
using coremerce.Interfaces;
using System.Threading.Tasks;

namespace coremerce.Services
{
  public class ProductService : IProductService
  {
    public async Task<bool> CreateProductAsync(Product product)
    {
      product.Id = 2;
      return true;
    }

    public async Task<bool> DeleteOrderAsync(int id)
    {
      // Delete from database and return true/false.
      return true;
    }

    public Task<Product> GetOrderAsync(int id)
    {
      return Task.Run(() => new Product(id, "Noddles", 12.9m));
    }

    public async Task<bool> UpdateProductAsync(int id, Product product)
    {
      product.Id = id;
      product.Name = product.Name;
      product.Price = product.Price;

      return true;
    }
  }
}
