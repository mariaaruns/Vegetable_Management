<%@ Page Title="" Language="C#" MasterPageFile="~/View/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Everest_veg_shop.View.Seller.Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <%--<script type="text/javascript">

        function PrintPanel() {
            var pgrid = document.getElementById('<%= BillGv.ClientID %>');
            Pgrid.border = 0;
            var Pwin = window.open('', 'PrintGrid', 'left=100,top=100,width=1024,height=768,tollbar=0,scrollbars=1,status=0,resizable=1')
            pwin.document.write(Pgrid.outerHTML);
            pwin.document.close();
            pwin.focus();
            pwin.print();
            pwin.close();
        }
    </script>--%>
     <script type="text/javascript">
         var custname = document.getElementById("Mybody_c_name").value;
         var city = document.getElementById("Mybody_city").value;
         var mobile = document.getElementById("Mybody_mobile").value;
         var cname = document.getElementById("name").innerHTML += custname;
         function PrintDiv() {
             console.log("button clicked");
             var divdata = document.getElementsByClassName("print")[0].innerHTML;
             var total = document.getElementsByClassName("print")[1].innerHTML;
            
             var printWin = window.open('', '', 'height=400,width=600');
             printWin.document.write(`<html><head><title>Invoice</title>
             <link rel="stylesheet" href="../../Asset/Lib/Bootstrap/css/bootstrap.min.css" />
             <meta charset="UTF-8">
             </head><body>
             <div class="container">
             <h2 class="text-center">Billing</h2>
             <h3 Id="name">Customer name :${custname} </h3>
             <p>Mobile :${mobile} </p>
             <p>City : ${city}<p>
             <p>Date : <p>
             ${ divdata }
             <p>Total:  ${ total }  </p>
             </div>
             </body></html>`)
             printWin.document.close();
             printWin.print();
         }

     </script>

    <div class="container-fluid">
        <div class="row mt-2">
            <div class="col-md-4">
                <div class="row">
                    <div class="col">

                        <div class="mb-3">
                            <label for="prduct_name" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="prduct_name" runat="server" />
                        </div>
                        <div class="mb-3">
                            <label for="prduct_price" class="form-label">Product price</label>
                            <input type="text" class="form-control" id="product_price" runat="server"/>
                        </div>
                        <div class="mb-3">
                            <label for="product_qty" class="form-label">Product qty</label>
                            <input type="number" class="form-control" id="product_qty" runat="server" />
                        </div>
                        

                    </div>
                           <div class="col mt-2">
                               <img src="../../Asset/Images/Bill.png" class="img-fluid ms-5" style="width:40%"/><br /><br /><br /><br /><br />
                               <br />
                               <label id="ErrMsg" runat="server" class="form-label text-danger"></label> <br/>
                <asp:Button text="Add To Bill" Class="btn btn-warning ms-2" runat="server" ID="PrntBill" OnClick="PrntBill_Click" />
                <asp:Button text="Reset" Class="btn btn-danger ms-2" runat="server" ID="Reset" OnClick="Reset_Click" />
            </div>
     
                </div>
                <div class="row mt-2">
                <div class="col-md-4">
                     <asp:GridView ID="ProductGv" class="table table-hover" AutoGenerateSelectButton="True" runat="server" OnSelectedIndexChanged="ProductGv_SelectedIndexChanged"  >
                         
                </asp:GridView>
                </div>
                  
                
            </div>
                </div>
            
                
            

            <div class="col-md-8">
                <div id="DivToPrint" runat="server">
                    <h1 class="text-center text-info"> Billing </h1>
                    <div class="row">
                        <div class="col-md-4">
                             <div class="mb-3">
                            <label for="c_name" class="form-label">Customer Name</label>
                            <input type="text" class="form-control" id="c_name" runat="server" />
                        </div>

                        </div>
                        <div class="col-md-4">
                             <div class="mb-3">
                            <label for="mobile" class="form-label">Mobile</label>
                            <input type="text" class="form-control" id="mobile" runat="server" />
                        </div>

                        </div>

                        <div class="col-md-4">
                             <div class="mb-3">
                            <label for="city" class="form-label">City</label>
                            <input type="text" class="form-control" id="city" runat="server" />
                        </div>

                        </div>
                    </div>

                <div class="row print">
                    <asp:GridView ID="BillGv" class="table table-hover" runat="server" AutoGenerateDeleteButton="True" OnRowDeleting="BillGv_RowDeleting" OnRowDeleted="BillGv_RowDeleted" >
                        <AlternatingRowStyle BorderStyle="Dotted" />
                    </asp:GridView>
                </div>
                  <div class="row print">
                        <div class ="col"></div>
                        <div class ="col">
                            <h3 class="text-danger" id="txt_grnd_ttl" runat="server"></h3>
                        </div>
                      </div>
                        <div class ="col">
                      
                            <asp:Button ID="btn_print" runat="server" Text="Save"  class="btn btn-success" OnClientClick="PrintDiv();return true" OnClick="btn_print_Click" />

                        </div>

                    </div>
            </div>
        </div>
    </div>
   
</asp:Content>
