//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bigidea
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            this.Collect = new HashSet<Collect>();
            this.Comment = new HashSet<Comment>();
            this.RoleGive = new HashSet<RoleGive>();
        }
    
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Passward { get; set; }
        public string Sex { get; set; }
        public string NickName { get; set; }
        public string HeadSculpture { get; set; }
        public string SelfSInfo { get; set; }
        public string HeadPicUrl { get; set; }
        public string Email { get; set; }
        public Nullable<System.DateTime> LastLoginTime { get; set; }
        public string IsDel { get; set; }
        public string IsStop { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Collect> Collect { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoleGive> RoleGive { get; set; }
    }
}
