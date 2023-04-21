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
    public class OrderController : ControllerBase
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
                    var orders = new List<Order>(context.Orders);
                    return Ok(orders);
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

        [HttpGet("{OrId}")]

        public IActionResult Get(int OrId)
        {
            /*if ((Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9"))
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    var orders = new List<Order>(context.Orders);
                    var selection = orders.FirstOrDefault(a => a.OrId == OrId);
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

        [HttpGet("GetAllOrdersByAdId/{AdId}")]

        public IActionResult GetAllOrdersByAdminId(int AdId)
        {
            /*if ((Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9"))
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    List<Order> orders = context.Orders.Where(order => order.AdId == AdId).ToList();

                    return Ok(orders);
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

        public IActionResult Post(OrderRequestDto orderrequest)
        {
            /*if (Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9")
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    Order order = new Order();
                    order.OrData = orderrequest.OrData;
                    order.AdId = orderrequest.AdId;
                    order.Name = orderrequest.Name;
                    order.Address = orderrequest.Address;
                    order.Phone = orderrequest.Phone;
                    order.Email = orderrequest.Email;
                    order.Status = orderrequest.Status;
                    order.LogDate = orderrequest.LogDate;
                    context.Orders.Add(order);
                    context.SaveChanges();
                    return Ok("Add order ok.");
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
        [HttpPut("{OrId}")]

        public IActionResult Put(int OrId, OrderRequestDto orderupdate)
        {
            /*if (Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9")
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    Order order = context.Orders.First(o => o.OrId == OrId);
                    order.OrData = orderupdate.OrData;
                    order.AdId = orderupdate.AdId;
                    order.Name = orderupdate.Name;
                    order.Address = orderupdate.Address;
                    order.Phone = orderupdate.Phone;
                    order.Email = orderupdate.Email;
                    order.Status = orderupdate.Status;
                    order.LogDate = orderupdate.LogDate;
                    context.Orders.Update(order);
                    context.SaveChanges();
                    return Ok("Order modification ok.");
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
        [HttpDelete("{OrId}")]

        public IActionResult Delete(int orid)
        {
            /*if (Program.LoggedInUsers.ContainsKey(uId) && Program.LoggedInUsers[uId].AdPermission == "9")
            {*/
            using (var context = new vizsgaremek_v4Context())
            {
                try
                {
                    Order order = context.Orders.First(order => order.OrId == orid);
                    context.Orders.Remove(order);
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
