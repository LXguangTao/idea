using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;
using Bigidea.Areas.Back.Models;
using System.Web.Security;

namespace Bigidea.Areas.Back.Controllers
{
    /// <summary>
    /// 用户管理
    /// </summary>
    [Authorize]
    public class HomeController : Controller
    {
        // GET: Back/Home
        bigideaEntities m = new bigideaEntities();
        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Logins()
        {
            try
            {
                using (bigideaEntities m = new bigideaEntities())
                {
                    string username = Request.Params["username"];
                    string pwd = MD5.MD5Encrypt(Request.Params["password"]);
                    var loadUser = m.View_User.Where(x => x.UserName == username);
                    var user = m.User.FirstOrDefault(x=>x.UserName==username);              
                    if (loadUser == null)
                    {
                        return Json(new result(false, "该用户不存在"));
                    }
                    if (!loadUser.Select(x=>x.RoleName).Contains("管理员"))
                    {
                        return Json(new result(false, "该用户不是管理员"));
                    }
                    if (user.Passward != pwd)
                    {
                        return Json(new result(false, "密码不正确"));
                    }
                    user.LastLoginTime = DateTime.Now;
                    m.SaveChanges();
                    if (loadUser == null)
                    {
                        return Json(new result(false, "密码错误"));
                    }
                    FormsAuthentication.SetAuthCookie(username, false);
                    string roles="";
                    foreach (var item in loadUser.Select(x=>x.RoleName))
                    {
                        roles += item + " ";
                    }
                    return Json(new result(true, "登录成功",roles));
                }
            }
            catch (Exception ex)
            {
                return Json(new result(false, "登录失败:" + ex.Message));
            }
        }
        /// <summary>
        /// 后台框架
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 欢迎页
        /// </summary>
        /// <returns></returns>
        public ActionResult Welcome()
        {
            return View();
        }
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AddUser()
        {
            return View();
        }
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddUser(int id)
        {
            try
            {
                bigideaEntities m = new bigideaEntities();
                {
                    var addUser = from x in m.User
                                  where x.Id == id
                                  select new
                                  {
                                      UserName = x.UserName,
                                      NickName = x.NickName,
                                      Email = x.Email
                                  };
                    if (addUser == null)
                    {
                        return Json(new result(false, "该用户不存在"));
                    }
                    return Json(new { success = true, data = addUser });
                }

            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult AddUsers()
        {
            try
            {
                string username = Request.Params["username"];
                string email = Request.Params["email"];
                string nickname = Request.Params["nickname"];
                string pass = Request.Params["pass"];
                string sex = Request.Params["sex"];
                string type = Request.Params["type"];
                string repass = Request.Params["repass"];
                if (pass != repass)
                {
                    return Json(new result(false, "重复密码不一致！"));
                }
                pass = MD5.MD5Encrypt(pass);
                User newuser = new User();
                newuser.UserName = username;
                newuser.Sex = sex;
                newuser.Email = email;
                newuser.NickName = nickname;
                newuser.HeadPicUrl = "";
                newuser.HeadSculpture = "";
                newuser.IsStop = "否";
                newuser.IsDel = "0";
                newuser.LastLoginTime = DateTime.Now;                
                newuser.Passward = pass;                
                m.User.Add(newuser);
                m.SaveChanges();
                string[] roles = type.TrimEnd().Split(' ');
                foreach (var item in roles)
                {
                    RoleGive rg = new RoleGive();
                    rg.UserId = newuser.Id;
                    rg.RoleId = int.Parse(item);
                    m.RoleGive.Add(rg);
                }
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "数据保存失败"));
                }
                return Json(new result(true, "成功"));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 删除用户
        /// </summary>
        /// <returns></returns>
        public ActionResult DelUser()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DelUsers()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    User only = m.User.SingleOrDefault(x => x.Id == id);
                    only.IsDel = "1";
                }
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "数据库保存失败"));
                }
                return Json(new result(true, ""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 最终删除用户
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult LastDelUsers()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    User only = m.User.SingleOrDefault(x => x.Id == id);
                    m.User.Remove(only);
                    var arrs = m.RoleGive.Where(x => x.UserId == id).ToList();
                    foreach (var items in arrs)
                    {
                        m.RoleGive.Remove(items);
                    }
                }
                
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "数据库保存失败"));
                }
                return Json(new result(true, ""));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 编辑用户信息
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult EditUser()
        {
            return View();
        }
        /// <summary>
        /// 修改密码页面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ChangePwd()
        {
            return View();
        }
        /// <summary>
        /// 修改密码数据
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ChangePwds()
        {
            try
            {
                int id = int.Parse(Request.Params["id"]);
                string nickname = Request.Params["nickname"];
                string oldpass = MD5.MD5Encrypt(Request.Params["oldpass"]);
                string newpass = MD5.MD5Encrypt(Request.Params["newpass"]);
                string repass = MD5.MD5Encrypt(Request.Params["repass"]);
                var changeUser = m.User.FirstOrDefault(x => x.Id == id);
                if (changeUser==null)
                {
                    return Json(new result(false,"此用户不存在"));
                }
                if (changeUser.Passward!=oldpass)
                {
                    return Json(new result(false,"原密码错误"));
                }
                if (newpass!=repass)
                {
                    return Json(new result(false,"两次密码不一致"));
                }
                changeUser.Passward = newpass;
                if (m.SaveChanges()<=0)
                {
                    return Json(new result(false,"新密码与原密码不能相同"));
                }
                return Json(new result(true,""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 用户列表页面
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult UserList()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Users()
        {
            try
            {
                var user = this.User.Identity.Name;
                return Json(new { success = true, datas = user });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
        /// <summary>
        /// 退出
        /// </summary>
        /// <returns></returns>
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return Redirect("~/Back/Home/Login");
        }
        /// <summary>
        /// 用户列表数据
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UserLists()
        {
            try
            {
                string username = Request.Params["username"];
                int limit = int.Parse(Request.Params["limit"]);
                int page = int.Parse(Request.Params["page"]);
                bigideaEntities m = new bigideaEntities();
                var users = from x in m.User
                            where x.IsDel == "0"
                            orderby x.Id
                            select new
                            {
                                Id = x.Id,
                                UserName = x.UserName,
                                Sex = x.Sex,
                                NickName = x.NickName,
                                SelfSInfo = x.SelfSInfo,
                                Email = x.Email,
                                LastLoginTime = x.LastLoginTime,
                                IsStop = x.IsStop
                            };
                if (!string.IsNullOrEmpty(username))
                {
                    users = users.Where(x=>x.UserName.Contains(username));
                }
                return Json(new { code = 0, msg = "", data = users, count = users.Count() });
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "查询出错:" + ex.Message });
            }
        }
        /// <summary>
        /// 用户删除列表信息
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DelUserLists()
        {
            try
            {
                int limit = int.Parse(Request.Params["limit"]);
                int page = int.Parse(Request.Params["page"]);
                bigideaEntities m = new bigideaEntities();
                var users = from x in m.User
                            where x.IsDel == "1"
                            orderby x.Id
                            select new
                            {
                                Id = x.Id,
                                UserName = x.UserName,
                                Sex = x.Sex,
                                NickName = x.NickName,
                                SelfSInfo = x.SelfSInfo,
                                Email = x.Email,
                                LastLoginTime = x.LastLoginTime,
                                IsDel = x.IsDel
                            };
                return Json(new { code = 0, msg = "", data = users, count = users.Count() });

            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "查询出错:" + ex.Message });
            }
        }
        /// <summary>
        /// 编辑用户
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult EditUser(string username)
        {
            try
            {
                string email = Request.Params["email"];
                string nickname = Request.Params["nickname"];
                string type = Request.Params["type"];
                int id = int.Parse(Request.Params["id"]);
                var edituser = m.User.FirstOrDefault(x => x.Id == id);
                if (edituser == null)
                {
                    return Json(new result(false, "不存在此用户"));
                }
                edituser.UserName = username;
                edituser.Email = email;
                edituser.NickName = nickname;
                string[] roles = type.TrimEnd().Split(' ');
                foreach (var item in roles)
                {
                    RoleGive rg = new RoleGive();
                    rg.UserId = id;
                    rg.RoleId = int.Parse(item);
                    m.RoleGive.Add(rg);
                }
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "数据库保存失败"));
                }
                return Json(new result(true, "成功"));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 恢复用户
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ReUser()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    User only = m.User.SingleOrDefault(x => x.Id == id);
                    only.IsDel = "0";
                }
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "数据库保存失败"));
                }
                return Json(new result(true, ""));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
    }
}