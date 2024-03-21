using kaizenITSM.Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Text;
using kaizenITSM.Blazor.Components.Shared;
using kaizenITSM.Domain.Entities.hd;
using System.Net.Http;

namespace kaizenITSM.Blazor.Controllers
{
    [DisableRequestSizeLimit]
    public partial class UploadController : ControllerBase
    {
        private readonly IWebHostEnvironment _environment;
        private readonly HttpClient _httpClient;

        public UploadController(IWebHostEnvironment environment, HttpClient httpClient)
        {
            _environment = environment;
            _httpClient = httpClient;
        }

        // Single file upload
        [HttpPost("upload/single")]
        public IActionResult Single(IFormFile file)
        {
            try
            {
                // Put your code here
                return StatusCode(200);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // Multiple files upload
        [HttpPost("upload/multiple")]
        public async Task<IActionResult> Multiple(IFormFile[] files)
        {
            try
            {
                var folder = Path.Combine(_environment.WebRootPath, "upload/ticket",
                    DateTime.Now.ToString().Replace(".", "").Replace(":", "").Replace(" ", "").Replace("-", ""));

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                foreach (var file in files)
                {
                    var fileName = $"{Guid.NewGuid()}{Path.GetExtension(file.FileName)}";

                    using (var stream = new FileStream(Path.Combine(folder, fileName), FileMode.Create))
                    {
                        file.CopyTo(stream);

                        Files f = new Files();
                        f.Extension = Path.GetExtension(file.FileName);
                        f.Name = Path.GetFileNameWithoutExtension(file.FileName);
                        f.FileName = file.FileName;
                        f.Link = $"{folder}/{fileName}";
                        f.Version = 1;

                        StringContent content1 = new StringContent(JsonConvert.SerializeObject(f), Encoding.UTF8, "application/json");
                        var response1 = await _httpClient.PostAsync("Files/Insert", content1);

                        string apiResponse1 = await response1.Content.ReadAsStringAsync();

                        if (response1.IsSuccessStatusCode)
                        {
                            var newObject = JsonConvert.DeserializeObject<Files>(apiResponse1);

                            TicketFiles tf = new TicketFiles();
                            tf.FileID = newObject.ID;
                            tf.TicketID = 1;

                            StringContent content = new StringContent(JsonConvert.SerializeObject(tf), Encoding.UTF8, "application/json");

                            var response = await _httpClient.PostAsync("TicketFiles/Insert", content);

                            string apiResponse = await response.Content.ReadAsStringAsync();
                        }
                    }
                }

                return StatusCode(200);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // Multiple files upload with parameter
        [HttpPost("upload/{id}")]
        public async Task<IActionResult> Post(IFormFile[] files, int id)
        {
            try
            {
                var subfolder = DateTime.Now.ToString().Replace(".", "").Replace(":", "").Replace(" ", "").Replace("-", "");
                var folder = Path.Combine(_environment.WebRootPath, "upload/ticket", subfolder);

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                foreach (var file in files)
                {
                    var fileName = $"{Guid.NewGuid()}{Path.GetExtension(file.FileName)}";

                    using (var stream = new FileStream(Path.Combine(folder, fileName), FileMode.Create))
                    {
                        file.CopyTo(stream);

                        Files f = new Files();
                        f.Extension = Path.GetExtension(file.FileName);
                        f.Name = Path.GetFileNameWithoutExtension(file.FileName);
                        f.FileName = file.FileName;
                        f.Link = $"{folder}/{fileName}";
                        f.Version = 1;

                        StringContent content1 = new StringContent(JsonConvert.SerializeObject(f), Encoding.UTF8, "application/json");
                        var response1 = await _httpClient.PostAsync("Files/Insert", content1);

                        string apiResponse1 = await response1.Content.ReadAsStringAsync();

                        if (response1.IsSuccessStatusCode)
                        {
                            var newObject = JsonConvert.DeserializeObject<Files>(apiResponse1);

                            TicketFiles tf = new TicketFiles();
                            tf.FileID = newObject.ID;
                            tf.TicketID = id;

                            StringContent content = new StringContent(JsonConvert.SerializeObject(tf), Encoding.UTF8, "application/json");

                            var response = await _httpClient.PostAsync("TicketFiles/Insert", content);

                            string apiResponse = await response.Content.ReadAsStringAsync();
                        }
                    }
                }

                return StatusCode(200);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // Image file upload (used by HtmlEditor components)
        [HttpPost("upload/image")]
        public IActionResult Image(IFormFile file)
        {
            try
            {
                var fileName = $"{Guid.NewGuid()}{Path.GetExtension(file.FileName)}";

                using (var stream = new FileStream(Path.Combine(_environment.WebRootPath, "images", "_upload", fileName), FileMode.Create))
                {
                    // Save the file
                    file.CopyTo(stream);

                    // Return the URL of the file
                    var url = Url.Content($"~/images/_upload/{fileName}");

                    return Ok(new { Url = url });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
