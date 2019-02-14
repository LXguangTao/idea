using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Bigidea.Areas.Back.Models
{
    public class UICaseAdd
    {
        public string title { get; set; }
        public string area { get; set; }
        public string type { get; set; }
        public string tag { get; set; }
        public string trade { get; set; }
        public string author { get; set; }
        public string agency { get; set; }
        public string research { get; set; }
        public string media { get; set; }
        public string MainPic { get; set; }
        public string casecont { get; set; }
    }
}