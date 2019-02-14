using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;

namespace Bigidea.Controllers
{
    public class ZuiXinAnLiController : Controller
    {
        // GET: ZuiXinAnLi
        bigideaEntities m = new bigideaEntities();
        [HttpPost]
        public ActionResult AnLi() {
            try
            {
                //var anli = m.Article.OrderBy(x => x.Id).Where(x => x.Id > 110).Take(12).ToList();
                string type = Request.Params["type"];
                string trade = Request.Params["trade"];
                string area = Request.Params["area"];
                string media = Request.Params["media"];
                var anli = from x in m.Article
                           where x.Id<159
                           orderby x.Id
                           select new
                           {
                               Id = x.Id,
                               Title = x.Title,
                               MainPicUrl = x.MainPicUrl,
                               Author = x.Author,
                               Agency = x.Agency,
                               ReadTimes = x.ReadTimes,
                               Type=x.Type,
                               Trade=x.Trade,
                               Area = x.Area,
                               Media=x.Media
                           };
                if (!string.IsNullOrEmpty(type))
                {
                    anli = anli.Where(x => x.Type == type);
                }
                if (!string.IsNullOrEmpty(trade))
                {
                    anli = anli.Where(x => x.Trade == trade);
                }
                if (!string.IsNullOrEmpty(area))
                {
                    anli = anli.Where(x => x.Area == area);
                }
                if (!string.IsNullOrEmpty(media))
                {
                    anli = anli.Where(x => x.Media == media);
                }
                var anlis = anli.Where(x=>x.Id>108).OrderByDescending(x=>x.Id).Take(12).ToList();
                if (anli == null)
                {
                    return Json(new result(false, "找不到"));
                }
                return Json(new result(true, "", anlis));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult Collect()
        {
            try
            {
                int articleid = int.Parse(Request.Params["id"]);
                if (this.User.Identity.Name=="")
                {
                    return Json(new result(true,"deng"));
                }
                var userid = m.User.FirstOrDefault(x=>x.UserName==this.User.Identity.Name).Id;
                var oldcli = m.Collect.FirstOrDefault(x=>x.UserId==userid && x.ArticleId==articleid);
                if (oldcli!=null)
                {
                    return Json(new result(false,"该案例已收藏"));
                }
                Collect newCli = new Collect() {
                    ArticleId = articleid,
                    UserId=userid
                };
                m.Collect.Add(newCli);
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
    }
}