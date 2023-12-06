<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Everest_veg_shop.View.Admin.Dashboard" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <h3 class="text-center text-success h-100 mt-3"><i class="fa-solid fa-chart-line"></i> Dashboard</h3>
    <br />
    <br />
    <br />

    <div class="container">
        <div class="row text-center">
            <div class="col-sm-4">
                <div class="card text-bg-primary mb-3" style="max-width: 18rem;">
                    
                    <div class="card-body">
                        <h5 class="card-title">Products</h5>
                        <h4 class="card-text" id="txt_product_count" runat="server"></h4>
 
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card text-bg-success mb-3" style="max-width: 18rem;">
                    
                    <div class="card-body">
                        <h5 class="card-title">Categories</h5>
                        <h4 class="card-text" id="txt_categories_count" runat="server"></h4>
 
                    </div>
                </div>

            </div>

            <div class="col-sm-4">
                <div class="card text-bg-danger mb-3" style="max-width: 18rem;">
                    
                    <div class="card-body">
                        <h5 class="card-title">Total Earnings</h5>
                        <h4 class="card-text" id="txt_finanace" runat="server"></h4>
                    </div>
                </div>
            </div>

            
        </div>
        
        <br />
        <br />
        <br />
        <div class="row  text-center">
            <div class="col-sm-4">
                
                <div class="card text-bg-primary mb-3" style="max-width: 18rem;">
                    
                    <div class="card-body">
                        <h5 class="card-title">Seller List</h5>
            
                        <div class="row">
                        <div class="col-sm-8"><asp:DropDownList runat="server" id="cb_sellers" class="form-control" OnSelectedIndexChanged="cb_sellers_SelectedIndexChanged"></asp:DropDownList></div>
                        <div class="col-sm-4"><asp:Button ID="get_total" runat="server" class="btn btn-warning" Text="Get" OnClick="Button1_Click" /> </div>
                        </div>
                        </div>
                    </div>
                </div>
            

            <div class="col-sm-4">
                <div class="card text-bg-success mb-3" style="max-width: 18rem;">
                    
                    <div class="card-body">
                        <h5 class="card-title">Revenue By seller</h5>
                        <h4 class="card-text" id="txt_totalsales" runat="server"></h4>
                        
                    </div>
                </div>

            </div>

            <div class="col-sm-4">
                <div class="card text-bg-danger mb-3" style="max-width: 18rem;">
                    
                    <div class="card-body">
                        <h5 class="card-title">Sellers</h5>
                        <h4 class="card-text" id="txt_sellers_count" runat="server"></h4>
                    </div>
                </div>
            </div>

            
        </div>


        

        
                </div>





        
</asp:Content>
