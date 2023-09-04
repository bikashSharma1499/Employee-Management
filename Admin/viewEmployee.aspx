<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="viewEmployee.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<script type="text/javascript">
    // Function to filter GridView rows based on the search input
    function filterGridView() {
        var input, filter, gridview, row, cells, cellText, i, j;
        input = document.getElementById("txtSearch");
        filter = input.value.toUpperCase();
        gridview = document.getElementById("gvEmployee");
        row = gridview.getElementsByTagName("tr");

        for (i = 1; i < row.length; i++) { // Start from 1 to skip header row
            cells = row[i].getElementsByTagName("td");
            var rowVisible = false; // Flag to determine if row should be visible

            for (j = 0; j < cells.length; j++) {
                cellText = cells[j].textContent || cells[j].innerText;
                if (cellText.toUpperCase().indexOf(filter) > -1) {
                    rowVisible = true;
                    break; // Show the row and exit the loop
                }
            }

            if (rowVisible) {
                row[i].style.display = "";
            } else {
                row[i].style.display = "none"; // Hide the row
            }
        }
    }

    // Attach the filterGridView function to the input's keyup event
    document.getElementById("txtSearch").addEventListener("keyup", filterGridView);
</script>--%>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <main id="main" class="main" style="margin-bottom:500px;">

    <div class="pagetitle">
      <h1>Employee Details</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
          <li class="breadcrumb-item active">View Employee</li>
        </ol>
      </nav>
    </div>
                                 
                                     <div class="card">
                                         <div class="card-header text-white fw-bold  d-flex justify-content-around " style="background-color:turquoise;padding-top: 5px;padding-bottom: 5px;">
                                             
                                             <h4 class="me-auto fw-bolder">Employee Details </h4>
                                             <asp:TextBox ID="txtSearh" AutoPostBack="true" OnTextChanged="txtSearh_TextChanged" placeholder="Enter name or Mobile" CssClass=" form-control w-25 me-2" runat="server"></asp:TextBox> <asp:Button ID="btnSearch" OnClick="btnSearch_Click1" CssClass="btn btn-outline-danger" runat="server" Text="Search" />
                                         </div>
                                                      
                                         <div class="card-body p-0">
                                             <div class="row">
                                                 <div class="col-lg-12 form-group">
                                              <asp:Label ID="lblUid" runat="server" Text="Label" Visible="false"></asp:Label>
                                            <div class="table-responsive shadow">
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
                                                                <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Height="13px" ImageUrl="../assets/img/DeleteImage.png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                              <asp:BoundField DataField="Name" HeaderText="Name hgygfy" SortExpression="Name" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                        
                                                     
                                                        <asp:BoundField DataField="Mobile2" HeaderText="Alt Mobile" SortExpression="Mobile" NullDisplayText="N/A" ReadOnly="false">
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
                                                           <asp:BoundField DataField="GuardianName" HeaderText="Guardian Name" SortExpression="GuardianName" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="GuadianMobile" HeaderText="Guardian Mobile" SortExpression="GuadianMobile" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="AadharNumber" HeaderText="Aadhar No" SortExpression="AadharNumber" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="false" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                             <asp:BoundField DataField="PermanentAddress" HeaderText="Permanent Address" SortExpression="PermanentAddress" NullDisplayText="N/A" ReadOnly="false">
                                                            <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" Wrap="true" />
                                                        </asp:BoundField>
                                                                 <asp:BoundField DataField="LoginPass" HeaderText="Login Pass" SortExpression="LoginPass" NullDisplayText="N/A" ReadOnly="false">
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

         </main>
</asp:Content>

