﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Management/MasterPage.master" AutoEventWireup="true" CodeFile="Inquiry.aspx.cs" Inherits="Management_Inquiry" %>

<%@ Register src="../UserControl/ucColorBox/ucColorBox.ascx" tagname="ucColorBox" tagprefix="uc1" %>
<%@ Register src="../UserControl/ucGridView/ucGridVIewDataTables.ascx" tagname="ucGridVIewDataTables" tagprefix="uc2" %>
<%@ Register src="../UserControl/ucLoader/ucLoader.ascx" tagname="ucLoader" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
    <style type="text/css">
        .txtCenter
        {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBodyHead" Runat="Server">
    <div style="float:left;margin-right:5px;">
        <img src="/Images/Icon/icContact.png" alt="Inquiry Manage" title="Inquiry Manage" />
    </div>
    <div style="text-align:left;float:left;">
        <h1>Inquiry Manage</h1>
        ระบบจัดการข้อมูลการฝากคำถามถึงโรงพยาบาล | <a href="/Management/">กลับสู่หน้าหลัก</a>
    </div>
    <div style="float:right;margin-top:17px;margin-right:9px;">
        <a href="/Management/<%=webManage %>" class="cbIFrame">
            <div class="Button AddTH"></div>
        </a>
    </div>
    <div style="clear:both;"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" Runat="Server">
    <uc1:ucColorBox ID="ucColorBox1" runat="server" UID="Child" ColorBoxIframeName="cbIFrame"/>
    <uc3:ucLoader ID="ucLoader1" runat="server" />
    <asp:Label ID="lblSQL" runat="server"></asp:Label>
    <asp:Label ID="lblDG" runat="server" />

    <uc2:ucGridVIewDataTables ID="ucGridVIewDataTables1" runat="server" GridViewID="gvDefault"/>
    <div class="GridView">
        <asp:Panel ID="pnDGHeader" runat="server">
            <div class="GridViewHeader">
                <div style="float:right;">
                    <asp:Button ID="btDGSubmit" runat="server" ValidationGroup="vgDGSubmit" OnClick="btDGSubmit_Click" CssClass="Button SaveTH" />
                </div>
                <h3 style="margin-left:90px;">
                    Inquiry List
                </h3>
                <div style="clear:both;"></div>
            </div>
        </asp:Panel>
        <asp:GridView id="gvDefault" runat="server" AutoGenerateColumns="false" 
            ShowHeader="true" ShowFooter="true" CellPadding="0" Width="100%" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <th class="GridViewSubHeader" style="width:30px;">
				                    
			            </th>
			            <th class="GridViewSubHeader">
				            ชื่อ / รายละเอียด
			            </th>
                        <th class="GridViewSubHeader" style="width:180px;">
				            ศูนย์ที่เกี่ยวข้อง
			            </th>
                        <th class="GridViewSubHeader" style="width:100px;">
				            วันเวลาบันทึก
			            </th>
                        <th class="GridViewSubHeader" style="width:80px;">
				            สถานะ
			            </th>
                        <th class="GridViewSubHeader" style="width:30px;">
				                    
			            </th>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <td class="GridViewItem">
                            <!--### CurrentPageChecker:START ###-->
                            <div style="display:none;">
                                <asp:CheckBox ID="cbDGCurrentPage" runat="server" Checked="true"/>
                            </div>
                            <!--### CurrentPageChecker:END ###-->
				            <asp:Label ID="lblDGID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UID") %>' Visible="false"/>
                            <asp:CheckBox ID="cbDGActive" runat="server" Checked='<%#(DataBinder.Eval(Container.DataItem, "Active")).ToString()=="1"?true:false %>' ToolTip="เปิด/ปิด การแสดงผล"/>
			            </td>
                        <td class="GridViewItem">
                            <div style="text-align:left;padding:10px;">
                                <div style="color:#F33D3D;">
                                    <b style="color:#565757;">ข้อความ : </b><%#DataBinder.Eval(Container.DataItem,"Message") %>
                                </div>
                                <div style="color:#E8A900;border-top:1px dashed #ddd;padding-top:5px;margin-top:5px;">
                                    <b style="color:#565757;">จาก : </b><%#DataBinder.Eval(Container.DataItem,"Name") %><br />
                                    <b style="color:#565757;">อีเมล์ : </b><%#DataBinder.Eval(Container.DataItem,"Email") %> | 
                                    <b style="color:#565757;">โทรศัพท์ : </b><%#DataBinder.Eval(Container.DataItem,"Phone") %>
                                </div>
                            </div>
			            </td>
                        <td class="GridViewItem">
                            <%#DataBinder.Eval(Container.DataItem, "MedicalCenterName")%>
                        </td>
                        <td class="GridViewItem">
				            <%#DateTime.Parse(DataBinder.Eval(Container.DataItem, "MWhen").ToString()).ToString("dd/MM/yyyy HH:mm") %>
			            </td>
                        <td class="GridViewItem">
                            <span style='<%#(DataBinder.Eval(Container.DataItem, "Status").ToString()=="REPLIED"?"color:#4DB501;":"color:#F13915;")%>'>
                                <%#DataBinder.Eval(Container.DataItem, "Status")%>
                            </span>
                            <asp:TextBox ID="txtDGSort" runat="server" Width="45px" CssClass="txtCenter" Text='<%#DataBinder.Eval(Container.DataItem, "Sort")%>' Visible="false"></asp:TextBox>
                        </td>
                        <td class="GridViewItem">
                            <a href="/Management/<%=webManage %>?id=<%#DataBinder.Eval(Container.DataItem,"UID") %>&command=edit" title="แก้ไขข้อมูล" class="cbIFrame">
                                <div class="Icon16 Edit"></div>
                            </a>
				            <a onclick="return confirm('กดปุ่ม OK เพื่อยืนยันการลบข้อมูล')" 
                                href="/Management/<%=webManage %>?id=<%#DataBinder.Eval(Container.DataItem,"UID") %>&command=delete" 
                                class="Icon16 Delete" title="ลบข้อมูล">
                            </a>
			            </td>
                    </ItemTemplate>
                    <FooterTemplate>
                        <th class="GridViewSubHeader" style="width:30px;">
				                    
			            </th>
			            <th class="GridViewSubHeader">
				            ชื่อ / รายละเอียด
			            </th>
                        <th class="GridViewSubHeader" style="width:180px;">
				            ศูนย์ที่เกี่ยวข้อง
			            </th>
                        <th class="GridViewSubHeader" style="width:100px;">
				            วันเวลาบันทึก
			            </th>
                        <th class="GridViewSubHeader" style="width:80px;">
				            สถานะ
			            </th>
                        <th class="GridViewSubHeader" style="width:30px;">
				                    
			            </th>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>