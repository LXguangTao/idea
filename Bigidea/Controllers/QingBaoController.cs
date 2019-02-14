using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bigidea.Controllers
{
    public class QingBaoController : Controller
    {
        // GET: QingBao
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult QingBao()
        {
            try
            {
                using (bigideaEntities U = new bigideaEntities())
                {
                    var QingBao = U.Advices.OrderBy(x => x.Id).ToList();
                    return Json(new { success = true, data = QingBao });
                }
            }
            catch (Exception ex)
            {
                return Json( new { success=false,message=ex.Message});
            }
        }

        [HttpPost]
        public ActionResult QingBaoXiangQing()
        {
            try
            {
                int id = int.Parse(Request.Params["id"]);
                using (bigideaEntities U = new bigideaEntities())
                {
                    var QingBaoXiangQing = U.Advices.SingleOrDefault(x=>x.Id==id);
                    return Json(new { success = true, data = QingBaoXiangQing });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


    }
}