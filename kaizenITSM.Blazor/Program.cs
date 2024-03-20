using kaizenITSM.Blazor.Components;
using Microsoft.AspNetCore.Authentication.Cookies;
using Radzen;

var builder = WebApplication.CreateBuilder(args);
var configuration = builder.Configuration;
var services = builder.Services;
var environment = builder.Environment;

services.AddRazorComponents().AddInteractiveServerComponents();

services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
	.AddCookie(options =>
	{
		options.Cookie.Name = "kainzenITSM_auth";
		options.LoginPath = "/Account/Login";
		options.Cookie.MaxAge = TimeSpan.FromMinutes(30);
		options.AccessDeniedPath = "/Account/AccessDenied";
	});
services.AddAuthorization();
services.AddCascadingAuthenticationState();

string? baseApiUrl = configuration.GetSection("appSettings").GetValue<string>(key: "BaseApiUrl");
services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(baseApiUrl) });

services.AddHttpContextAccessor();
//services.AddLocalization();

//var cultureInfo = new CultureInfo("pl-PL");

//CultureInfo.DefaultThreadCurrentCulture = cultureInfo;
//CultureInfo.DefaultThreadCurrentUICulture = cultureInfo;

//services.AddMemoryCache();

services.AddRadzenComponents();

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Error", createScopeForErrors: true);
	app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();
app.UseAuthentication();
app.UseAuthorization();

app.MapRazorComponents<App>().AddInteractiveServerRenderMode();

app.Run();
