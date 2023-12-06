<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Seller.aspx.cs" Inherits="Everest_veg_shop.View.Admin.Seller" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">

    <div class="container-fluid">
        <div class="row mt-3">
                <div class="col-md-4"></div>
            <div class="col-md-8">
                <h3 class ="text-success"><i class="fa-solid fa-user-tie"></i> Manage Seller</h3>
            </div>
        </div>
<br />

            <div class="row">
                <div class="col-md-4">
                    <h3>Seller details</h3>
                    <form runtat="server" method="post">
                        <div class="mb-3">
                            <label for="seller_name" class="form-label">Seller Name</label>
                            <input type="text" class="form-control" id="seller_name" runat="server" />
                        </div>

                        <div class="mb-3">
                            <label for="seller_email" class="form-label">Seller Email</label>
                            <input type="text" class="form-control" id="seller_email" runat="server"/>
                        </div>

                        <div class="mb-3">
                            <label for="seller_pwd" class="form-label">Seller Password</label>
                            <input type="text" class="form-control" id="seller_pwd" runat="server"/>
                        </div>

                        <div class="mb-3">
                            <label for="seller_phone" class="form-label">Seller Phone</label>
                            <input type="text" class="form-control" id="seller_phone" runat="server" />
                        </div>        
   

                         <div class="mb-3">
                            <label for="seller_address" class="form-label">Seller Address</label>
                            <input type="text" class="form-control" id="seller_address" runat="server"/>
                        </div>
                        <label id="ErrMsg" runat="server" class="text-danger"></label>
                        <asp:Button text="Edit" Class="btn btn-warning" runat="server" ID="btn_edit_seller" OnClick="Unnamed1_Click"/>
                        <asp:Button text="Delete" Class="btn btn-danger ms-2" runat="server" ID="btn_delete_seller" OnClick="btn_delete_seller_Click"/>
                        <asp:Button text="Save" Class="btn btn-success ms-2" runat="server" ID="btn_save_seller" OnClick="Unnamed3_Click"/>
                    </form>
                </div>
                <div class="col-md-8">
                    <asp:GridView ID="sellerGv" runat="server" class="table table-hover" AutoGenerateSelectButton="True" OnSelectedIndexChanged="sellerGv_SelectedIndexChanged">

                    </asp:GridView>

                </div>

            </div>




    </div>

</asp:Content>
