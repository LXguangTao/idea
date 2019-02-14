using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;

namespace Bigidea.Areas.Back.Controllers
{
    /// <summary>
    /// 推荐管理
    /// </summary>
    [Authorize]
    public class RecController : Controller
    {
        bigideaEntities m = new bigideaEntities();
        // GET: Back/Rec
        /// <summary>
        /// 推荐视图
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            ViewBag.count = m.View_Rec.Count();
            return View();
        }
        /// <summary>
        /// 推荐案例列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CaseList()
        {
            try
            {
                string title = Request.Params["title"];
                string posid = Request.Params["posid"];
                var caselist = m.View_Rec.ToList();
                if (!string.IsNullOrEmpty(title))
                {
                    caselist = caselist.Where(x=>x.Title.Contains(title)).ToList();
                }
                if (posid==null)
                {
                    return Json(new { code = 0, data = caselist, msg = "", count = caselist.Count() });
                }
                if (int.Parse(posid)==1)
                {
                    caselist = caselist.Where(x => x.PosId == int.Parse(posid)).ToList();
                    return Json(new { code=0,data=caselist,msg="",count=caselist.Count()});
                }
                caselist = caselist.Where(x => x.PosId == int.Parse(posid)).ToList();
                return Json(new { code = 0, data = caselist, msg = "", count = caselist.Count() });
            }
            catch (Exception ex)
            {
                return Json(new { code=500,msg=ex.Message});
            }
        }
        /// <summary>
        /// 删除推荐
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DelRec()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                string[] arr1 = Request.Params["posid"].TrimEnd().Split(' ');
                for (int i = 0; i < arr.Length; i++)
                {
                    int id = int.Parse(arr[i]);
                    int posid = int.Parse(arr1[i]);
                    ReArticle only = m.ReArticle.SingleOrDefault(x => x.ArticleId == id && x.PosId==posid);
                    m.ReArticle.Remove(only);
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
        /// 推荐
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Rec()
        {
            try
            {
                int rec = int.Parse(Request.Params["rec"]);
                int articleid = int.Parse(Request.Params["id"]);
                int quanz = int.Parse(Request.Params["quanz"]);
                var recart = m.ReArticle.FirstOrDefault(x => x.ArticleId == articleid && x.PosId == rec);
                if (recart != null)
                {
                    return Json(new result(false, "该案例已被推荐此位置"));
                }
                var max = m.ReArticle.Where(x => x.ArticleId == articleid && x.PosId == rec).OrderByDescending(x=>x.Weight).FirstOrDefault().Weight;
                ReArticle newa = new ReArticle()
                {
                    ArticleId = articleid,
                    PosId = rec,
                    Weight = max++
                };
                m.ReArticle.Add(newa);
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "推荐失败"));
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