using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.IO;

namespace Bigidea.Models
{
    public class SendEmail
    {
        public bool Sendemail(string sendUser,int yzm)
        {
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.163.com";//邮件服务器
            client.UseDefaultCredentials = true;
            client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network; //指定电子邮件发送方式
            client.Credentials = new System.Net.NetworkCredential("18037123549@163.com", "qq1263294262");//用户名、密码

            System.Net.Mail.MailMessage Message = new System.Net.Mail.MailMessage();
            Message.From = new System.Net.Mail.MailAddress("18037123549@163.com");
            Message.To.Add(sendUser);
            Message.Subject = "大创意PITCHINA";
            Message.Body = "Hello，亲爱的用户，您此次所需的验证码为："+yzm+" ，感谢您的使用！";
            Message.SubjectEncoding = System.Text.Encoding.UTF8;
            Message.BodyEncoding = System.Text.Encoding.UTF8;
            Message.Priority = System.Net.Mail.MailPriority.High;
            Message.IsBodyHtml = true;
            try
            {
                client.Send(Message);
                return true;
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                return false;
            }
        }
        
    }
}