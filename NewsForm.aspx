﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsForm.aspx.cs" Inherits="NewsForm" ValidateRequest="false" %>
<%@ Register src="UserControl/ucTextEditor/ucTextEditorFull.ascx" tagname="ucTextEditorFull" tagprefix="uc1" %>
<%@ Register src="UserControl/ucLanguage/ucLanguageDB.ascx" tagname="ucLanguageDB" tagprefix="uc2" %>
<%@ Register src="UserControl/ucCaptcha/ucCaptcha.ascx" tagname="ucCaptcha" tagprefix="uc4" %>
<%@ Register src="UserControl/ucDateTime/ucDateTimeFlat.ascx" tagname="ucDateTimeFlat" tagprefix="uc5" %>

<%@ Register src="UserControl/ucGridView/ucGridViewTemplate.ascx" tagname="ucGridViewTemplate" tagprefix="uc3" %>

<link href="CSS/cssControl.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="GridView">
        <div class="GridViewHeader">
                <asp:Label ID="lblTitle" runat="server" Font-Bold="True" ForeColor="#3366CC"></asp:Label>
        </div>
        <table cellpadding="0" cellspacing="0">
            <tr class="GridViewSubHeader">
                <td colspan="2">
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblSubject" runat="server" Text="Subject : "></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <asp:TextBox ID="txtSubject" runat="server" Width="600px"></asp:TextBox>
                    <asp:Label ID="lblUID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="Detail" runat="server" Text="Detail : "></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <uc1:ucTextEditorFull ID="txtDetail" runat="server" Width="600" />
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblImagesT" runat="server" 
                        Text="Imanges Thumpnail: "></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <asp:Label ID="lblImagesThumb" runat="server" Visible="False"></asp:Label>
                    <asp:FileUpload ID="txtImgThum" runat="server" />
                    <span style="font-size:9pt;color:#E94929;"> * 320 x 140 px</span>
                </td>
            </tr>
                        <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblImagesF" runat="server" 
                        Text="Imanges Full: "></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <asp:Label ID="lblImagesFull" runat="server" Visible="False"></asp:Label>
                    <asp:FileUpload ID="txtImgFull" runat="server" />
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblDateFrom" runat="server" Text="Date From :"></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <uc5:ucDateTimeFlat ID="txtDateFrom" runat="server" EnableTimePicker="False" MaxDate="2999-12-31"
                        MinDate="2000-01-01" />
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblDateTo" runat="server" Text="Date To :"></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <uc5:ucDateTimeFlat ID="txtDateTo" runat="server" EnableTimePicker="False" MaxDate="2999-12-31"
                        MinDate="2000-01-01" />
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblRemark" runat="server" Text="Remark : "></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <asp:TextBox ID="txtRemark" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblStatus" runat="server" Text="Status : "></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <asp:RadioButton ID="rdbActive" runat="server" Text="Active" Checked="True" GroupName="StatusFlag" />
                    &nbsp;
                    <asp:RadioButton ID="rdbInactive" runat="server" Text="Inactive" GroupName="StatusFlag" />
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                    <asp:Label ID="lblLanguage" runat="server" Text="Language :"></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                    <asp:DropDownList ID="ddlLanguage" runat="server" meta:resourcekey="DropDownList1Resource1">
                    </asp:DropDownList>
                    <asp:Label ID="lblLangUID" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                <asp:Label ID="lblMetaKeywords" runat="server" Text="Meta Keywords :"></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                <asp:TextBox ID="txtMetaKeywords" runat="server" Width="600px"></asp:TextBox>  * คั่นด้วยเครื่องหมาย ,
                </td>
            </tr>
            <tr class="GridViewItem">
                <td style="text-align: right; padding-right: 10;">
                <asp:Label ID="lblMetaDescription" runat="server" Text="Meta Description :"></asp:Label>
                </td>
                <td style="text-align: left; padding-left: 10;">
                <asp:TextBox ID="txtMetaDescription" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr class="GridViewItem">
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
        <div class="GridViewFooter">
            <asp:Button ID="btSave" runat="server" Text="" CssClass="button SaveTH"
                OnClick="btSave_Click" />
            <asp:Button ID="btDelete" runat="server" Text="" CssClass="button RemoveTH" 
                OnClick="btDelete_Click" />
        </div>
    </div>
    <uc3:ucGridViewTemplate ID="ucGridViewTemplate1" runat="server" FooterStyle="padding:20px;font-weight:bold;" />
    </form>
</body>
</html>
