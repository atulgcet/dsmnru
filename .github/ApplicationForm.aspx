<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplicationForm.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" id="theme" href="dashboard/css/theme-default.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- START PLUGINS -->
    <script type="text/javascript" src="dashboard/js/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="dashboard/js/plugins/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="dashboard/js/plugins/bootstrap/bootstrap.min.js"></script>
    <!-- END SCRIPTS -->

    <script type="text/javascript" language="javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
    
    <script type="text/javascript">
        function checksubjectsec1(source, destination1, destination2) {
            var ddl1 = document.getElementById(source);
            var ddl2 = document.getElementById(destination1);
            var ddl3 = document.getElementById(destination2);
            var selectedvalue = ddl1.options[ddl1.selectedIndex].value;
            var ddl2value = ddl2.options[ddl2.selectedIndex].value;
            var ddl3value = ddl3.options[ddl3.selectedIndex].value;
            $('[id*=' + destination1 + '] option').each(function () {
                if (selectedvalue == $(this).val() && $(this).val() != "NA") {
                    $(this).hide();
                }
                else if (ddl3value != $(this).val() && selectedvalue == "NA") {
                    $(this).show();
                }
            });
            $('[id*=' + destination2 + '] option').each(function () {
                if (selectedvalue == $(this).val() && $(this).val() != "NA") {
                    $(this).hide();
                }
                else if (ddl2value != $(this).val() && selectedvalue == "NA") {
                    $(this).show();
                }
            });
        }

        $(function () {
            $('#FileUpload1').change(function () {
                var filesize = $('#<%= FileUpload1.ClientID %>')[0].files[0].size / 1025;
                if (filesize > 80) {
                    alert("File size is Big, please select a file less than 80KB");
                    $('#<%= FileUpload1.ClientID %>').val('');
                }
            });
            $('#FileUpload2').change(function () {
                var filesize = $('#<%= FileUpload2.ClientID %>')[0].files[0].size / 1025;
                if (filesize > 80) {
                    alert("File size is Big, please select a file less than 80KB");
                    $('#<%= FileUpload2.ClientID %>').val('');
                }
            });
            $('#FileUpload3').change(function () {
                var filesize = $('#<%= FileUpload3.ClientID %>')[0].files[0].size / 1025;
                if (filesize > 300) {
                    alert("File size is Big, please select a file less than 300KB");
                    $('#<%= FileUpload3.ClientID %>').val('');
                }
            });
        });
    </script>

    <style type="text/css">
        .auto-style1 {
            height: 17px;
        }

        .auto-style3 {
            width: 592px;
        }

        .auto-style4 {
            width: 586px;
        }
    </style>
