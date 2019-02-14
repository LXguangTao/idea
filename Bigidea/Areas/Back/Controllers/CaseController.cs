using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;
using Bigidea.Areas.Back.Models;

namespace Bigidea.Areas.Back.Controllers
{
    /// <summary>
    /// 案例管理
    /// </summary>
    [Authorize]
    public class CaseController : Controller
    {
        bigideaEntities m = new bigideaEntities();
        // GET: Back/Case
        /// <summary>
        /// 案例视图
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            ViewBag.count = m.Article.Count();
            return View();
        }
        /// <summary>
        /// 添加案例视图
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AddCase()
        {
            ViewBag.type = m.Article.Select(x => x.Type).Distinct().ToList();
            ViewBag.trade = m.Article.Select(x => x.Trade).Distinct().ToList();
            ViewBag.media = m.Article.Select(x => x.Media).Distinct().ToList();
            return View();
        }
        /// <summary>
        /// 添加案例
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddCase(UICaseAdd a)
        {
            try
            {
                Article newCase = new Article()
                {
                    Title = a.title,
                    Area = a.area,
                    Type = a.type,
                    Tags = a.tag,
                    Trade = a.trade,
                    Author = a.author,
                    Agency = a.agency,
                    Research = a.research,
                    Media = a.media,
                    MainPicUrl = a.MainPic,
                    Cont = a.casecont,
                    CreateTime = DateTime.Now,
                    ReadTimes = 0
                };
                m.Article.Add(newCase);
                if (m.SaveChanges() <= 0)
                {
                    return Json(new result(false, "数据保存失败"));
                }
                return Json(new result(true, ""));

            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        /// <summary>
        /// 上传图片
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
                    string upLoadPath = "~/photos/newAnli/"; //上传目录相对路径
                    string fullUpLoadPath = Server.MapPath(upLoadPath);  //将路径转换成 物理路径
                    string newFilePath = upLoadPath + newFileName; //上传后的路径
                    postFile.SaveAs(fullUpLoadPath + newFileName);  //核心方法
                    return Json(new result(true, "", "photos/newAnli/" + newFileName));
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
        /// 案例列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CaseList()
        {
            try
            {
                int page, rows;
                if (!int.TryParse(Request.Params["page"], out page))
                {
                    page = 1;
                }
                if (!int.TryParse(Request.Params["limit"], out rows))
                {
                    rows = 8;
                }
                string title = Request.Params["title"];
                string type = Request.Params["type"];
                string tag = Request.Params["tag"];
                string trade = Request.Params["trade"];
                IQueryable<Article> d = m.Article.Where(x => true);
                if (!string.IsNullOrWhiteSpace(type))
                    d = d.Where(x => x.Type == type);
                if (!string.IsNullOrWhiteSpace(tag))
                    d = d.Where(x => x.Tags.Contains(tag));
                if (!string.IsNullOrWhiteSpace(title))
                    d = d.Where(x => x.Title.Contains(title));
                if (!string.IsNullOrWhiteSpace(trade))
                    d = d.Where(x => x.Trade == trade);
                var lis = (from x in d
                           select new {
                               Id=x.Id,
                               Title = x.Title,
                               Tags = x.Tags,
                               Area = x.Area,
                               Type = x.Type,
                               Media = x.Media,
                               CreateTime = x.CreateTime,
                               ReadTimes = x.ReadTimes
                           }).ToList();
                var list = lis.OrderByDescending(x=>x.Id).Skip((page - 1) * rows).Take(rows).ToList();
                return Json(new { code = 0, msg = "", data = list, count = lis.Count() });
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "查询出错:" + ex.Message });
            }
        }
        /// <summary>
        /// 删除案例
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DelCase()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    var s = m.Collect.Where(x => x.ArticleId == id).ToList();
                    var t = m.Comment.Where(x => x.ArticleId == id).ToList();
                    foreach (var i in s)
                    {
                        m.Collect.Remove(i);
                    }
                    foreach (var j in t)
                    {
                        m.Comment.Remove(j);
                    }
                }
                m.SaveChanges();
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    Article only = m.Article.SingleOrDefault(x => x.Id == id);
                    m.Article.Remove(only);
                }
                
                if (m.SaveChanges()<=0)
                {
                    return Json(new result(false,"数据库保存失败"));
                }
                return Json(new result(true,""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        /// <summary>
        /// 推荐案例
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Rec()
        {
            try
            {
                int rec = int.Parse(Request.Params["rec"]);
                int articleid = int.Parse(Request.Params["id"]);
                var recart = m.ReArticle.FirstOrDefault(x => x.ArticleId == articleid && x.PosId == rec);
                var max = m.ReArticle.Where(x => x.PosId == rec).OrderByDescending(x => x.Weight).FirstOrDefault().Weight;
                if (recart!=null)
                {
                    return Json(new result(false,"该案例已被推荐此位置"));
                }
                ReArticle newa = new ReArticle() {
                    ArticleId = articleid,
                    PosId = rec,
                    Weight = max++
                };
                m.ReArticle.Add(newa);
                if (m.SaveChanges()<=0)
                {
                    return Json(new result(false,"推荐失败"));
                }
                return Json(new result(true,""));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
    }
}