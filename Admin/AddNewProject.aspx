<%@ Page Title="" Language="C#" EnableEventValidation="false" EnableViewState="true" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddNewProject.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

      
    <main id="main" class="main " style="margin-bottom: 450px;">
        
        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">Master</li>
                    <li class="breadcrumb-item active">Add New Projects</li>

                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section dashboard">


            <div class="card mx-auto p-3 shadow border-primary" style="border:2px solid; ">
                <div class="card-header text-white fw-bolder" style="background-color:turquoise;">Add New Project</div>
                <div class="row  border-4 rounded-3">
                    <div class="col-md-4">
                        <div class="card">
                            
                            <div class="card-body p-2">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtProject" CssClass="form-control" placeholder="txtProject" runat="server"></asp:TextBox>
                                    <label>
                                        Project Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" Display="Dynamic" ControlToValidate="txtProject" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                </div>
                                <div class="mt-3">
                                    <asp:LinkButton ID="btnAddProject" ValidationGroup="Error" OnClick="btnAddProject_Click" CssClass="btn btn-success" runat="server">Add New</asp:LinkButton>
                                    <asp:LinkButton ID="btnUpdateProject" OnClick="btnUpdateProject_Click" CssClass="btn btn-success" Visible="false" runat="server">Update</asp:LinkButton>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="row mt-2">
                    <div class="col-lg-12 form-group">
                        <asp:Label ID="lblUid" runat="server" Text="Label" Visible="false"></asp:Label>
                        <div class="table-responsive rounded-2">
                            
                            <asp:GridView ID="gvProject" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="PUid" AutoGenerateColumns="False" AllowPaging="True"
                                AllowSorting="true" PageSize="10" CssClass="table table-condensed table-bordered table-striped">
                                <HeaderStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                        <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                        <ItemStyle Font-Size="Smaller" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1Select"  OnClick="ImageButton1Select_Click" runat="server" Height="13px" ImageUrl="../assets/img/EditProfile.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Action">
                                        <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1Delete"  OnClick="ImageButton1Delete_Click" runat="server" Height="13px" ImageUrl="../assets/img/DeleteImage.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name"  SortExpression="ProjectName" NullDisplayText="N/A" ReadOnly="false">
                                        <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemStyle Font-Size="Smaller" Wrap="false" />
                                    </asp:BoundField>



                                </Columns>
                            </asp:GridView>
                         
                        </div>
                    </div>
                </div>
                    </div>
                </div>
            </div>


        </section>
    </main>
              </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

