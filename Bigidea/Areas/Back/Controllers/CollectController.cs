 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;

namespace Bigidea.Areas.Back.Controllers
{
    /// <summary>
    /// 收藏管理
    /// </summary>
    [Authorize]
    public class CollectController : Controller
    {
        bigideaEntities m = new bigideaEntities();
        // GET: Back/Collect
        /// <summary>
        /// 收藏视图
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
        /// 收藏列表视图
        /// </summary>
        /// <returns></returns>
        public ActionResult CollectList()
        {
            return View();
        }
        /// <summary>
        /// 收藏案例
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CollectLists()
        {
            try
            {
                string username = Request.Params["username"];
                var list = m.View_Collect.ToList();
                if (username == null)
                {
                    return Json(new { code = 0, msg="",data = list, count = list.Count() });
                }
                else
                {                   
                    list = list.Where(x => x.UserName.Contains(username)).ToList();
                    return Json(new { code = 0, msg="",data = list, count = list.Count() });
                }
            }
            catch (Exception ex)
            {
                return Json(new { code=500,msg=ex.Message});
            }
        }
        /// <summary>
        /// 删除收藏
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DelCollect()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    Collect only = m.Collect.SingleOrDefault(x => x.Id == id);
                    m.Collect.Remove(only);
                }
                m.SaveChanges();
                return Json(new result(true, ""));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
    }
}