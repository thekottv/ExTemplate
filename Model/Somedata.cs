//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ExTemplate.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Somedata
    {
        public int ID { get; set; }
        public string OrderName { get; set; }
        public System.DateTime OrderDate { get; set; }
        public int ClientID { get; set; }
        public int ExecutorID { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Users Users { get; set; }
    }
}