using coremerce.Domain;
using System.Threading.Tasks;

namespace coremerce.Interfaces
{
  public interface IProductService
  {
    Task<bool> CreateProductAsync(Product product);
    Task<Product> GetOrderAsync(int id);
    Task<bool> UpdateProductAsync(int id, Product product);
    Task<bool> DeleteOrderAsync(int id);
  }
}
