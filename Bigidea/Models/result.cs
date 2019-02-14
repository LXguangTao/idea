using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bigidea.Models
{
    public class result
    {
        public bool success { get; set; }
        public string message { get; set; }
        public string remark { get; set; }
        public object data { get; set; }
        public result(bool success, string message)
        {
            this.success = success;
            this.message = message;
        }
        public result(bool success, string message,object data)
        {
            this.success = success;
            this.message = message;
            this.data = data;
        }
        public result(bool success, string message, string remark)
        {
            this.success = success;
            this.message = message;
            this.remark = remark;
        }
    }
}