using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;
using Bigidea.Areas.Back.Models;
using System.Web.Security;

namespace Bigidea.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        bigideaEntities m = new bigideaEntities();
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login()
        {
            using (bigideaEntities b = new bigideaEntities())
            {
                /*接收从前台传送的数据*/
                string userzhanghao = Request.Params["userzh"];
                string usermima = MD5.MD5Encrypt(Request.Params["userpwd"]);
                string vccode = Request.Form["code"];
                //验证验证码
                if (string.IsNullOrEmpty(vccode))
                {
                    return Json(new result(false, "验证码不能为空"));
                }
                else
                {
                    if (Session["code"] == null)
                        return Json(new result(false, "验证码已过期，请点击刷新验证码"));
                    string str = Session["code"].ToString();
                    str = str.ToLower();
                    vccode = vccode.ToLower();
                    if (str != vccode)
                        return Json(new result(false, "验证码填写错误!"));
                    else
                    {
                        Session["code"] = null;
                    }
                }
                try
                {
                    var user = b.User.SingleOrDefault(x => x.UserName == userzhanghao && x.Passward == usermima);
                    /*从数据库中查取该用户是否存在*/
                    if (user == null)
                    {
                        return Json(new result(false, "帐号或密码输入错误"));
                    }
                    FormsAuthentication.SetAuthCookie(userzhanghao, false);/*给用户颁发通行证*/
                    return Json(new result(true, ""));
                }
                catch (Exception ex)
                {
                    return Json(new result(false, ex.Message,"no"));
                }
            }
        }
        /// <summary>
        /// 登录页面的验证码
        /// </summary>
        /// <returns></returns>
        public ActionResult VCode()
        {
            VerificationCodeHelper vcode = new VerificationCodeHelper();
            string codeStr = vcode.GetRandomCode();
            if (!string.IsNullOrEmpty(codeStr))
            {
                byte[] arrImg = vcode.GetVCode(codeStr);
                Session["code"] = codeStr;
                return File(arrImg, "image/gif");
            }
            else
            {
                return RedirectToAction("/Home/VCode?rand=" + Guid.NewGuid().ToString().Substring(1, 10), "image/jpeg");
            }
        }
        /// <summary>
        /// 忘记密码
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult WangJiMiMa()
        {
            string newpass = Request.Params["newpass"];
            string repass = Request.Params["repass"];
            string username = Request.Params["username"];
            /*接收从前台传送的数据*/
            try
            {
                using (bigideaEntities b = new bigideaEntities())
                {
                    var user = b.User.FirstOrDefault(x => x.UserName == username);/*从数据库中查询该用户*/
                    if (user == null)
                    {
                        return Json(new result(false, "找不到"));
                    }
                    if (newpass != repass)
                    {
                        return Json(new result(false, "两次密码不一致"));
                    }
                    user.Passward = MD5.MD5Encrypt(newpass);
                    /*将该用户的新密码存入到数据库*/
                    if (b.SaveChanges() <= 0)
                    {
                        return Json(new result(false, "新密码修改失败"));
                    }
                    return Json(new result(true, ""));
                }
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 验证用户名
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUsername()
        {
            //忘记密码验证用户
            try
            {
                string username = Request.Params["username"];
                var user = from x in m.User
                           where x.UserName == username
                           select new           //查询该用户的信息
                           {
                               UserName = x.UserName,
                               Email = x.Email
                           };
                if (user == null)
                {
                    return Json(new result(false, "用户名错误"));
                }
                return Json(new result(true, "", user));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 注册
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Zhuce()
        {
            //接收从前台传的数据
            string name = Request.Params["name"];
            string pwd = MD5.MD5Encrypt(Request.Params["pwd"]);//密码加密
            string email = Request.Params["email"];
            using (bigideaEntities b = new bigideaEntities())
            {
                try
                {
                    User u = new User()
                    {
                        UserName = name,
                        Passward = pwd,
                        Email = email,
                        Sex = "0",
                        NickName = name,
                        HeadPicUrl = "images/default12.png",
                        HeadSculpture = "images/headTwo.png",/*注册之后的默认头像和头图*/
                        IsDel = "0"//用户列表中用户的状态
                    };
                    b.User.Add(u);
                    if (b.SaveChanges() <= 0)
                    {
                        return Json(new result(false, "保存失败"));
                    }
                    RoleGive s = new RoleGive()
                    {
                        UserId = m.User.SingleOrDefault(x => x.UserName == name).Id,/*将该用户的信息添加到权限表中*/
                        RoleId = 1
                    };
                    return Json(new result(true, ""));
                }
                catch (Exception ex)
                {
                    return Json(new result(false, ex.Message));
                }
            }
        }
        /// <summary>
        /// 发送验证码
        /// </summary>
        /// <param name="useremail"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SendEmails(string useremail)
        {
            try
            {
                Random rd = new Random();//随机数
                int num = rd.Next(100000, 1000000);//取值范围
                SendEmail b = new SendEmail();//创建对象
                bool a = b.Sendemail(useremail, num);//调用方法
                if (a == true)
                {
                    return Json(new result(true, num.ToString()));//将验证码转化为字符串
                }
                else
                {
                    return Json(new result(false, ""));
                }
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 个人主页的用户的信息
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Self()
        {
            try
            {
                var users = from x in m.User
                            select new
                            {
                                UserName = x.UserName,
                                Email = x.Email,            /*登录成功后在个人主页显示个人信息*/
                                HeadPicUrl = x.HeadPicUrl,
                                SelfSInfo = x.SelfSInfo,
                                HeadSculpture = x.HeadSculpture
                            };
                users = users.Where(x => x.UserName == this.User.Identity.Name);
                if (users == null)
                {
                    return Json(new result(false, "该用户不存在"));
                }
                return Json(new result(true, "", users));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UploadPhoto()
        {
            try
            {
                HttpPostedFileBase postFile = Request.Files["file"];
                if (postFile != null)
                {
                    string fileExt = postFile.FileName.Substring(postFile.FileName.LastIndexOf(".") + 1); //文件扩展名，不含“.”
                    string newFileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + "." + fileExt; //随机生成新的文件名
                    string upLoadPath = "~/photos/head/"; //上传目录相对路径
                    string fullUpLoadPath = Server.MapPath(upLoadPath);  //将路径转换成 物理路径
                    string newFilePath = upLoadPath + newFileName; //上传后的路径
                    postFile.SaveAs(fullUpLoadPath + newFileName);  //核心方法
                    return Json(new result(true, "", "photos/head/" + newFileName));
                }
                else
                {
                    return Json(new result(false, "未检测到文件数据"));
                }
            }
            catch (Exception ex)
            {
                return Json(new result(false, "上传失败:" + ex.Message));
            }
        }
        /// <summary>
        /// 修改头图
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UploadToutu()
        {
            try
            {
                HttpPostedFileBase postFile = Request.Files["file"];
                if (postFile != null)
                {
                    string fileExt = postFile.FileName.Substring(postFile.FileName.LastIndexOf(".") + 1); //文件扩展名，不含“.”
                    string newFileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + "." + fileExt; //随机生成新的文件名
                    string upLoadPath = "~/photos/Toutu/"; //上传目录相对路径
                    string fullUpLoadPath = Server.MapPath(upLoadPath);  //将路径转换成 物理路径
                    string newFilePath = upLoadPath + newFileName; //上传后的路径
                    postFile.SaveAs(fullUpLoadPath + newFileName);  //核心方法
                    return Json(new result(true, "", "photos/Toutu/" + newFileName));
                }
                else
                {
                    return Json(new result(false, "未检测到文件数据"));
                }
            }
            catch (Exception ex)
            {
                return Json(new result(false, "上传失败:" + ex.Message));
            }
        }
        /// <summary>
        /// 获得收藏
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetCollect()
        {
            try
            {
                var user = this.User.Identity.Name;
                var rearticle = m.View_Collect.Where(x => x.UserName == user).ToList();
                if (rearticle == null)
                {
                    return Json(new result(false, "未找到"));
                }
                return Json(new result(true, "", rearticle));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }        
        /// <summary>
        /// 保存
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Save()
        {
            string touxiangUrl = Request.Params["txUrl"];
            string username = Request.Params["username"];
            string oldusername = Request.Params["oldusername"];
            string email = Request.Params["email"];
            string self = Request.Params["self"];
            string toutuSrc = Request.Params["toutuSrc"];//接收从个人主页传的数据
            using (bigideaEntities b = new bigideaEntities())
            {
                try
                {
                    var user = b.User.FirstOrDefault(x => x.UserName == oldusername);//查询到该用户
                    user.UserName = username;
                    user.HeadPicUrl = touxiangUrl;
                    user.Email = email;
                    user.SelfSInfo = self;
                    user.HeadSculpture = toutuSrc;
                    b.SaveChanges();//将该用户修改后的信息保存在数据库中
                    return Json(new result(true, touxiangUrl, toutuSrc));
                }
                catch (Exception ex)
                {
                    return Json(new result(false, ex.Message));
                }
            }
        }
        /// <summary>
        /// 退出
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SignOut()
        {
            try
            {
                FormsAuthentication.SignOut();
                return Json(new result(true, ""));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult LoginUser()
        {
            try
            {
                var user = from x in m.User
                           select new
                           {
                               UserName = x.UserName,
                               HeadPicUrl = x.HeadPicUrl
                           };
                var userss = this.User.Identity.Name;
                var users = user.Where(x => x.UserName == userss).FirstOrDefault();
                if (users == null)
                {
                    return Json(new result(false, "该用户不存在"));
                }
                return Json(new result(true, "", users));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult LoginUsers()
        {
            try
            {
                var user = from x in m.User
                           select new
                           {
                               UserName = x.UserName,
                               HeadPicUrl = x.HeadPicUrl
                           };
                var userss = this.User.Identity.Name;
                var users = user.Where(x => x.UserName == userss).FirstOrDefault();
                if (users == null)
                {
                    return Json(new result(false, "该用户不存在"));
                }
                return Json(new result(true, "", users));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
    }
}