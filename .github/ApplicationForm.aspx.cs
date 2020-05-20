using System;
using System.IO;
//using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Default5 : System.Web.UI.Page
{
    public string connection_string = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public SqlConnection constr;
    // = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    SqlTransaction transaction = null;
    public SqlCommand cmd;
    public SqlDataReader dr;
    public int j;
    String Query=null;
    int feeamount = 0, final_amount = 0;

    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // Label_nationality.Text = DropDownList_Nationality.SelectedItem.Value.ToString();
            // SetDefaultView();
            showpanel();
            payment();
        }


    }
    private void showpanel()
    {
        if (Session["uname"] == null || Session["regno"] == null)
        {
            Alert.Show("Check Login Details");
            Response.AppendHeader("Refresh", "0;url=Account/Logout.aspx");
        }
        else
        {
            SetDefaultView();
            using (constr = new SqlConnection(connection_string))
            {
                try
                {
                    string user_name_session = Session["uname"].ToString();
                    constr.Open();

                    Query = "select pname,pcode,uname,regno,name from registration where uname=@uname and regno=@regno";

                    // using (cmd = new SqlCommand("select pname,pcode,uname,regno from registration where uname='@uname' and regno='@regno'", constr))
                    //  using (cmd = new SqlCommand("select pname,pcode,uname,regno from registration where uname='"+user_name_session+"' and regno='"+Session["regno"].ToString()+"'", constr))

                    using (cmd = new SqlCommand(Query, constr))
                    {
                        cmd.Parameters.AddWithValue("@uname", user_name_session);
                        cmd.Parameters.AddWithValue("@regno", Session["regno"].ToString());


                        dr = cmd.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                pname.Text = dr["pname"].ToString();
                                pcode.Text = dr["pcode"].ToString();
                                username.Text = dr["uname"].ToString();
                                Label_regno.Text = dr["regno"].ToString();
                                applicant.Text = dr["name"].ToString();
                               // mobileno.Text=dr["mobileno"].ToString();
                                //email_txt.Text=dr["emailad"].ToString();

                            }

                            string pname_str = pcode.Text;

                            string[] ph_values = pname.Text.Split(' ');

                            string pname_cert = pname.Text;



                            if (pname_str == "PDCD")
                            {
                                Panel_Intermediate.Visible = false;
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                RequiredField_inter_sr.Visible = false;
                                disability.SelectedValue = "HI";
                                disability.Enabled = false;
                            }
                            else if (pname_cert == "Certificate Course in Bhojpuri")
                            {
                                //Panel_Intermediate.Visible = false;
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                RequiredField_inter_sr.Visible = false;
                                
                            }
                            else if (pname_str == "DEDH" || pname_str == "DEDV" || pname_str == "DEDM")
                            {
                                //Panel_AIOT.Visible = true;

                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                dedPanel.Visible = false;
                                FileUpload9.Visible = true;
                                FileUpload10.Visible = true;
                                Label113.Visible = true;
                                Label114.Visible = true;
                                RegularExpressionValidator275.Enabled = false;
                                RegularExpressionValidator276.Enabled = false;
                                RequiredFieldValidator40.Enabled = false;
                                RequiredFieldValidator41.Enabled = false;
                                RequiredFieldValidator42.Enabled = true;

                            }
                            else if (pname_str == "BA" )
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                baPanel.Visible = true;

                            }

                            else if (pname_str == "B.A.")
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                bahindPanel.Visible = true;

                            }

                            else if (pname_str == "BSC")
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                bscPanel.Visible = true;

                            }
                            else if (pname_str == "BVA" || pname_str == "BCOM" || pname_str == "BBA" || pname_str == "BLLB")
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;

                            }

                            //################################## July 30, 2019 ###########################################
                            else if (pname_str == "BSNG" || pname_str == "BSML" || pname_str == "BSRI" || pname_str == "BSOY" || pname_str == "BPTY")
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;

                            }

                            else if (pname_str == "BEDH" || pname_str == "BEDG"  || pname_str == "BEDV" || pname_str == "BEDM")
                            {

                                pgpanal.Visible = false; mphilpanal.Visible = false;
                                UGC_CSIR_panal.Visible = false; bedrPanel.Visible = true;

                            }

                            else if (pname_str == "BPO" || pname_str == "BSLP")
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                bpoPanel.Visible = true;

                            }
                            else if (pname_str == "BTEC")
                            {
                                graduationpanal.Visible = false; pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                btechPanel.Visible = true;

                            }
                            else if (pname_str == "BTECL")
                            {
                                pgpanal.Visible = false;
                                mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                btechPanel.Visible = true;
                            }
                            else if (pname_str == "MTEC")
                            {
                                pgpanal.Visible = false;
                                UGC_CSIR_panal.Visible = false;
                                mphilpanal.Visible = false;

                            }

                            else if (pname_str == "LLM")
                            {
                                UGC_CSIR_panal.Visible = false;
                                mphilpanal.Visible = false;
                            }

                            else if (ph_values[0].ToString() == "Master" || ph_values[0].ToString() == "M.Sc." || pname_str== "MCA" || ph_values[0].ToString() == "M.Com." || pname_str == "MBA" || ph_values[0].ToString() == "M.A.")
                            {
                                pgpanal.Visible = false;
                                UGC_CSIR_panal.Visible = false;
                                mphilpanal.Visible = false;
//update graduation required validator 10 may 2019
                                RequiredFieldValidator_Graduation.Visible = true;


                            }
                            else if (ph_values[0].ToString() == "Ph.D.")
                            {
                                phdPanel.Visible = true;
                            }
                        }
                        else
                        {
                            Alert.Show("Check Login Details");
                            Response.AppendHeader("Refresh", "1;url=Account/Logout.aspx");
                        }
                    }
                }
                catch(Exception ex)
                {
                    Alert.Show("Check Login Details Exception Raised");
                    Response.AppendHeader("Refresh", "1;url=Account/Logout.aspx");
                }
                finally
                {
                    if (dr != null)
                    {
                        dr.Close();
                        dr.Dispose();
                    }
                    constr.Close();
                }
            }
        }
    }
    private void SetDefaultView()
    {
        using (constr = new SqlConnection(connection_string))
        {
            int flag = 0;
            constr.Open();
            try
            {
                Query = "select flag from registration where regno=@regno";
                using (SqlCommand cmd_flag = new SqlCommand(Query, constr))
                {
                    cmd_flag.Parameters.AddWithValue("@regno", Session["regno"].ToString());

                    dr = cmd_flag.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            flag = Convert.ToInt32(dr[0].ToString());
                        }
                        //Alert.Show("Value"+flag.ToString()+"Session"+ Session["regno"].ToString());
                        //yet to fix
                        if (flag.ToString() != null || flag.ToString() != "")
                        {
                            MultiView1.ActiveViewIndex = flag;

                        }
                        else if (flag.ToString() == "7")
                        {
                            Response.Redirect("~/Dashboard.aspx");
                            //Server.Transfer("~/Dashboard.aspx");
                        }
                        else
                        {
                            MultiView1.ActiveViewIndex = 0;
                        }


                    }
                }
            }
            catch { }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr.Dispose();
                }
                constr.Close();
            }
        }
        //MultiView1.ActiveViewIndex = 7;
    }
    protected void personl_detail_btnSubmit_Click(object sender, EventArgs e)
    {

if(ccode.Text=="OBC" && state.SelectedItem.Value.ToString() != "Uttar Pradesh")
        {
            Alert.Show("OBC Category not allowed for State Other than Uttar Pradesh.");
        }
        else
        {
        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            
            using (transaction = constr.BeginTransaction())
            {
                try
                {
                    string dob = DdType.SelectedItem.Value.ToString() + "/" + DmType.SelectedItem.Value.ToString() + "/" + DyType.SelectedItem.Value.ToString();

        /*            if (label_state.Text != "Uttar Pradesh")
                    {
                        Label_Other_state.Text = ostate.SelectedItem.Value.ToString();
                    }
                    else
                    {
                        Label_Other_state.Text = "Uttar Pradesh";
                    }

                    if(DropDownList_Nationality.SelectedItem.Text != "Indian")
                    {
                        Label_nationality.Text = nationality.Text.Trim();
                    }
                    else
                    {
                        Label_nationality.Text = "Indian";
                    }

                    if(religion.SelectedItem.Text != "Other Religion")
                    {
                        Label_religion.Text = religion.SelectedItem.Value.ToString();
                    }
                    else
                    {
                        Label_religion.Text=tb_religion.Text.Trim();
                    }

                    */

                    if(disability.SelectedItem.Text == "Other Disability")
                    {
                        Label_Disability.Text = tb_disability.Text;
                    }
                    else
                    {
                        Label_Disability.Text = disability.SelectedItem.Text;
                    }

                    //Query = "update registration set name=@candidatename,fname= @fname,husband=@husband,mname=@mname,adharno=@adharno,gender=@gender,nationality=@nationality,state=@state,religion=@religion,minority=@minority,dob=@dob,maritial=@maritial,category=@category,ccode=@ccode,dsmruemp=@dsmruemp,dsmruwardemp=@dsmruwardemp,disability=@disability,disabilitycode=@disabilitycode,dffighter=@dffighter,ncc=@ncc,sportsplayer=@sportsplayer,nss=@nss,debard=@debard,flag=@flag where regno=@regno";
                   // Query = "update registration set name=@candidatename,fname= @fname,mname=@mname,gender=@gender,nationality=@nationality,state=@state,religion=@religion,minority=@minority,dob=@dob,maritial=@maritial,category=@category,ccode=@ccode,dsmruemp=@dsmruemp,dsmruwardemp=@dsmruwardemp,disability=@disability,disabilitycode=@disabilitycode,dffighter=@dffighter,ncc=@ncc,sportsplayer=@sportsplayer,nss=@nss,flag=@flag where regno=@regno";
                        Query = "update registration set name=@candidatename,fname= @fname,mname=@mname,nominee= @nominee,policestn=@policestn,railwaystn=@railwaystr,aadharno=@aadharno,blood=@blood,Domocile=@Domocile,gender=@gender,nationality=@nationality,state=@state,religion=@religion,minority=@minority,dob=@dob,maritial=@maritial,category=@category,ccode=@ccode,dsmruemp=@dsmruemp,dsmruwardemp=@dsmruwardemp,disability=@disability,disabilitycode=@disabilitycode,dffighter=@dffighter,ncc=@ncc,sportsplayer=@sportsplayer,nss=@nss,flag=@flag where regno=@regno";

                        // Alert.Show("Update query: "+Query);
                        //using (cmd = new SqlCommand("update registration set fname='" + father.Text + "',mname='" + mother.Text + "',gender='" + gender.SelectedItem.Value.ToString() + "',nationality='" + nationality.Text + "',state='" + Label_Other_state.Text + "',religion='" + religion.Text + "',minority='" + minority.SelectedItem.Value.ToString() + "',dob='" + dob + "',maritial='" + mstatus.SelectedItem.Value.ToString() + "',category='" + category.SelectedItem.Value.ToString() + "',ccode='" + ccode.Text + "',dsmruemp='" + demployee.SelectedItem.Value.ToString() + "',dsmruwardemp='" + deward.SelectedItem.Value.ToString() + "',disability='" + disability.SelectedItem.Text + "',disabilitycode='" + dcode.Text + "',dffighter='" + ffighter.SelectedItem.Value.ToString() + "',ncc='" + ncc.SelectedItem.Value.ToString() + "',sportsplayer='" + sports.SelectedItem.Value.ToString() + "',nss='" + nss.SelectedItem.Value.ToString() + "',debard='" + legal.SelectedItem.Value.ToString() + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
                        using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        cmd.Parameters.AddWithValue("@candidatename", applicant.Text.Trim().ToUpper());
                        cmd.Parameters.AddWithValue("@fname", father.Text.Trim().ToUpper());
                        cmd.Parameters.AddWithValue("@mname", mother.Text.Trim().ToUpper());
                            //cmd.Parameters.AddWithValue("@husband", husband.Text.Trim());

                            cmd.Parameters.AddWithValue("@nominee", nominee.Text.Trim().ToUpper());
                          cmd.Parameters.AddWithValue("@policestn", police.Text.Trim().ToUpper());
                          cmd.Parameters.AddWithValue("@railwaystr", railway.Text.Trim().ToUpper());
                            cmd.Parameters.AddWithValue("@aadharno", aadharno.Text.Trim());
                            //cmd.Parameters.AddWithValue("@bloodgrp", blood.SelectedItem.Value.ToString());

                            cmd.Parameters.AddWithValue("@Domocile", Domocile.SelectedItem.Value.ToString());

                            //cmd.Parameters.AddWithValue("@adharno", AdharNo.Text.Trim());
                            cmd.Parameters.AddWithValue("@blood", blood.SelectedItem.Value.ToString());
                            cmd.Parameters.AddWithValue("@gender", gender.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@nationality", DropDownList_Nationality.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@state", state.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@religion", religion.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@minority", minority.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@maritial", mstatus.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@category", category.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@ccode", ccode.Text.Trim());
                        cmd.Parameters.AddWithValue("@dsmruemp", txtempname.Text.Trim());
                        cmd.Parameters.AddWithValue("@dsmruwardemp", Demployeew.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@disability", Label_Disability.Text);
                        cmd.Parameters.AddWithValue("@disabilitycode", dcode.Text.Trim());
                        cmd.Parameters.AddWithValue("@dffighter", ffighter.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@ncc", ncc.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@sportsplayer", sports.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@nss", nss.SelectedItem.Value.ToString());
                        //cmd.Parameters.AddWithValue("@debard", legal.SelectedItem.Value.ToString());
                        
                        cmd.Parameters.AddWithValue("@flag", "2");

                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();

                        if (j == 1)
                        {
                            Alert.Show("Personal Details Saved Successfully...!");
                            MultiView1.ActiveViewIndex = 2;
                        }
                        else
                        {
                            Alert.Show("Personal Details Saved Failed");

                        }
                    }
            }
                    catch(Exception ex)
            {
                try
                {
                    transaction.Rollback();
                }
                catch
                {
                    Alert.Show("Exception Caused Transaction Rollback");
                }
               Alert.Show("Personal Details Saving Raised Exception");

            }
            finally { constr.Close(); }

        }
}

        }
        }
    protected void mailing_address_Click(object sender, EventArgs e)
    {

        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            using (transaction = constr.BeginTransaction())
            {
                try
                {

                    //string phone = TextBox9.Text +" "+ TextBox5.Text;
                    string address = paddress.Text.ToUpper() + "," + paddress0.Text.ToUpper() + "," + paddress1.Text.ToUpper();
                    string address_1 = maddress.Text.ToUpper() + "," + maddress0.Text.ToUpper() + "," + maddress1.Text.ToUpper();


                    //Query = "update registration set padress=@padress,madress=@madress,pstation=@pstation,rstation=@rstation,telephone=@telephone,mobileno=@mobileno,emailad=@emailad,flag=@flag where regno=@regno";
                    Query = "update registration set madress=@madress,padress=@padress,mobileno=@mobileno,emailad=@emailad,flag=@flag where regno=@regno";
                    //using (cmd = new SqlCommand("update registration set padress='" + paddress.Text + "',madress='" + maddress.Text + "',pstation='" + pstation.Text + "',rstation='" + rstation.Text + "',telephone='" + phone + "',mobileno='" + mobileno.Text + "',emailad='" + email_txt.Text + "',adharno='" + AdharNo.Text + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {

                        cmd.Parameters.AddWithValue("@padress", address);
                        cmd.Parameters.AddWithValue("@madress", address_1);
                        //cmd.Parameters.AddWithValue("@pstation", pstation.Text.Trim());
                        //cmd.Parameters.AddWithValue("@rstation", rstation.Text.Trim());
                        //cmd.Parameters.AddWithValue("@telephone", phone);
                        cmd.Parameters.AddWithValue("@mobileno", mobileno.Text.Trim());
                        cmd.Parameters.AddWithValue("@emailad", email_txt.Text.Trim());
            //            cmd.Parameters.AddWithValue("@adharno", AdharNo.Text.Trim());

                        cmd.Parameters.AddWithValue("@flag", "3");
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

                        
                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();
                        if (j == 1)
                        {
                            Alert.Show("Mailing Details saved successfully...!");
                            MultiView1.ActiveViewIndex = 3;

                        }
                        else
                        {
                            Alert.Show("Mailing details saving failed");

                        }
                    }


                }
                catch
                {
                    try
                    {
                        transaction.Rollback();
                    }
                    catch
                    {
                        Alert.Show("Exception Caused Transaction Rollback");
                    }
                    Alert.Show("Mailing details saving failed & raised exception");

                }

                finally { constr.Close(); }

            }
        }
    }
    protected void Education_Button_Click(object sender, EventArgs e)
    {

        //string user_name = Session["uname"].ToString();
        string user_name = username.Text.Trim();

        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            using (transaction = constr.BeginTransaction())
            {
                
                try
                {

                    //string phone = TextBox9.Text + TextBox5.Text;
                    string ba1c = ba1c_1.SelectedItem.Value.ToString() + "," + ba1c_2.SelectedItem.Value.ToString() + "," + ba1c_3.SelectedItem.Value.ToString();
                    string ba2c = ba2c_1.SelectedItem.Value.ToString() + "," + ba2c_2.SelectedItem.Value.ToString() + "," + ba2c_3.SelectedItem.Value.ToString();
                    string ba3c = ba3c_1.SelectedItem.Value.ToString() + "," + ba3c_2.SelectedItem.Value.ToString() + "," + ba3c_3.SelectedItem.Value.ToString();
                    //bahind
                    string bahind1c = bahind1c_1.SelectedItem.Value.ToString() + "," + bahind1c_2.SelectedItem.Value.ToString() + "," + bahind1c_3.SelectedItem.Value.ToString();
                    string bahind2c = bahind2c_1.SelectedItem.Value.ToString() + "," + bahind2c_2.SelectedItem.Value.ToString() + "," + bahind2c_3.SelectedItem.Value.ToString();
                    string bahind3c = bahind3c_1.SelectedItem.Value.ToString() + "," + bahind3c_2.SelectedItem.Value.ToString() + "," + bahind3c_3.SelectedItem.Value.ToString();


                    // string bsc1c = bsc1c_1.SelectedItem.Value.ToString() + "," + bsc1c_2.SelectedItem.Value.ToString() + "," + bsc1c_3.SelectedItem.Value.ToString();
                    string bsc1c = bsc1c_1.SelectedItem.Value.ToString();
                    //string bsc2c = bsc2c_1.SelectedItem.Value.ToString() + "," + bsc2c_2.SelectedItem.Value.ToString() + "," + bsc2c_3.SelectedItem.Value.ToString();

                    //string ded = ded_1c.SelectedItem.Value.ToString() + "," + ded_2c.SelectedItem.Value.ToString() + "," + ded_3c.SelectedItem.Value.ToString();
                    string bed = bed_1c.SelectedItem.Value.ToString() + "," + bed_2c.SelectedItem.Value.ToString() + "," + bed_3c.SelectedItem.Value.ToString();
                    //string bed_odl = bed_odl_1c.SelectedItem.Value.ToString() + "," + bed_odl_2c.SelectedItem.Value.ToString() + "," + bed_odl_3c.SelectedItem.Value.ToString();
                    //string phd_inst = TextBox12.Text;
                    //string phd_sub = TextBox13.Text;
                    //string phd_duration_frm = TextBox14.Text;
                    //string phd_duration_to = TextBox15.Text;
                    //string phd_yr = TextBox16.Text;
                    string passedstatus = RadioButtonPassedStatus.SelectedValue.ToString();
                    string appearingstatus = Label_AppearedStatus.Text;

                    //Query = "update registration set flag=@flag,hboard=@hboard,hyear=@hyear, hmarksobt=@hmarksobt,hmaxmarks=@hmaxmarks,hdiv=@hdiv,hsub=@hsub,hreferenceno=@hreferenceno,iboard=@iboard, iyear=@iyear,imarksobt=@imarksobt,imaxmarks=@imaxmarks,idiv=@idiv,isub=@isub,ireference=@ireference,gtype=@gtype,guniversity=@guniversity,gyear=@gyear,gmarksobt=@gmarksobt,gmaxmarks=@gmaxmarks,gdiv=@gdiv,gsub=@gsub,greference=@greference,pgtype=@pgtype,pguniversity=@pguniversity,pgyear=@pgyear,pgmarksobt=@pgmarksobt,pgmaxmarks=@pgmaxmarks,pgdiv=@pgdiv,pgsub=@pgsub,pgreference=@pgreference,mphiluniversity=@mphiluniversity,mpyear=@mpyear,mpmarksobt=@mpmarksobt,mpmaxmarks=@mpmaxmarks,mpdiv=@mpdiv,mpsub=@mpsub,mpreference=@mpreference,ugctype=@ugctype,uuniversity=@uuniversity,uyear=@uyear,umarksobt=@umarksobt,umaxmarks=@umaxmarks,udiv=@udiv,usub=@usub,ureference=@ureference,temp6=@othercoursename_temp6,ouniversity=@ouniversity,oyear=@oyear,omarksobt=@omarksobt,omaxmarks=@omaxmarks,odiv=@odiv,osub=@osub,oreference=@oreference,ba1c=@ba1c,ba2c=@ba2c,ba3c=@ba3c,ded=@ded,bedspl=@bedspl,bedodl=@bedodl,baslp=@baslp,bpo=@bpo,btech1c=@btech1c,btech2c=@btech2c,btech3c=@btech3c,btech4c=@btech4c," + "btech5c=@btech5c,phdinst=@phdinst,phdsub=@phdsub,pdhfrom=@pdhfrom,phdto=@phdto,phdym=@phdym,empadd=@empadd,hper=@hper,iper=@iper,ugper=@ugper,pgper=@pgper,ugcper=@ugcper,mphilper=@mphilper,operper=@operper,passedstatus=@passedstatus,appearstatus=@appearstatus where regno=@regno";
                    Query = "update registration set flag=@flag,hboard=@hboard,hyear=@hyear, hmarksobt=@hmarksobt,hmaxmarks=@hmaxmarks,hdiv=@hdiv,hsub=@hsub,hreferenceno=@hreferenceno,iboard=@iboard, iyear=@iyear,imarksobt=@imarksobt,imaxmarks=@imaxmarks,idiv=@idiv,isub=@isub,ireference=@ireference,gtype=@gtype,guniversity=@guniversity,gyear=@gyear,gmarksobt=@gmarksobt,gmaxmarks=@gmaxmarks,gdiv=@gdiv,gsub=@gsub,greference=@greference,pgtype=@pgtype,pguniversity=@pguniversity,pgyear=@pgyear,pgmarksobt=@pgmarksobt,pgmaxmarks=@pgmaxmarks,pgdiv=@pgdiv,pgsub=@pgsub,pgreference=@pgreference,operper=@operper,temp6=@othercoursename_temp6,ouniversity=@ouniversity,oyear=@oyear,omarksobt=@omarksobt,omaxmarks=@omaxmarks,odiv=@odiv,osub=@osub,oreference=@oreference,hper=@hper,iper=@iper,ugper=@ugper,pgper=@pgper,ba1c=@ba1c,ba2c=@ba2c,ba3c=@ba3c,bahind1c=@bahind1c,bahind2c=@bahind2c,bahind3c=@bahind3c,bsc1c=@bsc1c,bedspl=@bedspl,baslp=@baslp,bpo=@bpo,passedstatus=@passedstatus,appearstatus=@appearstatus where regno=@regno";
                    //mphiluniversity=@mphiluniversity,mpyear=@mpyear,mpmarksobt=@mpmarksobt,mpmaxmarks=@mpmaxmarks,mpdiv=@mpdiv,mpsub=@mpsub,mpreference=@mpreference,ugctype=@ugctype,uuniversity=@uuniversity,uyear=@uyear,umarksobt=@umarksobt,umaxmarks=@umaxmarks,udiv=@udiv,usub=@usub,ureference=@ureference,ded =@ded,bedodl=@bedodl,,btech1c=@btech1c,btech2c=@btech2c,btech3c=@btech3c,btech4c=@btech4c," + "btech5c=@btech5c,phdinst=@phdinst,phdsub=@phdsub,pdhfrom=@pdhfrom,phdto=@phdto,phdym=@phdym,,ugcper=@ugcper,mphilper=@mphilper,
                    // using (cmd = new SqlCommand("update registration set hboard='" + TxtHSBoard.Text + "',hyear='" + TxtHSYear.Text + "',hmarksobt='" + TxtHSMarksObt.Text + "',hmaxmarks='" + TxtHSMaxMarks.Text + "',hdiv='" + TxtHSDiv.Text + "',hsub='" + TxtHSSubjects.Text + "',hreferenceno='" + TxtHS_reference_no.Text + "',iboard='" + TxtInterBoard.Text + "',iyear='" + TxtInterYear.Text + "',imarksobt='" + TxtInterMarksObt.Text + "',imaxmarks='" + TxtInterMaxMarks.Text + "',idiv='" + TxtInter_div.Text + "',isub='" + TxtInterSubjects.Text + "',ireference='" + Txtinter_reference_No.Text + "',gtype='" + Drop_graduation.SelectedItem.Value.ToString() + "',guniversity='" + TxtGradBoard_3.Text + "',gyear='" + TxtGradYear0.Text + "',gmarksobt='" + TxtGradMarksObt0.Text + "',gmaxmarks='" + TxtGradMaxMarks0.Text + "',gdiv='" + TxtGrad_div.Text + "',gsub='" + TxtGradSubjects0.Text + "',greference='" + Txt_grad_ref_no.Text + "',pgtype='" + Drop_pg.SelectedItem.Value.ToString() + "',pguniversity='" + Txt_pg_Board.Text + "',pgyear='" + Txt_pg_Year.Text + "',pgmarksobt='" + Txt_pg_MarksObt.Text + "',pgmaxmarks='" + Txt_pg_MaxMarks.Text + "',pgdiv='" + Txt_pg_div.Text + "',pgsub='" + Txt_pg_Subjects.Text + "',pgreference='" + Txt_pg_ref_no.Text + "',mphiluniversity='" + Txt_mphil_Board3.Text + "',mpyear='" + Txt_mphil_Yr3.Text + "',mpmarksobt='" + Txt_mphil_Marksobtained3.Text + "',mpmaxmarks='" + Txt_mphil_MaxMarks3.Text + "',mpdiv='" + Txt_mphil_div.Text + "',mpsub='" + Txt_mphil_Subjects3.Text + "',mpreference='" + Txt_mphil_ref_no.Text + "',ugctype='" + Drop_ugc.SelectedItem.Value.ToString() + "',uuniversity='" + Txt_ugc_Board1.Text + "',uyear='" + Txt_ugc_Year1.Text + "',umarksobt='" + Txt_ugc_MarksObt1.Text + "',umaxmarks='" + Txt_ugc_MaxMarks1.Text + "',udiv='" + Txt_ugc_div.Text + "',usub='" + Txt_ugc_Subjects1.Text + "',ureference='" + Txt_ugc_ref_no.Text + "',ouniversity='" + TxtOtherBoard2.Text + "',oyear='" + TxtOtherYr2.Text + "',omarksobt='" + TxtOtherMarksobtained2.Text + "',omaxmarks='" + TxtOtherMaxMarks2.Text + "',odiv='" + TxtOther_div.Text + "',osub='" + TxtOtherSubjects2.Text + "',oreference='" + Txt_other_ref_no.Text + "',ba1c='" + ba1c + "',ba2c='" + ba2c + "',ba3c='" + ba3c + "',ded='" + ded + "',bedspl='" + bed + "',bedodl='" + bed_odl + "',baslp='" + bpo_baslp_1c.SelectedItem.Value.ToString() + "',bpo='" + bpo_baslp_2c.SelectedItem.Value.ToString() + "',btech1c='" + btech_1c.Text + "',btech2c='" + btech_2c.Text + "',btech3c='" + btech_3c.Text + "',btech4c='" + btech_4c.Text + "',btech5c='" + btech_5c.Text + "',phdinst='" + phd_inst + "',phdsub='" + phd_sub + "',pdhfrom='" + phd_duration_frm + "',phdto='" + phd_duration_to + "',phdym='" + phd_yr + "',empadd='" + phd_emp_name_add.Text + "',hper='" + TxtHSPercent.Text + "',iper='" + TxtInterPercent.Text + "',ugper='" + TxtgradPercent.Text + "',pgper='" + TxtpgPercent.Text + "',	ugcper='" + TxtugcPercent.Text + "',mphilper='" + TxtmphilPercent.Text + "',operper='" + TxtotherPercent.Text + "',passedstatus='" + passedstatus + "',appearstatus='" + appearingstatus + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))

                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        cmd.Parameters.AddWithValue("@flag", "5");


                        cmd.Parameters.AddWithValue("@hboard", TxtHSBoard.Text.Trim());
                        cmd.Parameters.AddWithValue("@hyear", TxtHSYear.Text.Trim());
                        cmd.Parameters.AddWithValue("@hmarksobt", TxtHSMarksObt.Text.Trim());
                        cmd.Parameters.AddWithValue("@hmaxmarks", TxtHSMaxMarks.Text.Trim());
                        cmd.Parameters.AddWithValue("@hdiv", TxtHSDiv.Text.Trim());
                        cmd.Parameters.AddWithValue("@hsub", TxtHSSubjects.Text.Trim());
                        cmd.Parameters.AddWithValue("@hreferenceno", TxtHS_reference_no.Text.Trim());

                        cmd.Parameters.AddWithValue("@iboard", TxtInterBoard.Text.Trim());
                        cmd.Parameters.AddWithValue("@iyear", TxtInterYear.Text.Trim());
                        cmd.Parameters.AddWithValue("@imarksobt", TxtInterMarksObt.Text.Trim());
                        cmd.Parameters.AddWithValue("@imaxmarks", TxtInterMaxMarks.Text.Trim());
                        cmd.Parameters.AddWithValue("@idiv", TxtInter_div.Text.Trim());
                        cmd.Parameters.AddWithValue("@isub", TxtInterSubjects.Text.Trim());
                        cmd.Parameters.AddWithValue("@ireference", Txtinter_reference_No.Text.Trim());

                        cmd.Parameters.AddWithValue("@gtype", Drop_graduation.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@guniversity", TxtGradBoard_3.Text.Trim());
                        cmd.Parameters.AddWithValue("@gyear", TxtGradYear0.Text.Trim());
                        cmd.Parameters.AddWithValue("@gmarksobt", TxtGradMarksObt0.Text.Trim());
                        cmd.Parameters.AddWithValue("@gmaxmarks", TxtGradMaxMarks0.Text.Trim());
                        cmd.Parameters.AddWithValue("@gdiv", TxtGrad_div.Text.Trim());
                        cmd.Parameters.AddWithValue("@gsub", TxtGradSubjects0.Text.Trim());
                        cmd.Parameters.AddWithValue("@greference", Txt_grad_ref_no.Text.Trim());

                        cmd.Parameters.AddWithValue("@pgtype", Drop_pg.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@pguniversity", Txt_pg_Board.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgyear", Txt_pg_Year.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgmarksobt", Txt_pg_MarksObt.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgmaxmarks", Txt_pg_MaxMarks.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgdiv", Txt_pg_div.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgsub", Txt_pg_Subjects.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgreference", Txt_pg_ref_no.Text.Trim());


                        //cmd.Parameters.AddWithValue("@mphiluniversity", Txt_mphil_Board3.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mpyear", Txt_mphil_Yr3.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mpmarksobt", Txt_mphil_Marksobtained3.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mpmaxmarks", Txt_mphil_MaxMarks3.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mpdiv", Txt_mphil_div.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mpsub", Txt_mphil_Subjects3.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mpreference", Txt_mphil_ref_no.Text.Trim());
                        

                        //cmd.Parameters.AddWithValue("@ugctype", Drop_ugc.SelectedItem.Value.ToString());
                        //cmd.Parameters.AddWithValue("@uuniversity", Txt_ugc_Board1.Text.Trim());
                        //cmd.Parameters.AddWithValue("@uyear", Txt_ugc_Year1.Text.Trim());
                        //cmd.Parameters.AddWithValue("@umarksobt", Txt_ugc_MarksObt1.Text.Trim());
                        //cmd.Parameters.AddWithValue("@umaxmarks", Txt_ugc_MaxMarks1.Text.Trim());
                        //cmd.Parameters.AddWithValue("@udiv", Txt_ugc_div.Text.Trim());
                        //cmd.Parameters.AddWithValue("@usub", Txt_ugc_Subjects1.Text.Trim());
                        //cmd.Parameters.AddWithValue("@ureference", Txt_ugc_ref_no.Text.Trim());

                        cmd.Parameters.AddWithValue("@othercoursename_temp6", TxtOtherCourse2.Text.Trim());
                        cmd.Parameters.AddWithValue("@ouniversity", TxtOtherBoard2.Text.Trim());
                        cmd.Parameters.AddWithValue("@oyear", TxtOtherYr2.Text.Trim());
                        cmd.Parameters.AddWithValue("@omarksobt", TxtOtherMarksobtained2.Text.Trim());
                        cmd.Parameters.AddWithValue("@omaxmarks", TxtOtherMaxMarks2.Text.Trim());
                        cmd.Parameters.AddWithValue("@odiv", TxtOther_div.Text.Trim());
                        cmd.Parameters.AddWithValue("@osub", TxtOtherSubjects2.Text.Trim());
                        cmd.Parameters.AddWithValue("@oreference", Txt_other_ref_no.Text.Trim());
                        

                        cmd.Parameters.AddWithValue("@ba1c", ba1c);
                        cmd.Parameters.AddWithValue("@ba2c", ba2c);
                        cmd.Parameters.AddWithValue("@ba3c", ba3c);
                        cmd.Parameters.AddWithValue("@bsc1c", bsc1c);
                        // ba for hind college
                        cmd.Parameters.AddWithValue("@bahind1c", bahind1c);
                        cmd.Parameters.AddWithValue("@bahind2c", bahind2c);
                        cmd.Parameters.AddWithValue("@bahind3c", bahind3c);
                        

                        //cmd.Parameters.AddWithValue("@bsc2c", bsc2c);
                        //cmd.Parameters.AddWithValue("@ded", ded);
                        cmd.Parameters.AddWithValue("@bedspl", bed);
                        //cmd.Parameters.AddWithValue("@bedodl", bed_odl);
                        cmd.Parameters.AddWithValue("@baslp", bpo_baslp_1c.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@bpo", bpo_baslp_2c.SelectedItem.Value.ToString());



                        //cmd.Parameters.AddWithValue("@btech1c", btech_1c.Text.Trim());
                        //cmd.Parameters.AddWithValue("@btech2c", btech_2c.Text.Trim());
                        //cmd.Parameters.AddWithValue("@btech3c", btech_3c.Text.Trim());
                        //cmd.Parameters.AddWithValue("@btech4c", btech_4c.Text.Trim());
                        //cmd.Parameters.AddWithValue("@btech5c", btech_5c.Text.Trim());

                        //cmd.Parameters.AddWithValue("@phdinst", phd_inst);
                        //cmd.Parameters.AddWithValue("@phdsub", phd_sub);
                        //cmd.Parameters.AddWithValue("@pdhfrom", phd_duration_frm);
                        //cmd.Parameters.AddWithValue("@phdto", phd_duration_to);
                        //cmd.Parameters.AddWithValue("@phdym", phd_yr);
                        
                        //cmd.Parameters.AddWithValue("@empadd", phd_emp_name_add.Text.Trim());
                        cmd.Parameters.AddWithValue("@hper", TxtHSPercent.Text.Trim());
                        cmd.Parameters.AddWithValue("@iper", TxtInterPercent.Text.Trim());
                        cmd.Parameters.AddWithValue("@ugper", TxtgradPercent.Text.Trim());
                        cmd.Parameters.AddWithValue("@pgper", TxtpgPercent.Text.Trim());
                        //cmd.Parameters.AddWithValue("@ugcper", TxtugcPercent.Text.Trim());
                        //cmd.Parameters.AddWithValue("@mphilper", TxtmphilPercent.Text.Trim());
                        cmd.Parameters.AddWithValue("@operper", TxtotherPercent.Text.Trim());

                        cmd.Parameters.AddWithValue("@passedstatus", passedstatus);
                        cmd.Parameters.AddWithValue("@appearstatus", appearingstatus);

                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());
                        
                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();

                        if (j == 1)
                        {
                            Alert.Show("Academic Details saved successfully...!");
                            MultiView1.ActiveViewIndex = 5;

                        }
                        else
                        {
                            Alert.Show("Academic details saving failed...!");

                        }
                    }
                }
                catch
                {
                    try
                    {
                        transaction.Rollback();
                    }
                    catch
                    {
                        Alert.Show("Exception Caused Transaction Rollback");
                    }

                    Alert.Show("Academic details saving failed & raised exception");


                }

                finally { constr.Close(); }
                
            }
        }
    }
    protected void Facility_Button_Click(object sender, EventArgs e)
    {
    
        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            using (transaction = constr.BeginTransaction())
            {

                try
                {
                    Query = "update registration set scholarship=@scholarship,hostel=@hostel,travelbus=@travelbus,flag=@flag where regno=@regno";
                   
                    // using (cmd = new SqlCommand("update registration set scholarship='" + sholarship_radio.SelectedItem.Value.ToString() + "',hostel='" + hostel_radio.SelectedItem.Value.ToString() + "',travelbus='" + travel_bus_radio.SelectedItem.Value.ToString() + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {

                        cmd.Parameters.AddWithValue("@scholarship", sholarship_radio.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@hostel", hostel_radio.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@travelbus", travel_bus_radio.SelectedItem.Value.ToString());

                        cmd.Parameters.AddWithValue("@flag", "5");
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

                        j = cmd.ExecuteNonQuery();
                        //Label4.Text = "you are registered successfully...";
                        transaction.Commit();
                        if (j == 1)
                        {
                            Alert.Show("Facility Detail updated successfully");
                            
                            MultiView1.ActiveViewIndex = 5;
                        }
                        else
                        {
                            Alert.Show("Facility detail updation failed");
                        }
                    }

                }
                catch
                {

                    try
                    {
                        transaction.Rollback();
                    }
                    catch
                    {
                        Alert.Show("Exception Caused Transaction Rollback");
                    }
                    Alert.Show("Facility detail saving failed & raised exception");
                }
                finally { constr.Close(); }
            }
        }       
    }
    protected void Image_Upload_button_Click(object sender, EventArgs e)
    {
        string u_name = Label_regno.Text.Trim();

        if (FileUpload1.HasFile && FileUpload2.HasFile)
        {
            try
            {
                //if (FileUpload1.PostedFile.ContentType == "image/jpeg" && FileUpload2.PostedFile.ContentType == "image/jpeg" && FileUpload3.PostedFile.ContentType == "application/pdf" && FileUpload4.PostedFile.ContentType == "application/pdf" && FileUpload5.PostedFile.ContentType == "application/pdf" && FileUpload6.PostedFile.ContentType == "application/pdf" && FileUpload7.PostedFile.ContentType == "application/pdf" && FileUpload8.PostedFile.ContentType == "application/pdf")
                //{
                    if (FileUpload1.PostedFile.ContentLength < 102400 && FileUpload2.PostedFile.ContentLength < 102400 && FileUpload3.PostedFile.ContentLength < 307200 && FileUpload4.PostedFile.ContentLength < 307200 && FileUpload5.PostedFile.ContentLength < 307200 && FileUpload6.PostedFile.ContentLength < 307200 && FileUpload7.PostedFile.ContentLength < 307200 && FileUpload8.PostedFile.ContentLength < 307200 || FileUpload9.PostedFile.ContentLength < 307200 || FileUpload10.PostedFile.ContentLength < 307200)
                    {
                        string filename = FileUpload1.FileName;
                        string sign_filename = FileUpload2.FileName;
                        string x_filename = FileUpload3.FileName;
                        string xii_filename = FileUpload4.FileName;
                        string ug_filename = FileUpload5.FileName;
                        string other_filename = FileUpload6.FileName;
                        string category_filename = FileUpload7.FileName;
                        string disability_filename = FileUpload8.FileName;
                        string aioat19admit_filename = FileUpload9.FileName;
                        string aioat19score_filename = FileUpload10.FileName;

                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + filename);
                        FileUpload2.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + sign_filename);
                        FileUpload3.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + x_filename);
                        FileUpload4.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + xii_filename);
                        FileUpload5.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + ug_filename);
                        FileUpload6.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + other_filename);
                        FileUpload7.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + category_filename);
                        FileUpload8.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + disability_filename);
                        FileUpload9.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + aioat19admit_filename);
                        FileUpload10.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + aioat19score_filename);

                    string path_photo = "~/uploads/" + u_name + filename.ToString();
                        string path_sign = "~/uploads/" + u_name + sign_filename.ToString();
                        string path_x = "~/uploads/" + u_name + x_filename.ToString();
                        string path_xii = "~/uploads/" + u_name + xii_filename.ToString();
                        string path_ug = "~/uploads/" + u_name + ug_filename.ToString();
                        string path_other = "~/uploads/" + u_name + other_filename.ToString();
                        string path_category = "~/uploads/" + u_name + category_filename.ToString();
                        string path_disability = "~/uploads/" + u_name + disability_filename.ToString();
                        string aioat19admit = "~/uploads/" + u_name + aioat19admit_filename.ToString();
                        string aioat19score = "~/uploads/" + u_name + aioat19score_filename.ToString();

                    using (constr = new SqlConnection(connection_string))
                        {
                            constr.Open();
                            try
                            {
                                using (transaction = constr.BeginTransaction())
                                {
                                    //   Query = "update registration set photo_path=@photo_path,flag=@flag where regno=@regno";
                                    Query = "update registration set photo_path=@photo_path,sign_path=@sign_path,upload_10=@upload_10,upload_12=@upload_12,upload_grad=@upload_grad,upload_otherdegree=@upload_otherdegree,upload_caste=@upload_caste,upload_disability=@upload_disability,flag=@flag, aiotadmitcard=@aiotadmitcard, aiotscorecard=@aiotscorecard where regno=@regno";
                                    //using (cmd = new SqlCommand("update registration set photo_path='" + path_photo + "',sign_path='" + path_sign + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
                                    using (cmd = new SqlCommand(Query, constr, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@photo_path", path_photo);
                                        cmd.Parameters.AddWithValue("@sign_path", path_sign);
                                        cmd.Parameters.AddWithValue("@upload_10", path_x);
                                        cmd.Parameters.AddWithValue("@upload_12", path_xii);
                                        cmd.Parameters.AddWithValue("@upload_grad", path_ug);
                                        cmd.Parameters.AddWithValue("@upload_otherdegree", path_other);
                                        cmd.Parameters.AddWithValue("@upload_caste", path_category);
                                        cmd.Parameters.AddWithValue("@upload_disability", path_disability);
                                        cmd.Parameters.AddWithValue("@aiotadmitcard", aioat19admit);
                                        cmd.Parameters.AddWithValue("@aiotscorecard", aioat19score);

                                    cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

                                        cmd.Parameters.AddWithValue("@flag", "7");

                                        j = cmd.ExecuteNonQuery();

                                        if (j == 1)
                                        {
                                            Alert.Show("Upload status: File uploaded Successfully");
                                            gotonextbutton.Visible = true;
                                            Photo_img.Visible = true;
                                            Signature_img.Visible = true;
                                            //Panel_IMAGE.Visible = true;
                                            //Panel_doc.Visible = true;
                                            Image_Upload_button.Visible = false;
                                            RegularExpressionValidator273.Enabled = false;
                                            RegularExpressionValidator274.Enabled = false;
                                            RegularExpressionValidator8.Enabled = false;
                                            RegularExpressionValidator7.Enabled = false;
                                            RegularExpressionValidator6.Enabled = false;
                                            RegularExpressionValidator3.Enabled = false;
                                            RegularExpressionValidator2.Enabled = false;
                                            RegularExpressionValidator272.Enabled = false;
                                            RegularExpressionValidator275.Enabled = false;
                                            RegularExpressionValidator276.Enabled = false;
                                            RequiredFieldValidator40.Enabled = false;
                                            RequiredFieldValidator41.Enabled = false;

                                        transaction.Commit();
                                        }
                                        else
                                        {
                                            Alert.Show("Upload status: Failed");
                                        }
                                    }
                                }

                                //Query = "select photo_path from registration where regno=@regno";
                                Query = "select photo_path,sign_path,upload_10,upload_12,upload_grad,upload_otherdegree,upload_disability,upload_caste,aiotadmitcard,aiotscorecard from registration where regno=@regno";
                                //using (SqlCommand cmd1 = new SqlCommand("select photo_path,sign_path from registration where regno='" + Label_regno.Text.Trim() + "'", constr))

                                using (SqlCommand cmd1 = new SqlCommand(Query, constr))
                                {
                                    cmd1.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

                                    dr = cmd1.ExecuteReader();
                                    while (dr.Read())
                                    {
                                        Photo_img.ImageUrl = dr["photo_path"].ToString();
                                        Signature_img.ImageUrl = dr["sign_path"].ToString();
                                        // Upload Documents

                                        string x_doc = Path.GetExtension((dr["upload_10"].ToString()));
                                        if (x_doc == null || x_doc == "")
                                        {
                                            hyDoc_1.Visible = false;
                                        }
                                        else
                                        {
                                            hyDoc_1.Visible = true;
                                            hyDoc_1.NavigateUrl = (dr["upload_10"].ToString());
                                        }

                                        string xii_doc = Path.GetExtension((dr["upload_12"].ToString()));
                                        if (xii_doc == null || xii_doc == "")
                                        {
                                            hyDoc_2.Visible = false;
                                        }
                                        else
                                        {
                                        hyDoc_2.Visible = true;
                                        hyDoc_2.NavigateUrl = (dr["upload_12"].ToString());
                                        }
                                        string ug_doc = Path.GetExtension((dr["upload_grad"].ToString()));
                                        if (ug_doc == null || ug_doc == "")
                                        {
                                        hyDoc_3.Visible = false;
                                        }
                                        else
                                        {
                                        hyDoc_3.Visible = true;
                                        hyDoc_3.NavigateUrl = (dr["upload_grad"].ToString());
                                        }
                                        string other_doc = Path.GetExtension((dr["upload_otherdegree"].ToString()));
                                        if (other_doc == null || other_doc == "")
                                        {
                                        hyDoc_4.Visible = false;
                                        }
                                        else
                                        {
                                        hyDoc_4.Visible = true;
                                        hyDoc_4.NavigateUrl = (dr["upload_otherdegree"].ToString());
                                        }
                                        string caste_doc = Path.GetExtension((dr["upload_caste"].ToString()));
                                        if (caste_doc == null || caste_doc == "")
                                        {
                                        hyDoc_5.Visible = false;
                                        }
                                        else
                                        {
                                        hyDoc_5.Visible = true;
                                        hyDoc_5.NavigateUrl = (dr["upload_caste"].ToString());
                                        }
                                        string disability_doc = Path.GetExtension((dr["upload_disability"].ToString()));
                                        if (disability_doc == null || disability_doc == "")
                                        {
                                        hyDoc_6.Visible = false;
                                        }
                                        else
                                        {
                                        hyDoc_6.Visible = true;
                                        hyDoc_6.NavigateUrl = (dr["upload_disability"].ToString());
                                        }

                                    string aioat19Acard_doc = Path.GetExtension((dr["aiotadmitcard"].ToString()));
                                    if (aioat19Acard_doc == null || aioat19Acard_doc == "")
                                    {
                                        hyDoc_7.Visible = false;
                                    }
                                    else
                                    {
                                        hyDoc_7.Visible = true;
                                        hyDoc_7.NavigateUrl = (dr["aiotadmitcard"].ToString());
                                    }

                                    string aioat19Scard_doc = Path.GetExtension((dr["aiotscorecard"].ToString()));
                                    if (aioat19Scard_doc == null || aioat19Scard_doc == "")
                                    {
                                        hyDoc_8.Visible = false;
                                    }
                                    else
                                    {
                                        hyDoc_8.Visible = true;
                                        hyDoc_8.NavigateUrl = (dr["aiotscorecard"].ToString());
                                    }
                                }
                                    dr.Close();

                                }

                            }
                            catch (Exception ex)
                            {
                                try{ transaction.Rollback(); }
                                catch{Alert.Show("Exception Caused Transaction Rollback");}
                                Label97.Text = ex.ToString();
                            }
                            finally
                            {
                                if (constr != null)
                                {
                                    constr.Close();
                                }

                            }
                        }

                    }
                    else
                    {
                        Alert.Show("Upload status: The Image file has to be less than 80 KB and PDF 300 KB ");
                    }
            }
            catch
            {
            //        Alert.Show("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
                        Alert.Show("Upload status: The file could not be uploaded.");

            }
            finally
            {
                //constr.Close();
            }
        }
        else
        {
            Alert.Show("No file selected");
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 6;
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void category_SelectedIndexChanged(object sender, EventArgs e)
    {
        ccode.Text = category.SelectedItem.Value.ToString();
        category.Focus();
    }
    protected void disability_SelectedIndexChanged(object sender, EventArgs e)
    {
        dcode.Text = disability.SelectedItem.Value.ToString();
        if(disability.SelectedItem.Text== "Other Disability")
        {
            tb_disability.Visible = true;
        }
        disability.Focus();
    }
    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (state.SelectedItem.Value.ToString() == "Uttar Pradesh" || state.SelectedItem.Value.ToString() == "---Select State---")
        {
            //ostate.Enabled = false;
            //ostate.SelectedItem.Text = "---Select Other State---";
            //label_state.Text = "Uttar Pradesh";
            //RequiredFieldValidator31.Enabled = false;
            ccode.Enabled = true;
            category.Enabled = true;
        }
        else
        {
            //ostate.Enabled = true;
            //RequiredFieldValidator31.Enabled = true;
            //label_state.Text = ostate.SelectedItem.Value.ToString();
            category.SelectedItem.Text = "GEN";
            ccode.Text = "GEN";
            ccode.Enabled = false;
            category.Enabled = false;
        }
        state.Focus();
    }




    protected void gotonextbutton_Click(object sender, EventArgs e)
    {
        //Alert.Show(TB_PaymentAmount.Text);

        //   MultiView1.ActiveViewIndex = 6;
        MultiView1.ActiveViewIndex = 7;
    }
    protected void accept_submit_button_Click(object sender, EventArgs e)
    {

        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            using (transaction = constr.BeginTransaction())
            {

                try
                {
                    //Query = "update registration set fee_amount=@fee_amount,flag=@flag where uname=@uname and regno=@regno";
                    Query = "update registration set fscheck=@fscheck, flag=@flag where uname=@uname and regno=@regno";

                    //Alert.Show(Label_fee_amount.Text);
                    //using (cmd = new SqlCommand("update registration set fee_amount='" + Label_fee_amount.Text + "' where uname='" + username.Text.Trim() + "' and regno='" + Label_regno.Text.Trim() + "'", constr, transaction))

                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        //cmd.Parameters.AddWithValue("@fee_amount", Label_fee_amount.Text.Trim());
                        cmd.Parameters.AddWithValue("@uname", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());
                        cmd.Parameters.AddWithValue("@flag", "7");
                        cmd.Parameters.AddWithValue("@fscheck", "yes"); 
                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();
                        if (j == 1)
                        {
                            Response.Redirect("~/PreviewForm.aspx");
                        /*    //Response.Redirect("payment.aspx");
                            if (pcode.Text == "BTEC" || pcode.Text == "BTECL" || pcode.Text == "MTEC")
                            {
                               // Response.Redirect("~/DownloadForm.aspx");
                                Response.Redirect("~/PreviewForm.aspx");
                                // Server.Transfer("DownloadForm.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/payment.aspx");
                               // Server.Transfer("payment.aspx");
                            }*/
                        }
                        else
                        {
                            Alert.Show("Update status: Failed!");
                        }
                    }
                }
                catch
                {
                    try
                    {
                        transaction.Rollback();
                    }
                    catch
                    {
                        Alert.Show("Exception Caused Transaction Rollback");
                    }
                    Alert.Show("Update status: Failed : Exception Caused!");
                }
                finally { constr.Close(); }
            }
        }

    }
    
    protected void RadioButtonPassedStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonPassedStatus.SelectedItem.Value.ToString() == "Yes")
        {
            Label_AppearedStatus.Text = "No";
            //RadioButtonAppearedStatus.SelectedIndex=RadioButtonAppearedStatus.Items.


        }
        else if (RadioButtonPassedStatus.SelectedItem.Value.ToString() == "No")
        {
            Label_AppearedStatus.Text = "Yes";
        }
        RadioButtonPassedStatus.Focus();
    }

    public void payment()
    {
        string strcategorycode = null, strdisabilitycode = null;   
        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            // set fee start
            try
            {
                Query = "select temp3,disabilitycode,ccode from registration where regno=@regno";
                //using (SqlCommand cmd_fee = new SqlCommand("select temp3 from registration where uname='" + username.Text.Trim() + "' and regno='" + Label_regno.Text.Trim() + "'", constr))
                using (SqlCommand cmd_fee = new SqlCommand(Query, constr))
                {
                    //cmd_fee.Parameters.AddWithValue("@uname", username.Text.Trim());
                    //cmd_fee.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());
                    cmd_fee.Parameters.AddWithValue("@regno", Session["regno"].ToString());
                    dr = cmd_fee.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            feeamount = Convert.ToInt32(dr[0].ToString());
                            TB_PaymentAmount.Text = feeamount.ToString();
                            strdisabilitycode = dr[1].ToString();
                            strcategorycode = dr[2].ToString();
                        }
                    }

                    if (strdisabilitycode != "Not Any" || strcategorycode == "SC" || strcategorycode == "ST")
                    {
                        final_amount = feeamount / 2;
                        TB_PaymentAmount.Text = final_amount.ToString();
                        //Label_fee_amount.Text = final_amount.ToString();
                        Label_Fee_Check.Text = final_amount.ToString();
                        ////Alert.Show(final_amount.ToString());
                    }
                    else
                    {
                        final_amount = feeamount;
                        TB_PaymentAmount.Text = final_amount.ToString();
                        Label_fee_amount.Text = final_amount.ToString();
                        //Label_Fee_Check.Text = final_amount.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Label_Fee_Check.Text = ex.ToString();
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr.Dispose();
                }
                constr.Close();
            }
        }
    }
    protected void Button_Payment_Btech_Click(object sender, EventArgs e)
    {
        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            using (transaction = constr.BeginTransaction())
            {
                try
                {
                    Query = "update registration set temp7=@newpaymentmode,ddno=@ddno, bankname=@bankname, paymentamount=@paymentamount, dddate=@dddate,flag=@flag where uname=@uname and regno=@regno";
                    //Alert.Show(Label_fee_amount.Text);
                    //using (cmd = new SqlCommand("update registration set fee_amount='" + Label_fee_amount.Text + "' where uname='" + username.Text.Trim() + "' and regno='" + Label_regno.Text.Trim() + "'", constr, transaction))

                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        cmd.Parameters.AddWithValue("@newpaymentmode", RadioButtonList_PaymentMode.Text);
                        cmd.Parameters.AddWithValue("@paymentamount", TB_PaymentAmount.Text.Trim());

                        cmd.Parameters.AddWithValue("@ddno", TB_DD_No.Text.Trim());
                        cmd.Parameters.AddWithValue("@bankname", TB_BankName.Text.Trim());

                        string dddate = TB_DD_Date.Text.Trim();//DateTime.ParseExact(TB_DD_Date.Text.Trim(), "dd/MM/yyyy", null);
                        cmd.Parameters.AddWithValue("@dddate", dddate);
                       // cmd.Parameters.AddWithValue("@dddate", TB_DD_Date.Text.Trim());
                        cmd.Parameters.AddWithValue("@uname", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());
                        cmd.Parameters.AddWithValue("@flag", "6");

                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();
                        if (j == 1)
                        {
                            //Response.Redirect("payment.aspx");
                            if (pcode.Text == "BTEC" || pcode.Text == "BTECL" )
                            {
                             //   TB_PaymentAmount.Text = Label_fee_amount.Text;
                                MultiView1.ActiveViewIndex = 7;
                            }
                            else
                            {
                                Response.Redirect("~/payment.aspx");
                              //  Server.Transfer("payment.aspx");
                            }
                        }
                        else
                        {
                            Alert.Show("Update status: Failed!");
                        }
                    }
                }
                catch (Exception ex)
                {
                    try
                    {
                        transaction.Rollback();
                    }
                    catch
                    {
                        Alert.Show("Exception Caused Transaction Rollback");
                    }
                    Alert.Show("Update status: Failed : Exception Caused!");
                    Label98.Text = ex.ToString();
                }
                finally { constr.Close(); }
            }
        }

    }

    protected void DropDownList_Nationality_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (DropDownList_Nationality.SelectedItem.Value.ToString() != "Indian")
        {
            //nationality.Visible = true;
            //Label_nationality.Text = nationality.Text.Trim();
            state.Enabled = false;
            state.SelectedValue = "Other";
            category.Enabled = false;
            category.SelectedValue = "GEN";
            ccode.Text = "GEN";
            disability.SelectedValue = "Not Any";
			dcode.Text="Not Any";
            disability.Enabled = false;
            //  nationality.Text = null;
        }
        else if (DropDownList_Nationality.SelectedItem.Value.ToString() == "Indian")
        {
            //nationality.Visible = false;
            //Label_nationality.Text = "Indian";
            state.SelectedValue = "---Select State---";
            state.Enabled = true;
            disability.Enabled = true;
            category.Enabled = true;
        }
        DropDownList_Nationality.Focus();
    }

    protected void CheckBox_declaration_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox_declaration.Checked == true)
        {
            accept_submit_button.Visible = true;
        }
        else
        {
            accept_submit_button.Visible = false;
        }
    }

    protected void Demployeew_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Demployeew.SelectedValue.ToString() == "Yes")
        {
            Label31.Visible = true;
            txtempname.Visible = true;
            txtempname.Text = "";
            RequiredFieldValidator34.Enabled = true;
        }
        else if (Demployeew.SelectedValue.ToString() == "No")
        {
            Label31.Visible = false;
            txtempname.Visible = false;
            txtempname.Text = "NA";
            RequiredFieldValidator34.Enabled = false;
        }
        Demployeew.Focus();
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            maddress.Text = paddress.Text;
            maddress0.Text = paddress0.Text;
            maddress1.Text = paddress1.Text;
        }
    }

}