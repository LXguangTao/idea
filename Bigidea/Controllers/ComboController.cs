using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;
using System.IO;
using System.Text;

namespace Bigidea.Controllers
{
    public class ComboController : Controller
    {
        bigideaEntities T = new bigideaEntities();
        // GET: Combo
        /// <summary>
        /// 查找文章
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Index()
        {
            try
            {
                //数据库查找
                string title = Request.Params["title"];
                var c = T.Article.FirstOrDefault(x => x.Title == title);
                if (c==null)
                {
                    return Json(new result(false,"该文章不存在"));
                }
                return Json(new result(true,"",c));
            }
            catch (Exception ex)//数据异常返回的
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// bigbang页面文章
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult BigBang()
        {
            try
            {
                var c = T.Article.FirstOrDefault(x => x.Title == "双11过后，最前沿的广告人都在谈论什么？");
                if (c == null)
                {
                    return Json(new result(false, "该文章不存在"));
                }
                return Json(new result(true, "", c));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 保存评论
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Fabiaos()
        {
            try
            {
                string cont = Request.Params["cont"];
                int id = int.Parse(Request.Params["id"]);
                StreamReader sr = new StreamReader("SenVoc/暴恐词库.txt", Encoding.Default);
                String line;
                List<string> arr = new List<string>();
                while ((line = sr.ReadLine()) != null)
                {
                    arr.Add(line.ToString());
                }
                foreach (var item in arr)
                {
                    if (cont.IndexOf(item)!=-1)
                    {
                       cont = cont.Replace(item, "***");
                    }
                }
                
                var user = this.User.Identity.Name;
                var users = T.User.FirstOrDefault(x=>x.UserName==user);
                if (users==null)
                {
                    return Json(new result(true,"fang"));
                }
                Comment newcom = new Comment() {
                    ArticleId=id,
                    Cont=cont,
                    UserId=users.Id,
                    CommentTime=DateTime.Now
                };
                T.Comment.Add(newcom);
                if (T.SaveChanges()<=0)
                {
                    return Json(new result(false,"保存失败"));
                }
                return Json(new result(true,""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 评论列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CommentList()
        {
            try
            {
                int id = int.Parse(Request.Params["id"]);
                var commentlist = T.View_Comment.Where(x=>x.Id==id).OrderByDescending(x => x.CommentTime).ToList();
                return Json(new result(true,"",commentlist));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 发表评论
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CreateLi()
        {
            try
            {
                var u = T.View_Comment.FirstOrDefault(x=>x.UserName==this.User.Identity.Name);
                if (u==null)
                {
                    return Json(new result(false,"尚未登录"));
                }
                return Json(new result(true,"",u));

            }
            catch (Exception ex)
            {

                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 向前台送敏感词数据
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetFile()
        {
            StreamReader sr = new StreamReader("SenVoc/暴恐词库.txt", Encoding.Default);
            String line;
            List<string> arr = new List<string>();
            while ((line = sr.ReadLine()) != null)
            {
                arr.Add(line.ToString());
            }
            return Json(new result(true,"",arr));
        }
    }
}