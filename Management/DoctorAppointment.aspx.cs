﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

public partial class Management_DoctorAppointment : System.Web.UI.Page
{
    #region Global Variable
    public clsDefault clsDefault = new clsDefault();
    clsSQL clsSQL = new clsSQL();
    clsSecurity clsSecurity = new clsSecurity();
    public string tableDefault = "DoctorAppointment";
    public string webDefault = "DoctorAppointment.aspx";
    public string webManage = "DoctorAppointmentManage.aspx";
    #endregion
    #region Database Config
    string parameterChar = "@"; //SQLServer=@ MySQL=?
    clsSQL.DBType dbType = clsSQL.DBType.SQLServer;
    string cs = "cs";
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["command"]!=null)
            {
                if (Request.QueryString["command"].ToString() == "delete")
                {
                    if(clsSQL.Execute(
                        "DELETE FROM DoctorAppointment WHERE UID=@UID;",
                        new string[,] { { "@UID", Request.QueryString["id"].ToString() } }, 
                        dbType, 
                        cs))
                    {
                        //ucColorBox1.Redirect("/Management/DoctorAppointment.aspx");
                        Response.Redirect("DoctorAppointment.aspx");
                    }
                    else
                    {
                        ucColorBox1.Alert("เกิดข้อผิดพลาดขณะลบข้อมูล");
                    }
                }
            }
            else
            { 
                BindDefault();
            }
        }
    }

    protected void BindDefault()
    {
        gvDefault.Visible = true; pnDGHeader.Visible = true;
        #region Variable
        StringBuilder strSQL = new StringBuilder();
        DataTable dt = new DataTable();
        #endregion
        #region SQL Query
        strSQL.Append("SELECT ");
        strSQL.Append(tableDefault + ".UID,");
        strSQL.Append(tableDefault + ".HN,");
        strSQL.Append(tableDefault + ".PName,");
        strSQL.Append(tableDefault + ".FName,");
        strSQL.Append(tableDefault + ".LName,");
        strSQL.Append(tableDefault + ".Email,");
        strSQL.Append(tableDefault + ".Phone,");
        strSQL.Append(tableDefault + ".DoctorName,");
        strSQL.Append(tableDefault + ".DepartmentName,");
        strSQL.Append(tableDefault + ".Comment,");
        strSQL.Append(tableDefault + ".BirthDate,");
        strSQL.Append(tableDefault + ".NID,");
        strSQL.Append(tableDefault + ".AppointmentDate,");
        strSQL.Append(tableDefault + ".MWhen,");
        strSQL.Append(tableDefault + ".Sort,");
        strSQL.Append(tableDefault + ".Active ");
        strSQL.Append("FROM ");
        strSQL.Append(tableDefault + " ");
        strSQL.Append("ORDER BY ");
        strSQL.Append(tableDefault + ".Sort");
        strSQL.Append("," + tableDefault + ".MWhen DESC");
        #endregion
        #region Data Builder
        dt = clsSQL.Bind(strSQL.ToString(), dbType, cs);
        strSQL.Length = 0; strSQL.Capacity = 0;

        if (dt != null && dt.Rows.Count > 0)
        {
            lblDG.Text = "";
            gvDefault.DataSource = dt;
            if (Request.QueryString["page"] != null)
            {
                try
                {
                    gvDefault.PageIndex = int.Parse(Request.QueryString["page"].ToString());
                }
                catch (Exception ex)
                {
                    gvDefault.PageIndex = int.Parse(Request.QueryString["page"].ToString()) - 1;
                }
            }
            gvDefault.DataBind();
            dt = null;
        }
        else
        {
            pnDGHeader.Visible = false;
            lblDG.Text = clsDefault.AlertMessageColor("ไม่พบข้อมูลที่ต้องการ", clsDefault.AlertType.Info);
        }
        #endregion
    }

    protected void btDGSubmit_Click(object sender, EventArgs e)
    {
        #region Authorize
        if (!clsSecurity.LoginChecker("admin"))
        {
            ucColorBox1.Redirect("/", "เกิดข้อผิดพลาด", "คุณไม่ได้รับสิทธิ์ในการบันทึกข้อมูล กรุณาล็อคอินด้วยสิทธิ์ Admin");
            return;
        }
        #endregion
        #region Variable
        StringBuilder strSQL = new StringBuilder();
        #endregion
        #region SQL Builder
        for (int i = 0; i < gvDefault.Rows.Count; i++)
        {
            #region CurrentPageChecker
            var cbDGCurrentPage = (CheckBox)gvDefault.Rows[i].FindControl("cbDGCurrentPage");
            if (!cbDGCurrentPage.Checked) continue;
            #endregion
            Label lblDGID = (Label)gvDefault.Rows[i].FindControl("lblDGID");
            CheckBox cbDGActive = (CheckBox)gvDefault.Rows[i].FindControl("cbDGActive");
            TextBox txtDGSort = (TextBox)gvDefault.Rows[i].FindControl("txtDGSort");

            if (lblDGID != null && cbDGActive != null)
            {
                #region SQL Query
                strSQL.Append("UPDATE ");
                strSQL.Append(tableDefault + " ");
                strSQL.Append("SET ");
                strSQL.Append("Sort=" + clsSQL.CodeFilter(txtDGSort.Text) + ",");
                strSQL.Append("Active='" + (cbDGActive.Checked ? "1" : "0") + "' ");
                strSQL.Append("WHERE ");
                strSQL.Append("UID=" + lblDGID.Text);
                strSQL.Append(";");
                #endregion
            }
        }
        #endregion

        if (clsSQL.Execute(strSQL.ToString(), dbType, cs))
        {
            ucColorBox1.Redirect("/Management/" + webDefault, "ดำเนินการเสร็จสิ้น", "แก้ไขข้อมูลเสร็จเรียบร้อย");
        }
        else
        {
            ucColorBox1.Alert("เกิดข้อผิดพลาด", "เกิดข้อผิดพลาดขณะบันทึกข้อมูลลงฐานข้อมูล<br/>" + strSQL.ToString(), AlertImage: ucColorBox.Alerts.Fail);
        }
    }
}