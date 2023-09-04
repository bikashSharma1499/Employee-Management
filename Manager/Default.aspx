<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manager_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



        <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div>
   
             


      <div class="container-fluid">
    <div class="row justify-content-center align-items-center">
      <div class="col-12 col-lg-12 col-xl-12">
     
            <div class="row ">
                <div class="card border-primary border-1 shadow  p-0">
                <div class="card-header bg-primary text-white fs-5">
                    Attendance &nbsp; &nbsp; &nbsp; <asp:Label ID="lblDate" runat="server" ></asp:Label>
                </div>
                <div class="card-body  mt-3">
                    <div class="row">
                        <div class="col-lg-2 col-md-3 col-sm-4 col-xs-4">
                            <div class=" card border-primary " style="border:1px solid;" >
                                <div class="card-body">
                                    Checked In
                                </div>
                            </div>
                        </div>
                          <div class="col-lg-2  col-md-3 col-sm-4 col-xs-4" >
                            <div class="card border-danger "  style="border:1px solid;">
                                <div class="card-body">
                                    Not Checked In
                                </div>
                            </div>
                        </div>
                           <div class="col-lg-2  col-md-3 col-sm-4 col-xs-4 ">
                            <div class="card border-secondary" style="border:1px solid;">
                                <div class="card-body">
                                   On Leave
                                </div>
                            </div>
                        </div>
                            <div class="col-lg-2  col-md-3 col-sm-4 col-xs-4">
                            <div class="card border-warning" style="border:1px solid;">
                                <div class="card-body">
                                 Weekly Off
                                </div>
                            </div>
                        </div>
                           <div class="col-lg-2  col-md-3 col-sm-4 col-xs-4 ">
                            <div class="card border-info" style="border:1px solid;">
                                <div class="card-body">
                                 Holiday
                                </div>
                            </div>
                        </div>
                            <div class="col-lg-2  col-md-3 col-sm-4 col-xs-4">
                            <div class="card border-success" style="border:1px solid;">
                                <div class="card-body">
                                 Checked Out
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
            </div>
       
          <div class="row">
              <div class="col-lg-6 shadow d-flex">
              <div class="col-lg-6 ps-0  me-2">
              <div class="card ps-0 ">
                  <div class="card-header">
                     New Leave Request
                  </div>
                  <div class="card-body">
                      <asp:Label ID="lblLeaveNotificationPending"  runat="server" Text="Label"></asp:Label>
                  </div>
              </div>

           </div>
              <div class="col-lg-6 ">
              <div class="card ">
                  <div class="card-header">
                     Pending Leave Request
                  </div>
                  <div class="card-body">
                      <asp:Label ID="lblLeaveNotificationApproved"  runat="server" Text="Label"></asp:Label>
                  </div>
              </div>

           </div>
           </div>
          </div>
          </div>
        </div>
    </div>
  </main><!-- End #main -->
</asp:Content>

