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
    /// 情报管理
    /// </summary>
    [Authorize]
    public class AdviceController : Controller
    {
        bigideaEntities m = new bigideaEntities();
        // GET: Back/Advice
        /// <summary>
        /// 情报视图
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 情报列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AdList()
        {
            try
            {
                var adlist = m.Advices.OrderBy(x => x.Id).ToList();
                return Json(new { code = 0, msg = "", data = adlist, count = adlist.Count() });
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = ex.Message,  });
            }
        }
        /// <summary>
        /// 删除情报
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DelAd()
        {
            try
            {
                string[] arr = Request.Params["id"].TrimEnd().Split(' ');
                foreach (var item in arr)
                {
                    int id = int.Parse(item);
                    Advices only = m.Advices.SingleOrDefault(x => x.Id == id);
                    m.Advices.Remove(only);
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
        /// 添加情报视图
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AddAd()
        {
            return View();
        }
        /// <summary>
        /// 添加情报
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddAds(UIAdAdd a)
        {
            try
            {               
                Advices newad = new Advices() {
                    Title=a.title,Subhead=a.subhead,Arbitrary=a.arbitrary,PicUrl=a.MainPic,Daoyan=a.daoyan,CoverStory=a.coverstory,
                    Dinting=a.dinting,Snakes=a.snakes
                };
                m.Advices.Add(newad);
                m.Configuration.ValidateOnSaveEnabled = false;
                m.SaveChanges();
                m.Configuration.ValidateOnSaveEnabled = true;
                return Json(new result(true,""));
                
            }
            catch (Exception ex)
            {
                return Json(new result(false,ex.Message));
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
                    string upLoadPath = "~/photos/QingBao/"; //上传目录相对路径
                    string fullUpLoadPath = Server.MapPath(upLoadPath);  //将路径转换成 物理路径
                    string newFilePath = upLoadPath + newFileName; //上传后的路径
                    postFile.SaveAs(fullUpLoadPath + newFileName);  //核心方法
                    return Json(new result(true, "", "photos/QingBao/" + newFileName));
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
    }
}