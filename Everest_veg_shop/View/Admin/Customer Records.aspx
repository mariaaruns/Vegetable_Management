<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer Records.aspx.cs" Inherits="Everest_veg_shop.View.Admin.Customer_Records" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">

    <div class="container-fluid">
       
        <h3 class="text-center text-success mt-3 "><i class="fa-solid fa-user"></i> Customer Records</h3>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </div>
         <div class="col-sm-8">
             <asp:GridView runat="server" class="table table-hover" id="Customer_Gv">

             </asp:GridView>

         </div>

        </div>


    </div>
</asp:Content>
