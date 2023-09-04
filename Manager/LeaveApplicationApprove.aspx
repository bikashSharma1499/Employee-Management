<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="LeaveApplicationApprove.aspx.cs" Inherits="Manager_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .b-border {
            border: 2px solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="main" class="main">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

      
        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">Employee Leave Applciation</li>
                </ol>
            </nav>
        </div>




        <div class="container-fluid">
            <div class="row justify-content-center align-items-center">
                <div class="col-12 col-lg-12 col-xl-12 p-0">
                    <div class="card">
                        <div class="card-header text-white fw-bold bg-primary ">
                            Approve Leave Application
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 mt-2 ">
                                    <asp:LinkButton ID="btnNewApplication" OnClick="btnNewApplication_Click" CssClass="card info-card revenue-card shadow border-primary b-border" runat="server">
                                        <div class="card-body">
                                            <h5 class="card-title">New Leave Applications </h5>

                                            <div class="d-flex align-items-center">
                                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">

                                                    <i class="fa-regular fa-bell fa-2xl" style="color: #575757;"></i>
                                                </div>
                                                <div class="ps-3 ms-auto w-100 ">
                                                    <h6 class="mx-auto w-100">
                                                        <asp:Label ID="lblNewLeaveCount" CssClass="h1 text-danger" runat="server" Text="Label"></asp:Label></h6>
                                                    <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>


                                <div class="col-md-3 mt-2 ">
                                    <asp:LinkButton ID="btnApproved" OnClick="btnApproved_Click" CssClass="card info-card revenue-card shadow border-success b-border" runat="server">

                                        <div class="card-body">
                                            <h5 class="card-title">Approved  Applications </h5>

                                            <div class="d-flex align-items-center">
                                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">

                                                    <i class="fa-regular fa-square-check fa-2xl" style="color: #575757;"></i>
                                                </div>
                                                <div class="ps-3 ms-auto w-100 ">
                                                    <h6 class="mx-auto w-100">
                                                        <asp:Label ID="lblApprovedLeave" CssClass="h1 text-danger" runat="server" Text="Label"></asp:Label></h6>
                                                    <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                                </div>
                                            </div>
                                        </div>

                                    </asp:LinkButton>
                                </div>

                                <div class="col-md-3 mt-2 ">
                                    <asp:LinkButton ID="btnRejected" OnClick="btnRejected_Click" CssClass="card info-card revenue-card shadow border-warning b-border" runat="server">

                                        <div class="card-body">
                                            <h5 class="card-title">Rejected  Applications </h5>

                                            <div class="d-flex align-items-center">
                                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">

                                                    <i class="fa-regular fa-rectangle-xmark fa-2xl" style="color: #575757;"></i>
                                                </div>
                                                <div class="ps-3 ms-auto w-100 ">
                                                    <h6 class="mx-auto w-100">
                                                        <asp:Label ID="lblLeaveRejected" CssClass="h1 text-danger" runat="server" Text="Label"></asp:Label></h6>
                                                    <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                                </div>
                                            </div>
                                        </div>

                                    </asp:LinkButton>
                                </div>

                                <div class="col-md-3 mt-2 ">
                                    <asp:LinkButton ID="btnAllLeave" OnClick="btnAllLeave_Click" CssClass="card info-card revenue-card shadow border-dander b-border" runat="server">
                                        <div class="card-body">
                                            <h5 class="card-title">View All  Applications </h5>

                                            <div class="d-flex align-items-center">
                                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                    <i class="fa-regular fa-rectangle-list fa-2xl" style="color: #575757;"></i>
                                                </div>
                                                <div class="ps-3 ms-auto w-100 ">
                                                    <h6 class="mx-auto w-100">
                                                        <asp:Label ID="lblAllLeave" CssClass="h1 text-danger" runat="server" Text="Label"></asp:Label></h6>
                                                    <%--  <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>--%>
                                                </div>
                                            </div>
                                        </div>

                                    </asp:LinkButton>
                                </div>





                            </div>

                        </div>





                        <asp:Panel ID="PnlNewApplication" Visible="false" runat="server">
                            <div class="table-responsive p-3">
                                <h4 class="text-muted">New Leave Application Request</h4>
                                <asp:Label ID="lblUid1" runat="server" Visible="false" Text="Label"></asp:Label>
                                <asp:GridView ID="gvLeaveNew" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="Luid" AutoGenerateColumns="False" AllowPaging="True"
                                    AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                    <HeaderStyle />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                            <ItemStyle Font-Size="Smaller" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <HeaderStyle ForeColor="white" BackColor="#241468" Font-Bold="true" Font-Size="Small" />
                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                            <ItemTemplate>

                                                <asp:ImageButton ID="ImageBtnApproveLeave" data-bs-toggle="modal" data-bs-target="#exampleModal" OnClick="ImageBtnApproveLeave_Click" ImageUrl="../assets/img/EditProfile.png" Width="20" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="EndDate" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" SortExpression="LeaveType" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveStatus" HeaderText="Status" SortExpression="LeaveStatus" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Attachmets" HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ViewAttachment" OnClick="ViewAttachment_Click1" runat="server" Height="13px" ImageUrl="../assets/img/DailyExpensesImageIcon.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>

                        </asp:Panel>

                        <asp:Panel ID="pnlRejectLeave" Visible="false" runat="server">
                            <div class="table-responsive p-3">
                                <h4 class="text-muted">Rejected Application Request</h4>
                                <asp:Label ID="lblUidR" runat="server" Visible="false" Text="Label"></asp:Label>
                                <asp:GridView ID="gvRejected" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="Luid" AutoGenerateColumns="False" AllowPaging="True"
                                    AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                    <HeaderStyle />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                            <ItemStyle Font-Size="Smaller" />
                                        </asp:TemplateField>
                                   <%--     <asp:TemplateField HeaderText="View">
                                            <HeaderStyle ForeColor="white" BackColor="#241468" Font-Bold="true" Font-Size="Small" />
                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                            <ItemTemplate>

                                                <asp:ImageButton ID="ImageBtnDelete" OnClick="ImageBtnDelete_Click" ImageUrl="../assets/img/DeleteImage.png" Width="15" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="ApplicationDate" HeaderText="Applied Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="EndDate" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" SortExpression="LeaveType" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveStatus" HeaderText="Status" SortExpression="LeaveStatus" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveComment" HeaderText="Rejected Comment" SortExpression="LeaveStatus" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Attachmets" HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ViewAttachment1" OnClick="ViewAttachment1_Click" runat="server" Height="13px" ImageUrl="../assets/img/DailyExpensesImageIcon.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                            </div>

                        </asp:Panel>
                        <asp:Panel ID="pnlApprovedLeave" Visible="false" runat="server">
                            <div class="table-responsive p-3">
                                <h4 class="text-muted">Approved Application Request</h4>
                                <asp:Label ID="lblUidA" runat="server" Visible="false" Text="Label"></asp:Label>
                                <asp:GridView ID="gvApproved" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="Luid" AutoGenerateColumns="False" AllowPaging="True"
                                    AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                    <HeaderStyle />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                            <ItemStyle Font-Size="Smaller" />
                                        </asp:TemplateField>
                                     <%--   <asp:TemplateField HeaderText="View">
                                            <HeaderStyle ForeColor="white" BackColor="#241468" Font-Bold="true" Font-Size="Small" />
                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                            <ItemTemplate>

                                                <asp:ImageButton ID="ImageBtnDelete" OnClick="ImageBtnDelete_Click" ImageUrl="../assets/img/DeleteImage.png" Width="15" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="ApplicationDate" HeaderText="Applied Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="EndDate" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" SortExpression="LeaveType" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveStatus" HeaderText="Status" SortExpression="LeaveStatus" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveComment" HeaderText="Comments" SortExpression="LeaveComment" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Attachmets" HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ViewAttachment3" OnClick="ViewAttachment3_Click" runat="server" Height="13px" ImageUrl="../assets/img/DailyExpensesImageIcon.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                            </div>

                        </asp:Panel>

                        <asp:Panel ID="pnlAllLeave" Visible="true" runat="server">
                            <div class="table-responsive p-3">
                                <h4 class="text-muted">All Leave Application Request</h4>
                                <asp:Label ID="lblUidAll" runat="server" Visible="false" Text="Label"></asp:Label>
                                <asp:GridView ID="gvAllLeave" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="Luid" AutoGenerateColumns="False" AllowPaging="True"
                                    AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                    <HeaderStyle />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                            <ItemStyle Font-Size="Smaller" />
                                        </asp:TemplateField>
                                      <%--  <asp:TemplateField HeaderText="View">
                                            <HeaderStyle ForeColor="white" BackColor="#241468" Font-Bold="true" Font-Size="Small" />
                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                            <ItemTemplate>

                                                <asp:ImageButton ID="ImageBtnDelete" OnClick="ImageBtnDelete_Click" ImageUrl="../assets/img/DeleteImage.png" Width="15" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="ApplicationDate" HeaderText="Applied Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="EndDate" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" SortExpression="LeaveType" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveStatus" HeaderText="Status" SortExpression="LeaveStatus" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LeaveComment" HeaderText="Comments" SortExpression="LeaveComment" NullDisplayText="N/A" ReadOnly="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Attachmets" HeaderStyle-Wrap="false">
                                            <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ViewAttachment4" OnClick="ViewAttachment4_Click" runat="server" Height="13px" ImageUrl="../assets/img/DailyExpensesImageIcon.png" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                    </Columns>
                                </asp:GridView>
                            </div>

                        </asp:Panel>

                    </div>
                </div>
            </div>
        </div>
                             </ContentTemplate>
        </asp:UpdatePanel>
    </main>
         
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog ">
            <div class="modal-content">

                <div class="modal-body p-0">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <div class="card">
                                <div class="card-header bg-primary text-white">
                                    Update Leave Status
                                </div>
                                <div class="card-body">

                                    <div class="d-flex flex-column">

                                        <asp:Label ID="lblUidStatus" runat="server" Visible="false"></asp:Label>



                                        <asp:Label ID="lblName" runat="server" Visible="true"></asp:Label>
                                        <asp:Label ID="lblAppliedDate" runat="server" Visible="true"></asp:Label>
                                        <asp:Label ID="lblStartDate" runat="server" Visible="true"></asp:Label>
                                        <asp:Label ID="lblEndDate" runat="server" Visible="true"></asp:Label>
                                        <asp:Label ID="lblReason" runat="server" Visible="true"></asp:Label>

                                    </div>




                                    <div class="row mt-3 d-flex">
                                        <div class="col-xs-6 m-0 p-0">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownAction" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem>Approve</asp:ListItem>
                                                    <asp:ListItem>Reject</asp:ListItem>
                                                   
                                                </asp:DropDownList>
                                                <label>
                                                    Action
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="DropDownAction" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </label>
                                            </div>
                                            <div class="col-xs-6 m-0 p-0">
                                                <div class="form-floating">
                                                    <asp:TextBox ID="txtComment" CssClass="form-control" placeholder="txtGuardianName" runat="server"></asp:TextBox>
                                                    <label>
                                                        Comment<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtComment" ValidationGroup="Error" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">

                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>

                                        <div class="col-md-4">
                                            <asp:LinkButton ID="UpdateStatusLeave"  OnClick="UpdateStatusLeave_Click1"  CssClass="btn btn-success" runat="server">Update</asp:LinkButton>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:LinkButton ID="LinkButton1" OnClick="btnClose_Click" CssClass="btn btn-danger" runat="server">Cancel</asp:LinkButton>
                                         </div>
                                    </div>





                                </div>

                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="LinkButton1" />

                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <%--   <div class="modal-footer border-0">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
            </div>
        </div>
    </div>
</asp:Content>

