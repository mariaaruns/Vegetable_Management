<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Everest_veg_shop.View.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login-Everest Vegetables</title>
    <link rel="stylesheet" href="../Asset/Lib/Bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/Login.css" />
    
    
</head>
<body>
     <nav class="navbar  bg-success">
  <div class="container">
    <a class="navbar-brand"href="../Index.aspx"><h4 class ="text-bg-success">Everest Vegetables</h4>
       
    </a>
  </div>
</nav>
     
     
    <div class="container-fluid">
        <div class="row" style="height: 90px"></div>
        <div class="row" >
             <div class="col-sm-2 col-md-3 col-lg-4"></div>
            <div class="col-sm-8 col-md-6 col-lg-4">
          
            <div class="glass" >
                <h1 class="text-light text-center ">Login</h1>

                <form id="form1" runat="server">

                    <div class="mb-3">
                        <label for="email" class="form-label text-light">Email address</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" runat="server" required />
                    </div>

                    <div class="mb-3">
                        <label for="pwd" class="form-label text-light">Password</label>
                        <input type="password" class="form-control" id="pwd" required runat="server"/>
                    </div>

                    <div class="mb-3 form-check h5">
                        <input type="radio" class="form-radio-input" name="radio" id="adminRadio" checked runat="server"/>
                        <label class="form-check-label text-light" for="adminRadio">Admin</label>

                        <input type="radio" class="form-radio-input" name="radio" id="sellerRadio" runat="server"/>
                        <label class="form-check-label text-light" for="sellerRadio">Seller</label>
                    </div>

                    <div class="mb-3 d-grid">
                       
                        <label id="infoMsg" runat="server" class="text-danger"></label>
                        <asp:Button text="Login" Class="btn btn-success ms-2 btn-block" runat="server" ID="btn_Login" OnClick="btn_Login_Click" />
                    </div>

                </form>


            </div>
                </div>

            <div class="col-sm-2 col-md-3 col-lg-4"></div>

        </div>

    </div>

      

</body>
</html>
