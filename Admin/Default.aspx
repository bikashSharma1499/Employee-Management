<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .border{
           border:2px solid;
           border-radius:5px;
        }
    </style>
     <script type="text/javascript">
        // Function to prevent the Enter key from submitting the form
        function disableEnterKey(e) {
            var key = e.keyCode || e.which;
            if (key === 13) {
                e.preventDefault();
            }
        }

        // Attach the function to the keydown event of the document or a specific element
        document.addEventListener("keydown", disableEnterKey);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main id="main" class="main mb-5">

        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">

                <!-- Left side columns -->
                <div class="col-lg-8">
                    <div class="row">

                        <!-- Sales Card -->
                        <div class="col-xxl-4 col-md-6">
                            <div class="card info-card sales-card border border-primary">



                                <div class="card-body">
                                    <h5 class="card-title">Total Employees </h5>

                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>
                                                <asp:Label ID="lblTotalEmp" runat="server" Text="Label"></asp:Label></h6>
                                            <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End Sales Card -->

                        <!-- Sales Card -->
                        <div class="col-xxl-4 col-md-6">
                            <div class="card info-card sales-border border border-danger ">



                                <div class="card-body">
                                    <h5 class="card-title">Employees On Leave</h5>

                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>
                                                <asp:Label ID="lblEmpOnLeave" runat="server" Text="Label"></asp:Label></h6>
                                            <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End Sales Card -->

                        <!-- Customers Card -->
                        <!-- Sales Card -->
                        <div class="col-xxl-4 col-md-6">
                            <div class="card info-card sales-card border border-warning">



                                <div class="card-body">
                                    <h5 class="card-title">Employee Working </h5>

                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>
                                                <asp:Label ID="lblEmpWorking" runat="server" Text="Label"></asp:Label></h6>
                                            <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- End Sales Card -->




                        <!-- Recent Sales -->
                        <div class="col-lg-12">

                            <div class="card shadow">
                                <div class="card-header text-white p-2 fs-4 fw-bolder" style="background-color:turquoise;">
                                    Top Employee
                                </div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <asp:GridView ID="gvTopEmployee" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="EmpId" AutoGenerateColumns="False" AllowPaging="True"
                                            AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                            <HeaderStyle />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                                    <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                    <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                    <ItemStyle Font-Size="Smaller" />
                                                </asp:TemplateField>
                                                <%--    <asp:TemplateField HeaderText="View">
                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="13px" ImageUrl="../img/EditProfile.png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                    <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                </asp:BoundField>


                                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="false">
                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                    <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" NullDisplayText="N/A" ReadOnly="false">
                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                    <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ManagerRating" HeaderText="Rating" SortExpression="Designation" NullDisplayText="N/A" ReadOnly="false">
                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                    <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                </asp:BoundField>

                                            </Columns>
                                        </asp:GridView>
                                        <%--  <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="Select * from tblContractorMaster where Status ='Active' ORDER BY EmpId DESC" FilterExpression="ContractorName LIKE '%{0}%'  or Mobile LIKE '%{0}%'">
                                                    <FilterParameters>
                                                        <asp:ControlParameter Name="Name" ControlID="txtSearch" PropertyName="Text" />
                                                        <asp:ControlParameter Name="Mobile" ControlID="txtSearch" PropertyName="Text" />
                                                    </FilterParameters>
                                                </asp:SqlDataSource>--%>
                                    </div>
                                </div>
                            </div>



                        </div>


                    </div>


                </div>

                <div class="col-lg-4">


                    <!-- Recent Activity -->
                    <div class="card" style="height:460px;">
                     

                        <div class="card-body">
                            <h5 class="card-title">Recent Activity <span>| Today</span></h5>

                            <asp:Repeater ID="rptActivities" runat="server">
                                <ItemTemplate>
                                    <div class="activity-item d-flex">
                                        <i class='bi bi-check2 activity-badge text-success align-self-start'></i>
                                        <div class="activity-content">
                                            <span class="text-danger h5 p-2"><%# Eval("ProjectName") %></span><br />
                                            <span class="text-info h6 p-2"><%# Eval("Name") %></span>
                                            <span class="text-primary p-2"><%# Eval("Description") %></span>
                                        </div>
                                    </div>
                                    <!-- End activity item-->
                                </ItemTemplate>
                            </asp:Repeater>


                        </div>
                    </div>
                    <!-- End Recent Activity -->

                </div>
            </div>


        </section>

    </main>
    <!-- End #main -->
</asp:Content>

