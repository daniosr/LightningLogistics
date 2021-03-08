using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LightningLogisticsAPI.Contexts;
using LightningLogisticsAPI.Models;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.Configuration;
using System.Text;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;

namespace LightningLogisticsAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        public IConfiguration Configuration { get; }
        public AuthController(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        private string GenerateJwtToken()
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Configuration["JwtAuth:Key"]);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
           {
                new Claim("Id", "this is a test"),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            }),
                Expires = DateTime.UtcNow.AddHours(6),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha512Signature)
            };
            var token = jwtTokenHandler.CreateToken(tokenDescriptor);

            var jwtToken = jwtTokenHandler.WriteToken(token);

            return jwtToken;
        }

        [HttpPost("change")]
        public string ChangePassword(Password password)
        {
            byte[] salt = new byte[128 / 8];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }

            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: password.PasswordString,
                salt: salt,
                prf: KeyDerivationPrf.HMACSHA512,
                iterationCount: 10000,
                numBytesRequested: 256 / 8));

            using (var context = new ItemsContext())
            {
                context.Auth.Add(new Login()
                {
                    PasswordHash = hashed,
                    PasswordSalt = Convert.ToBase64String(salt)
                });
                context.SaveChanges();
            }

            string token = GenerateJwtToken();
            return token;
        }

        private bool CheckPassword(string password)
        {
            Login login;

            using (var context = new ItemsContext())
            {
                login = context.Auth.OrderBy(a => a.LoginID).Last();
            }

            byte[] salt = Convert.FromBase64String(login.PasswordSalt);

            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: password,
                salt: salt,
                prf: KeyDerivationPrf.HMACSHA512,
                iterationCount: 10000,
                numBytesRequested: 256 / 8));

            return (hashed == login.PasswordHash);

        }

        [HttpPost]
        public string Post(Password password)
        {
            if (CheckPassword(password.PasswordString))
            {
                string token = GenerateJwtToken();
                return token;
            }
            return ("The password is wrong");
        }
    }
}
