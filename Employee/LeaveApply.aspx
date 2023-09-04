<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="LeaveApply.aspx.cs" Inherits="Employee_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Style for the calendar header */
        .shadow .ajax__calendar_container .ajax__calendar_header {
            background-color: red;
        }

            /* Style for the calendar header text */
            .shadow .ajax__calendar_container .ajax__calendar_header a,
            .shadow .ajax__calendar_container .ajax__calendar_header a:hover,
            .shadow .ajax__calendar_container .ajax__calendar_header a:visited {
                color: white;
            }
    </style>
    <script type="text/javascript">
    function checkDateSelection(sender, args) {
        var selectedDate = args._selectedDate;

        // Get the current date
        var currentDate = new Date();
        currentDate.setHours(0, 0, 0, 0); // Set time to midnight for comparison

        if (selectedDate < currentDate) {
            alert("You cannot select a date earlier than today.");
            args.set_cancel(true); // Cancel the date selection
        }
    }
</script>
   <title>Leave Application</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <main id="main" class="main">


        <div class="pagetitle">
            <h1>Leave Application</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active">Apply Leave</li>
                </ol>
            </nav>
        </div>
      <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               --%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                          
                            <div class="card">
                                <div class="card-header bg-danger p-2 text-white">
                                    Available Leave Balance
                                </div>
                                <div class="card-body p-2 ms-1 pb-2">
                                    <div class="d-flex justify-content-between mt-4 mb-4">
                                        <asp:Label ID="lblFL" runat="server" Text="Label"></asp:Label>
                                        <asp:Label ID="lblEL" runat="server" Text="Label"></asp:Label>
                                        <asp:Label ID="lblCL" runat="server" Text="Label"></asp:Label>
                                        <asp:Label ID="lblSL" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Calendar ID="Calendar1" CssClass="shadow w-100" runat="server" BackColor="White" BorderColor="#3366CC" Font-Names="Verdana" Font-Size="12pt" ForeColor="#003399" Height="200px" Width="220px" BorderWidth="1px" DayNameFormat="Shortest" CellPadding="1">
                                            <DayHeaderStyle Height="2px" CssClass="text-center" BackColor="#99CCCC" ForeColor="#336666" />
                                            <NextPrevStyle Font-Size="11pt" ForeColor="#CCCCFF" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                            <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="12pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                            <WeekendDayStyle BackColor="#CCCCFF" />
                                        </asp:Calendar>
                                    </div>

                                </div>
                                <div class="card-footer">
                                    <div class="d-flex justify-content-between">
                                        <p><span><i class="fa-solid fa-square" style="color: red;"></i></span>&nbsp;Holiday</p>
                                        <p><span><i class="fa-solid fa-square" style="color: blue;"></i></span>&nbsp;Planned Leave</p>
                                    </div>                                                                    
                                    <div class="d-flex justify-content-between">                              
                                        <p><span><i class="fa-solid fa-square" style="color: grey;"></i></span>&nbsp;Weekend</p>
                                        <p><span><i class="fa-solid fa-square" style="color: green;"></i></span>&nbsp;Approved Leave</p>
                                    </div>                                                                  
                                    <div class="d-flex justify-content-between">                            
                                        <p><span><i class="fa-solid fa-square" style="color: yellow;"></i></span>&nbsp;Flexi Leave</p>
                                        <p><span><i class="fa-solid fa-square" style="color: orangered;"></i></span>&nbsp;Pending Leave</p>
                                    </div>
                                </div>
                            </div>
                                          </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="col-lg-8 col-md-7">

                            <div class="row">


                                <div class="card" style="padding:0;">
                                    <div class="card-header p-2 text-white fw-bolder" style="background-color:turquoise;">
                                        Leave Appplication Form 

                                    </div>
                                    <div class="card-body p-2 ms-1">
                                        <div class="row">

                                              <div class="col-md-3">
                                                <div class="form-floating">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtApplicationDate" Enabled="false" placeholder="txtApplicationDate Date" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>
                                                            Application Date
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error" Display="Dynamic" ControlToValidate="txtApplicationDate" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>

                                                        </label>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" Format="dd-MM-yyyy" runat="server" BehaviorID="txtApplicationDate_CalendarExtender11" TargetControlID="txtApplicationDate"></ajaxToolkit:CalendarExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="txtApplicationDate" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-floating">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtStartDate" placeholder="Reporting Date" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>
                                                            Start Date
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" Display="Dynamic" ControlToValidate="txtStartDate" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>

                                                        </label>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" OnClientDateSelectionChanged="checkDateSelection" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtStartDate"></ajaxToolkit:CalendarExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtStartDate" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">

                                                <div class="form-floating">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtEndDate" placeholder="Reporting Date" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>
                                                            End Date
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" Display="Dynamic" ControlToValidate="txtEndDate" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </label>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtEndDate_CalendarExtender11" TargetControlID="txtEndDate"></ajaxToolkit:CalendarExtender>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtEndDate" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                    </div>
                                                </div>
                                            </div>





                                            <div class="col-md-3">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownLeaveType" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                        <asp:ListItem>Flexi Holiday</asp:ListItem>
                                                        <asp:ListItem>Earned Leave</asp:ListItem>
                                                        <asp:ListItem>Causual Leave</asp:ListItem>
                                                        <asp:ListItem>Sick Leave</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <label>
                                                        Leave Type
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="Error" InitialValue="0" ControlToValidate="DropDownLeaveType" runat="server" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-floating">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtReason" placeholder="Reporting Date" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <label>
                                                            Reason
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="Error" ControlToValidate="txtReason" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-floating mb-3">
                                                    <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                                    <label>
                                                        Attachments
                                                    </label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:LinkButton ID="btnLeaveApply" OnClick="btnLeaveApply_Click" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="ri-check-line text-white"></i> &nbsp;Apply Leave</asp:LinkButton>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:Label ID="lblMsg" CssClass="fw-bolder fs-5 text-danger" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="card p-0">
                                    <div class="card-header p-2 text-white fw-bolder" style="background-color:turquoise;">Leave Application</div>
                                    <div class="col-lg-12 form-group">
                                        <div class="table-responsive">
                                             <asp:Label ID="lblUid" runat="server" Visible="false" Text="Label"></asp:Label>
                                            <asp:GridView ID="gvLeave" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="Luid" AutoGenerateColumns="False" AllowPaging="True"
                                                AllowSorting="true" PageSize="50" CssClass="table table-condensed table-bordered table-striped">
                                                <HeaderStyle />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                                        <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                        <ItemStyle Font-Size="Smaller" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <HeaderStyle ForeColor="white" BackColor="#241468" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                        <ItemTemplate>

                                                            <asp:ImageButton ID="ImageBtnDelete" OnClick="ImageBtnDelete_Click" ImageUrl="../assets/img/DeleteImage.png" Width="15" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" DataFormatString="{0:dd-MM-yyyy}" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                                        <HeaderStyle ForeColor="White" Wrap="false" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
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


                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           <%-- </ContentTemplate>
          <Triggers>
              <asp:PostBackTrigger ControlID="btnLeaveApply" />
             
          </Triggers>
        </asp:UpdatePanel>--%>

    </main>
</asp:Content>

