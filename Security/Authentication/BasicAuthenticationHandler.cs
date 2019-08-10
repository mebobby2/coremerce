using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Logging;
using coremerce.Models;
using Microsoft.Extensions.Options;
using System;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace coremerce.Security.Authentication
{
  public class BasicAuthenticationHandler : AuthenticationHandler<BasicAuthenticationOptions>
  {
    private readonly CoremerceContext _context;
    private const string AuthorizationHeaderName = "Authorization";
    private const string BasicSchemeName = "Basic";
    public BasicAuthenticationHandler(IOptionsMonitor<BasicAuthenticationOptions> options,
           ILoggerFactory logger, UrlEncoder encoder, ISystemClock clock, CoremerceContext context)
       : base(options, logger, encoder, clock)
    {
      _context = context;
    }

    protected override Task<AuthenticateResult> HandleAuthenticateAsync()
    {
      if (!Request.Headers.ContainsKey(AuthorizationHeaderName))
      {
        return Task.FromResult(AuthenticateResult.NoResult());
      }

      if (!AuthenticationHeaderValue.TryParse(Request.Headers[AuthorizationHeaderName], out AuthenticationHeaderValue headerValue))
      {
        return Task.FromResult(AuthenticateResult.NoResult());
      }

      if (!BasicSchemeName.Equals(headerValue.Scheme, StringComparison.OrdinalIgnoreCase))
      {
        return Task.FromResult(AuthenticateResult.NoResult());
      }

      byte[] headerValueBytes = Convert.FromBase64String(headerValue.Parameter);
      string emailPassword = Encoding.UTF8.GetString(headerValueBytes);
      string[] parts = emailPassword.Split(':');

      if (parts.Length != 2)
      {
          return Task.FromResult(AuthenticateResult.Fail("Invalid Basic Authentication Header"));
      }

      string email = parts[0];
      string password = parts[1];

      var customer = _context.Customers.SingleOrDefault(x => x.Email == email && x.Password == password);
      if (customer == null)
      {
          return Task.FromResult(AuthenticateResult.Fail("Invalid email and password."));
      }

      var claims = new[]
      {
        new Claim(ClaimTypes.Name, email),
        new Claim(ClaimTypes.NameIdentifier, customer.Id.ToString())
      };

      var identity = new ClaimsIdentity(claims, Scheme.Name);
      var principal = new ClaimsPrincipal(identity);
      var ticket = new AuthenticationTicket(principal, Scheme.Name);
      return Task.FromResult(AuthenticateResult.Success(ticket));
    }
  }
}
