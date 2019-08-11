using IdentityModel;
using IdentityServer4.Models;
using System.Collections.Generic;

namespace coremerce.Security.OAuth
{
  public class Config
  {
    public static IEnumerable<ApiResource> GetApiResources()
    {
      return new List<ApiResource>
      {
        new ApiResource(
          "Coremerce.ReadAccess",
          "Coremerce API",
          new List<string> {
            JwtClaimTypes.Id,
            JwtClaimTypes.Email,
            JwtClaimTypes.Name,
            JwtClaimTypes.GivenName,
            JwtClaimTypes.FamilyName
          }
        ),

        new ApiResource("Coremerce.FullAccess", "Coremerce API")
      };
    }

    public static IEnumerable<Client> GetClients()
    {
      return new[]
      {
        new Client
        {
          Enabled = true,
          ClientName = "HTML Page Client",
          ClientId = "htmlClient",
          AllowedGrantTypes = GrantTypes.ResourceOwnerPassword,

          ClientSecrets =
          {
            new Secret("secretpassword".Sha256())
          },
          AllowedScopes = { "Coremerce.ReadAccess" }
        }
      };
    }

  }
}
