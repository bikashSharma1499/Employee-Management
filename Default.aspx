<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <link href="../assets/img/favicon.ico" rel="icon" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            background-color: navy;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
<%--        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
     
          
        <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
            <div class="container ">


                <div class="col-md-4  mx-auto">
                    <div class="card ">

                        <div class="card-header bg-light border-bottom-0">
                                   <div class="brand-wrapper">
                                <h3 class=" fw-bolder  text-center ">
                                    <img src="assets/img/Logo.png" /></h3>
                            </div>
                        </div>
    <%--                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>

                        <div class="card-body">
                     
                            <p class="login-card-description text-muted text-center">Sign into your account</p>

                            <div class=" form-floating mb-3">
                                <asp:TextBox ID="txtUser" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                <label>
                                    Email ID
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="txtUser" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </label>
                            </div>
                            <div class=" form-floating mb-3">
                                <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                <label>
                                    Password
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="txtUser" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </label>
                            </div>
                            <div class="form-floating mb-5">
                                <asp:DropDownList ID="DropDownListUser" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                    <asp:ListItem Value="Admin" Text="Admin"></asp:ListItem>
                                    <asp:ListItem Value="Manager" Text="Manager"></asp:ListItem>
                                    <asp:ListItem Value="Employee" Text="Employee"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label AssociatedControlID="DropDownListUser" runat="server">User Type</asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ControlToValidate="DropDownListUser" runat="server" ErrorMessage="*" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                         <%--   <i class="fa-solid fa-right-to-bracket fa-fade" style="color: #f3f2f2;"></i>--%>

                            <div class="row"> <asp:Button ID="loginBtn" OnClick="loginBtn_Click" CssClass="  btn btn-dark text-white w-50 mx-auto" runat="server" Text="Login" />
                      </div>
                                 <br />


                            <h1 class=" font-monospace"></h1>

                        </div>
    <%--                       </ContentTemplate>
        </asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>
        </main>
       
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
