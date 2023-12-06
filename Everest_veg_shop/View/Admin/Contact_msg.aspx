<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Contact_msg.aspx.cs" Inherits="Everest_veg_shop.View.Admin.Contact_msg" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <h3 class="text-center text-success mt-3"><i class="fa-solid fa-envelope"></i> Contact Messages</h3>
        <div class="row">
            
            <div class="col-sm-4"></div>
            <div class="col-sm-4 text-center">
     
                </div>
            <div class="col-sm-4"></div>
         
            </div>
        <br />
        <div class="row">
            <div class="col-sm-4"><asp:Calendar ID="cal_search_contact" runat="server" OnSelectionChanged="cal_search_contact_SelectionChanged"></asp:Calendar></div>
            <div class="col-sm-8"><asp:GridView runat="server" class="table table-hover" id="ContactGv"></asp:GridView></div>
        </div>
        
    </div>
</asp:Content>
