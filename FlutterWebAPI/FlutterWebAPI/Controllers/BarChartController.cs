using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FlutterWebAPI.Models;
namespace FlutterWebAPI.Controllers
{
    public class BarChartController : ApiController
    {

        [HttpGet]
        public IEnumerable<ftblbarchartdata> GetChartData()
        {
            using (PradeepDBEntities2 entities = new PradeepDBEntities2())
            {
                return entities.ftblbarchartdatas.ToList();
            }
        }
    }
}
