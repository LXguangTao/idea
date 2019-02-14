using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;

namespace Bigidea.Areas.Back.Controllers
{
    /// <summary>
    /// 权限管理
    /// </summary>
    [Authorize]
    public class QuanController : Controller
    {
        bigideaEntities m = new bigideaEntities();
        // GET: Back/Quan
        /// <summary>
        /// 用户视图
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 权重列表视图
        /// </summary>
        /// <returns></returns>
        public ActionResult QuanList()
        {
            return View();
        }
        /// <summary>
        /// 权重列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult QuanLists()
        {
            try
            {
                string username = Request.Params["username"];
                var user = m.View_User.Where(x=>x.UserName==username).ToList();
                var role = m.Role.ToList();
                if (user==null)
                {
                    return Json(new result(false,"此用户不存在"));
                }
                string roles = "";
                foreach (var item in user)
                {
                    roles += item.RoleName;
                }
                return Json(new result(true, "",new {roles=roles,user=role.Select(x=>x.Note) }));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 修改权限
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ChangeRole()
        {
            try
            {
                string username = Request.Params["username"];
                string type = Request.Params["type"];
                var user = m.User.FirstOrDefault(x=>x.UserName==username);
                if (user==null)
                {
                    return Json(new result(false,"不存在此用户"));
                }
                var list = m.RoleGive.Where(x => x.UserId == user.Id).Select(x => x.RoleId).ToList();
                var a = m.View_User.Where(x => x.UserName == username);
                string[] roles = type.TrimEnd().Split(' ');
                if (list.Count() > roles.Count())
                {
                    foreach (var item in a)
                    {
                        if (!roles.Contains(item.RoleName))
                        {
                            var rg = m.RoleGive.FirstOrDefault(x => x.UserId == user.Id && x.RoleId == m.Role.FirstOrDefault(p=>p.RoleName==item.RoleName).Id);
                            m.RoleGive.Remove(rg);
                        }
                    }
                }
                else
                {
                    foreach (var item in roles)
                    {
                        var s = m.Role.FirstOrDefault(x => x.RoleName == item);
                        if (!list.Contains(s.Id))
                        {
                            RoleGive rg = new RoleGive()
                            {
                                UserId = user.Id,
                                RoleId = s.Id
                            };
                            m.RoleGive.Add(rg);
                        }
                    }
                }
                m.SaveChanges();
                return Json(new result(true,""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
    }
}