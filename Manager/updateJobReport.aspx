<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="updateJobReport.aspx.cs" Inherits="Manager_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Manager Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">Update Job Report</li>
                </ol>
            </nav>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <div class="container-fluid">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-12 col-lg-12 col-xl-12">

                            <div class="row ">
                                <div class="card border-primary border-1 shadow  p-0">
                                    <div class="card-header text-white bg-primary fs-5 d-flex p-1 ps-3" ">
                                        <div>
                                            Update Job Report 
                                
                                    <label for="txtReportDate" class="col-form-label ms-5 me-2">Date</label>
                                        </div>
                                        <div class="col-auto">
                                            <asp:TextBox ID="txtReportDate" OnTextChanged="txtReportDate_TextChanged" AutoPostBack="true" CssClass="form-control text-center fw-bolder w-75 mt-1" runat="server"></asp:TextBox>

                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtReportDate"></ajaxToolkit:CalendarExtender>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtReportDate" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                        </div>

                                    </div>
                                    <div class="card-body p-3">
                                        <div class="card-text">
                                            New Request
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12 form-group">

                                                <div class="table-responsive">
                                                    <asp:GridView ID="gvReport" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="RUid" AutoGenerateColumns="False" AllowPaging="True"
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

                                                                    <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" data-bs-toggle="modal" data-bs-target="#exampleModal" ImageUrl="../assets/img/EditProfile.png" Width="15" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ReportingDate" HeaderText="Reporting Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="empName" HeaderText="Employee Name" SortExpression="ProjectName" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>

                                                            <asp:BoundField DataField="PrName" HeaderText="Project Name" SortExpression="ProjectName" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>

                                                            <asp:BoundField DataField="func" HeaderText="Function" SortExpression="Functionn" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Act" HeaderText="Activities Performed" SortExpression="Activities" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="piaName" HeaderText="PIA NAME/Agency" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Nos" HeaderText="Nos" SortExpression="Nos" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Description" HeaderText="Description/ Remarks" SortExpression="Description" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="DateJoining" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="SelfRating" HeaderText="Self Rating" SortExpression="SelfRating" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                            </asp:BoundField>
                                                            <%--    <asp:TemplateField HeaderText="Attachmets" HeaderStyle-Wrap="false">
                                                        <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />

                                                        <ItemTemplate>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>--%>
                                                            <asp:BoundField DataField="ManagerRating" HeaderText="Manager Rating" SortExpression="ManagerRating" NullDisplayText="N/A" ReadOnly="false">
                                                                <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                                <ItemStyle Font-Size="Smaller" Wrap="true" />
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
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </main>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog ">
            <div class="modal-content">

                <div class="modal-body p-0">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <div class="card">
                                <div class="card-header bg-primary text-white">
                                    Report Summary
                                </div>
                                <div class="card-body">

                                    <div class="d-flex flex-column">

                                        <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>



                                        <asp:Label ID="lblName" runat="server" Visible="true"></asp:Label>
                                        <asp:Label ID="lblDate" runat="server" Visible="true"></asp:Label>

                                        <asp:Label ID="lblStartTime" runat="server" Visible="true"></asp:Label>
                                        <asp:Label ID="lblEndTime" runat="server" Visible="true"></asp:Label>
                                    </div>




                                    <div class="row mt-3">
                                        <div class="col-md-6 m-0 p-0">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownManagerRating" CssClass="form-control" runat="server">
                                                    <asp:ListItem>0</asp:ListItem>
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                </asp:DropDownList>
                                                <label>
                                                    Manager Rating 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  Display="Dynamic" ControlToValidate="DropDownManagerRating" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">

                                        <asp:Label ID="lblMsg" runat="server" ></asp:Label>
                                         <p> Avg Rating :  <asp:Label ID="lblMr" runat="server" ></asp:Label></p>
                                        <asp:Label ID="lblMr1" runat="server" Visible="false" ></asp:Label>
                                        <div class="col-md-4">
                                            <asp:LinkButton ID="BtnRatingManager" OnClick="BtnRatingManager_Click" CssClass="btn btn-success" runat="server">Rate Now</asp:LinkButton>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:LinkButton ID="LinkButton1" OnClick="btnClose_Click" CssClass="btn btn-danger" runat="server">Cancel</asp:LinkButton>
                                            <asp:Button ID="btnEdit" Visible="false" OnClick="btnEdit_Click" CssClass="btn btn-success" runat="server" Text="Edit" />
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