</head>
<body>
    <%--Form Start--%>
    <form runat="server" enctype="multipart/form-data">

        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="#">DSMNRU</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>
                    <li class="xn-profile">
                        <a href="#" class="profile-mini">
                            <%-- <img src="assets/images/users/avatar.jpg" alt="John Doe" />--%>
                        </a>
                        <div class="profile">
                            <%--<div class="profile-image">
                            <img src="assets/images/users/avatar.jpg" alt="John Doe" />
                        </div>
                            --%><div class="profile-data">
                                <div class="profile-data-name">Admission 2020-21</div>
                                <div class="profile-data-title"></div>
                            </div>

                        </div>
                    </li>
                    <%--   <li class="xn-title">Navigation</li>--%>
                    <li>
                        <%--  <a href="#"><span class="fa fa-desktop"></span><span class="xn-text">Dashboard</span></a>
                    <asp:LinkButton ID="LinkButton_dashboard" runat="server" CausesValidation="False"><span class="fa fa-desktop"></span>Dashboard</asp:LinkButton>--%>
                    </li>



                    <li>
                        <%-- <a href="#"><span class="fa fa-pencil"></span>Personal Details</a>--%>
                        <asp:LinkButton ID="LinkButton_Personal" runat="server" CausesValidation="False"><span class="fa fa-pencil"></span>Personal Details</asp:LinkButton>
                    </li>

                    <li>
                        <%-- <a href="#"><span class="fa fa-pencil"></span>Mailing Address</a>--%>
                        <asp:LinkButton ID="LinkButton_MaliningAddress" runat="server" CausesValidation="False"><span class="fa fa-pencil"></span>Mailing Address</asp:LinkButton>
                    </li>
                    <li>
                        <%-- <a href="#"><span class="fa fa-pencil"></span>Academic Qualification</a>--%>
                        <asp:LinkButton ID="LinkButton_academic" runat="server" CausesValidation="False"><span class="fa fa-pencil"></span>Academic Qualification</asp:LinkButton>
                    </li>
                    <li>
                        <%--<a href="#"><span class="fa fa-pencil"></span>Facilities Details</a>--%>
                        <asp:LinkButton ID="LinkButton_fascilities" runat="server" CausesValidation="False"><span class="fa fa-pencil"></span>Desired Facilities</asp:LinkButton>
                    </li>
                    <li>
                        <%--<a href="#"><span class="fa fa-pencil"></span>Photo Upload</a>--%>
                        <asp:LinkButton ID="LinkButton_upload" runat="server" CausesValidation="False"><span class="fa fa-pencil"></span>Photo Upload</asp:LinkButton>
                    </li>
                    <li>
                        <%--   <a href="#"><span class="fa fa-pencil"></span>Payment Details</a>--%>
                        <asp:LinkButton ID="LinkButton_payment" runat="server" CausesValidation="False"><span class="fa fa-pencil"></span>Payment Details</asp:LinkButton>
                    </li>
                    <li>
                        <%--<a href="Account/Logout.aspx"><span class="fa fa-pencil"></span>Logout</a>
                    <asp:LinkButton ID="LinkButton_Logout" runat="server" OnClick="LinkButton_Logout_Click" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</asp:LinkButton>--%>
                        <asp:LinkButton ID="LinkButton_logout" runat="server" CausesValidation="False" PostBackUrl="~/Account/Logout.aspx"><span class="fa fa-sign-out"></span>Logout</asp:LinkButton>
                    </li>

                    <asp:Label ID="Label_Fee_Check" runat="server" ForeColor="#666666" Visible="False"></asp:Label>
                    &nbsp;
                <li></li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>
                    <li>&nbsp; </li>

                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->

            <!-- PAGE CONTENT -->
            <div class="page-content">

                <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->
                    <!-- SEARCH -->
                    <!--<li class="xn-search">
                        <form role="form">
                            <input type="text" name="search" placeholder="Search..."/>
                        </form>
                    </li>-->
                    <!-- END SEARCH -->
                    <!-- SIGN OUT -->

                    <li class="xn-icon-button pull-right">
                        <asp:LinkButton ID="LinkButton_logout_end" runat="server" CausesValidation="False" PostBackUrl="~/Account/Logout.aspx"><span class="fa fa-sign-out"></span></asp:LinkButton>
                        <%--<a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>--%>
                    </li>
                    <!-- END SIGN OUT -->
                    <!-- MESSAGES -->

                    <!-- END MESSAGES -->
                    <!-- TASKS -->

                    <!-- END TASKS -->
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->


                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">


                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Application Form</strong> </h3>

                                </div>
                                <div class="panel-body">
                                    <%--  <p>This is non libero bibendum, scelerisque arcu id, placerat nunc. Integer ullamcorper rutrum dui eget porta. Fusce enim dui, pulvinar a augue nec, dapibus hendrerit mauris. Praesent efficitur, elit non convallis faucibus, enim sapien suscipit mi, sit amet fringilla felis arcu id sem. Phasellus semper felis in odio convallis, et venenatis nisl posuere. Morbi non aliquet magna, a consectetur risus. Vivamus quis tellus eros. Nulla sagittis nisi sit amet orci consectetur laoreet. Vivamus volutpat erat ac vulputate laoreet. Phasellus eu ipsum massa.</p>--%>
                                </div>
                                <div class="panel-body">


                                    <asp:Panel ID="Panel_Header" runat="server" Visible="false">

                                        <fieldset>
                                            <div class="form-group">
                                                <table class="table datatable">
                                                    <%--<tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                    --%><tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="Programme Name"></asp:Label>
                                                        </td>
                                                        <td>


                                                            <asp:TextBox ID="pname" runat="server" ReadOnly="True"></asp:TextBox>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" Text="Programme Code"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="pcode" runat="server" ReadOnly="True"></asp:TextBox>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label8" runat="server" Text="User Name"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="username" runat="server" ReadOnly="True"></asp:TextBox>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label_regno1" runat="server" Text="Registration No"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Label_regno" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </fieldset>

                                    </asp:Panel>

                                    <asp:MultiView ID="MultiView1" runat="server">

                                        <asp:View ID="View1" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        Apply On-line<i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="nav-justified">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>

                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="3" align="center">
                                                        <asp:Button ID="Button6" runat="server" CssClass="btn btn-primary"
                                                            Text="Online Application Form" OnClick="Button6_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="3">&nbsp;</td>
                                                </tr>
                                            </table>

                                        </asp:View>

                                        <!-------------------------------------------------------------------------------------End of View 1------------------------------------------------------------------------------->
                                        <asp:View ID="View2" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        <strong>Personal Details</strong><i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table datatable">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label13" runat="server"
                                                            Text="Name of Candidate "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="applicant" runat="server"
                                                            placeholder="Enter Candidate's Name" ReadOnly="True" CssClass="text-uppercase" Width="200px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label14" runat="server"
                                                            Text="Name of the Father"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="father" runat="server"
                                                            placeholder="Enter Father's Name" CssClass="text-uppercase" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                                                            ControlToValidate="father" ErrorMessage="* Father's Name Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                            ControlToValidate="father" ErrorMessage="* Enter valid Name"
                                                            ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="label15" runat="server"
                                                            Text="Name of the Mother"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="mother" runat="server"
                                                            placeholder="Enter Mother's Name" CssClass="text-uppercase" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server"
                                                            ControlToValidate="mother" ErrorMessage="* Mother's Name Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                                            ControlToValidate="mother" ErrorMessage="* Enter valid Name"
                                                            ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <asp:Label ID="label2" runat="server"
                                                            Text="Name of Nominee"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="nominee" runat="server"
                                                            placeholder="Enter Nominee Name" CssClass="text-uppercase" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                            ControlToValidate="nominee" ErrorMessage="* Nominee Name Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                            ControlToValidate="nominee" ErrorMessage="* Enter valid Name"
                                                            ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="label4" runat="server"
                                                            Text="Nearest Police Station"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="police" runat="server"
                                                            placeholder="Enter Nearest Police Station" CssClass="text-uppercase" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                            ControlToValidate="police" ErrorMessage="* Nearest police Station Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                                            ControlToValidate="police" ErrorMessage="* Enter valid Nearest Police Station Name"
                                                            ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="label5" runat="server"
                                                            Text="Nearest Railway Station"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="railway" runat="server"
                                                            placeholder="Enter Nearest Railway Station Name" CssClass="text-uppercase" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                            ControlToValidate="railway" ErrorMessage="* Nearest Railway Station Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                                            ControlToValidate="railway" ErrorMessage="* Enter valid Nearest Railway Station "
                                                            ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="label6" runat="server"
                                                            Text="Aadhar No"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="aadharno" runat="server"
                                                            placeholder="Enter Aadhar No" Width="200px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                                            ControlToValidate="aadharno" ErrorMessage="* Aadhar No Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                                            ControlToValidate="aadharno"
                                                            ForeColor="#CC0000" ErrorMessage="* Only Twelve Digit Number Allowed."
                                                            ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label17" runat="server"
                                                            Text="Blood Group"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="blood" runat="server" Height="27px" Width="200px">
                                                            <asp:ListItem>---Select Blood Group---</asp:ListItem>
                                                            <asp:ListItem>O+</asp:ListItem>
                                                            <asp:ListItem>O-</asp:ListItem>
                                                            <asp:ListItem>A+</asp:ListItem>
                                                            <asp:ListItem>A-</asp:ListItem>
                                                            <asp:ListItem>B+</asp:ListItem>
                                                            <asp:ListItem>B-</asp:ListItem>
                                                            <asp:ListItem>AB+</asp:ListItem>
                                                            <asp:ListItem>AB-</asp:ListItem>
                                                            <asp:ListItem>OTHER</asp:ListItem>
                                                            <asp:ListItem>Not Known</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                                            ControlToValidate="blood" ErrorMessage="* Select Blood Group"
                                                            InitialValue="---Select Blood Group---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <%--<tr>--%>
                                                <td>
                                                    <asp:Label ID="Label10" runat="server"
                                                        Text="Domocile"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="Domocile" runat="server" Height="27px" Width="200px">
                                                        <asp:ListItem>---Select Domocile---</asp:ListItem>
                                                        <asp:ListItem>UP</asp:ListItem>
                                                        <asp:ListItem>OTHER</asp:ListItem>

                                                    </asp:DropDownList>
                                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                                        ControlToValidate="Domocile" ErrorMessage="* Select Domocile"
                                                        InitialValue="---Select Domocile---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                </td>
                                                </tr>   

                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label16" runat="server"
                                                            Text="Gender"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="gender" runat="server" Height="27px" Width="200px">
                                                            <asp:ListItem>---Select Gender---</asp:ListItem>
                                                            <asp:ListItem>Male</asp:ListItem>
                                                            <asp:ListItem>Female</asp:ListItem>
                                                            <asp:ListItem>Transgender</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                                            ControlToValidate="gender" ErrorMessage="* Select Gender"
                                                            InitialValue="---Select Gender---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label11" runat="server"
                                                            Text="Nationality "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownList_Nationality" runat="server" OnSelectedIndexChanged="DropDownList_Nationality_SelectedIndexChanged" AutoPostBack="True" Height="27px" Width="200px">
                                                            <asp:ListItem>---Select Nationality---</asp:ListItem>
                                                            <asp:ListItem Value="Afganistan">Afghanistan</asp:ListItem>
                                                            <asp:ListItem Value="Albania">Albania</asp:ListItem>
                                                            <asp:ListItem Value="Algeria">Algeria</asp:ListItem>
                                                            <asp:ListItem Value="American Samoa">American Samoa</asp:ListItem>
                                                            <asp:ListItem Value="Andorra">Andorra</asp:ListItem>
                                                            <asp:ListItem Value="Angola">Angola</asp:ListItem>
                                                            <asp:ListItem Value="Anguilla">Anguilla</asp:ListItem>
                                                            <asp:ListItem Value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</asp:ListItem>
                                                            <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                                            <asp:ListItem Value="Armenia">Armenia</asp:ListItem>
                                                            <asp:ListItem Value="Aruba">Aruba</asp:ListItem>
                                                            <asp:ListItem Value="Australia">Australia</asp:ListItem>
                                                            <asp:ListItem Value="Austria">Austria</asp:ListItem>
                                                            <asp:ListItem Value="Azerbaijan">Azerbaijan</asp:ListItem>
                                                            <asp:ListItem Value="Bahamas">Bahamas</asp:ListItem>
                                                            <asp:ListItem Value="Bahrain">Bahrain</asp:ListItem>
                                                            <asp:ListItem Value="Bangladesh">Bangladesh</asp:ListItem>
                                                            <asp:ListItem Value="Barbados">Barbados</asp:ListItem>
                                                            <asp:ListItem Value="Belarus">Belarus</asp:ListItem>
                                                            <asp:ListItem Value="Belgium">Belgium</asp:ListItem>
                                                            <asp:ListItem Value="Belize">Belize</asp:ListItem>
                                                            <asp:ListItem Value="Benin">Benin</asp:ListItem>
                                                            <asp:ListItem Value="Bermuda">Bermuda</asp:ListItem>
                                                            <asp:ListItem Value="Bhutan">Bhutan</asp:ListItem>
                                                            <asp:ListItem Value="Bolivia">Bolivia</asp:ListItem>
                                                            <asp:ListItem Value="Bonaire">Bonaire</asp:ListItem>
                                                            <asp:ListItem Value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</asp:ListItem>
                                                            <asp:ListItem Value="Botswana">Botswana</asp:ListItem>
                                                            <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                                                            <asp:ListItem Value="British Indian Ocean Ter">British Indian Ocean Ter</asp:ListItem>
                                                            <asp:ListItem Value="Brunei">Brunei</asp:ListItem>
                                                            <asp:ListItem Value="Bulgaria">Bulgaria</asp:ListItem>
                                                            <asp:ListItem Value="Burkina Faso">Burkina Faso</asp:ListItem>
                                                            <asp:ListItem Value="Burundi">Burundi</asp:ListItem>
                                                            <asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
                                                            <asp:ListItem Value="Cameroon">Cameroon</asp:ListItem>
                                                            <asp:ListItem Value="Canada">Canada</asp:ListItem>
                                                            <asp:ListItem Value="Canary Islands">Canary Islands</asp:ListItem>
                                                            <asp:ListItem Value="Cape Verde">Cape Verde</asp:ListItem>
                                                            <asp:ListItem Value="Cayman Islands">Cayman Islands</asp:ListItem>
                                                            <asp:ListItem Value="Central African Republic">Central African Republic</asp:ListItem>
                                                            <asp:ListItem Value="Chad">Chad</asp:ListItem>
                                                            <asp:ListItem Value="Channel Islands">Channel Islands</asp:ListItem>
                                                            <asp:ListItem Value="Chile">Chile</asp:ListItem>
                                                            <asp:ListItem Value="China">China</asp:ListItem>
                                                            <asp:ListItem Value="Christmas Island">Christmas Island</asp:ListItem>
                                                            <asp:ListItem Value="Cocos Island">Cocos Island</asp:ListItem>
                                                            <asp:ListItem Value="Colombia">Colombia</asp:ListItem>
                                                            <asp:ListItem Value="Comoros">Comoros</asp:ListItem>
                                                            <asp:ListItem Value="Congo">Congo</asp:ListItem>
                                                            <asp:ListItem Value="Cook Islands">Cook Islands</asp:ListItem>
                                                            <asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
                                                            <asp:ListItem Value="Cote DIvoire">Cote D'Ivoire</asp:ListItem>
                                                            <asp:ListItem Value="Croatia">Croatia</asp:ListItem>
                                                            <asp:ListItem Value="Cuba">Cuba</asp:ListItem>
                                                            <asp:ListItem Value="Curaco">Curacao</asp:ListItem>
                                                            <asp:ListItem Value="Cyprus">Cyprus</asp:ListItem>
                                                            <asp:ListItem Value="Czech Republic">Czech Republic</asp:ListItem>
                                                            <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                                                            <asp:ListItem Value="Djibouti">Djibouti</asp:ListItem>
                                                            <asp:ListItem Value="Dominica">Dominica</asp:ListItem>
                                                            <asp:ListItem Value="Dominican Republic">Dominican Republic</asp:ListItem>
                                                            <asp:ListItem Value="East Timor">East Timor</asp:ListItem>
                                                            <asp:ListItem Value="Ecuador">Ecuador</asp:ListItem>
                                                            <asp:ListItem Value="Egypt">Egypt</asp:ListItem>
                                                            <asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
                                                            <asp:ListItem Value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
                                                            <asp:ListItem Value="Eritrea">Eritrea</asp:ListItem>
                                                            <asp:ListItem Value="Estonia">Estonia</asp:ListItem>
                                                            <asp:ListItem Value="Ethiopia">Ethiopia</asp:ListItem>
                                                            <asp:ListItem Value="Falkland Islands">Falkland Islands</asp:ListItem>
                                                            <asp:ListItem Value="Faroe Islands">Faroe Islands</asp:ListItem>
                                                            <asp:ListItem Value="Fiji">Fiji</asp:ListItem>
                                                            <asp:ListItem Value="Finland">Finland</asp:ListItem>
                                                            <asp:ListItem Value="France">France</asp:ListItem>
                                                            <asp:ListItem Value="French Guiana">French Guiana</asp:ListItem>
                                                            <asp:ListItem Value="French Polynesia">French Polynesia</asp:ListItem>
                                                            <asp:ListItem Value="French Southern Ter">French Southern Ter</asp:ListItem>
                                                            <asp:ListItem Value="Gabon">Gabon</asp:ListItem>
                                                            <asp:ListItem Value="Gambia">Gambia</asp:ListItem>
                                                            <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                                                            <asp:ListItem Value="Germany">Germany</asp:ListItem>
                                                            <asp:ListItem Value="Ghana">Ghana</asp:ListItem>
                                                            <asp:ListItem Value="Gibraltar">Gibraltar</asp:ListItem>
                                                            <asp:ListItem Value="Great Britain">Great Britain</asp:ListItem>
                                                            <asp:ListItem Value="Greece">Greece</asp:ListItem>
                                                            <asp:ListItem Value="Greenland">Greenland</asp:ListItem>
                                                            <asp:ListItem Value="Grenada">Grenada</asp:ListItem>
                                                            <asp:ListItem Value="Guadeloupe">Guadeloupe</asp:ListItem>
                                                            <asp:ListItem Value="Guam">Guam</asp:ListItem>
                                                            <asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
                                                            <asp:ListItem Value="Guinea">Guinea</asp:ListItem>
                                                            <asp:ListItem Value="Guyana">Guyana</asp:ListItem>
                                                            <asp:ListItem Value="Haiti">Haiti</asp:ListItem>
                                                            <asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
                                                            <asp:ListItem Value="Honduras">Honduras</asp:ListItem>
                                                            <asp:ListItem Value="Hong Kong">Hong Kong</asp:ListItem>
                                                            <asp:ListItem Value="Hungary">Hungary</asp:ListItem>
                                                            <asp:ListItem Value="Iceland">Iceland</asp:ListItem>
                                                            <asp:ListItem Value="Indian">Indian</asp:ListItem>
                                                            <asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
                                                            <asp:ListItem Value="Iran">Iran</asp:ListItem>
                                                            <asp:ListItem Value="Iraq">Iraq</asp:ListItem>
                                                            <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                                                            <asp:ListItem Value="Israel">Israel</asp:ListItem>
                                                            <asp:ListItem Value="Italy">Italy</asp:ListItem>
                                                            <asp:ListItem Value="Jamaica">Jamaica</asp:ListItem>
                                                            <asp:ListItem Value="Japan">Japan</asp:ListItem>
                                                            <asp:ListItem Value="Jordan">Jordan</asp:ListItem>
                                                            <asp:ListItem Value="Kazakhstan">Kazakhstan</asp:ListItem>
                                                            <asp:ListItem Value="Kenya">Kenya</asp:ListItem>
                                                            <asp:ListItem Value="Kiribati">Kiribati</asp:ListItem>
                                                            <asp:ListItem Value="Korea North">Korea North</asp:ListItem>
                                                            <asp:ListItem Value="Korea Sout">Korea South</asp:ListItem>
                                                            <asp:ListItem Value="Kuwait">Kuwait</asp:ListItem>
                                                            <asp:ListItem Value="Kyrgyzstan">Kyrgyzstan</asp:ListItem>
                                                            <asp:ListItem Value="Laos">Laos</asp:ListItem>
                                                            <asp:ListItem Value="Latvia">Latvia</asp:ListItem>
                                                            <asp:ListItem Value="Lebanon">Lebanon</asp:ListItem>
                                                            <asp:ListItem Value="Lesotho">Lesotho</asp:ListItem>
                                                            <asp:ListItem Value="Liberia">Liberia</asp:ListItem>
                                                            <asp:ListItem Value="Libya">Libya</asp:ListItem>
                                                            <asp:ListItem Value="Liechtenstein">Liechtenstein</asp:ListItem>
                                                            <asp:ListItem Value="Lithuania">Lithuania</asp:ListItem>
                                                            <asp:ListItem Value="Luxembourg">Luxembourg</asp:ListItem>
                                                            <asp:ListItem Value="Macau">Macau</asp:ListItem>
                                                            <asp:ListItem Value="Macedonia">Macedonia</asp:ListItem>
                                                            <asp:ListItem Value="Madagascar">Madagascar</asp:ListItem>
                                                            <asp:ListItem Value="Malaysia">Malaysia</asp:ListItem>
                                                            <asp:ListItem Value="Malawi">Malawi</asp:ListItem>
                                                            <asp:ListItem Value="Maldives">Maldives</asp:ListItem>
                                                            <asp:ListItem Value="Mali">Mali</asp:ListItem>
                                                            <asp:ListItem Value="Malta">Malta</asp:ListItem>
                                                            <asp:ListItem Value="Marshall Islands">Marshall Islands</asp:ListItem>
                                                            <asp:ListItem Value="Martinique">Martinique</asp:ListItem>
                                                            <asp:ListItem Value="Mauritania">Mauritania</asp:ListItem>
                                                            <asp:ListItem Value="Mauritius">Mauritius</asp:ListItem>
                                                            <asp:ListItem Value="Mayotte">Mayotte</asp:ListItem>
                                                            <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                                                            <asp:ListItem Value="Midway Islands">Midway Islands</asp:ListItem>
                                                            <asp:ListItem Value="Moldova">Moldova</asp:ListItem>
                                                            <asp:ListItem Value="Monaco">Monaco</asp:ListItem>
                                                            <asp:ListItem Value="Mongolia">Mongolia</asp:ListItem>
                                                            <asp:ListItem Value="Montserrat">Montserrat</asp:ListItem>
                                                            <asp:ListItem Value="Morocco">Morocco</asp:ListItem>
                                                            <asp:ListItem Value="Mozambique">Mozambique</asp:ListItem>
                                                            <asp:ListItem Value="Myanmar">Myanmar</asp:ListItem>
                                                            <asp:ListItem Value="Nambia">Nambia</asp:ListItem>
                                                            <asp:ListItem Value="Nauru">Nauru</asp:ListItem>
                                                            <asp:ListItem Value="Nepal">Nepal</asp:ListItem>
                                                            <asp:ListItem Value="Netherland Antilles">Netherland Antilles</asp:ListItem>
                                                            <asp:ListItem Value="Netherlands">Netherlands (Holland, Europe)</asp:ListItem>
                                                            <asp:ListItem Value="Nevis">Nevis</asp:ListItem>
                                                            <asp:ListItem Value="New Caledonia">New Caledonia</asp:ListItem>
                                                            <asp:ListItem Value="New Zealand">New Zealand</asp:ListItem>
                                                            <asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
                                                            <asp:ListItem Value="Niger">Niger</asp:ListItem>
                                                            <asp:ListItem Value="Nigeria">Nigeria</asp:ListItem>
                                                            <asp:ListItem Value="Niue">Niue</asp:ListItem>
                                                            <asp:ListItem Value="Norfolk Island">Norfolk Island</asp:ListItem>
                                                            <asp:ListItem Value="Norway">Norway</asp:ListItem>
                                                            <asp:ListItem Value="Oman">Oman</asp:ListItem>
                                                            <asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
                                                            <asp:ListItem Value="Palau Island">Palau Island</asp:ListItem>
                                                            <asp:ListItem Value="Palestine">Palestine</asp:ListItem>
                                                            <asp:ListItem Value="Panama">Panama</asp:ListItem>
                                                            <asp:ListItem Value="Papua New Guinea">Papua New Guinea</asp:ListItem>
                                                            <asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
                                                            <asp:ListItem Value="Peru">Peru</asp:ListItem>
                                                            <asp:ListItem Value="Phillipines">Philippines</asp:ListItem>
                                                            <asp:ListItem Value="Pitcairn Island">Pitcairn Island</asp:ListItem>
                                                            <asp:ListItem Value="Poland">Poland</asp:ListItem>
                                                            <asp:ListItem Value="Portugal">Portugal</asp:ListItem>
                                                            <asp:ListItem Value="Puerto Rico">Puerto Rico</asp:ListItem>
                                                            <asp:ListItem Value="Qatar">Qatar</asp:ListItem>
                                                            <asp:ListItem Value="Republic of Montenegro">Republic of Montenegro</asp:ListItem>
                                                            <asp:ListItem Value="Republic of Serbia">Republic of Serbia</asp:ListItem>
                                                            <asp:ListItem Value="Reunion">Reunion</asp:ListItem>
                                                            <asp:ListItem Value="Romania">Romania</asp:ListItem>
                                                            <asp:ListItem Value="Russia">Russia</asp:ListItem>
                                                            <asp:ListItem Value="Rwanda">Rwanda</asp:ListItem>
                                                            <asp:ListItem Value="St Barthelemy">St Barthelemy</asp:ListItem>
                                                            <asp:ListItem Value="St Eustatius">St Eustatius</asp:ListItem>
                                                            <asp:ListItem Value="St Helena">St Helena</asp:ListItem>
                                                            <asp:ListItem Value="St Kitts-Nevis">St Kitts-Nevis</asp:ListItem>
                                                            <asp:ListItem Value="St Lucia">St Lucia</asp:ListItem>
                                                            <asp:ListItem Value="St Maarten">St Maarten</asp:ListItem>
                                                            <asp:ListItem Value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</asp:ListItem>
                                                            <asp:ListItem Value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</asp:ListItem>
                                                            <asp:ListItem Value="Saipan">Saipan</asp:ListItem>
                                                            <asp:ListItem Value="Samoa">Samoa</asp:ListItem>
                                                            <asp:ListItem Value="Samoa American">Samoa American</asp:ListItem>
                                                            <asp:ListItem Value="San Marino">San Marino</asp:ListItem>
                                                            <asp:ListItem Value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</asp:ListItem>
                                                            <asp:ListItem Value="Saudi Arabia">Saudi Arabia</asp:ListItem>
                                                            <asp:ListItem Value="Senegal">Senegal</asp:ListItem>
                                                            <asp:ListItem Value="Serbia">Serbia</asp:ListItem>
                                                            <asp:ListItem Value="Seychelles">Seychelles</asp:ListItem>
                                                            <asp:ListItem Value="Sierra Leone">Sierra Leone</asp:ListItem>
                                                            <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
                                                            <asp:ListItem Value="Slovakia">Slovakia</asp:ListItem>
                                                            <asp:ListItem Value="Slovenia">Slovenia</asp:ListItem>
                                                            <asp:ListItem Value="Solomon Islands">Solomon Islands</asp:ListItem>
                                                            <asp:ListItem Value="Somalia">Somalia</asp:ListItem>
                                                            <asp:ListItem Value="South Africa">South Africa</asp:ListItem>
                                                            <asp:ListItem Value="Spain">Spain</asp:ListItem>
                                                            <asp:ListItem Value="Sri Lanka">Sri Lanka</asp:ListItem>
                                                            <asp:ListItem Value="Sudan">Sudan</asp:ListItem>
                                                            <asp:ListItem Value="Suriname">Suriname</asp:ListItem>
                                                            <asp:ListItem Value="Swaziland">Swaziland</asp:ListItem>
                                                            <asp:ListItem Value="Sweden">Sweden</asp:ListItem>
                                                            <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                                                            <asp:ListItem Value="Syria">Syria</asp:ListItem>
                                                            <asp:ListItem Value="Tahiti">Tahiti</asp:ListItem>
                                                            <asp:ListItem Value="Taiwan">Taiwan</asp:ListItem>
                                                            <asp:ListItem Value="Tajikistan">Tajikistan</asp:ListItem>
                                                            <asp:ListItem Value="Tanzania">Tanzania</asp:ListItem>
                                                            <asp:ListItem Value="Thailand">Thailand</asp:ListItem>
                                                            <asp:ListItem Value="Togo">Togo</asp:ListItem>
                                                            <asp:ListItem Value="Tokelau">Tokelau</asp:ListItem>
                                                            <asp:ListItem Value="Tonga">Tonga</asp:ListItem>
                                                            <asp:ListItem Value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</asp:ListItem>
                                                            <asp:ListItem Value="Tunisia">Tunisia</asp:ListItem>
                                                            <asp:ListItem Value="Turkey">Turkey</asp:ListItem>
                                                            <asp:ListItem Value="Turkmenistan">Turkmenistan</asp:ListItem>
                                                            <asp:ListItem Value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</asp:ListItem>
                                                            <asp:ListItem Value="Tuvalu">Tuvalu</asp:ListItem>
                                                            <asp:ListItem Value="Uganda">Uganda</asp:ListItem>
                                                            <asp:ListItem Value="Ukraine">Ukraine</asp:ListItem>
                                                            <asp:ListItem Value="United Arab Erimates">United Arab Emirates</asp:ListItem>
                                                            <asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
                                                            <asp:ListItem Value="United States of America">United States of America</asp:ListItem>
                                                            <asp:ListItem Value="Uraguay">Uruguay</asp:ListItem>
                                                            <asp:ListItem Value="Uzbekistan">Uzbekistan</asp:ListItem>
                                                            <asp:ListItem Value="Vanuatu">Vanuatu</asp:ListItem>
                                                            <asp:ListItem Value="Vatican City State">Vatican City State</asp:ListItem>
                                                            <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                                                            <asp:ListItem Value="Vietnam">Vietnam</asp:ListItem>
                                                            <asp:ListItem Value="Virgin Islands (Brit)">Virgin Islands (Brit)</asp:ListItem>
                                                            <asp:ListItem Value="Virgin Islands (USA)">Virgin Islands (USA)</asp:ListItem>
                                                            <asp:ListItem Value="Wake Island">Wake Island</asp:ListItem>
                                                            <asp:ListItem Value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</asp:ListItem>
                                                            <asp:ListItem Value="Yemen">Yemen</asp:ListItem>
                                                            <asp:ListItem Value="Zaire">Zaire</asp:ListItem>
                                                            <asp:ListItem Value="Zambia">Zambia</asp:ListItem>
                                                            <asp:ListItem Value="Zimbabwe">Zimbabwe</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;&nbsp;
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="DropDownList_Nationality" ErrorMessage="* Select Nationality" ForeColor="#CC0000" InitialValue="---Select Nationality---"></asp:RequiredFieldValidator>

                                                    </td>
                                                </tr>
                                                <%--<tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                --%><tr>
                                                    <td>
                                                        <asp:Label ID="Label102" runat="server" Text="State"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="state" runat="server" AutoPostBack="True" Width="200px" Height="27px">
                                                            <asp:ListItem>---Select State---</asp:ListItem>
                                                            <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                                            <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                                            <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                                            <asp:ListItem>Assam</asp:ListItem>
                                                            <asp:ListItem>Bihar</asp:ListItem>
                                                            <asp:ListItem>Chandigarh</asp:ListItem>
                                                            <asp:ListItem>Chattisgarh</asp:ListItem>
                                                            <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                                            <asp:ListItem>Daman and Diu</asp:ListItem>
                                                            <asp:ListItem>Delhi</asp:ListItem>
                                                            <asp:ListItem>Goa</asp:ListItem>
                                                            <asp:ListItem>Gujarat</asp:ListItem>
                                                            <asp:ListItem>Haryana</asp:ListItem>
                                                            <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                                            <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                                            <asp:ListItem>Jharkhand</asp:ListItem>
                                                            <asp:ListItem>Karnataka</asp:ListItem>
                                                            <asp:ListItem>Kerala</asp:ListItem>
                                                            <asp:ListItem>Lakshadweep</asp:ListItem>
                                                            <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                            <asp:ListItem>Maharashtra</asp:ListItem>
                                                            <asp:ListItem>Manipur</asp:ListItem>
                                                            <asp:ListItem>Meghalaya</asp:ListItem>
                                                            <asp:ListItem>Mizoram</asp:ListItem>
                                                            <asp:ListItem>Nagaland</asp:ListItem>
                                                            <asp:ListItem>Orissa</asp:ListItem>
                                                            <asp:ListItem>Pondicherry</asp:ListItem>
                                                            <asp:ListItem>Punjab</asp:ListItem>
                                                            <asp:ListItem>Rajasthan</asp:ListItem>
                                                            <asp:ListItem>Sikkim</asp:ListItem>
                                                            <asp:ListItem>Tamil Nadu</asp:ListItem>
                                                            <asp:ListItem>Tripura</asp:ListItem>
                                                            <asp:ListItem>Uttarakhand</asp:ListItem>
                                                            <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                            <asp:ListItem>West Bengal</asp:ListItem>
                                                            <asp:ListItem>Other</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="state" ErrorMessage="* Select State" ForeColor="#CC0000" InitialValue="---Select State---"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <%-- <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                --%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label21" runat="server"
                                                            Text="Religion"></asp:Label>
                                                    </td>
                                                    <td>


                                                        <asp:DropDownList ID="religion" runat="server" Width="200px" Height="27px">
                                                            <asp:ListItem>---Select Religion---</asp:ListItem>
                                                            <asp:ListItem>Hindu</asp:ListItem>
                                                            <asp:ListItem>Muslim</asp:ListItem>
                                                            <asp:ListItem>Sikh</asp:ListItem>
                                                            <asp:ListItem>Christian</asp:ListItem>
                                                            <asp:ListItem>Buddhist</asp:ListItem>
                                                            <asp:ListItem>Jain</asp:ListItem>
                                                            <asp:ListItem>Parasri</asp:ListItem>

                                                        </asp:DropDownList>
                                                        &nbsp;
                                                     
                                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="religion" ErrorMessage="* Select Reliigion" ForeColor="#CC0000" InitialValue="---Select Religion---"></asp:RequiredFieldValidator>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label22" runat="server"
                                                            Text="Minority"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="minority" runat="server" Height="27px" Width="200px">
                                                            <asp:ListItem>---Select Minority---</asp:ListItem>
                                                            <asp:ListItem>No</asp:ListItem>
                                                            <asp:ListItem>Yes</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                                            ControlToValidate="minority" ErrorMessage="* Minority Status"
                                                            InitialValue="---Select Minority---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label18" runat="server"
                                                            Text="Date of Birth"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DdType" runat="server">
                                                            <asp:ListItem>---Select Day---</asp:ListItem>
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
                                                            <asp:ListItem>11</asp:ListItem>
                                                            <asp:ListItem>12</asp:ListItem>
                                                            <asp:ListItem>13</asp:ListItem>
                                                            <asp:ListItem>14</asp:ListItem>
                                                            <asp:ListItem>15</asp:ListItem>
                                                            <asp:ListItem>16</asp:ListItem>
                                                            <asp:ListItem>17</asp:ListItem>
                                                            <asp:ListItem>18</asp:ListItem>
                                                            <asp:ListItem>19</asp:ListItem>
                                                            <asp:ListItem>20</asp:ListItem>
                                                            <asp:ListItem>21</asp:ListItem>
                                                            <asp:ListItem>22</asp:ListItem>
                                                            <asp:ListItem>23</asp:ListItem>
                                                            <asp:ListItem>24</asp:ListItem>
                                                            <asp:ListItem>25</asp:ListItem>
                                                            <asp:ListItem>26</asp:ListItem>
                                                            <asp:ListItem>27</asp:ListItem>
                                                            <asp:ListItem>28</asp:ListItem>
                                                            <asp:ListItem>29</asp:ListItem>
                                                            <asp:ListItem>30</asp:ListItem>
                                                            <asp:ListItem>31</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="DmType" runat="server">
                                                            <asp:ListItem>---Select Month---</asp:ListItem>
                                                            <asp:ListItem>01</asp:ListItem>
                                                            <asp:ListItem>02</asp:ListItem>
                                                            <asp:ListItem>03</asp:ListItem>
                                                            <asp:ListItem>04</asp:ListItem>
                                                            <asp:ListItem>05</asp:ListItem>
                                                            <asp:ListItem>06</asp:ListItem>
                                                            <asp:ListItem>07</asp:ListItem>
                                                            <asp:ListItem>08</asp:ListItem>
                                                            <asp:ListItem>09</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>11</asp:ListItem>
                                                            <asp:ListItem>12</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="DyType" runat="server">
                                                            <asp:ListItem>---Select Year---</asp:ListItem>
                                                            <asp:ListItem>1950</asp:ListItem>
                                                            <asp:ListItem>1951</asp:ListItem>
                                                            <asp:ListItem>1952</asp:ListItem>
                                                            <asp:ListItem>1953</asp:ListItem>
                                                            <asp:ListItem>1954</asp:ListItem>
                                                            <asp:ListItem>1955</asp:ListItem>
                                                            <asp:ListItem>1956</asp:ListItem>
                                                            <asp:ListItem>1957</asp:ListItem>
                                                            <asp:ListItem>1958</asp:ListItem>
                                                            <asp:ListItem>1959</asp:ListItem>
                                                            <asp:ListItem>1960</asp:ListItem>
                                                            <asp:ListItem>1961</asp:ListItem>
                                                            <asp:ListItem>1962</asp:ListItem>
                                                            <asp:ListItem>1963</asp:ListItem>
                                                            <asp:ListItem>1964</asp:ListItem>
                                                            <asp:ListItem>1965</asp:ListItem>
                                                            <asp:ListItem>1966</asp:ListItem>
                                                            <asp:ListItem>1967</asp:ListItem>
                                                            <asp:ListItem>1968</asp:ListItem>
                                                            <asp:ListItem>1969</asp:ListItem>
                                                            <asp:ListItem>1970</asp:ListItem>
                                                            <asp:ListItem>1971</asp:ListItem>
                                                            <asp:ListItem>1972</asp:ListItem>
                                                            <asp:ListItem>1973</asp:ListItem>
                                                            <asp:ListItem>1974</asp:ListItem>
                                                            <asp:ListItem>1975</asp:ListItem>
                                                            <asp:ListItem>1976</asp:ListItem>
                                                            <asp:ListItem>1977</asp:ListItem>
                                                            <asp:ListItem>1978</asp:ListItem>
                                                            <asp:ListItem>1979</asp:ListItem>
                                                            <asp:ListItem>1980</asp:ListItem>
                                                            <asp:ListItem>1981</asp:ListItem>
                                                            <asp:ListItem>1982</asp:ListItem>
                                                            <asp:ListItem>1983</asp:ListItem>
                                                            <asp:ListItem>1984</asp:ListItem>
                                                            <asp:ListItem>1985</asp:ListItem>
                                                            <asp:ListItem>1986</asp:ListItem>
                                                            <asp:ListItem>1987</asp:ListItem>
                                                            <asp:ListItem>1988</asp:ListItem>
                                                            <asp:ListItem>1989</asp:ListItem>
                                                            <asp:ListItem>1990</asp:ListItem>
                                                            <asp:ListItem>1991</asp:ListItem>
                                                            <asp:ListItem>1992</asp:ListItem>
                                                            <asp:ListItem>1993</asp:ListItem>
                                                            <asp:ListItem>1994</asp:ListItem>
                                                            <asp:ListItem>1995</asp:ListItem>
                                                            <asp:ListItem>1996</asp:ListItem>
                                                            <asp:ListItem>1997</asp:ListItem>
                                                            <asp:ListItem>1998</asp:ListItem>
                                                            <asp:ListItem>1999</asp:ListItem>
                                                            <asp:ListItem>2000</asp:ListItem>
                                                            <asp:ListItem>2001</asp:ListItem>
                                                            <asp:ListItem>2002</asp:ListItem>
                                                            <asp:ListItem>2003</asp:ListItem>
                                                            <asp:ListItem>2004</asp:ListItem>
                                                            <asp:ListItem>2005</asp:ListItem>
                                                            <asp:ListItem>2006</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                            ControlToValidate="DdType" ErrorMessage="* Select Day"
                                                            InitialValue="---Select Day---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                            ControlToValidate="DmType" ErrorMessage="* Select Month"
                                                            InitialValue="---Select Month---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                                            ControlToValidate="DyType" ErrorMessage="* Select Year"
                                                            InitialValue="---Select Year---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label104" runat="server" Text="Marital Status"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="mstatus" runat="server" Height="27px" Width="200px">
                                                            <asp:ListItem>---Select Marital Status---</asp:ListItem>
                                                            <asp:ListItem>Married</asp:ListItem>
                                                            <asp:ListItem>Unmarried</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="mstatus" ErrorMessage="* Marital Status" ForeColor="#CC0000" InitialValue="---Select Marital Status---"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="table datatable">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label20" runat="server"
                                                                        Text="Name of the Category"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="category" runat="server"
                                                                        AutoPostBack="True" OnSelectedIndexChanged="category_SelectedIndexChanged" Height="27px" Width="200px">
                                                                        <asp:ListItem>---Select Category---</asp:ListItem>
                                                                        <asp:ListItem Value="GEN">General</asp:ListItem>
                                                                        <asp:ListItem Value="OBC">Other Backward Class</asp:ListItem>
                                                                        <asp:ListItem Value="SC">Schedule Caste</asp:ListItem>
                                                                        <asp:ListItem Value="ST">Schedule Tribe</asp:ListItem>
                                                                        <asp:ListItem Value="EWS">Economically Weaker Section</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    &nbsp;
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                                                        ControlToValidate="category" ErrorMessage="* Select Category"
                                                                        InitialValue="---Select Category---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label30" runat="server"
                                                                        Text="Category Code"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="ccode" runat="server" Height="27px"
                                                                        ReadOnly="True" Width="118px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label32" runat="server" Text="DSMNRU Employee Ward"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="Demployeew" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="Demployeew_SelectedIndexChanged">
                                                                        <asp:ListItem Value="No" Selected="True">No </asp:ListItem>
                                                                        <asp:ListItem Value="Yes">Yes </asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label31" runat="server" Text="DSMNRU Employee Name and Relation" Visible="False"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtempname" runat="server" Visible="False" Height="27px" Width="200px"></asp:TextBox>
                                                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtempname" ErrorMessage="* Employee Name and Relation Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator261" runat="server" ControlToValidate="txtempname" ErrorMessage="* Enter valid Name" ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label33" runat="server"
                                                                        Text="Disability"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="disability" runat="server" Height="27px" Width="200px"
                                                                        AutoPostBack="True" OnSelectedIndexChanged="disability_SelectedIndexChanged">
                                                                        <asp:ListItem>---Select Disability---</asp:ListItem>
                                                                        <asp:ListItem Value="Not Any">Not Any</asp:ListItem>
                                                                        <asp:ListItem Value="TB">Total Blind</asp:ListItem>
                                                                        <asp:ListItem Value="LV">Low Vision</asp:ListItem>
                                                                        <asp:ListItem Value="HI">Hearing Imparied</asp:ListItem>
                                                                        <asp:ListItem Value="OH">Orthopaedically Handicap</asp:ListItem>
                                                                        <asp:ListItem Value="LC">Leprosy Cured</asp:ListItem>
                                                                        <asp:ListItem Value="OD">Other Disability</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                                                                        ControlToValidate="disability" ErrorMessage="* Select Disability"
                                                                        InitialValue="---Select Disability---" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                                    <asp:TextBox ID="tb_disability" runat="server" placeholder="Enter Other Disability" Visible="False" Height="27px" Width="200px"></asp:TextBox>


                                                                    <asp:Label ID="Label_Disability" runat="server"></asp:Label>


                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label34" runat="server"
                                                                        Text="Disability Code"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="dcode" runat="server" Height="27px"
                                                                        placeholder="Enter Disability" ReadOnly="True" CssClass="col-xs-offset-0" Width="118px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label35" runat="server"
                                                                        Text="Dependent of Freedom Fighter"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="ffighter" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                                                        <asp:ListItem>Yes</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label36" runat="server"
                                                                        Text="NCC"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="ncc" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                                                        <asp:ListItem>Yes</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label37" runat="server"
                                                                        Text="Inter-State/National/International Sports Participation"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="sports" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                                                        <asp:ListItem>Yes</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label38" runat="server"
                                                                        Text="NSS"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="nss" runat="server" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                                                        <asp:ListItem>Yes</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label_fee_amount" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label_otherstate_fee" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <asp:Button ID="personl_detail_btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="personl_detail_btnSubmit_Click" Text=" Save " Width="150px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>

                                        </asp:View>

                                        <!----------------------------------------End of View 2----------------------------------------->


                                        <asp:View ID="View3" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        <strong>Mailing Details</strong><i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table datatable">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server"
                                                            Text="Permanent Address"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="paddress" CssClass="text-uppercase" runat="server" placeholder="Enter Address" Width="200px" AutoPostBack="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server"
                                                            ControlToValidate="paddress" ErrorMessage="* Permanent Address Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator258" runat="server" ControlToValidate="paddress" ErrorMessage="* Enter valid Address (Special characters not allowed)" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="paddress0" CssClass="text-uppercase" runat="server" AutoPostBack="true" placeholder="Enter Address" Width="200px"></asp:TextBox>
                                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator259" runat="server" ControlToValidate="paddress0" ErrorMessage="* Enter valid Address (Special characters not allowed)" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="paddress1" CssClass="text-uppercase" AutoPostBack="true" runat="server" placeholder="Enter Address" Width="200px"></asp:TextBox>
                                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator260" runat="server" ControlToValidate="paddress1" ErrorMessage="* Enter valid Address (Special characters not allowed)" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label105" runat="server" Text="Mailing Address"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="maddress" runat="server" placeholder="Enter Address" Width="200px" CssClass="text-uppercase"></asp:TextBox>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Keep Mailing Address same as Permanent Address" AutoPostBack="true" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="maddress" EnableTheming="False" ErrorMessage="* Mailing Address Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator262" runat="server" ControlToValidate="maddress" ErrorMessage="* Enter valid Address (Special characters not allowed)" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="maddress0" runat="server" placeholder="Enter Address" Width="200px" CssClass="text-uppercase"></asp:TextBox>
                                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator263" runat="server" ControlToValidate="maddress0" ErrorMessage="* Enter valid Address (Special characters not allowed)" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="maddress1" runat="server" placeholder="Enter Address" Width="200px" CssClass="text-uppercase"></asp:TextBox>
                                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator264" runat="server" ControlToValidate="maddress1" ErrorMessage="* Enter valid Address (Special characters not allowed)" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label12" runat="server"
                                                            Text="Alternate Mobile No."></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="mobileno" runat="server"
                                                            placeholder="Enter Mobile No." Width="200px"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11"
                                                            runat="server" ControlToValidate="mobileno"
                                                            ErrorMessage="* Enter valid Mobile No." ForeColor="#CC0000"
                                                            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label49" runat="server"
                                                            Text="Alternate Email"></asp:Label>
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="email_txt" runat="server"
                                                            placeholder="Enter Email" Width="200px"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13"
                                                            runat="server" ControlToValidate="email_txt" ErrorMessage="* Enter valid Email ID"
                                                            ForeColor="#CC0000"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>


                                                <%--<tr>
                                                    <td colspan="3">
                                                        <table class="table datatable">
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                --%>
                                                <tr>
                                                    <td colspan="3" align="center">
                                                        <asp:Button ID="mailing_address" runat="server" CssClass="btn btn-primary" OnClick="mailing_address_Click" Text="Save" Width="200px" />
                                                    </td>
                                                </tr>
                                                <%-- <tr>
                                                    <td>&nbsp;</td>
                                                    <td colspan="2">&nbsp;</td>
                                                </tr>--%>
                                            </table>

                                        </asp:View>

                                        <!----------------------------------------End of View 3----------------------------------------->

                                        <asp:View ID="View4" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        Academic Qualification<i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <strong>* Passed in Basic Eligibility Examination and Result Declared
                                                        </strong>

                                                    </td>

                                                    <td>&nbsp;
                                                        <asp:RadioButtonList ID="RadioButtonPassedStatus" runat="server"
                                                            RepeatDirection="Horizontal" AutoPostBack="True"
                                                            OnSelectedIndexChanged="RadioButtonPassedStatus_SelectedIndexChanged">
                                                            <asp:ListItem>Yes</asp:ListItem>
                                                            <asp:ListItem>No</asp:ListItem>

                                                        </asp:RadioButtonList>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Graduation0" runat="server" ControlToValidate="RadioButtonPassedStatus" ErrorMessage="*Result Status Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <strong>* Appeared in Basic Eligibility Examination and Result Awaited:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label
                                                            ID="Label_AppearedStatus" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <strong>* Enter the Obtained Marks and Max. Marks in same Lenght e.g. (06.34 and 
                                                            18.00) or (0634 and 1800)<br />
                                                        </strong>* Mention Total Marks of all  the subjects in which applicant  has passed the examination. The percentage of  marks obtained must  be mentioned upto two decimal  points.  Wherever grading system is applicable, mention equivalent percentage/marks and attach grading conversion formula certificate duly signed by the Competent Authority/HOD/Registrar .
                                                            <br />
                                                        * If Applicant is in final year in required qualification then fill <strong>Appearing </strong>in Reference No column.<br />
                                                        <br />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2">
                                                        <table>

                                                            <tr>
                                                                <td align="left" colspan="11">
                                                                    <asp:Panel ID="graduationpanal0" runat="server" Width="100%">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td class="text-center" width="140px">
                                                                                    <b>Examination</b></td>
                                                                                <td class="text-center" width="143px">&nbsp;</td>
                                                                                <td class="text-center" width="80px">
                                                                                    <b>Board/<br />
                                                                                        University</b></td>
                                                                                <td class="text-center" width="80px">
                                                                                    <b>Year</b></td>
                                                                                <td class="text-center" width="60px">
                                                                                    <b>Obtained CGPA /<br />
                                                                                        Marks</b></td>
                                                                                <td class="text-center" width="80px">
                                                                                    <b>Max. CGPA / Marks</b></b></td>
                                                                                <td class="text-center" width="80px">
                                                                                    <strong>% CGPA / Marks Obtained</strong></td>
                                                                                <td class="text-center" width="100px">
                                                                                    <b>Division</b></td>
                                                                                <td class="text-center" width="257px">
                                                                                    <b>Subjects </b>
                                                                                </td>
                                                                                <td class="text-center" width="21px">&nbsp;</td>
                                                                                <td class="text-left" width="220px">
                                                                                    <b>Reference No</b></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" width="140px">High School<br />
                                                                                    /Equivalent</td>
                                                                                <td align="left" style="width: 70px" width="140px">
                                                                                    <asp:DropDownList ID="Drop_graduation0" runat="server" Visible="False">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtHSBoard" runat="server" MaxLength="20" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator42"
                                                                                        runat="server" ControlToValidate="TxtHSBoard" ErrorMessage="* Not Valid"
                                                                                        ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtHSYear" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17"
                                                                                        runat="server" ControlToValidate="TxtHSYear" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="60px">
                                                                                    <asp:TextBox ID="TxtHSMarksObt" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15"
                                                                                        runat="server" ControlToValidate="TxtHSMarksObt" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">&nbsp;<asp:TextBox ID="TxtHSMaxMarks" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16"
                                                                                        runat="server" ControlToValidate="TxtHSMaxMarks" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtHSPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator41"
                                                                                        runat="server" ControlToValidate="TxtHSPercent" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="100px">
                                                                                    <asp:TextBox ID="TxtHSDiv" runat="server" MaxLength="6" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="257px">
                                                                                    <asp:TextBox ID="TxtHSSubjects" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="220px">
                                                                                    <asp:TextBox ID="TxtHS_reference_no" runat="server" MaxLength="50"
                                                                                        Width="100px" placeholder="10th Roll No"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server"
                                                                                        ControlToValidate="TxtHS_reference_no" ErrorMessage="*Reference No Required"
                                                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" width="140px">&nbsp;</td>
                                                                                <td align="left" style="width: 70px" width="140px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" colspan="5">
                                                                                    <asp:CompareValidator ID="CompareValidator2" runat="server"
                                                                                        ControlToCompare="TxtHSMarksObt" ControlToValidate="TxtHSMaxMarks"
                                                                                        ErrorMessage="Marks obtained cannot be greater than Max. Marks"
                                                                                        ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                                <td align="left" width="220px">&nbsp;</td>
                                                                            </tr>

                                                                            <asp:Panel ID="Panel_Intermediate" runat="server">
                                                                                <tr>
                                                                                    <td align="left" width="140px">Intermediate<br />
                                                                                        /Equivalent</td>
                                                                                    <td align="left" style="width: 70px" width="140px">&nbsp;</td>
                                                                                    <td align="left" width="80px">
                                                                                        <asp:TextBox ID="TxtInterBoard" runat="server" MaxLength="20" Width="60px"></asp:TextBox>
                                                                                        <br />
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator43"
                                                                                            runat="server" ControlToValidate="TxtInterBoard" ErrorMessage="* Not Valid"
                                                                                            ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                        <br />
                                                                                    </td>
                                                                                    <td align="left" width="80px">
                                                                                        <asp:TextBox ID="TxtInterYear" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18"
                                                                                            runat="server" ControlToValidate="TxtInterYear" ErrorMessage="*No only"
                                                                                            ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                                    </td>
                                                                                    <td align="left" width="60px">
                                                                                        <asp:TextBox ID="TxtInterMarksObt" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator19"
                                                                                            runat="server" ControlToValidate="TxtInterMarksObt" ErrorMessage="*No only"
                                                                                            ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                    </td>
                                                                                    <td align="left" width="80px">&nbsp;<asp:TextBox ID="TxtInterMaxMarks" runat="server" MaxLength="5"
                                                                                        Width="60px"></asp:TextBox>
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator20"
                                                                                            runat="server" ControlToValidate="TxtInterMaxMarks" ErrorMessage="*No only"
                                                                                            ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                    </td>
                                                                                    <td align="left" width="80px">
                                                                                        <asp:TextBox ID="TxtInterPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                        <br />
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator44"
                                                                                            runat="server" ControlToValidate="TxtInterPercent" ErrorMessage="*No Only"
                                                                                            ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                                        <br />
                                                                                    </td>
                                                                                    <td align="left" width="100px">
                                                                                        <asp:TextBox ID="TxtInter_div" runat="server" MaxLength="6" Width="60px"></asp:TextBox>
                                                                                        <br />
                                                                                        <br />
                                                                                    </td>
                                                                                    <td align="left" width="257px">
                                                                                        <asp:TextBox ID="TxtInterSubjects" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                                                                        <br />
                                                                                        <br />
                                                                                    </td>
                                                                                    <td align="left" class="white" width="21px">
                                                                                        <br />
                                                                                    </td>
                                                                                    <td align="left" width="220px">
                                                                                        <asp:TextBox ID="Txtinter_reference_No" runat="server" MaxLength="50"
                                                                                            Width="100px" placeholder="10+2 Roll No"></asp:TextBox>
                                                                                        <br />
                                                                                        <asp:RequiredFieldValidator ID="RequiredField_inter_sr" runat="server" ControlToValidate="Txtinter_reference_No" ErrorMessage="*Reference No Required" ForeColor="Red" Visible="true"></asp:RequiredFieldValidator>
                                                                                        <br />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left" width="140px">&nbsp;</td>
                                                                                    <td align="left" style="width: 70px" width="140px">&nbsp;</td>
                                                                                    <td align="left" width="80px">&nbsp;</td>
                                                                                    <td align="left" width="80px">&nbsp;</td>
                                                                                    <td align="left" colspan="5">
                                                                                        <asp:CompareValidator ID="CompareValidator3" runat="server"
                                                                                            ControlToCompare="TxtInterMarksObt" ControlToValidate="TxtInterMaxMarks"
                                                                                            ErrorMessage="Marks obtained cannot be greater than Max. Marks"
                                                                                            ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                                                                    </td>
                                                                                    <td align="left" class="white" width="21px">&nbsp;</td>
                                                                                    <td align="left" width="220px">&nbsp;</td>
                                                                                </tr>
                                                                            </asp:Panel>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="left" colspan="11">
                                                                    <asp:Panel ID="graduationpanal" runat="server" Width="100%">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td align="left" width="140px">Graduation
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="143px">
                                                                                    <asp:DropDownList ID="Drop_graduation" runat="server">
                                                                                        <asp:ListItem Value="NA">---Select---</asp:ListItem>
                                                                                        <asp:ListItem>Professional</asp:ListItem>
                                                                                        <asp:ListItem>Non Professional</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtGradBoard_3" runat="server" MaxLength="50" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator50"
                                                                                        runat="server" ControlToValidate="TxtGradBoard_3" ErrorMessage="* Not Valid"
                                                                                        ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtGradYear0" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator26"
                                                                                        runat="server" ControlToValidate="TxtGradYear0" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="60px">
                                                                                    <asp:TextBox ID="TxtGradMarksObt0" runat="server" MaxLength="5"
                                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator28"
                                                                                        runat="server" ControlToValidate="TxtGradMarksObt0" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">&nbsp;
                                                                                    <asp:TextBox ID="TxtGradMaxMarks0" runat="server" MaxLength="5"
                                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator34"
                                                                                        runat="server" ControlToValidate="TxtGradMaxMarks0" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtgradPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator45"
                                                                                        runat="server" ControlToValidate="TxtgradPercent" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="100px">
                                                                                    <asp:TextBox ID="TxtGrad_div" runat="server" MaxLength="6" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="257px">
                                                                                    <asp:TextBox ID="TxtGradSubjects0" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="220px">
                                                                                    <asp:TextBox ID="Txt_grad_ref_no" runat="server" MaxLength="50" Width="100px" placeholder="UG Roll No"></asp:TextBox>
                                                                                    <br />

                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Graduation" runat="server" ControlToValidate="Txt_grad_ref_no" ErrorMessage="*Reference No Required" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" width="140px">&nbsp;</td>
                                                                                <td align="left" width="143px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" colspan="5">
                                                                                    <asp:CompareValidator ID="CompareValidator4" runat="server"
                                                                                        ControlToCompare="TxtGradMarksObt0" ControlToValidate="TxtGradMaxMarks0"
                                                                                        ErrorMessage="Marks obtained cannot be greater than Max. Marks"
                                                                                        ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                                <td align="left" width="220px">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="11">
                                                                    <asp:Panel ID="pgpanal" runat="server" Width="100%">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td align="left" width="140px">Post
                                                                                <br />
                                                                                    Graduation
                                                                                <br />
                                                                                </td>
                                                                                <td align="left" width="143px">
                                                                                    <asp:DropDownList ID="Drop_pg" runat="server">
                                                                                        <asp:ListItem Value="NA">---Select---</asp:ListItem>
                                                                                        <asp:ListItem>Professional</asp:ListItem>
                                                                                        <asp:ListItem>Non Professional</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="Txt_pg_Board" runat="server" MaxLength="20" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator51"
                                                                                        runat="server" ControlToValidate="Txt_pg_Board" ErrorMessage="* Not Valid"
                                                                                        ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="Txt_pg_Year" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator27"
                                                                                        runat="server" ControlToValidate="Txt_pg_Year" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="60px">
                                                                                    <asp:TextBox ID="Txt_pg_MarksObt" runat="server" MaxLength="5"
                                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator29"
                                                                                        runat="server" ControlToValidate="Txt_pg_MarksObt" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">&nbsp;
                                                                                <asp:TextBox ID="Txt_pg_MaxMarks" runat="server" MaxLength="5"
                                                                                    onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator35"
                                                                                        runat="server" ControlToValidate="Txt_pg_MaxMarks" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtpgPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator46"
                                                                                        runat="server" ControlToValidate="TxtpgPercent" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="100px">
                                                                                    <asp:TextBox ID="Txt_pg_div" runat="server" MaxLength="6" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="257px">
                                                                                    <asp:TextBox ID="Txt_pg_Subjects" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="21px" class="white">
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="220px">
                                                                                    <asp:TextBox ID="Txt_pg_ref_no" runat="server" MaxLength="50" Width="100px" placeholder="PG Roll No"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" width="140px">&nbsp;</td>
                                                                                <td align="left" class="style4">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" colspan="5">
                                                                                    <asp:CompareValidator ID="CompareValidator5" runat="server"
                                                                                        ControlToCompare="Txt_pg_MarksObt" ControlToValidate="Txt_pg_MaxMarks"
                                                                                        ErrorMessage="Marks obtained cannot be greater than Max. Marks"
                                                                                        ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                                <td align="left" width="220px">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="11">
                                                                    <asp:Panel ID="mphilpanal" runat="server" Width="100%">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td align="left" width="140px">M.Phil<br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="143px">
                                                                                    <asp:DropDownList ID="Drop_pg0" runat="server" Visible="False">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="Txt_mphil_Board3" runat="server" MaxLength="20" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator52"
                                                                                        runat="server" ControlToValidate="Txt_mphil_Board3" ErrorMessage="* Not Valid"
                                                                                        ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="Txt_mphil_Yr3" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator30"
                                                                                        runat="server" ControlToValidate="Txt_mphil_Yr3" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="60px">
                                                                                    <asp:TextBox ID="Txt_mphil_Marksobtained3" runat="server" MaxLength="5"
                                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator31"
                                                                                        runat="server" ControlToValidate="Txt_mphil_Marksobtained3"
                                                                                        ErrorMessage="*No only" ForeColor="Red"
                                                                                        ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">&nbsp;
                                                                                <asp:TextBox ID="Txt_mphil_MaxMarks3" runat="server" MaxLength="5"
                                                                                    onkeypress="return number(event)" Width="60px"></asp:TextBox>

                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator36"
                                                                                        runat="server" ControlToValidate="Txt_mphil_MaxMarks3" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>

                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtmphilPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator47"
                                                                                        runat="server" ControlToValidate="TxtmphilPercent" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="100px">
                                                                                    <asp:TextBox ID="Txt_mphil_div" runat="server" MaxLength="6"
                                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="257px">
                                                                                    <asp:TextBox ID="Txt_mphil_Subjects3" runat="server" MaxLength="50"
                                                                                        Width="250px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="21px" class="white">
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="220px">
                                                                                    <asp:TextBox ID="Txt_mphil_ref_no" runat="server" MaxLength="50" Width="100px" placeholder="MPhil Roll No"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" width="140px">&nbsp;</td>
                                                                                <td align="left" width="143px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" colspan="5">
                                                                                    <asp:CompareValidator ID="CompareValidator6" runat="server"
                                                                                        ControlToCompare="Txt_mphil_Marksobtained3"
                                                                                        ControlToValidate="Txt_mphil_MaxMarks3"
                                                                                        ErrorMessage="Marks obtained cannot be greater than Max. Marks"
                                                                                        ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                                <td align="left" width="220px">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" colspan="11">
                                                                    <asp:Panel ID="UGC_CSIR_panal" runat="server" Width="100%">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td align="left" width="140px">UGC / CSIR
                                                                                <br />
                                                                                </td>
                                                                                <td align="left" width="143px">
                                                                                    <asp:DropDownList ID="Drop_ugc" runat="server">
                                                                                        <asp:ListItem Value="NA">---Select---</asp:ListItem>
                                                                                        <asp:ListItem>NET</asp:ListItem>
                                                                                        <asp:ListItem>JRF</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="Txt_ugc_Board1" runat="server" MaxLength="20" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator53"
                                                                                        runat="server" ControlToValidate="Txt_ugc_Board1" ErrorMessage="* Not Valid"
                                                                                        ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="Txt_ugc_Year1" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator32"
                                                                                        runat="server" ControlToValidate="Txt_ugc_Year1" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="60px">
                                                                                    <asp:TextBox ID="Txt_ugc_MarksObt1" runat="server" MaxLength="5"
                                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator24"
                                                                                        runat="server" ControlToValidate="Txt_ugc_MarksObt1" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">&nbsp;
                                                                                <asp:TextBox ID="Txt_ugc_MaxMarks1" runat="server" MaxLength="5"
                                                                                    onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator38"
                                                                                        runat="server" ControlToValidate="Txt_ugc_MaxMarks1" ErrorMessage="*No only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="80px">
                                                                                    <asp:TextBox ID="TxtugcPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator48"
                                                                                        runat="server" ControlToValidate="TxtugcPercent" ErrorMessage="*No Only"
                                                                                        ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                                </td>
                                                                                <td align="left" width="100px">
                                                                                    <asp:TextBox ID="Txt_ugc_div" runat="server" MaxLength="6" Width="60px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="257px">
                                                                                    <asp:TextBox ID="Txt_ugc_Subjects1" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">
                                                                                    <br />
                                                                                </td>
                                                                                <td align="left" width="220px">
                                                                                    <asp:TextBox ID="Txt_ugc_ref_no" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
                                                                                    <br />
                                                                                    <br />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" width="140px">&nbsp;</td>
                                                                                <td align="left" class="style4">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" width="80px">&nbsp;</td>
                                                                                <td align="left" colspan="5">
                                                                                    <asp:CompareValidator ID="CompareValidator7" runat="server"
                                                                                        ControlToCompare="Txt_ugc_MarksObt1" ControlToValidate="Txt_ugc_MaxMarks1"
                                                                                        ErrorMessage="Marks obtained cannot be greater than Max. Marks" ForeColor="Red"
                                                                                        Operator="GreaterThan"></asp:CompareValidator>
                                                                                </td>
                                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                                <td align="left" width="220px">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="left" width="140px">Others<br />
                                                                    <br />
                                                                </td>
                                                                <td align="left" width="143px">
                                                                    <asp:TextBox ID="TxtOtherCourse2" runat="server" MaxLength="30" Width="60px"></asp:TextBox>
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                <td align="left" width="80px">
                                                                    <asp:TextBox ID="TxtOtherBoard2" runat="server" MaxLength="20" Width="60px"></asp:TextBox>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator54"
                                                                        runat="server" ControlToValidate="TxtOtherBoard2" ErrorMessage="* Not Valid"
                                                                        ForeColor="Red" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                </td>
                                                                <td align="left" width="80px">
                                                                    <asp:TextBox ID="TxtOtherYr2" runat="server" MaxLength="4" Width="60px"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator33"
                                                                        runat="server" ControlToValidate="TxtOtherYr2" ErrorMessage="*No only"
                                                                        ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                                </td>
                                                                <td align="left" width="60px">
                                                                    <asp:TextBox ID="TxtOtherMarksobtained2" runat="server" MaxLength="5"
                                                                        onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator37"
                                                                        runat="server" ControlToValidate="TxtOtherMarksobtained2"
                                                                        ErrorMessage="*No only" ForeColor="Red"
                                                                        ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                </td>
                                                                <td align="left" width="80px">&nbsp;
                                                                <asp:TextBox ID="TxtOtherMaxMarks2" runat="server" MaxLength="5"
                                                                    onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator39"
                                                                        runat="server" ControlToValidate="TxtOtherMaxMarks2" ErrorMessage="*No only"
                                                                        ForeColor="Red" ValidationExpression="^[0-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                                </td>
                                                                <td align="left" width="80px">
                                                                    <asp:TextBox ID="TxtotherPercent" runat="server" MaxLength="5" Width="60px"></asp:TextBox>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator49"
                                                                        runat="server" ControlToValidate="TxtotherPercent" ErrorMessage="*No Only"
                                                                        ForeColor="Red" ValidationExpression="^[0-9]{2,2}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                                </td>
                                                                <td align="left" width="100px">&nbsp;
                                                                <asp:TextBox ID="TxtOther_div" runat="server" MaxLength="6"
                                                                    onkeypress="return number(event)" Width="60px"></asp:TextBox>
                                                                    &nbsp;&nbsp;&nbsp;
                                                                <br />
                                                                    <br />
                                                                </td>
                                                                <td align="left" width="257px">&nbsp;<asp:TextBox ID="TxtOtherSubjects2" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                <td align="left" width="21px" class="white">
                                                                    <br />
                                                                </td>
                                                                <td align="left" width="220px">&nbsp;<asp:TextBox ID="Txt_other_ref_no" runat="server" MaxLength="50" Width="100px"></asp:TextBox>
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="left" class="style8">&nbsp;</td>
                                                                <td align="left" class="style9">&nbsp;</td>
                                                                <td align="left" class="style5">&nbsp;</td>
                                                                <td align="left" width="80px">&nbsp;</td>
                                                                <td align="left" colspan="5">
                                                                    <asp:CompareValidator ID="CompareValidator8" runat="server"
                                                                        ControlToCompare="TxtOtherMarksobtained2" ControlToValidate="TxtOtherMaxMarks2"
                                                                        ErrorMessage="Marks obtained cannot be greater than Max. Marks"
                                                                        ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                                                                </td>
                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                <td align="left" width="220px">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="style8">&nbsp;</td>
                                                                <td align="left" class="style9">&nbsp;</td>
                                                                <td align="left" class="style5">&nbsp;</td>
                                                                <td align="left" width="80px">&nbsp;</td>
                                                                <td align="left" colspan="5">&nbsp;</td>
                                                                <td align="left" class="white" width="21px">&nbsp;</td>
                                                                <td align="left" width="220px">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2">
                                                        <table class="nav-justified">

                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="baPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="Label86" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True" Text="For BA Programme"></asp:Label>
                                                                                    <asp:Label ID="Label99" runat="server" ForeColor="Red" Text="(Please select the choice of Subject as per the availability of course in the University/Affiliated College as given in the Admission Brochure 2020-21.)" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 25%;">
                                                                                    <asp:Label ID="Label87" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Ist Choice"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 25%;">
                                                                                    <asp:DropDownList ID="ba1c_1" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba1c_1', 'ba1c_2', 'ba1c_3')">
                                                                                        <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="width: 25%;">
                                                                                    <asp:DropDownList ID="ba1c_2" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba1c_2', 'ba1c_1', 'ba1c_3')">
                                                                                        <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="width: 25%;">
                                                                                    <asp:DropDownList ID="ba1c_3" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba1c_3', 'ba1c_2', 'ba1c_1')">
                                                                                        <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Please Select 1st Subject" ForeColor="Red" ControlToValidate="ba1c_1" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                                                                                <td>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="ba1c_2" ErrorMessage="*Please Select 2nd Subject" ForeColor="Red" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <td>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="ba1c_3" ErrorMessage="*Please Select 3rd Subject" ForeColor="Red" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label88" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="IInd Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ba2c_1" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba2c_1', 'ba2c_2', 'ba2c_3')">
                                                                                        <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ba2c_2" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba2c_2', 'ba2c_1', 'ba2c_3')">
                                                                                        <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ba2c_3" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba2c_3', 'ba2c_2', 'ba2c_1')">
                                                                                        <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label89" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="IIIrd Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ba3c_1" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba3c_1', 'ba3c_2', 'ba3c_3')">
                                                                                        <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ba3c_2" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba3c_2', 'ba3c_1', 'ba3c_3')">
                                                                                        <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>

                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ba3c_3" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('ba3c_3', 'ba3c_2', 'ba3c_1')">
                                                                                        <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>History</asp:ListItem>
                                                                                        <asp:ListItem>Economics</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>

                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="bahindPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="Label26" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True" Text="For BA Programme"></asp:Label>
                                                                                    <asp:Label ID="Label27" runat="server" ForeColor="Red" Text="(Please select the choice of Subject as per the availability of course in the University/Affiliated College as given in the Admission Brochure 2020-21.)" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 25%;">
                                                                                    <asp:Label ID="Label28" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Ist Choice"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 25%;">
                                                                                    <asp:DropDownList ID="bahind1c_1" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind1c_1', 'bahind1c_2', 'bahind1c_3')">
                                                                                        <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="width: 25%;">
                                                                                    <asp:DropDownList ID="bahind1c_2" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind1c_2', 'bahind1c_1', 'bahind1c_3')">
                                                                                        <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="width: 25%;">
                                                                                    <asp:DropDownList ID="bahind1c_3" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind1c_3', 'bahind1c_2', 'bahind1c_1')">
                                                                                        <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*Please Select 1st Subject" ForeColor="Red" ControlToValidate="bahind1c_1" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                                                                               <td>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="bahind1c_2" ErrorMessage="*Please Select 2nd Subject" ForeColor="Red" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <td>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="bahind1c_3" ErrorMessage="*Please Select 3rd Subject" ForeColor="Red" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label29" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="IInd Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bahind2c_1" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind2c_1', 'bahind2c_2', 'bahind2c_3')">
                                                                                        <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bahind2c_2" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind2c_2', 'bahind2c_1', 'bahind2c_3')">
                                                                                        <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bahind2c_3" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind2c_3', 'bahind2c_2', 'bahind2c_1')">
                                                                                        <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label39" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="IIIrd Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bahind3c_1" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind3c_1', 'bahind3c_2', 'bahind3c_3')">
                                                                                        <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bahind3c_2" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind3c_2', 'bahind3c_1', 'bahind3c_3')">
                                                                                        <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>

                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bahind3c_3" runat="server" CssClass="form-control ddl" onchange="checksubjectsec1('bahind3c_3', 'bahind3c_2', 'bahind3c_1')">
                                                                                        <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                                                        <asp:ListItem>English</asp:ListItem>
                                                                                        <asp:ListItem>Urdu</asp:ListItem>
                                                                                        <asp:ListItem>Education</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Psychology</asp:ListItem>
                                                                                        <asp:ListItem>Geography</asp:ListItem>
                                                                                        <asp:ListItem>Political Science</asp:ListItem>
                                                                                        <asp:ListItem>Sociology</asp:ListItem>
                                                                                        <asp:ListItem>Art & Craft</asp:ListItem>
                                                                                        <asp:ListItem>Home Science</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="bscPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="Label19" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True" Text="For BSC Programme"></asp:Label>
                                                                                    <asp:Label ID="Label23" runat="server" ForeColor="Red" Text="(Please select the choice of Subject as per the availability of course in the University/Affiliated College as given in the Admission Brochure 2020-21.)" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label24" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Enter Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bsc1c_1" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA"> Select Subject Group</asp:ListItem>
                                                                                        <%--   <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Political Science</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem> --%>
                                                                                        <asp:ListItem> B.Sc. (Physics, Chemistry, Mathematics)</asp:ListItem>
                                                                                        <asp:ListItem> B.Sc. (Zoology, Botany, Chemistry)</asp:ListItem>

                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <%--          <td>
                                                                            <asp:DropDownList ID="bsc1c_2" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Political Science</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="bsc1c_3" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Political Science</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr> --%>
                                                                                <tr>
                                                                                    <td>&nbsp;</td>
                                                                                    <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*Atleast one subject Group selection required." ForeColor="Red" ControlToValidate="bsc1c_1" InitialValue="NA" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                                                                                    <td>&nbsp;</td>
                                                                                    <td>&nbsp;</td>
                                                                                </tr>
                                                                                <%--      <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label26" runat="server" CssClass="col-lg-2 control-label" 
                                                                                Text="IInd Choice"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="bsc2c_1" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="bsc2c_2" runat="server" CssClass="form-control ddl">
                                                                               <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                
																				 </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="bsc2c_3" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem Value="NA">IIIrd Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                              <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label27" runat="server" CssClass="col-lg-2 control-label" 
                                                                                Text="IIIrd Choice"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem Value="NA">Ist Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DropDownList8" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem Value="NA">IInd Subject</asp:ListItem>
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DropDownList9" runat="server" CssClass="form-control ddl">
                                                                                <asp:ListItem>Physics</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                                <asp:ListItem>Mathematics</asp:ListItem>
                                                                                <asp:ListItem>Zoology</asp:ListItem>
                                                                                <asp:ListItem>Botany</asp:ListItem>
                                                                                <asp:ListItem>Chemistry</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>  --%>
                                                                                <tr>
                                                                                    <td>&nbsp;</td>
                                                                                    <td>&nbsp;</td>
                                                                                    <td>&nbsp;</td>
                                                                                    <td>&nbsp;</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="4">&nbsp;</td>
                                                                                </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="dedPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="Label61" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True"
                                                                                        Text="For D.Ed. (Special Education) Programme (V.I./ H.I./ M.R.)"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label55" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Enter Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ded_1c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">Ist Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ded_2c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IInd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="ded_3c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IIIrd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="bedrPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="Label64" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True"
                                                                                        Text="For B.Ed. (Special Education) Programme (V.I./ H.I./ M.R.)"></asp:Label>
                                                                                    <asp:Label ID="Label100" runat="server" ForeColor="Red" Text="(Please select the choice of Subject as per the availability of course in the University/Affiliated College as given in the Admission Brochure 2020-21.)"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label94" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Enter Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bed_1c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">Ist Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bed_2c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IInd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bed_3c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IIIrd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="bedodlPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <asp:Label ID="Label65" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True"
                                                                                        Text="For B.Ed.(ODL) (Special Education) Programme (V.I./ H.I./ M.R.)"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label70" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Enter Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bed_odl_1c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">Ist Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bed_odl_2c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IInd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bed_odl_3c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IIIrd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Hearing Impairment</asp:ListItem>
                                                                                        <asp:ListItem>Mental Retardation</asp:ListItem>
                                                                                        <asp:ListItem>Visual Impairment</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="bpoPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="4" class="auto-style1">
                                                                                    <asp:Label ID="Label66" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True" Text="For B.ASLP/B.P.O. (Special Education) Programme "></asp:Label>
                                                                                    <asp:Label ID="Label101" runat="server" ForeColor="Red" Text="(Please select the choice of Subject as per the availability of course in the University/Affiliated College as given in the Admission Brochure 2020-21.)"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label71" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Text="Enter Choice"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bpo_baslp_1c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">Ist Choice</asp:ListItem>
                                                                                        <asp:ListItem Value="BPO">BPO</asp:ListItem>
                                                                                        <asp:ListItem Value="BSLP">BASLP</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="bpo_baslp_2c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IInd Choice</asp:ListItem>
                                                                                        <asp:ListItem Value="BPO">BPO</asp:ListItem>
                                                                                        <asp:ListItem Value="BSLP">BASLP</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="btechPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="6">
                                                                                    <asp:Label ID="Label67" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True" Text="For BTech Programme "></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;&nbsp;&nbsp;
                                                                            <asp:Label ID="Label96" runat="server" Font-Bold="False" Font-Size="13px"
                                                                                Text="Enter Choice"></asp:Label>
                                                                                </td>
                                                                                <td align="left">
                                                                                    <asp:DropDownList ID="btech_1c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">Ist Choice</asp:ListItem>
                                                                                        <asp:ListItem>Comp Science &amp; Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electronics &amp; Communication Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Civil Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electrical Engineering</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td align="left">
                                                                                    <asp:DropDownList ID="btech_2c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IInd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Comp Science&nbsp; &amp; Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electronics &amp; Communication Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Civil Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electrical Engineering</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td align="left">
                                                                                    <asp:DropDownList ID="btech_3c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IIIrd Choice</asp:ListItem>
                                                                                        <asp:ListItem>Comp Science&nbsp; &amp; Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electronics &amp; Communication Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Civil Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electrical Engineering</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="btech_4c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">IVth Choice</asp:ListItem>
                                                                                        <asp:ListItem>Comp Science&nbsp; &amp; Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electronics &amp; Communication Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Civil Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electrical Engineering</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="btech_5c" runat="server" CssClass="form-control ddl">
                                                                                        <asp:ListItem Value="NA">Vth Choice</asp:ListItem>
                                                                                        <asp:ListItem>Comp Science&nbsp; &amp; Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electronics &amp; Communication Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Civil Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                                                                        <asp:ListItem>Electrical Engineering</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td colspan="4">
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="*Atleast one branch selection required." ForeColor="Red" ControlToValidate="btech_1c" InitialValue="NA" SetFocusOnError="True" Enabled="False"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="phdPanel" runat="server" Visible="False">
                                                                        <table class="nav-justified">
                                                                            <tr>
                                                                                <td colspan="6">
                                                                                    <asp:Label ID="Label80" runat="server" CssClass="col-lg-2 control-label"
                                                                                        Font-Bold="True" Text="For Ph.D. Programme Only"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="6">
                                                                                    <table class="left">
                                                                                        <tr>
                                                                                            <td rowspan="2">&nbsp;&nbsp;&nbsp;
                                                                                            </td>
                                                                                            <td align="left" rowspan="2">
                                                                                                <asp:Label ID="Label76" runat="server" Font-Bold="False" Font-Size="14px"
                                                                                                    Text="Subject(s) Taught"></asp:Label>
                                                                                            </td>

                                                                                            <td align="center" colspan="2">
                                                                                                <asp:Label ID="Label75" runat="server" Font-Bold="False" Font-Size="14px"
                                                                                                    Text="Duration"></asp:Label>
                                                                                            </td>
                                                                                            <td rowspan="2">
                                                                                                <asp:Label ID="Label78" runat="server" Font-Bold="False" Font-Size="14px"
                                                                                                    Text="Year &amp; Months"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <asp:Label ID="Label79" runat="server" Font-Bold="False" Font-Size="14px"
                                                                                                    Text="From"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:Label ID="Label77" runat="server" Font-Bold="False" Font-Size="14px"
                                                                                                    Text="To"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"
                                                                                                    placeholder="Name of the Institution"></asp:TextBox>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"
                                                                                                    placeholder="Enter Subject(s)"></asp:TextBox>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator257" runat="server" ControlToValidate="TextBox12" ErrorMessage="* Enter valid Name" ForeColor="#CC0000" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                                                                            </td>
                                                                                            <td align="left">&nbsp;</td>
                                                                                            <td align="left">&nbsp;</td>
                                                                                            <td align="left">&nbsp;</td>
                                                                                            <td>&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" colspan="2">
                                                                                                <asp:Label ID="Label74" runat="server" Font-Bold="False" Font-Size="14px"
                                                                                                    Text="Name and Address of the Employer"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left" colspan="3">
                                                                                                <asp:TextBox ID="phd_emp_name_add" runat="server" CssClass="form-control"
                                                                                                    placeholder="Enter Name &amp; Address" TextMode="MultiLine"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="6">* Applicants  working  in  any  organization  should  enclose  NOC  through  proper  channel  from  respective department.</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align="center">
                                                        <asp:Button ID="Education_Button" runat="server" CssClass="btn btn-primary"
                                                            OnClick="Education_Button_Click" Text="Save" Width="150px" />
                                                    </td>
                                                </tr>

                                            </table>


                                        </asp:View>

                                        <!----------------------------------------End of View 4----------------------------------------->

                                        <asp:View ID="View5" runat="server">

                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        <strong>Desired Facilities</strong><i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table datatable">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label84" runat="server"
                                                            Text="Scholarship"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="sholarship_radio" runat="server"
                                                            RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                                            <asp:ListItem>Yes</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label85" runat="server"
                                                            Text="Hostel"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="hostel_radio" runat="server"
                                                            RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                                            <asp:ListItem>Yes</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label83" runat="server"
                                                            Text="Travel/Bus"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="travel_bus_radio" runat="server"
                                                            RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True">No</asp:ListItem>
                                                            <asp:ListItem>Yes</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>

                                            </table>


                                            <table class="nav-justified">
                                                <tr>
                                                    <td colspan="2">&nbsp;&nbsp;*&nbsp;Said facilities will be provided as per the availability and rules of the 
                                                    University.</td>
                                                </tr>

                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align="center">
                                                        <asp:Button ID="Facility_Button" runat="server" CssClass="btn btn-primary"
                                                            Text="Save" OnClick="Facility_Button_Click" Width="150px" />
                                                    </td>
                                                </tr>

                                            </table>


                                        </asp:View>

                                        <!----------------------------------------End of View 5----------------------------------------->

                                        <asp:View ID="View6" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        <strong>File Upload&nbsp; </strong>
                                                    </div>
                                                </div>
                                                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label115" runat="server" ForeColor="Red" Text="Note: *Upload jpg/jpeg file only (Max size 80 KB)&nbsp; for Photo/Signature and PDF file only (Max size 300 KB)&nbsp; for Documents."></asp:Label>
                                                </strong>
                                            </div>
                                            <table class="nav-justified">
                                                <tr>
                                                    <td class="auto-style4">
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label9" runat="server"
                                                            Text="Photo Upload"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" />

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server"
                                                            ControlToValidate="FileUpload1" ErrorMessage="* Required Field"
                                                            ForeColor="#CC3300"></asp:RequiredFieldValidator>


                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator273" runat="server" ControlToValidate="FileUpload1" ErrorMessage="* Upload jpg/jpeg file only (Max size 80 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.jpeg|.JPEG)$"></asp:RegularExpressionValidator>


                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label103" runat="server" Text="Signature Upload"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload2" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server"
                                                            ControlToValidate="FileUpload2" ErrorMessage="* Required Field"
                                                            ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator274" runat="server" ControlToValidate="FileUpload2" ErrorMessage="* Upload jpg/jpeg file only (Max size 80 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.jpeg|.JPEG)$"></asp:RegularExpressionValidator>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label107" runat="server" Text="X Marksheet Upload (PDF file only)"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload3" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="FileUpload3" ErrorMessage="* Required Field" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="FileUpload3" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label108" runat="server" Text="XII Marksheet Upload (PDF file only)"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload4" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="FileUpload4" Enabled="False" ErrorMessage="* Required Field" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="FileUpload4" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label109" runat="server" Text="UG Marksheet Upload (PDF file only)"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload5" runat="server" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="FileUpload5" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label110" runat="server" Text="Other Marksheet Upload (PDF file only)"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload6" runat="server" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="FileUpload6" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label111" runat="server" Text="Category Certificate Upload (PDF file only)"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload7" runat="server" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="FileUpload7" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label112" runat="server" Text="Disability Certificate Upload (PDF file only)"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload8" runat="server" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator272" runat="server" ControlToValidate="FileUpload8" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <%--AIOT DETAILS START--%>
                                                <%--                                                <asp:Panel ID="Panel_AIOT" runat="server" Visible="false">--%>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label113" runat="server" Text="Any other Certificate / Document (PDF file only) (if Applicable)            "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload9" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="FileUpload9" ErrorMessage="* Required Field" ForeColor="#CC3300" Enabled="False"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator275" runat="server" ControlToValidate="FileUpload9" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$" Enabled="False"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Label ID="Label114" runat="server" Text="Any other Certificate / Document (PDF file only) (if Applicable)            "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload10" runat="server" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="FileUpload10" ErrorMessage="* Required Field" ForeColor="#CC3300" Enabled="False"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator276" runat="server" ControlToValidate="FileUpload10" ErrorMessage="* Upload pdf/PDF file only (Max size 300 KB) " ForeColor="#CC3300" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$" Enabled="False"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <%--                                                    </asp:Panel>--%>
                                                <%--AIOT DETAILS END--%>

                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:Image ID="Photo_img" runat="server" Height="154px" Width="149px" Visible="False" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="Signature_img" runat="server" Height="154px" Width="149px" Visible="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:HyperLink ID="hyDoc_1" runat="server" Target="_blank" Visible="False">X Marksheet</asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:HyperLink ID="hyDoc_3" runat="server" Target="_blank" Visible="False">UG Marksheet</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:HyperLink ID="hyDoc_2" runat="server" Target="_blank" Visible="False">XII Marksheet</asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:HyperLink ID="hyDoc_4" runat="server" Target="_blank" Visible="False">Other Marksheet</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:HyperLink ID="hyDoc_7" runat="server" Target="_blank" Visible="False">Any other Certificate_1</asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:HyperLink ID="hyDoc_5" runat="server" Target="_blank" Visible="False">Category Certificate</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">
                                                        <asp:HyperLink ID="hyDoc_8" runat="server" Target="_blank" Visible="False">Any other Certificate_2</asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:HyperLink ID="hyDoc_6" runat="server" Target="_blank" Visible="False">Disability Certificate</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style4">&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>

                                            <table class="table datatable">


                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="Image_Upload_button" runat="server" CssClass="btn btn-primary"
                                                            Text="Upload" OnClick="Image_Upload_button_Click" Width="150px" />
                                                        &nbsp;
                                                       
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="gotonextbutton" runat="server" CssClass="btn btn-primary"
                                                            Text="Go to Next" CausesValidation="False"
                                                            Visible="False" OnClick="gotonextbutton_Click" Width="150px" />

                                                        <asp:Label ID="Label97" runat="server" Visible="False"></asp:Label></td>
                                                </tr>

                                            </table>

                                        </asp:View>

                                        <!----------------------------------------End of View 6----------------------------------------->

                                        <asp:View ID="View7" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        <strong>Payment Details</strong><i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table datatable">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label25" runat="server"
                                                            Text="Payment Mode"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="RadioButtonList_PaymentMode" runat="server" RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True">&nbsp;Demand Draft&nbsp;&nbsp;</asp:ListItem>
                                                            <asp:ListItem>&nbsp;Challan</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                            ControlToValidate="RadioButtonList_PaymentMode" ErrorMessage="* Payment mode Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1_ddno" runat="server"
                                                            Text="DD No./Journal No."></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_DD_No" runat="server"
                                                            placeholder="Enter Six digit DD/Challan No."></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_ddno" runat="server"
                                                            ControlToValidate="TB_DD_No" ErrorMessage="* DD/Challan No. Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TB_DD_No" ErrorMessage="* Enter valid DD/Journal No." ForeColor="#CC0000" ValidationExpression="^[0-9]{6}(?:\s*,\s*[0-9]{6})*$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2_bankname" runat="server"
                                                            Text="Bank Name"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_BankName" runat="server"
                                                            placeholder="Enter Bank Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22_bankname" runat="server"
                                                            ControlToValidate="TB_BankName" ErrorMessage="* Bank Name Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="label4_payment" runat="server"
                                                            Text="Payment Amount"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_PaymentAmount" runat="server"
                                                            placeholder="Enter Payment Amount"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                            ControlToValidate="TB_PaymentAmount" ErrorMessage="* Payment Amount Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator55" runat="server" ControlToValidate="TB_PaymentAmount" ErrorMessage="* Enter valid amount" ForeColor="#CC0000" ValidationExpression="^[0-9]{4}(?:\s*,\s*[0-9]{4})*$" Visible="False"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label5_dd_date" runat="server"
                                                            Text="DD/Challan Date"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_DD_Date" runat="server"
                                                            placeholder="Enter Demand Draft Date" TextMode="Date"></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24_dd_Date" runat="server"
                                                            ControlToValidate="TB_DD_Date" ErrorMessage="* DD Date Required"
                                                            ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                                        &nbsp;
                                                        <%--
                                                        <asp:CompareValidator ID="valcDate" runat="server" ControlToValidate="TB_DD_Date" Display="Dynamic" ErrorMessage="(dd/mm/yyyy)" ForeColor="#CC0000" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                        &nbsp;<asp:RangeValidator ID="valrDate" runat="server" ControlToValidate="TB_DD_Date" MinimumValue="17/03/2018" MaximumValue="17/04/2018" Type="Date" text="Invalid Date" Display="Dynamic" ForeColor="#CC0000" Visible="False"/>--%>

                                                        <asp:RangeValidator ID="valrDate" runat="server" ControlToValidate="TB_DD_Date" MinimumValue="2018-03-17" MaximumValue="2018-06-17" Type="Date" Text="Invalid Date" Display="Dynamic" ForeColor="#CC0000" />
                                                        <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid date format" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ControlToValidate="TB_DD_Date"></asp:RegularExpressionValidator>--%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="Button_Payment_Btech" runat="server" CssClass="btn btn-primary"
                                                            Text="Save" Width="130px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="Label98" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>

                                        </asp:View>

                                        <!----------------------------------------End of View 7----------------------------------------->

                                        <!----------------------------------------Start of View 8----------------------------------------->
                                        <asp:View ID="View8" runat="server">
                                            <div class="panel panel-default">
                                                <div class="panel-heading panel-heading-custom">
                                                    <div class="panel-title">
                                                        <strong>Declaration & Submission</strong><i class="fa fa-pencil pull-right"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="table datatable">
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="CheckBox_declaration" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_declaration_CheckedChanged" />
                                                        I do hereby, solemn and affirm that details provided by me in this application form under various heads are true & correct to the best of my knowledge and information. I affirm that no part of information has been concealed, fabricated or manipulated and that I have read university’s regulations for eligibility & admission procedure. In the event that information provided by me is found incorrect, inappropriate, false, manipulated or fabricated, the university shall have right to withdraw admission provided to me through this application and to take such legal action against me as may be warranted by law.
                                        <br />
                                                        <br />
                                                        I also acknowledge hereby that I have read general instructions for application, procedure of admission, general code of conduct, hostel rules, examination rules, anti-ragging guidelines issued by UGC or Dr. Shakuntala Misra National Rehabilitation University and that I shall abide by them at all points of time. If my involvement in activities relating to discipline in university is found evident, university shall have all rights to take appropriate action against me. 
                                        <br />
                                                        <br />
                                                        I also acknowledge that I am not suffering from any contagious disease that poses potential threat to health and safety of students of the university and shall always treat students with special needs (differently-abled), girls students and economically/ socially deprived with compassion and cooperation. </td>
                                                </tr>

                                            </table>


                                            <table class="nav-justified">

                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td align="center">
                                                        <asp:Button ID="accept_submit_button" runat="server" CssClass="btn btn-primary"
                                                            Text="Accept &amp; Submit" OnClick="accept_submit_button_Click" Visible="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>

                                        </asp:View>


                                        <!----------------------------------------End of View 8----------------------------------------->
                                    </asp:MultiView>



                                </div>



                                <%--                                                                                <asp:ListItem>Urdu</asp:ListItem>
                                                                                <asp:ListItem>Education</asp:ListItem>
                                                                                <asp:ListItem>Psychology</asp:ListItem>
                                                                                <asp:ListItem>Geography</asp:ListItem>
                                                                                <asp:ListItem>Art Craft & Home Science</asp:ListItem>--%>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- END PAGE CONTENT WRAPPER -->
            </div>
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->


    </form>
    <%--                                                                                <asp:ListItem>Social Work</asp:ListItem>--%>

    <!-- START SCRIPTS -->

</body>
</html>
