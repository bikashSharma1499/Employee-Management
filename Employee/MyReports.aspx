<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Employee.master" AutoEventWireup="true" CodeFile="MyReports.aspx.cs" Inherits="Employee_Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   <title>My Reports</title>
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
               <div class="row">
                                        <div class="col-lg-12 form-group">
                                            <asp:Label ID="lblUid" runat="server" Text="Label" Visible="false"></asp:Label>
                                            <div class="table-responsive">
                                                <asp:GridView ID="gvEmployee" OnRowDataBound="gvEmployee_RowDataBound" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="RUid" AutoGenerateColumns="False" AllowPaging="True"
                                                    AllowSorting="true" PageSize="50"  CssClass="table table-condensed table-bordered table-striped">
                                                    <HeaderStyle />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                                            <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                            <ItemStyle Font-Size="Smaller" />
                                                        </asp:TemplateField>
                                                     <%--   <asp:TemplateField HeaderText="View">
                                                            <HeaderStyle ForeColor="White" BackColor="#241468" Font-Bold="true" Font-Size="Smaller" />
                                                            <ItemStyle Font-Size="Smaller" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="13px" ImageUrl="../img/EditProfile.png" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
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
                                                         <asp:BoundField DataField="StartTime"  HeaderText="Start Time" SortExpression="DateJoining" NullDisplayText="N/A" ReadOnly="false">
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
                                                             <asp:LinkButton ID="btnAttachment"  OnClick="btnAttachment_Click" Font-Bold="true"  runat="server"><%#Eval("Attachment") %></asp:LinkButton>
                                           
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

         </main>
</asp:Content>

