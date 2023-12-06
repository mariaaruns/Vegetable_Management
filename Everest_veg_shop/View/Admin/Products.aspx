<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Everest_veg_shop.View.Admin.Products" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">

    <div class="container-fluid">
        <div class="row">
                <div class="col-md-4"></div>
            <div class="col-md-8 mt-3">

              <h3 class ="text-success"> <i class="fa-solid fa-box"></i> Manage Products</h3>
            </div>
        </div>
        <br/>

            <div class="row">
                <div class="col-md-4">
                    <h3>Product details</h3>

                    <form runtat="server" method="post">
                        <div class="mb-3">
                            <label for="prduct_name" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="prduct_name" runat="server"/>
                        </div>

                        <div class="mb-3">
                            <label for="prduct_category" class="form-label">Product Categories</label>
                            <asp:DropDownList runat="server" id="prduct_category" class="form-control"></asp:DropDownList>
                            
                        </div>

                        <div class="mb-3">
                            <label for="prduct_price" class="form-label">Product Price</label>
                            <input type="text" class="form-control" id="prduct_price" runat="server"/>
                        </div>

                        <div class="mb-3">
                            <label for="prduct_qty" class="form-label">Product Quantity</label>
                            <input type="text" class="form-control" id="prduct_qty" runat="server"/>
                        </div>        
   

                         <div class="mb-3">
                            <label for="Exp_date" class="form-label">Product Expriation Date</label>
                            <input type="date" class="form-control" id="product_Exp_date" runat="server"/>
                             <%--<input type="date"  class="form-control" id="product_Exp_date" pattern=“\d{4}-\d{2}-\d{2}" runat="server">--%>
                        </div>
                        <label id="ErrMsg"  class="form-control text-danger" runat="server"></label>
                        <asp:Button text="Edit" Class="btn btn-warning" runat="server" ID="btn_edit_product" OnClick="btn_edit_product_Click"/>
                        <asp:Button text="Delete" Class="btn btn-danger ms-2" runat="server" ID="btn_delete_product" OnClick="btn_delete_product_Click"/>
                        <asp:Button text="Save" Class="btn btn-success ms-2" runat="server" ID="btn_save_product" OnClick="Unnamed3_Click"/>
                    </form>
                </div>
                
                <div class="col-md-8">

                           <asp:GridView ID="ProductGv" class="table table-hover" AutoGenerateSelectButton="True" runat="server" OnSelectedIndexChanged="ProductGv_SelectedIndexChanged" >

                </asp:GridView>

                </div>

            </div>




    </div>


</asp:Content>
