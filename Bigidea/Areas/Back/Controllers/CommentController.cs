using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;

namespace Bigidea.Areas.Back.Controllers
{
    /// <summary>
    /// 评论管理
    /// </summary>
    [Authorize]
    public class CommentController : Controller
    {
        bigideaEntities m = new bigideaEntities();
        // GET: Back/Comment
        /// <summary>
        /// 评论视图
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            ViewBag.type = m.Article.OrderByDescending(x => x.Id).Select(x => x.Type).Distinct().ToList();
            var tag = m.Article.OrderBy(x => x.Id).Select(x => x.Tags).ToList();
            List<string> tags = new List<string>();
            foreach (var i in tag)
            {
                if (i != null)
                {
                    string[] arr = i.Split(new char[] { ',', '，' });
                    foreach (var j in arr)
                    {
                        if (!tags.Contains(j))
                        {
                            tags.Add(j);
                        }
                    }
                }
            }
            ViewBag.tag = tags;
            ViewBag.trade = m.Article.OrderByDescending(x => x.Id).Select(x => x.Trade).Distinct().ToList();
            return View();
        }
        /// <summary>
        /// 评论案例
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CaseList()
        {
            try
            {
                string title = Request.Params["title"];
                string type = Request.Params["type"];
                string tag = Request.Params["tag"];
                string trade = Request.Params["trade"];
                int page, rows;
                if (!int.TryParse(Request.Params["page"], out page))
                {
                    page = 1;
                }
                if (!int.TryParse(Request.Params["limit"], out rows))
                {
                    rows = 10;
                }
                IQueryable<Article> d = m.Article.Where(x => true);
                if (!string.IsNullOrWhiteSpace(type))
                    d = d.Where(x => x.Type == type);
                if (!string.IsNullOrWhiteSpace(tag))
                    d = d.Where(x => x.Tags.Contains(tag));
                if (!string.IsNullOrWhiteSpace(title))
                    d = d.Where(x => x.Title.Contains(title));
                if (!string.IsNullOrWhiteSpace(trade))
                    d = d.Where(x => x.Trade == trade);
                //var caseList = d.OrderBy(x => x.Id).Select(new { Id= this. }).ToList();
                var caseList = (from s in d
                                orderby s.Id
                                select new
                                {
                                    Id = s.Id,
                                    Title = s.Title
                                }).ToList();
                var list = caseList.Skip((page - 1) * rows).Take(rows).ToList();
                return Json(new { code = 0, msg = "", data = list, count = d.Count() });
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "查询出错:" + ex.Message });
            }
        }
        /// <summary>
        /// 评论列表视图
        /// </summary>
        /// <returns></returns>
        public ActionResult CommentList()
        {
            return View();
        }
        /// <summary>
        /// 评论列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CommentLists()
        {
            try
            {
                string title = Request.Params["title"];
                string id = Request.Params["id"];
                string critics = Request.Params["critics"];
                if (id == "")
                {
                    var list = m.View_Comment.ToList();
                    if (!string.IsNullOrEmpty(title))
                    {
                        list = list.Where(x => x.Title.Contains(title)).ToList();
                    }
                    if (!string.IsNullOrEmpty(critics))
                    {
                        list = list.Where(x => x.UserName == critics).ToList();
                    }
                    return Json(new { code = 0, msg = "", data = list, count = list.Count() });
                }
                else
                {
                    int ids = int.Parse(id);
                    var list = m.View_Comment.Where(x => x.Id == ids).ToList();
                    if (!string.IsNullOrEmpty(title))
                    {
                        list = list.Where(x => x.Title.Contains(title)).ToList();
                    }
                    if (!string.IsNullOrEmpty(critics))
                    {
                        list = list.Where(x => x.UserName == critics).ToList();
                    }
                    return Json(new { code = 0, msg = "", data = list, count = list.Count() });
                }
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "查询出错:" + ex.Message });
            }
        }
        /// <summary>
        /// 删除评论
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DelComment()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    Comment only = m.Comment.SingleOrDefault(x => x.Id == id);
                    m.Comment.Remove(only);
                }
                m.SaveChanges();
                return Json(new result(true, ""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
    }
}