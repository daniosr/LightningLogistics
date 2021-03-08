using Microsoft.EntityFrameworkCore.Migrations;

namespace LightningLogisticsAPI.Migrations
{
    public partial class AddedHashAndSalt : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Password",
                table: "Auth",
                newName: "PasswordHash");

            migrationBuilder.AddColumn<string>(
                name: "PasswordSalt",
                table: "Auth",
                type: "TEXT",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PasswordSalt",
                table: "Auth");

            migrationBuilder.RenameColumn(
                name: "PasswordHash",
                table: "Auth",
                newName: "Password");
        }
    }
}
