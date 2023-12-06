<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Everest_veg_shop.View.Admin.Categories" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
                <div class="col-md-4"></div>
            <div class="col-md-8 mt-3">
              <h3 class="text-success"><i class="fa-solid fa-table-cells-large"></i> Manage Category</h3>
            </div>
        </div>
        <br />


            <div class="row">
                <div class="col-md-4">
                    <h3>Category details</h3>
                    <form runtat="server" method="post">
                        <div class="mb-3">
                            <label for="catName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="catName" runat="server"/>
                        </div>

                        <div class="mb-3">
                            <label for="catDescription" class="form-label">Category remarks</label>
                            <input type="text" class="form-control" id="catDescription" runat="server" />
                        </div>
                        <label id="ErrMsg" class ="text-danger" runat ="server"></label>
                        <asp:Button text="Edit" Class="btn btn-warning" runat="server" ID="btn_edit_category" OnClick="btn_edit_category_Click"/>
                        <asp:Button text="Delete" Class="btn btn-danger ms-2" runat="server" ID="btn_delete_category" OnClick="btn_delete_category_Click"/>
                        <asp:Button text="Save" Class="btn btn-success ms-2" runat="server" ID="btn_save_category" OnClick="Unnamed3_Click"/>
                    </form>
                </div>
                <div class="col-md-8">
                <asp:GridView ID="CatGv" class="table table-hover" AutoGenerateSelectButton="True" runat="server" OnSelectedIndexChanged="CatGv_SelectedIndexChanged">

                </asp:GridView>

                </div>
            </div>




    </div>


</asp:Content>
