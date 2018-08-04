using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace WebAPI.Controllers
{
    public class HomeController : ControllerBase
    {
        /// <summary>
        /// 默认
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [HttpPost]
        public async Task<ResponseModel> Index()
        {
            await Task.CompletedTask;
            return new ResponseModel()
            {
                Data = "hello index"
            };
        }

        /// <summary>
        /// GET jsonp
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<string> JsonpTest([FromQuery]RequestModel request)
        {
            var jsonpCallback = Request.Query["callback"].ToString();
            await Task.CompletedTask;

            var response = new ResponseModel()
            {
                Data = $"hello {request.Name}，it's jsonp request"
            };

            var setting = new JsonSerializerSettings
            {
                ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver()
            };
            return $"{jsonpCallback}({JsonConvert.SerializeObject(response, setting)})";
        }

        /// <summary>
        /// GET FromQuery
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<ResponseModel> FromQueryTest([FromQuery]RequestModel request)
        {
            await Task.CompletedTask;
            return new ResponseModel
            {
                Data = $"hello {request.Name}，it's fromQuery get request"
            };
        }

        /// <summary>
        /// POST FromForm
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ResponseModel> FromFormTest([FromForm]RequestModel request)
        {
            await Task.CompletedTask;
            return new ResponseModel
            {
                Data = $"hello {request.Name}，it's fromForm post request"
            };
        }

        /// <summary>
        /// POST FromBody
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ResponseModel> FromBodyTest([FromBody]RequestModel request)
        {
            var cookie = Request.Cookies["name"];
            await Task.CompletedTask;
            return new ResponseModel
            {
                Data = $"hello {request.Name}，it's fromBody post request"
            };
        }
    }

    public class RequestModel
    {
        public string Name { get; set; }
    }


    public class ResponseModel
    {
        public string Data { get; set; }
    }
}
