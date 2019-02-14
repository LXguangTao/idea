using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;

namespace Bigidea.Models
{
    public class NoWord
    {
        static string Read(string path)
        {
            StreamReader sr = new StreamReader(path, Encoding.Default);
            String line;
            List<string> arr = new List<string>();
            while ((line = sr.ReadLine()) != null)
            {
                arr.Add(line.ToString());
            }
            string sss = "";
            foreach (var item in arr)
            {
                sss += item + ",";
            }
            return sss;
        }
    }
}