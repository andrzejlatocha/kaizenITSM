using kaizenITSM.Blazor.Components;
using Radzen;

var builder = WebApplication.CreateBuilder(args);
var configuration = builder.Configuration;
var services = builder.Services;
var environment = builder.Environment;

services.AddRazorComponents().AddInteractiveServerComponents();

string? baseApiUrl = configuration.GetSection("appSettings").GetValue<string>(key: "BaseApiUrl");
services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(baseApiUrl) });

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

app.MapRazorComponents<App>().AddInteractiveServerRenderMode();

app.Run();
