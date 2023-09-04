<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="NewReport.aspx.cs" Inherits="Employee_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="main" class="main">


        <div class="pagetitle">
            <h1>Job Report</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">New Report</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>



                <div class="card">
                    <div class="card-header" style="background-color: darkturquoise;">
                        <h5 class="text-white fw-bolder mb-0 pb-0">Daily Job Report </h5>
                    </div>
                    <div class="card-body mt-3">
                        <div class="row mb-3">
                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtReportDate" placeholder="Reporting Date" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label>Date of Reporting</label>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtReportDate"></ajaxToolkit:CalendarExtender>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtReportDate" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:DropDownList ID="DropDownProjectName" OnSelectedIndexChanged="DropDownProjectName_SelectedIndexChanged" AutoPostBack="true" DataValueField="Puid" DataTextField="ProjectName" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>

                                    </asp:DropDownList>
                                    <label>
                                        Project
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" InitialValue="0" ControlToValidate="DropDownProjectName" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:DropDownList ID="DropDownListFunction" OnSelectedIndexChanged="DropDownListFunction_SelectedIndexChanged" AutoPostBack="true" DataValueField="Fuid" DataTextField="Functionn" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>

                                    </asp:DropDownList>
                                    <label>
                                        Function
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" InitialValue="0" ControlToValidate="DropDownListFunction" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>

                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:DropDownList ID="DropDownActivity"  DataValueField="ActId" DataTextField="Activities" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>

                                    </asp:DropDownList>
                                    <label>
                                        Activities Performed
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" InitialValue="0" ControlToValidate="DropDownActivity" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:DropDownList ID="DropDownListPIA" DataValueField="PIAid" DataTextField="Name" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>

                                    </asp:DropDownList>
                                    <label>
                                        PIA NAME/ Agency
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error" InitialValue="0" ControlToValidate="DropDownListPIA" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtDecription" CssClass="form-control" placeholder="Description" runat="server"></asp:TextBox>
                                    <label>
                                        Description / Remarks
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="Error" ControlToValidate="txtDecription" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>

                                </div>
                            </div>


                        </div>


                        <div class="row ">


                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtStartTime" CssClass="form-control" placeholder="startTime" runat="server"></asp:TextBox>
                                    <label>
                                        Start Time
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="Error" ControlToValidate="txtStartTime" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="txtStartTime"
                                        ValidationExpression="^(1[0-2]|0?[1-9]):[0-5][0-9] (AM|PM|am|pm)$"
                                        ErrorMessage="Invalid time format. Please use hh:mm am/pm."
                                        Display="Dynamic" />
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:TextBox ID="txtEndTime" CssClass="form-control" placeholder="startTime" runat="server"></asp:TextBox>
                                    <label>
                                        End Time
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="Error" ControlToValidate="txtEndTime" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:RegularExpressionValidator ID="revTime" runat="server"
                                        ControlToValidate="txtEndTime"
                                        ValidationExpression="^(1[0-2]|0?[1-9]):[0-5][0-9] (AM|PM|am|pm)$"
                                        ErrorMessage="Invalid time format. Please use hh:mm am/pm."
                                        Display="Dynamic" />

                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:DropDownList ID="DropDownRating" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
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
                                        Self Rating
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="Error" InitialValue="0" ControlToValidate="DropDownRating" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </label>

                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="form-floating mb-3">
                                    <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                    <label>
                                        Attachments
                                    </label>

                                </div>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-2">
                                <asp:LinkButton ID="LinkButton1" ValidationGroup="Error" OnClick="btnReport_Click" CssClass="btn btn-success p-2 w-100" runat="server"> <i class="ri-check-line text-white"></i> &nbsp;Submit</asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12 form-group">
                        <asp:Label ID="lblUid" runat="server" Text="Label" Visible="false"></asp:Label>
                        <div class="table-responsive">
                            
                            <asp:GridView ID="gvEmployee" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="RUid" AutoGenerateColumns="False" AllowPaging="True"
                                AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                <HeaderStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                        <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                        <ItemStyle Font-Size="Smaller" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1Delete" OnClick="ImageButton1Delete_Click1" runat="server" Height="13px" ImageUrl="../assets/img/DeleteImage.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ReportingDate" HeaderText="Reporting Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                        <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemStyle Font-Size="Smaller" Wrap="true" />
                                    </asp:BoundField>


                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" NullDisplayText="N/A" ReadOnly="false">
                                        <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                        <ItemStyle Font-Size="Smaller" Wrap="false" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Functionn" HeaderText="Function" SortExpression="Functionn" NullDisplayText="N/A" ReadOnly="false">
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
                                    <asp:TemplateField HeaderText="Attachmets" HeaderStyle-Wrap="false">
                                        <HeaderStyle ForeColor="White" Wrap="true" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />

                                        <ItemTemplate>
                                            <asp:ImageButton ID="ViewAttachment" OnClick="btnAttachment_Click" runat="server" Height="13px" ImageUrl="../assets/img/DailyExpensesImageIcon.png" />

                                        </ItemTemplate>

                                    </asp:TemplateField>
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


            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="LinkButton1" />
            </Triggers>
        </asp:UpdatePanel>


    </main>
</asp:Content>

