using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bigidea.Models;

namespace Bigidea.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        bigideaEntities m = new bigideaEntities();
        [HttpPost]
        public ActionResult Da()
        {
            try
            {
                var da = m.View_Rec.Where(x => x.PosId == 3).ToList();
                if (da == null)
                {
                    return Json(new result(false, "不存在"));
                }
                return Json(new result(true, "", da));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult Liu()
        {
            try
            {
                var liu = m.View_Rec.Where(x => x.PosId == 4).ToList();
                if (liu == null)
                {
                    return Json(new result(false, "不存在"));
                }
                return Json(new result(true, "", liu));
            }
            catch (Exception ex)
            {

                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult Jd() {
            try
            {
                var jd = m.View_Rec.Where(x => x.PosId == 5).ToList();
                if (jd==null) {
                    return Json(new result(false, "不存在"));
                }
                return Json(new result(true, "", jd));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        [HttpPost]
        public ActionResult QingBao()
        {
            try
            {
                var qingbao = m.Advices.OrderBy(x => x.Id).Take(4).ToList();
                if (qingbao == null)
                {
                    return Json(new result(false, "找不到"));
                }
                return Json(new result(true, "", qingbao));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult XunHuan() {
            try
            {
                //var xunhuan = m.Article.Where(x => x.Id > 110).Take(8).ToList();
                var xunhuan = from x in m.Article
                              where x.Id > 110
                              select new
                              {
                                  Title=x.Title,
                                  MainPicUrl=x.MainPicUrl,
                                  Author=x.Author,
                                  ReadTimes=x.ReadTimes,
                                  Agency = x.Agency
                              };
                var xunhuans = xunhuan.Take(8).ToList();
                if (xunhuans == null) {
                    return Json(new result(false, "找不到"));
                }
                return Json(new result(true, "", xunhuans));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult XiangQing() {
            try
            {
                int id = int.Parse(Request.Params["id"]);
                var xing = m.Article.FirstOrDefault(x => x.Id == id);
                xing.ReadTimes++;
                m.SaveChanges();
                var Xiang = from x in m.Article
                            where x.Id == id
                            select new
                            {
                                Title = x.Title,
                                MainPicUrl = x.MainPicUrl,
                                Author = x.Author,
                                ReadTimes = x.ReadTimes,
                                Agency = x.Agency,
                                Cont=x.Cont
                            };
                if (Xiang == null)
                {
                    return Json(new result(false, "找不到"));
                }
                return Json(new result(true, "", Xiang));
            }
            catch (Exception ex)
            {
                return Json(new result(false, ex.Message));
            }
        }
        [HttpPost]
        public ActionResult RecAnli()
        {
            try
            {
                var reclist = m.View_Rec.Where(x => x.PosId == 1).OrderByDescending(x=>x.Weight).Take(5).ToList();
                if (reclist==null)
                {
                    return Json(new result(false,"未找到"));
                }
                return Json(new result(true,"",reclist));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
        [HttpPost]
        public ActionResult AboutAnli()
        {
            try
            {
                var about = m.View_Rec.Where(x => x.PosId == 2).OrderByDescending(x=>x.Weight).Take(8).ToList();
                return Json(new result(true,"",about));
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
            }
        }
    }
}