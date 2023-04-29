using FadokoBackendV4.Models;
using FadokoBackendV4.Models.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace FadokoBackendV4.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CommodityController : ControllerBase
    {
        [HttpGet]

        public IActionResult Get()
        {
            /*if ((Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9"))
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    var commodities = new List<Commodity>(context.Commodities);
                    return Ok(commodities);
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }

            }/*
            }
            else
            {
                return BadRequest("Error!");
            }*/
        }


        [HttpGet("{CoId}")]

        public IActionResult Get(int CoId)
        {
            /*if ((Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9"))
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    var commodities = new List<Commodity>(context.Commodities);
                    var selection = commodities.FirstOrDefault(a => a.CoId == CoId);
                    return Ok(selection);
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }

            }/*
            }
            else
            {
                return BadRequest("Error!");
            }*/
        }

        [HttpPost]

        public IActionResult Post(CommodityRequestDto commodityrequest)
        {
            /*if (Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9")
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    Commodity commodity = new Commodity();
                    commodity.CoName = commodityrequest.CoName;
                    commodity.CoUnit = commodityrequest.CoUnit;
                    commodity.CoCat = commodityrequest.CoCat;
                    commodity.CoPrice = commodityrequest.CoPrice;
                    commodity.CoActive = commodityrequest.CoActive;
                    context.Commodities.Add(commodity);
                    context.SaveChanges();
                    return Ok("Add commodity ok.");
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }

            }/*
            }
            else
            {
                return BadRequest("Error!");
            }*/
        }

        [HttpPut("{CoId}")]

        public IActionResult Put(int CoId, CommodityRequestDto commodityupdate)
        {
            /*if (Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9")
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    Commodity commodity = context.Commodities.First(a => a.CoId == CoId);
                    commodity.CoName = commodityupdate.CoName;
                    commodity.CoUnit = commodityupdate.CoUnit;
                    commodity.CoCat = commodityupdate.CoCat;
                    commodity.CoPrice = commodityupdate.CoPrice;
                    commodity.CoActive = commodityupdate.CoActive;
                    context.Commodities.Update(commodity);
                    context.SaveChanges();
                    return Ok("Commodity modification ok.");
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }

            }
            /*}
            else
            {
                return BadRequest("Error!");
            }*/
        }
        [HttpDelete("{coid}")]

        public IActionResult Delete(int coid)
        {
            /*if (Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9")
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    Commodity commodity = context.Commodities.First(commodity => commodity.CoId == coid);
                    context.Commodities.Remove(commodity);
                    context.SaveChanges();
                    return Ok("Delete ok.");
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }

            }/*
            }
            else
            {
                return BadRequest("Error!");
            }*/
        }
    }
}
