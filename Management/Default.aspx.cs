﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_Default : System.Web.UI.Page
{
    #region GlobalVariable
    public clsSecurity clsSecurity = new clsSecurity();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        int? Test;
        Test = null;
        Response.Write(Test.ToString() ?? "ไม่ว่าง");
    }
}