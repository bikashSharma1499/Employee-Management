<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="NewEmployeeReg.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/css/AdminCSS.css" rel="stylesheet" />
    <style>
        label {
            color: navy;
            font-weight: bolder;
        }
    </style>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Employee Registraion</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">Employee Regisstration</li>
                </ol>
            </nav>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

      
        <div class="container-fluid h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-12 col-xl-12 p-0">
                    <div class="card">
                        <div class="card-header mb-3" style="background-color: darkturquoise;">
                            <h5 class="text-white fw-bolder mb-0 pb-0">New Regsitration </h5>
                        </div>
                        <div class="card-body">

                        <div class="row">
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtEmpName"  CssClass="form-control" placeholder="name" runat="server"></asp:TextBox>
                                    <label>
                                        Employee Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" ControlToValidate="txtEmpName" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtEmail"  CssClass="form-control" placeholder="email" runat="server"></asp:TextBox>
                                    <label>
                                        Employee Email<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" ControlToValidate="txtEmail" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:RegularExpressionValidator
                                                    ID="regexEmailValidator"
                                                    runat="server"
                                                    ControlToValidate="txtEmail"
                                                    ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b"
                                                    ErrorMessage="Invalid email address."
                                                    Display="Dynamic">
                                                </asp:RegularExpressionValidator>
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtMobile"   CssClass="form-control" MaxLength="10" placeholder="mobile" runat="server"></asp:TextBox>
                                    <label>
                                        Employee Mobile<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" ControlToValidate="txtMobile" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtMobile" FilterType="Custom" ValidChars="1234567890" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="Error"  runat="server"
                                        ControlToValidate="txtMobile" ErrorMessage="Invalid Mobile " SetFocusOnError="true" ForeColor="Red"
                                        Display="Dynamic" ValidationExpression="^\d{10}$">
                                    </asp:RegularExpressionValidator>




                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtMobile2"   MaxLength="10" CssClass="form-control" placeholder="name" runat="server"></asp:TextBox>
                                    <label>
                                        Alt mobile Name
                                    </label>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtMobile2" FilterType="Custom" ValidChars="1234567890" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="Error"  runat="server"
                                        ControlToValidate="txtMobile2" ErrorMessage="Invalid Mobile " SetFocusOnError="true" ForeColor="Red"
                                        Display="Dynamic" ValidationExpression="^\d{10}$">
                                    </asp:RegularExpressionValidator>

                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:DropDownList ID="DropDownListGender"   CssClass="form-control" placeholder="gender" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <label>
                                        Gender
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error" runat="server" InitialValue="0" ControlToValidate="DropDownListGender" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:DropDownList ID="DropDownDesignation"   CssClass="form-control" placeholder="Designation" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem>Designation 1</asp:ListItem>
                                    </asp:DropDownList>
                                    <label>
                                        Designation
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" runat="server" InitialValue="0" ControlToValidate="DropDownDesignation" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                        </div>
                        <div class="row">
                            <div class="col-md-2 mb-3">
                                <div class="form-floating">
                                    <asp:DropDownList ID="DropDownListExp"   CssClass="form-control" placeholder="Designation" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem>0 - 6 Months </asp:ListItem>
                                        <asp:ListItem>< 1 yr</asp:ListItem>
                                        <asp:ListItem>2 yr</asp:ListItem>
                                        <asp:ListItem>3 yr</asp:ListItem>
                                        <asp:ListItem>4 yr</asp:ListItem>
                                        <asp:ListItem>5 yr</asp:ListItem>
                                        <asp:ListItem> More than 5 yr</asp:ListItem>
                                    </asp:DropDownList>
                                    <label>
                                        Work Experience
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="Error" runat="server" InitialValue="0" ControlToValidate="DropDownListExp" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                </div>


                            </div>
                            <div class="col-md-2 mb-3">


                                <div class="form-floating">
                                    <asp:TextBox ID="txtDOB"   CssClass="form-control" placeholder="Enter Lead Date " runat="server"></asp:TextBox>
                                    <label>Date Of Birth</label>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtDOB"></ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" TargetControlID="txtDOB" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                    <div class="form-floating">
                                         
              
                                    <asp:TextBox ID="txtJoinDate"   CssClass="form-control" placeholder="Enter Lead Date " runat="server"></asp:TextBox>
                                    <label>Join Date</label>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtJoinDate"></ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" TargetControlID="txtJoinDate" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">
                                <div class="form-floating">

                                    <div class="form-floating">
                                        <asp:TextBox ID="txtGuardianName"   CssClass="form-control" placeholder="txtGuardianName" runat="server"></asp:TextBox>
                                        <label>
                                            Guardian Name<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtGuardianName" ValidationGroup="Error" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtGmobile"   CssClass="form-control" MaxLength="10" placeholder="txtGmobile" runat="server"></asp:TextBox>
                                    <label>
                                        Guardian Mobile
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="Error" ControlToValidate="txtGmobile" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="txtGmobile" FilterType="Custom" ValidChars="1234567890" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4"  runat="server"
                                            ControlToValidate="txtGmobile" ErrorMessage="Invalid Mobile Number" SetFocusOnError="true" ForeColor="Red"
                                            Display="Dynamic" ValidationExpression="^\d{10}$">
                                        </asp:RegularExpressionValidator>
                                    </label>
                                </div>

                            </div>
                            <div class="col-md-2 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtAdharNo"   CssClass="form-control" MaxLength="12" placeholder="txtAdharNo" runat="server"></asp:TextBox>
                                    <label>
                                        Aadhar Number &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="Error" ControlToValidate="txtAdharNo" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtMobile" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server"
                                        ControlToValidate="txtAdharNo" ErrorMessage=" Invalid Aadhar " SetFocusOnError="true" ForeColor="Red"
                                        Display="Dynamic" ValidationExpression="^\d{12}$">
                                    </asp:RegularExpressionValidator>

                                </div>

                            </div>

                        </div>


                        <div class="row">
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-floating">

                                    <div class="form-floating">
                                        <asp:TextBox ID="txtPresentAdd"   CssClass="form-control" placeholder="txtGuardianName" runat="server"></asp:TextBox>
                                        <label>
                                            Present Address<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="Error" ControlToValidate="txtPresentAdd" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 mb-3">

                                <div class="form-floating">
                                    <asp:TextBox ID="txtPermanetAdd"   CssClass="form-control" placeholder="txtGmobile" runat="server"></asp:TextBox>
                                    <label>
                                        Permanent Address<asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="Error" ControlToValidate="txtPermanetAdd" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                </div>

                            </div>



                        </div>

                            

                        <div class="mt-2">
                            <asp:LinkButton ID="btnRegister" ValidationGroup="Error"   OnClick="btnRegister_Click" CssClass="btn btn-success btn-lg" runat="server"><i class="fa-solid fa-check" style="color: #ffffff;"></i> &nbsp;Submit</asp:LinkButton>
                         

                        </div>

                    </div>
                    </div>


                </div>
            </div>

           

        </div>
                               </ContentTemplate>
        </asp:UpdatePanel>
        
         <div class="card ">
                <div class="card-body p-0">
                    <div class="row">
           
                                        <div class="col-lg-12 form-group">
                                              <asp:Label ID="lblUid" runat="server"  Visible="false" Text="Label"></asp:Label>
                                            <div class="table-responsive">
                                              
                                                <asp:GridView ID="gvEmployee" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="EmpId" AutoGenerateColumns="False" AllowPaging="True"
                                                    AllowSorting="true" PageSize="50"  CssClass="table table-condensed table-bordered table-striped">
                                                    <HeaderStyle />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                            <ItemStyle Font-Size="Smaller" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="View">
                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgDelete" OnClick="imgDelete_Click" runat="server" Height="13px" ImageUrl="../assets/img/DeleteImage.png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                              <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                        
                                                     
                                                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                       
                                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                         <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                      <asp:BoundField DataField="WorkExp" HeaderText="Work Exp" SortExpression="WorkExp" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="DateBirth" DataFormatString="{0:dd-MM-yyyy}" HeaderText="DOB" SortExpression="DateBirth" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                         <asp:BoundField DataField="DateJoining" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Join Date" SortExpression="DateJoining" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                          
                                                           <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                       
                                                       
                                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="LoginPass" HeaderText="Login Pass" SortExpression="LoginPass" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>



                </div>
            </div>
                        </div>
                    </div></div>

       
    </main>
    <!-- End #main -->
</asp:Content>

