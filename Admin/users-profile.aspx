<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="users-profile.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Profile</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Users</li>
                    <li class="breadcrumb-item active">Profile</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section profile">
            <div class="row">
                <div class="col-xl-4">

                    <div class="card">
                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                            <img src="../assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" />
                            <h2>
                                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></h2>
                            <%-- <h3>Web Designer</h3>--%>
                            <div class="social-links mt-2">
                                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-xl-8">

                    <div class="card">
                        <div class=" card-body pt-3">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>
                                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Update Profile</button>
                                    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Change Password</button>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <h5 class="card-title">Profile Details</h5>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                        <div class="col-lg-9 col-md-8">
                                            <asp:Label ID="lblName2" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label">Company</div>
                                        <div class="col-lg-9 col-md-8">Cogent Point</div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label">Job</div>
                                        <div class="col-lg-9 col-md-8">Admin</div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label">Country</div>
                                        <div class="col-lg-9 col-md-8">India</div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label">Address</div>
                                        <div class="col-lg-9 col-md-8">xxxxxxx</div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label">Phone</div>
                                        <div class="col-lg-9 col-md-8">+91 91xxxxxxx101</div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-lg-3 col-md-4 label">Email</div>
                                        <div class="col-lg-9 col-md-8">
                                            <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <div class="row mb-3 mt-4">
                                        <div class="col-lg-3 col-md-4 label">Name</div>
                                        <div class="col-lg-9 col-md-8">
                                            <div class="form-floating">
                                                <asp:TextBox ID="txtName" CssClass="form-control" placeholder="name" runat="server"></asp:TextBox>
                                            <label>Name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                          <div class="col-lg-2 col-md-4">
                                              <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Submit" /></div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
                        </div>
                    </div>

                </div>

            </div>
            
        </section>

    </main>
    <!-- End #main -->
</asp:Content>

