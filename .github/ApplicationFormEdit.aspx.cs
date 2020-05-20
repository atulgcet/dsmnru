using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ApplicationFormEdit : System.Web.UI.Page
{
    public string connection_string = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public SqlConnection constr;
    // = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    SqlTransaction transaction = null;
    public SqlCommand cmd;
    public SqlDataReader dr;
    public int j;
    String Query = null;

    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
     //   LoadData();
        if (!IsPostBack)
        {
            // SetDefaultView();
             LoadData();
            //  Alert.Show(Session["regno"].ToString() + Session["uname"].ToString());
            //payment_course();


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

                        Query = "select pname,pcode,uname,regno from registration where uname=@uname and regno=@regno";

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
                                    Panel_Intermediate.Visible = false;
                                    graduationpanal.Visible = false; pgpanal.Visible = false;
                                    mphilpanal.Visible = false; UGC_CSIR_panal.Visible = false;
                                    RequiredField_inter_sr.Visible = false;
                                }
                                else if (pname_str == "DEDH" || pname_str == "DEDV" || pname_str == "DEDM")
                                {
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
                                else if (pname_str == "BA")
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

                                else if (pname_str == "BEDH" || pname_str == "BEDV" || pname_str == "BEDM")
                                {
                                    
                                    pgpanal.Visible = false; mphilpanal.Visible = false;
                                    UGC_CSIR_panal.Visible = false; bedrPanel.Visible = false;

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


                                else if (ph_values[0].ToString() == "Master" || ph_values[0].ToString() == "M.Sc." || ph_values[0].ToString() == "MCA" || ph_values[0].ToString() == "M.Com." || ph_values[0].ToString() == "MBA" || ph_values[0].ToString() == "MA")
                                {
                                    pgpanal.Visible = false;
                                    UGC_CSIR_panal.Visible = false;
                                    mphilpanal.Visible = false;
                                }
                                else if (ph_values[0].ToString() == "Ph.D.")
                                {
                                    phdPanel.Visible = true;
                                }
                            }
                            else
                            {
                                Alert.Show("Check Login Details");
                                Response.AppendHeader("Refresh", "1;url=Logout.aspx");
                            }
                        }
                    }
                    catch
                    {
                        Alert.Show("Check Login Details Exception Raised");
                        Response.AppendHeader("Refresh", "1;url=Logout.aspx");
                    }
                    finally
                    {
                        if (dr != null || constr!=null)
                        {
                            dr.Close();
                            dr.Dispose();
                            
                        }
                        constr.Close();
                    }
                }
            }
        }


    }
    public void LoadData()
    {
        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            try
            {
                Query = "select * from registration where regno='"+ Session["regno"].ToString()+ "'";
                using (SqlDataAdapter da = new SqlDataAdapter(Query, constr))
                {
                    //  cmd_flag.Parameters.AddWithValue("@regno", Session["regno"].ToString());

                    DataSet ds = new DataSet();
                    da.Fill(ds, "registration");
                    int numrows1;
                    DataTable mytable1;
                    mytable1 = ds.Tables[0];
                    numrows1 = mytable1.Rows.Count;


                    if (numrows1 > 0)
                    {
                        DataRow[] dr1 = ds.Tables["registration"].Select();

                        pname.Text = (dr1[0]["pname"].ToString());
                        pcode.Text = (dr1[0]["pcode"].ToString());
                        username.Text = (dr1[0]["uname"].ToString());
                        Label_regno.Text= (dr1[0]["regno"].ToString());

                        applicant.Text = (dr1[0]["name"].ToString());
                        father.Text = (dr1[0]["fname"].ToString());
						//husband.Text = (dr1[0]["husband"].ToString());
                        mother.Text = (dr1[0]["mname"].ToString());
                        nominee.Text = (dr1[0]["nominee"].ToString());
                        railway.Text = (dr1[0]["railwaystn"].ToString());
                        police.Text = (dr1[0]["policestn"].ToString());
                        aadharno.Text = (dr1[0]["aadharno"].ToString());
                        blood.SelectedValue = (dr1[0]["blood"].ToString());
                      Domocile.SelectedValue = (dr1[0]["DOMOCILE"].ToString());
                        gender.SelectedValue= (dr1[0]["gender"].ToString());

                        
                       // nationality.Text = (dr1[0]["nationality"].ToString());
                        string nationalityvalue = (dr1[0]["nationality"].ToString());
                        if (nationalityvalue != "Indian")
                        {
                            //nationality.Text = nationalityvalue;
                            //DropDownList_Nationality.SelectedItem.Text = "Others";
                            DropDownList_Nationality.SelectedValue= nationalityvalue;
                            //nationality.Visible = true;
                            state.Enabled = false;
                            RequiredFieldValidator13.Visible = false;
                        }
                        else
                        {
                            DropDownList_Nationality.SelectedValue = nationalityvalue;
                            state.Enabled = true;
                            disability.Enabled = true;
                            category.Enabled = true;
                            RequiredFieldValidator13.Visible = true;
                        }


                        string statedbvalue= (dr1[0]["state"].ToString());
                        //Alert.Show(statedbvalue);
                        if(statedbvalue == "Uttar Pradesh")
                        {
                            state.SelectedValue= "Uttar Pradesh";
                        }
                        else
                        {
                            state.SelectedValue= statedbvalue;
                            //ostate.SelectedValue = statedbvalue;
                            //ostate.Enabled = true;
                            category.Enabled = false;
                        }

                        religion.SelectedValue = dr1[0]["religion"].ToString();
                        minority.SelectedValue = (dr1[0]["minority"].ToString());

                        //Date of birth
                        string dob_choice = (dr1[0]["dob"].ToString());
                        string[] dob_values = dob_choice.Split('/');

                        DdType.SelectedItem.Text = dob_values[0];
                        DmType.SelectedItem.Text = dob_values[1];
                        DyType.SelectedItem.Text = dob_values[2];

                        mstatus.SelectedValue = (dr1[0]["maritial"].ToString());
                        category.SelectedValue = (dr1[0]["category"].ToString());

                        ccode.Text = (dr1[0]["ccode"].ToString());
                        txtempname.Text= (dr1[0]["dsmruemp"].ToString());
                        Demployeew.SelectedValue = (dr1[0]["dsmruwardemp"].ToString());

                        
                        string disabilitycodevalue= (dr1[0]["disabilitycode"].ToString()); 
                        string disabilityvalue= dr1[0]["disability"].ToString();
                        if (disabilitycodevalue == "OD")
                        {
                            disability.SelectedValue= "OD";
                            tb_disability.Visible = true;
                            tb_disability.Text = disabilityvalue;
                        }
                        else
                        {
                            //disability.SelectedItem.Value= disabilityvalue;
                          //  disability.SelectedItem.Text = disabilityvalue;
                            disability.SelectedValue = disabilitycodevalue;
                            tb_disability.Visible = false;

                        }
                        
                        dcode.Text = (dr1[0]["disabilitycode"].ToString());
                        ffighter.SelectedValue = (dr1[0]["dffighter"].ToString());
                        ncc.SelectedValue = (dr1[0]["ncc"].ToString());
                        sports.SelectedValue = (dr1[0]["sportsplayer"].ToString());
                        nss.SelectedValue = (dr1[0]["nss"].ToString());
                        //legal.SelectedValue = (dr1[0]["debard"].ToString());

                        //Mailing details
                        string p_address = (dr1[0]["padress"].ToString());
                        string[] p_address_value = p_address.Split(',');

                        paddress.Text = p_address_value[0];
                        paddress0.Text = p_address_value[1];
                        paddress1.Text = p_address_value[2];

                        string m_address = (dr1[0]["madress"].ToString());
                        string[] m_address_value = p_address.Split(',');

                        maddress.Text = m_address_value[0];
                        maddress0.Text = m_address_value[1];
                        maddress1.Text = m_address_value[2];

                        //string telephone_choice = (dr1[0]["telephone"].ToString());
                        //string[] telephone_values = telephone_choice.Split(' ');
                        //TextBox9.Text = telephone_values[0];
                        //TextBox5.Text = telephone_values[1];  //phone no yet to fix

                        mobileno.Text = (dr1[0]["mobileno"].ToString());
                        email_txt.Text = (dr1[0]["emailad"].ToString());
                        //     Alert.Show(dr1[0]["adharno"].ToString());

                        //AdharNo.Text = (dr1[0]["adharno"].ToString());

                        //Examination
                        TxtHSBoard.Text = (dr1[0]["hboard"].ToString());
                        TxtHSYear.Text = (dr1[0]["hyear"].ToString());
                        TxtHSMarksObt.Text = (dr1[0]["hmarksobt"].ToString());
                        TxtHSMaxMarks.Text = (dr1[0]["hmaxmarks"].ToString());
                        TxtHSPercent.Text = (dr1[0]["hper"].ToString());
                        TxtHSDiv.Text = (dr1[0]["hdiv"].ToString());
                        TxtHSSubjects.Text = (dr1[0]["hsub"].ToString());
                        TxtHS_reference_no.Text = (dr1[0]["hreferenceno"].ToString());

                        TxtInterBoard.Text = (dr1[0]["iboard"].ToString());
                        TxtInterYear.Text = (dr1[0]["iyear"].ToString());
                        TxtInterMarksObt.Text = (dr1[0]["imarksobt"].ToString());
                        TxtInterMaxMarks.Text = (dr1[0]["imaxmarks"].ToString());
                        TxtInterPercent.Text = (dr1[0]["iper"].ToString());
                        TxtInter_div.Text = (dr1[0]["idiv"].ToString());
                        TxtInterSubjects.Text = (dr1[0]["isub"].ToString());
                        Txtinter_reference_No.Text = (dr1[0]["ireference"].ToString());


                        Drop_graduation.SelectedValue = (dr1[0]["gtype"].ToString());
                        TxtGradBoard_3.Text = (dr1[0]["guniversity"].ToString());
                        TxtGradYear0.Text = (dr1[0]["gyear"].ToString());
                        TxtGradMarksObt0.Text = (dr1[0]["gmarksobt"].ToString());
                        TxtGradMaxMarks0.Text = (dr1[0]["gmaxmarks"].ToString());
                        TxtgradPercent.Text = (dr1[0]["ugper"].ToString());
                        TxtGrad_div.Text = (dr1[0]["gdiv"].ToString());
                        TxtGradSubjects0.Text = (dr1[0]["gsub"].ToString());
                        Txt_grad_ref_no.Text = (dr1[0]["greference"].ToString());

                        //Drop_pg.SelectedValue = (dr1[0]["pgtype"].ToString());
                        //Txt_pg_Board.Text = (dr1[0]["pguniversity"].ToString());
                        //Txt_pg_Year.Text = (dr1[0]["pgyear"].ToString());
                        //Txt_pg_MarksObt.Text = (dr1[0]["pgmarksobt"].ToString());
                        //Txt_pg_MaxMarks.Text = (dr1[0]["pgmaxmarks"].ToString());
                        //TxtpgPercent.Text = (dr1[0]["pgper"].ToString());
                        //Txt_pg_div.Text = (dr1[0]["pgdiv"].ToString());
                        //Txt_pg_Subjects.Text = (dr1[0]["pgsub"].ToString());
                        //Txt_pg_ref_no.Text = (dr1[0]["pgreference"].ToString());


                        //Txt_mphil_Board3.Text = (dr1[0]["mphiluniversity"].ToString());
                        //Txt_mphil_Yr3.Text = (dr1[0]["mpyear"].ToString());
                        //Txt_mphil_Marksobtained3.Text = (dr1[0]["mpmarksobt"].ToString());
                        //Txt_mphil_MaxMarks3.Text = (dr1[0]["mpmaxmarks"].ToString());
                        //TxtmphilPercent.Text = (dr1[0]["mphilper"].ToString());
                        //Txt_mphil_div.Text = (dr1[0]["mpdiv"].ToString());
                        //Txt_mphil_Subjects3.Text = (dr1[0]["mpsub"].ToString());
                        //Txt_mphil_ref_no.Text = (dr1[0]["mpreference"].ToString());

                        //Drop_ugc.SelectedValue = (dr1[0]["ugctype"].ToString());
                        //Txt_ugc_Board1.Text = (dr1[0]["uuniversity"].ToString());
                        //Txt_ugc_Year1.Text = (dr1[0]["uyear"].ToString());
                        //Txt_ugc_MarksObt1.Text = (dr1[0]["umarksobt"].ToString());
                        //Txt_ugc_MaxMarks1.Text = (dr1[0]["umaxmarks"].ToString());
                        //TxtugcPercent.Text = (dr1[0]["ugcper"].ToString());
                        //Txt_ugc_div.Text = (dr1[0]["udiv"].ToString());
                        //Txt_ugc_Subjects1.Text = (dr1[0]["usub"].ToString());
                        //Txt_ugc_ref_no.Text = (dr1[0]["ureference"].ToString());

                        //TxtOtherCourse2
                        TxtOtherCourse2.Text= (dr1[0]["temp6"].ToString());
                        TxtOtherBoard2.Text = (dr1[0]["ouniversity"].ToString());
                        TxtOtherYr2.Text = (dr1[0]["oyear"].ToString());
                        TxtOtherMarksobtained2.Text = (dr1[0]["omarksobt"].ToString());
                        TxtOtherMaxMarks2.Text = (dr1[0]["omaxmarks"].ToString());
                        TxtotherPercent.Text = (dr1[0]["operper"].ToString());
                        TxtOther_div.Text = (dr1[0]["odiv"].ToString());
                        TxtOtherSubjects2.Text = (dr1[0]["osub"].ToString());
                        Txt_other_ref_no.Text = (dr1[0]["oreference"].ToString());

                        //fix course
                        string ba1c_1_choice= (dr1[0]["ba1c"].ToString());
                        string[] ba1c_1_values = ba1c_1_choice.Split(',');
                        ba1c_1.SelectedValue = ba1c_1_values[0];
                        ba1c_2.SelectedValue = ba1c_1_values[1];
                        ba1c_3.SelectedValue = ba1c_1_values[2];

                        string ba2c_1_choice = (dr1[0]["ba2c"].ToString());
                        string[] ba2c_1_values = ba2c_1_choice.Split(',');
                                               
                        ba2c_1.SelectedValue = ba2c_1_values[0];
                        ba2c_2.SelectedValue = ba2c_1_values[1];
                        ba2c_3.SelectedValue = ba2c_1_values[2];

                        string ba3c_1_choice = (dr1[0]["ba3c"].ToString());
                        string[] ba3c_1_values = ba3c_1_choice.Split(',');

                        ba3c_1.SelectedValue = ba3c_1_values[0];
                        ba3c_2.SelectedValue = ba3c_1_values[1];
                        ba3c_3.SelectedValue = ba3c_1_values[2];

                        // for bahind

                        string bahind1c_1_choice = (dr1[0]["bahind1c"].ToString());
                        string[] bahind1c_1_values = bahind1c_1_choice.Split(',');
                        bahind1c_1.SelectedValue = bahind1c_1_values[0];
                        bahind1c_2.SelectedValue = bahind1c_1_values[1];
                        bahind1c_3.SelectedValue = bahind1c_1_values[2];

                        string bahind2c_1_choice = (dr1[0]["bahind2c"].ToString());
                        string[] bahind2c_1_values = bahind2c_1_choice.Split(',');

                        bahind2c_1.SelectedValue = bahind2c_1_values[0];
                        bahind2c_2.SelectedValue = bahind2c_1_values[1];
                        bahind2c_3.SelectedValue = bahind2c_1_values[2];

                        string bahind3c_1_choice = (dr1[0]["bahind3c"].ToString());
                        string[] bahind3c_1_values = bahind3c_1_choice.Split(',');

                        bahind3c_1.SelectedValue = bahind3c_1_values[0];
                        bahind3c_2.SelectedValue = bahind3c_1_values[1];
                        bahind3c_3.SelectedValue = bahind3c_1_values[2];



                        //for bsc

                        // string bsc1c_1_choice = (dr1[0]["bsc1c"].ToString());
                        // bsc1c_1_choice = (dr1[0]["bsc1c"].ToString());
                        // string[] bsc1c_1_values = bsc1c_1_choice.Split(',');
                        //bsc1c_1.SelectedValue = bsc1c_1_values[0];
                        bsc1c_1.SelectedValue = (dr1[0]["bsc1c"].ToString());
                        // bsc1c_2.SelectedValue = bsc1c_1_values[1];
                        // bsc1c_3.SelectedValue = bsc1c_1_values[2];

                        // string bsc2c_1_choice = (dr1[0]["bsc2c"].ToString());
                        // string[] bsc2c_1_values = bsc2c_1_choice.Split(',');

                        // bsc2c_1.SelectedValue = bsc2c_1_values[0];
                        // bsc2c_2.SelectedValue = bsc2c_1_values[1];
                        // bsc2c_3.SelectedValue = bsc2c_1_values[2];

                        //ded choice
                        //string dedchoice = (dr1[0]["ded"].ToString());
                        //string[] ded_values = dedchoice.Split(',');
                        //ded_1c.SelectedValue= ded_values[0];
                        //ded_2c.SelectedValue = ded_values[1];
                        //ded_3c.SelectedValue = ded_values[2];


                        //bed special
                        string bedsplchoice = (dr1[0]["bedspl"].ToString());
                        string[] bedspl_values = bedsplchoice.Split(',');
                        bed_1c.SelectedValue = bedspl_values[0];
                        bed_2c.SelectedValue = bedspl_values[1];
                        bed_3c.SelectedValue = bedspl_values[2];

                        //bedodl
                        //string bedodl_choice = (dr1[0]["bedodl"].ToString());
                        //string[] bedodl_values = bedodl_choice.Split(',');
                        //bed_odl_1c.SelectedValue = bedodl_values[0];
                        //bed_odl_2c.SelectedValue = bedodl_values[1];
                        //bed_odl_3c.SelectedValue = bedodl_values[2];

                        bpo_baslp_1c.SelectedValue= (dr1[0]["baslp"].ToString());
                        bpo_baslp_2c.SelectedValue = (dr1[0]["bpo"].ToString());

                        //btech_1c.Text= (dr1[0]["btech1c"].ToString());
                        //btech_2c.Text = (dr1[0]["btech2c"].ToString());
                        //btech_3c.Text = (dr1[0]["btech3c"].ToString());
                        //btech_4c.Text = (dr1[0]["btech4c"].ToString());
                        //btech_5c.Text = (dr1[0]["btech5c"].ToString());

                        //TextBox12.Text=(dr1[0]["phdinst"].ToString());

                        //TextBox13.Text = (dr1[0]["phdsub"].ToString());
                        //TextBox14.Text = (dr1[0]["pdhfrom"].ToString());
                        //TextBox15.Text = (dr1[0]["phdto"].ToString());
                        //TextBox16.Text = (dr1[0]["phdym"].ToString());
                        //phd_emp_name_add.Text = (dr1[0]["empadd"].ToString());
                        
                        //facilities
                        //sholarship_radio.SelectedValue= (dr1[0]["scholarship"].ToString());
                        //hostel_radio.Text = (dr1[0]["hostel"].ToString());
                        //travel_bus_radio.Text = (dr1[0]["travelbus"].ToString());
                        
                        //sign photo
                       
                        Photo_img.ImageUrl = (dr1[0]["photo_path"].ToString());
                        Signature_img.ImageUrl = (dr1[0]["sign_path"].ToString());
                        
                        //Document Upload

                        string x_doc = Path.GetExtension((dr1[0]["upload_10"].ToString()));
                        if (x_doc == null || x_doc == "")
                        {
                            hyDoc_1.Visible = false;
                        }
                        else
                        {
                            hyDoc_1.Visible = true;
                            hyDoc_1.NavigateUrl = (dr1[0]["upload_10"].ToString());
                        }

                        string xii_doc = Path.GetExtension((dr1[0]["upload_12"].ToString()));
                        if (xii_doc == null || xii_doc == "")
                        {
                            hyDoc_2.Visible = false;
                        }
                        else
                        {
                            hyDoc_2.Visible = true;
                            hyDoc_2.NavigateUrl = (dr1[0]["upload_12"].ToString());
                        }

                        string ug_doc = Path.GetExtension((dr1[0]["upload_grad"].ToString()));
                        if (ug_doc == null || ug_doc == "")
                        {
                            hyDoc_3.Visible = false;
                        }
                        else
                        {
                            hyDoc_3.Visible = true;
                            hyDoc_3.NavigateUrl = (dr1[0]["upload_grad"].ToString());
                        }

                        string other_doc = Path.GetExtension((dr1[0]["upload_otherdegree"].ToString()));
                        if (other_doc == null || other_doc == "")
                        {
                            hyDoc_4.Visible = false;
                        }
                        else
                        {
                            hyDoc_4.Visible = true;
                            hyDoc_4.NavigateUrl = (dr1[0]["upload_otherdegree"].ToString());
                        }

                        string caste_doc = Path.GetExtension((dr1[0]["upload_caste"].ToString()));
                        if (caste_doc == null || caste_doc == "")
                        {
                            hyDoc_5.Visible = false;
                        }
                        else
                        {
                            hyDoc_5.Visible = true;
                            hyDoc_5.NavigateUrl = (dr1[0]["upload_caste"].ToString());
                        }

                        string disability_doc = Path.GetExtension((dr1[0]["upload_disability"].ToString()));
                        if (disability_doc == null || disability_doc == "")
                        {
                            hyDoc_6.Visible = false;
                        }
                        else
                        {
                            hyDoc_6.Visible = true;
                            hyDoc_6.NavigateUrl = (dr1[0]["upload_disability"].ToString());
                        }

                        string aioat19Acard_doc = Path.GetExtension((dr1[0]["aiotadmitcard"].ToString()));
                        if (aioat19Acard_doc == null || aioat19Acard_doc == "")
                        {
                            hyDoc_7.Visible = false;
                        }
                        else
                        {
                            hyDoc_7.Visible = true;
                            hyDoc_7.NavigateUrl = (dr1[0]["aiotadmitcard"].ToString());
                        }

                        string aioat19Scard_doc = Path.GetExtension((dr1[0]["aiotscorecard"].ToString()));
                        if (aioat19Scard_doc == null || aioat19Scard_doc == "")
                        {
                            hyDoc_8.Visible = false;
                        }
                        else
                        {
                            hyDoc_8.Visible = true;
                            hyDoc_8.NavigateUrl = (dr1[0]["aiotscorecard"].ToString());
                        }


                        RadioButtonPassedStatus.SelectedValue=(dr1[0]["passedstatus"].ToString());
                        Label_AppearedStatus.Text = (dr1[0]["appearstatus"].ToString());

                        //bankdetail
                        TB_DD_No.Text = (dr1[0]["ddno"].ToString());
                        TB_BankName.Text = (dr1[0]["bankname"].ToString());
                        TB_PaymentAmount.Text = (dr1[0]["paymentamount"].ToString());
                        TB_DD_Date.Text = (dr1[0]["dddate"].ToString());


                        //father.Text = (dr1[0]["fname"].ToString());
                        //father.Text = (dr1[0]["fname"].ToString());

                    }
                }
            }
            catch { }
            finally { constr.Close(); }
        }
    }
    private void SetDefaultView()
    {
        /*
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
                            Server.Transfer("~/Dashboard.aspx");
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
            }
        }
        */
        MultiView1.ActiveViewIndex = 1;
    }
    protected void personl_detail_btnSubmit_Click(object sender, EventArgs e)
    {
if (ccode.Text == "OBC" && state.SelectedItem.Value.ToString() != "Uttar Pradesh")
        {
            Alert.Show("OBC Category not allowed for State Other than Uttar Pradesh");
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

    /*                if (label_state.Text != "Uttar Pradesh")
                    {
                        Label_Other_state.Text = ostate.SelectedItem.Value.ToString();
                    }
                    else
                    {
                        Label_Other_state.Text = "Uttar Pradesh";
                    }

                    if (DropDownList_Nationality.SelectedItem.Text != "Indian")
                    {
                        Label_nationality.Text = nationality.Text.Trim();
                    }
                    else
                    {
                        Label_nationality.Text = "Indian";
                    }

                    if (religion.SelectedItem.Text != "Other Religion")
                    {
                        Label_religion.Text = religion.SelectedItem.Value.ToString();
                    }
                    else
                    {
                        Label_religion.Text = tb_religion.Text.Trim();
                    }
                    */

                    if (disability.SelectedItem.Text == "Other Disability")
                    {
                        Label_Disability.Text = tb_disability.Text;
                    }
                    else
                    {
                        Label_Disability.Text = disability.SelectedItem.Text;
                    }

                        //Query = "update registration set name=@candidatename,fname= @fname,husband=@husband,mname=@mname,adharno=@adharno,gender=@gender,nationality=@nationality,state=@state,religion=@religion,minority=@minority,dob=@dob,maritial=@maritial,category=@category,ccode=@ccode,dsmruemp=@dsmruemp,dsmruwardemp=@dsmruwardemp,disability=@disability,disabilitycode=@disabilitycode,dffighter=@dffighter,ncc=@ncc,sportsplayer=@sportsplayer,nss=@nss,debard=@debard where regno=@regno";
                        Query = "update registration set name=@candidatename,fname= @fname,mname=@mname,nominee= @nominee,policestn=@policestn,railwaystn=@railwaystr,aadharno=@aadharno,blood=@blood,DOMOCILE=@Domocile,gender=@gender,nationality=@nationality,state=@state,religion=@religion,minority=@minority,dob=@dob,maritial=@maritial,category=@category,ccode=@ccode,dsmruemp=@dsmruemp,dsmruwardemp=@dsmruwardemp,disability=@disability,disabilitycode=@disabilitycode,dffighter=@dffighter,ncc=@ncc,sportsplayer=@sportsplayer,nss=@nss where regno=@regno";
                        //Query = "update registration set name=@candidatename,fname= @fname,mname=@mname,nominee= @nominee,policestn=@policestn,railwaystn=@railwaystr,aadharno=@aadharno,blood=@blood,DOMOCILE=@Domocile,gender=@gender,nationality=@nationality,state=@state,religion=@religion,minority=@minority,dob=@dob,maritial=@maritial,category=@category,ccode=@ccode,dsmruemp=@dsmruemp,dsmruwardemp=@dsmruwardemp,disability=@disability,disabilitycode=@disabilitycode,dffighter=@dffighter,ncc=@ncc,sportsplayer=@sportsplayer,nss=@nss,flag=@flag where regno=@regno";

                        // Alert.Show("Update query: "+Query);
                        //using (cmd = new SqlCommand("update registration set fname='" + father.Text + "',mname='" + mother.Text + "',gender='" + gender.SelectedItem.Value.ToString() + "',nationality='" + nationality.Text + "',state='" + Label_Other_state.Text + "',religion='" + religion.Text + "',minority='" + minority.SelectedItem.Value.ToString() + "',dob='" + dob + "',maritial='" + mstatus.SelectedItem.Value.ToString() + "',category='" + category.SelectedItem.Value.ToString() + "',ccode='" + ccode.Text + "',dsmruemp='" + demployee.SelectedItem.Value.ToString() + "',dsmruwardemp='" + deward.SelectedItem.Value.ToString() + "',disability='" + disability.SelectedItem.Text + "',disabilitycode='" + dcode.Text + "',dffighter='" + ffighter.SelectedItem.Value.ToString() + "',ncc='" + ncc.SelectedItem.Value.ToString() + "',sportsplayer='" + sports.SelectedItem.Value.ToString() + "',nss='" + nss.SelectedItem.Value.ToString() + "',debard='" + legal.SelectedItem.Value.ToString() + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
                        using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        cmd.Parameters.AddWithValue("@candidatename", applicant.Text.Trim());
                        cmd.Parameters.AddWithValue("@fname", father.Text.Trim());
                            //cmd.Parameters.AddWithValue("@husband", husband.Text.Trim());
                            cmd.Parameters.AddWithValue("@nominee", nominee.Text.Trim().ToUpper());
                            cmd.Parameters.AddWithValue("@policestn", police.Text.Trim().ToUpper());
                            cmd.Parameters.AddWithValue("@railwaystr", railway.Text.Trim().ToUpper());
                            cmd.Parameters.AddWithValue("@aadharno", aadharno.Text.Trim());
                            cmd.Parameters.AddWithValue("@blood", blood.SelectedItem.Value.ToString());

                            cmd.Parameters.AddWithValue("@Domocile", Domocile.SelectedItem.Value.ToString());
                            cmd.Parameters.AddWithValue("@mname", mother.Text.Trim());
                        //cmd.Parameters.AddWithValue("@adharno", AdharNo.Text.Trim());
                        cmd.Parameters.AddWithValue("@gender", gender.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@nationality", DropDownList_Nationality.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@state", state.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@religion", religion.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@minority", minority.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@maritial", mstatus.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@category", category.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@ccode", ccode.Text.Trim());
                        cmd.Parameters.AddWithValue("@dsmruemp", txtempname.Text);
                        cmd.Parameters.AddWithValue("@dsmruwardemp", Demployeew.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@disability", Label_Disability.Text);
                        cmd.Parameters.AddWithValue("@disabilitycode", dcode.Text.Trim());
                        cmd.Parameters.AddWithValue("@dffighter", ffighter.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@ncc", ncc.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@sportsplayer", sports.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@nss", nss.SelectedItem.Value.ToString());
                        //cmd.Parameters.AddWithValue("@debard", legal.SelectedItem.Value.ToString());

                  //      cmd.Parameters.AddWithValue("@flag", "2");

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
                catch //(Exception ex)
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

                    //string phone = TextBox9.Text + TextBox5.Text;
                    string address = paddress.Text.ToUpper() + "," + paddress0.Text.ToUpper() + "," + paddress1.Text.ToUpper();
                    string address_1 = maddress.Text.ToUpper() + "," + maddress0.Text.ToUpper() + "," + maddress1.Text.ToUpper();

                    //Query = "update registration set padress=@padress,madress=@madress,pstation=@pstation,rstation=@rstation,telephone=@telephone,mobileno=@mobileno,emailad=@emailad,adharno=@adharno where regno=@regno";
                    Query = "update registration set madress=@madress,padress=@padress,mobileno=@mobileno,emailad=@emailad where regno=@regno";
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
                        //cmd.Parameters.AddWithValue("@adharno", AdharNo.Text.Trim());

                   //     cmd.Parameters.AddWithValue("@flag", "3");
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());


                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();
                        if (j == 1)
                        {
                            Alert.Show("Mailing Details updated successfully...!");
                            MultiView1.ActiveViewIndex = 3;

                        }
                        else
                        {
                            Alert.Show("Mailing details updation failed");

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
                    Alert.Show("Mailing details updation failed raised exception");

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
                    //  string bsc1c = bsc1c_1.SelectedItem.Value.ToString() + "," + bsc1c_2.SelectedItem.Value.ToString() + "," + bsc1c_3.SelectedItem.Value.ToString();
                    string bsc1c = bsc1c_1.SelectedItem.Value.ToString();
                    //  string bsc2c = bsc2c_1.SelectedItem.Value.ToString() + "," + bsc2c_2.SelectedItem.Value.ToString() + "," + bsc2c_3.SelectedItem.Value.ToString();

                    string ba3c = ba3c_1.SelectedItem.Value.ToString() + "," + ba3c_2.SelectedItem.Value.ToString() + "," + ba3c_3.SelectedItem.Value.ToString();

                    // bahind
                    string bahind1c = bahind1c_1.SelectedItem.Value.ToString() + "," + bahind1c_2.SelectedItem.Value.ToString() + "," + bahind1c_3.SelectedItem.Value.ToString();
                    string bahind2c = bahind2c_1.SelectedItem.Value.ToString() + "," + bahind2c_2.SelectedItem.Value.ToString() + "," + bahind2c_3.SelectedItem.Value.ToString();
                    string bahind3c = bahind3c_1.SelectedItem.Value.ToString() + "," + bahind3c_2.SelectedItem.Value.ToString() + "," + bahind3c_3.SelectedItem.Value.ToString();


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

                    //Query = "update registration set hboard=@hboard,hyear=@hyear, hmarksobt=@hmarksobt,hmaxmarks=@hmaxmarks,hdiv=@hdiv,hsub=@hsub,hreferenceno=@hreferenceno,iboard=@iboard, iyear=@iyear,imarksobt=@imarksobt,imaxmarks=@imaxmarks,idiv=@idiv,isub=@isub,ireference=@ireference,gtype=@gtype,guniversity=@guniversity,gyear=@gyear,gmarksobt=@gmarksobt,gmaxmarks=@gmaxmarks,gdiv=@gdiv,gsub=@gsub,greference=@greference,pgtype=@pgtype,pguniversity=@pguniversity,pgyear=@pgyear,pgmarksobt=@pgmarksobt,pgmaxmarks=@pgmaxmarks,pgdiv=@pgdiv,pgsub=@pgsub,pgreference=@pgreference,mphiluniversity=@mphiluniversity,mpyear=@mpyear,mpmarksobt=@mpmarksobt,mpmaxmarks=@mpmaxmarks,mpdiv=@mpdiv,mpsub=@mpsub,mpreference=@mpreference,ugctype=@ugctype,uuniversity=@uuniversity,uyear=@uyear,umarksobt=@umarksobt,umaxmarks=@umaxmarks,udiv=@udiv,usub=@usub,ureference=@ureference,temp6=@othercoursename_temp6,ouniversity=@ouniversity,oyear=@oyear,omarksobt=@omarksobt,omaxmarks=@omaxmarks,odiv=@odiv,osub=@osub,oreference=@oreference,ba1c=@ba1c,ba2c=@ba2c,ba3c=@ba3c,ded=@ded,bedspl=@bedspl,bedodl=@bedodl,baslp=@baslp,bpo=@bpo,btech1c=@btech1c,btech2c=@btech2c,btech3c=@btech3c,btech4c=@btech4c," + "btech5c=@btech5c,phdinst=@phdinst,phdsub=@phdsub,pdhfrom=@pdhfrom,phdto=@phdto,phdym=@phdym,empadd=@empadd,hper=@hper,iper=@iper,ugper=@ugper,pgper=@pgper,ugcper=@ugcper,mphilper=@mphilper,operper=@operper,passedstatus=@passedstatus,appearstatus=@appearstatus where regno=@regno";
                    Query = "update registration set hboard=@hboard,hyear=@hyear, hmarksobt=@hmarksobt,hmaxmarks=@hmaxmarks,hdiv=@hdiv,hsub=@hsub,hreferenceno=@hreferenceno,iboard=@iboard, iyear=@iyear,imarksobt=@imarksobt,imaxmarks=@imaxmarks,idiv=@idiv,isub=@isub,ireference=@ireference,gtype=@gtype,guniversity=@guniversity,gyear=@gyear,gmarksobt=@gmarksobt,gmaxmarks=@gmaxmarks,gdiv=@gdiv,gsub=@gsub,greference=@greference,pgtype=@pgtype,pguniversity=@pguniversity,pgyear=@pgyear,pgmarksobt=@pgmarksobt,pgmaxmarks=@pgmaxmarks,pgdiv=@pgdiv,pgsub=@pgsub,pgreference=@pgreference,operper=@operper,temp6=@othercoursename_temp6,ouniversity=@ouniversity,oyear=@oyear,omarksobt=@omarksobt,omaxmarks=@omaxmarks,odiv=@odiv,osub=@osub,oreference=@oreference,hper=@hper,iper=@iper,ugper=@ugper,pgper=@pgper,ba1c=@ba1c,ba2c=@ba2c,ba3c=@ba3c,bahind1c=@bahind1c,bahind2c=@bahind2c,bahind3c=@bahind3c,bsc1c=@bsc1c,bedspl=@bedspl,baslp=@baslp,bpo=@bpo,passedstatus=@passedstatus,appearstatus=@appearstatus where regno=@regno";

                    // using (cmd = new SqlCommand("update registration set hboard='" + TxtHSBoard.Text + "',hyear='" + TxtHSYear.Text + "',hmarksobt='" + TxtHSMarksObt.Text + "',hmaxmarks='" + TxtHSMaxMarks.Text + "',hdiv='" + TxtHSDiv.Text + "',hsub='" + TxtHSSubjects.Text + "',hreferenceno='" + TxtHS_reference_no.Text + "',iboard='" + TxtInterBoard.Text + "',iyear='" + TxtInterYear.Text + "',imarksobt='" + TxtInterMarksObt.Text + "',imaxmarks='" + TxtInterMaxMarks.Text + "',idiv='" + TxtInter_div.Text + "',isub='" + TxtInterSubjects.Text + "',ireference='" + Txtinter_reference_No.Text + "',gtype='" + Drop_graduation.SelectedItem.Value.ToString() + "',guniversity='" + TxtGradBoard_3.Text + "',gyear='" + TxtGradYear0.Text + "',gmarksobt='" + TxtGradMarksObt0.Text + "',gmaxmarks='" + TxtGradMaxMarks0.Text + "',gdiv='" + TxtGrad_div.Text + "',gsub='" + TxtGradSubjects0.Text + "',greference='" + Txt_grad_ref_no.Text + "',pgtype='" + Drop_pg.SelectedItem.Value.ToString() + "',pguniversity='" + Txt_pg_Board.Text + "',pgyear='" + Txt_pg_Year.Text + "',pgmarksobt='" + Txt_pg_MarksObt.Text + "',pgmaxmarks='" + Txt_pg_MaxMarks.Text + "',pgdiv='" + Txt_pg_div.Text + "',pgsub='" + Txt_pg_Subjects.Text + "',pgreference='" + Txt_pg_ref_no.Text + "',mphiluniversity='" + Txt_mphil_Board3.Text + "',mpyear='" + Txt_mphil_Yr3.Text + "',mpmarksobt='" + Txt_mphil_Marksobtained3.Text + "',mpmaxmarks='" + Txt_mphil_MaxMarks3.Text + "',mpdiv='" + Txt_mphil_div.Text + "',mpsub='" + Txt_mphil_Subjects3.Text + "',mpreference='" + Txt_mphil_ref_no.Text + "',ugctype='" + Drop_ugc.SelectedItem.Value.ToString() + "',uuniversity='" + Txt_ugc_Board1.Text + "',uyear='" + Txt_ugc_Year1.Text + "',umarksobt='" + Txt_ugc_MarksObt1.Text + "',umaxmarks='" + Txt_ugc_MaxMarks1.Text + "',udiv='" + Txt_ugc_div.Text + "',usub='" + Txt_ugc_Subjects1.Text + "',ureference='" + Txt_ugc_ref_no.Text + "',ouniversity='" + TxtOtherBoard2.Text + "',oyear='" + TxtOtherYr2.Text + "',omarksobt='" + TxtOtherMarksobtained2.Text + "',omaxmarks='" + TxtOtherMaxMarks2.Text + "',odiv='" + TxtOther_div.Text + "',osub='" + TxtOtherSubjects2.Text + "',oreference='" + Txt_other_ref_no.Text + "',ba1c='" + ba1c + "',ba2c='" + ba2c + "',ba3c='" + ba3c + "',ded='" + ded + "',bedspl='" + bed + "',bedodl='" + bed_odl + "',baslp='" + bpo_baslp_1c.SelectedItem.Value.ToString() + "',bpo='" + bpo_baslp_2c.SelectedItem.Value.ToString() + "',btech1c='" + btech_1c.Text + "',btech2c='" + btech_2c.Text + "',btech3c='" + btech_3c.Text + "',btech4c='" + btech_4c.Text + "',btech5c='" + btech_5c.Text + "',phdinst='" + phd_inst + "',phdsub='" + phd_sub + "',pdhfrom='" + phd_duration_frm + "',phdto='" + phd_duration_to + "',phdym='" + phd_yr + "',empadd='" + phd_emp_name_add.Text + "',hper='" + TxtHSPercent.Text + "',iper='" + TxtInterPercent.Text + "',ugper='" + TxtgradPercent.Text + "',pgper='" + TxtpgPercent.Text + "',	ugcper='" + TxtugcPercent.Text + "',mphilper='" + TxtmphilPercent.Text + "',operper='" + TxtotherPercent.Text + "',passedstatus='" + passedstatus + "',appearstatus='" + appearingstatus + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))

                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        //cmd.Parameters.AddWithValue("@flag", "4");
                        
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
                        cmd.Parameters.AddWithValue("@bsc1c", bsc1c);
                      //  cmd.Parameters.AddWithValue("@bsc2c", bsc2c);
                        cmd.Parameters.AddWithValue("@ba3c", ba3c);

                        //forbahind

                        // ba for hind college
                        cmd.Parameters.AddWithValue("@bahind1c", bahind1c);
                        cmd.Parameters.AddWithValue("@bahind2c", bahind2c);
                        cmd.Parameters.AddWithValue("@bahind3c", bahind3c);

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
                            Alert.Show("Academic Details updated successfully...!");
//updated on 23 april 19
                            MultiView1.ActiveViewIndex = 5;

                        }
                        else
                        {
                            Alert.Show("Academic details updation failed...!");

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

                    Alert.Show("Academic details updation failed raised exception");


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
                    Query = "update registration set scholarship=@scholarship,hostel=@hostel,travelbus=@travelbus where regno=@regno";

                    // using (cmd = new SqlCommand("update registration set scholarship='" + sholarship_radio.SelectedItem.Value.ToString() + "',hostel='" + hostel_radio.SelectedItem.Value.ToString() + "',travelbus='" + travel_bus_radio.SelectedItem.Value.ToString() + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {


                        cmd.Parameters.AddWithValue("@scholarship", sholarship_radio.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@hostel", hostel_radio.SelectedItem.Value.ToString());
                        cmd.Parameters.AddWithValue("@travelbus", travel_bus_radio.SelectedItem.Value.ToString());

        //                cmd.Parameters.AddWithValue("@flag", "5");
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
                    Alert.Show("Facility detail updation failed raised exception");
                }

                finally { constr.Close(); }

            }
        }
    }
    //protected void Image_Upload_button_Click(object sender, EventArgs e)
    //{
    //    string u_name = Label_regno.Text.Trim();

    //    if (FileUpload1.HasFile && FileUpload2.HasFile)
    //    {
    //        try
    //        {
    //            if (FileUpload1.PostedFile.ContentType == "image/jpeg" && FileUpload2.PostedFile.ContentType == "image/jpeg")
    //            {
    //                if (FileUpload1.PostedFile.ContentLength < 102400 && FileUpload2.PostedFile.ContentLength < 102400)
    //                {
    //                    string filename = FileUpload1.FileName;
    //                    string sign_filename = FileUpload2.FileName;
    //                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + filename);
    //                    FileUpload2.PostedFile.SaveAs(Server.MapPath("~/uploads/") + u_name + sign_filename);

    //                    string path_photo = "~/uploads/" + u_name + filename.ToString();
    //                    string path_sign = "~/uploads/" + u_name + sign_filename.ToString();

    //                    using (constr = new SqlConnection(connection_string))
    //                    {
    //                        constr.Open();
    //                        try
    //                        {
    //                            using (transaction = constr.BeginTransaction())
    //                            {
    //                                //Query = "update registration set photo_path=@photo_path where regno=@regno";
    //                                Query = "update registration set photo_path=@photo_path,sign_path=@sign_path,flag=@flag where regno=@regno";
    //                                //using (cmd = new SqlCommand("update registration set photo_path='" + path_photo + "',sign_path='" + path_sign + "' where regno='" + Label_regno.Text.Trim() + "'", constr, transaction))
    //                                using (cmd = new SqlCommand(Query, constr, transaction))
    //                                {
    //                                    cmd.Parameters.AddWithValue("@photo_path", path_photo);
    //                                    cmd.Parameters.AddWithValue("@sign_path", path_sign);
    //                                    cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

    //                                   // cmd.Parameters.AddWithValue("@flag", "6");

    //                                    j = cmd.ExecuteNonQuery();

    //                                    if (j == 1)
    //                                    {
    //                                        Alert.Show("Upload status: File uploaded Successfully");
    //                                        gotonextbutton.Visible = true;
    //                                        Panel_IMAGE.Visible = true;
    //                                        Image_Upload_button.Visible = false;
    //                                        transaction.Commit();
    //                                    }
    //                                    else
    //                                    {
    //                                        Alert.Show("Upload status: Failed");
    //                                    }
    //                                }
    //                            }

    //                            //Query = "select photo_path from registration where regno=@regno";
    //                            Query = "select photo_path,sign_path from registration where regno=@regno";
    //                            //using (SqlCommand cmd1 = new SqlCommand("select photo_path,sign_path from registration where regno='" + Label_regno.Text.Trim() + "'", constr))

    //                            using (SqlCommand cmd1 = new SqlCommand(Query, constr))
    //                            {

    //                                cmd1.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

    //                                dr = cmd1.ExecuteReader();
    //                                while (dr.Read())
    //                                {
    //                                    Photo_img.ImageUrl = dr["photo_path"].ToString();
    //                                    Signature_img.ImageUrl = dr["sign_path"].ToString();
    //                                }
    //                                dr.Close();

    //                            }

    //                        }
    //                        catch (Exception ex)
    //                        {
    //                            try
    //                            {
    //                                transaction.Rollback();
    //                            }
    //                            catch
    //                            {
    //                                Alert.Show("Exception Caused Transaction Rollback");
    //                            }
    //                            Label97.Text = ex.ToString();
    //                        }
    //                        finally
    //                        {
    //                            if (constr != null)
    //                            {
    //                                constr.Close();
    //                            }
    //                        }
    //                    }

    //                }
    //                else
    //                {
    //                    Alert.Show("Upload status: The file has to be less than 100 kb");

    //                }
    //            }
    //            else
    //            {
    //                Alert.Show("Upload status: Only JPEG files are accepted");

    //            }

    //        }
    //        catch
    //        {
    //            //        Alert.Show("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
    //            Alert.Show("Upload status: The file could not be uploaded.");

    //        }
    //        finally
    //        {
    //            constr.Close();
    //        }
    //    }
    //    else
    //    {
    //        Alert.Show("No file selected");
    //    }
    //}

    protected void Image_Upload_button_Click(object sender, EventArgs e)
    {
        string u_name = Label_regno.Text.Trim();

        if (FileUpload1.HasFile && FileUpload2.HasFile && FileUpload3.HasFile)
        {
            bool isValid = validateUploadedFiles();
            try
            {
                //if (FileUpload1.PostedFile.ContentType == "image/jpeg" && FileUpload2.PostedFile.ContentType == "image/jpeg" && FileUpload3.PostedFile.ContentType == "application/pdf" && FileUpload4.PostedFile.ContentType == "application/pdf" && FileUpload5.PostedFile.ContentType == "application/pdf" && FileUpload6.PostedFile.ContentType == "application/pdf" && FileUpload7.PostedFile.ContentType == "application/pdf" && FileUpload8.PostedFile.ContentType == "application/pdf")
                //{
                if (isValid)
                {
                    if (FileUpload1.PostedFile.ContentLength < 102400
                    && FileUpload2.PostedFile.ContentLength < 102400
                    && FileUpload3.PostedFile.ContentLength < 307200
                    && FileUpload4.PostedFile.ContentLength < 307200
                    && FileUpload5.PostedFile.ContentLength < 307200
                    && FileUpload6.PostedFile.ContentLength < 307200
                    && FileUpload7.PostedFile.ContentLength < 307200
                    && FileUpload8.PostedFile.ContentLength < 307200
                    && FileUpload9.PostedFile.ContentLength < 307200
                    && FileUpload10.PostedFile.ContentLength < 307200)
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
                                    Query = "update registration set photo_path=@photo_path,sign_path=@sign_path,upload_10=@upload_10,upload_12=@upload_12,upload_grad=@upload_grad,upload_otherdegree=@upload_otherdegree,upload_caste=@upload_caste,upload_disability=@upload_disability, aiotadmitcard=@aiotadmitcard, aiotscorecard=@aiotscorecard where regno=@regno";
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

                                        // cmd.Parameters.AddWithValue("@flag", "6");

                                        j = cmd.ExecuteNonQuery();

                                        if (j == 1)
                                        {
                                            Alert.Show("Upload status: File uploaded Successfully");
                                            gotonextbutton.Visible = true;
                                            Photo_img.Visible = true;
                                            Signature_img.Visible = true;
                                            //Panel_IMAGE.Visible = true;
                                            //Panel_doc.Visible = true;
                                            Image_Upload_button.Visible = true;
                                            //RegularExpressionValidator273.Enabled = false;
                                            //RegularExpressionValidator274.Enabled = false;
                                            //RegularExpressionValidator8.Enabled = false;
                                            //RegularExpressionValidator7.Enabled = false;
                                            //RegularExpressionValidator6.Enabled = false;
                                            //RegularExpressionValidator3.Enabled = false;
                                            //RegularExpressionValidator2.Enabled = false;
                                            //RegularExpressionValidator272.Enabled = false;
                                            //RegularExpressionValidator275.Enabled = false;
                                            //RegularExpressionValidator276.Enabled = false;
                                            //RequiredFieldValidator40.Enabled = false;
                                            //RequiredFieldValidator41.Enabled = false;
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
                                try
                                {
                                    transaction.Rollback();
                                }
                                catch
                                {
                                    Alert.Show("Exception Caused Transaction Rollback");
                                }
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
                else
                {
                    Alert.Show("Please check the size of uploaded files.");
                }

                //}
                //else
                //{
                //    Alert.Show("Upload status: Upload Photo, Singnature in JPEG formate and Documents in PDF formate");
                //}

            }
            catch(Exception ex)
            {
                //        Alert.Show("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
                Alert.Show("Upload status: The file could not be uploaded.");

            }
            finally
            {
                if (constr != null)
                {
                    constr.Close();
                }
            }
        }
        else
        {
            Alert.Show("No file selected");
        }
    }

    private bool validateUploadedFiles()
    {
        bool isValid = true;

        int filesize80kb = 80 * 1024;
        int filesize300kb = 300 * 1024;
        if (FileUpload1.HasFile && FileUpload1.FileBytes.Length > filesize80kb)
        {
            isValid = false;
        }
        else if (FileUpload2.HasFile && FileUpload2.FileBytes.Length > filesize80kb)
        {
            isValid = false;
        }
        else if (FileUpload3.HasFile && FileUpload3.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload4.HasFile && FileUpload4.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload5.HasFile && FileUpload5.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload6.HasFile && FileUpload6.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload7.HasFile && FileUpload7.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload8.HasFile && FileUpload8.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload9.HasFile && FileUpload9.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        else if (FileUpload10.HasFile && FileUpload10.FileBytes.Length > filesize300kb)
        {
            isValid = false;
        }
        return isValid;
    }

    protected void FileUpload1_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload1.FileBytes.Length > 80 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload2_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload2.FileBytes.Length > 80 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }

    protected void FileUpload3_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload3.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload4_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload4.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload5_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload5.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload6_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload6.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload7_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload7.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload8_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload8.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload9_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload9.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    protected void FileUpload10_SizeValidator_serverValidate(object source, ServerValidateEventArgs args)
    {
        if (FileUpload10.FileBytes.Length > 300 * 1024)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
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
        if (disability.SelectedItem.Text == "Other Disability")
        {
            tb_disability.Visible = true;
        }
        else
        {
            tb_disability.Visible = false;
        }
        disability.Focus();
    }
    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (state.SelectedItem.Value.ToString() == "Uttar Pradesh" || state.SelectedItem.Value.ToString() == "---Select State---")
        {
            //ostate.Enabled = false;
            
            //ostate.SelectedItem.Text = "---Select Other State---";
            //ostate.SelectedValue= "---Select Other State---";
            //ostate.SelectedItem.Value = "---Select Other State---";
            //label_state.Text = "Uttar Pradesh";

            ccode.Enabled = true;
            category.Enabled = true;
        }
        else
        {
            //ostate.Enabled = true;
            //RequiredFieldValidator31.Enabled = true;
            //label_state.Text = state.SelectedItem.Value.ToString();
            category.SelectedItem.Text = "GEN";
            ccode.Text = "GEN";
            ccode.Enabled = false;
            category.Enabled = false;
        }
        state.Focus();
    }




    protected void gotonextbutton_Click(object sender, EventArgs e)
    {
        // Alert.Show(TB_PaymentAmount.Text);
        MultiView1.ActiveViewIndex = 7;
        //MultiView1.ActiveViewIndex = 6;
    }
    protected void accept_submit_button_Click(object sender, EventArgs e)
    {
        /*
        if (pcode.Text == "BTEC" || pcode.Text == "BTECL" || pcode.Text == "MTEC")
        {
            Response.Redirect("~/DownloadForm.aspx");
            
        }
        else
        {
            Response.Redirect("~/payment.aspx");
            
        }*/

        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            using (transaction = constr.BeginTransaction())
            {
                try
                {
                    Query = "update registration set finalcheck=@finalcheck  where uname=@uname and regno=@regno";
                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        //cmd.Parameters.AddWithValue("@fee_amount", Label_fee_amount.Text.Trim());
                        cmd.Parameters.AddWithValue("@uname", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());
                        cmd.Parameters.AddWithValue("@finalcheck", "yes");
                     //   cmd.Parameters.AddWithValue("@fee_amount", Lbl_CourseFinalFee.Text);
                        
                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();
                        if (j == 1)
                        {
                            Response.Redirect("~/PreviewForm.aspx");
                            //Response.Redirect("~/Payment/Gateway.aspx");
/*                            if (pcode.Text == "BTEC" || pcode.Text == "BTECL" || pcode.Text == "MTEC")
                            {
                                Response.Redirect("~/DownloadForm.aspx");
                            }
                            else
                            {
                              //  Response.Redirect("~/payment.aspx");       
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
    }

    protected void Button_Payment_Btech_Click(object sender, EventArgs e)
    {
        TB_PaymentAmount.Text = Label_fee_amount.Text;

        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            int feeamount = 0, final_amount = 0;
            try
            {

                Query = "select temp3 from registration where uname=@uname and regno=@regno";
                //using (SqlCommand cmd_fee = new SqlCommand("select temp3 from registration where uname='" + username.Text.Trim() + "' and regno='" + Label_regno.Text.Trim() + "'", constr))
                using (SqlCommand cmd_fee = new SqlCommand(Query, constr))
                {
                    cmd_fee.Parameters.AddWithValue("@uname", username.Text.Trim());
                    cmd_fee.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());

                    dr = cmd_fee.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            feeamount = Convert.ToInt32(dr[0].ToString());
                        }

                    }

                    if (disability.SelectedItem.Value != "Not Any" || ccode.Text == "SC" || ccode.Text == "ST")
                    {
                        final_amount = feeamount / 2;
                        Label_fee_amount.Text = final_amount.ToString();

                        TB_PaymentAmount.Text = final_amount.ToString();
                        //Label_Fee_Check.Text = final_amount.ToString();
                        //Alert.Show(final_amount.ToString());
                    }
                    else
                    {
                        final_amount = feeamount;
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
                    //  dr.Close();
                    dr.Dispose();
                }
            }


            using (transaction = constr.BeginTransaction())
            {

                try
                {
                    Query = "update registration set ddno=@ddno, bankname=@bankname, paymentamount=@paymentamount, dddate=@dddate where uname=@uname and regno=@regno";

                    //Alert.Show(Label_fee_amount.Text);
                    //using (cmd = new SqlCommand("update registration set fee_amount='" + Label_fee_amount.Text + "' where uname='" + username.Text.Trim() + "' and regno='" + Label_regno.Text.Trim() + "'", constr, transaction))

                    using (cmd = new SqlCommand(Query, constr, transaction))
                    {
                        cmd.Parameters.AddWithValue("@paymentamount", Label_fee_amount.Text);

                        cmd.Parameters.AddWithValue("@ddno", TB_DD_No.Text.Trim());
                        cmd.Parameters.AddWithValue("@bankname", TB_BankName.Text.Trim());

                        cmd.Parameters.AddWithValue("@dddate", TB_DD_Date.Text.Trim());

                        cmd.Parameters.AddWithValue("@uname", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@regno", Label_regno.Text.Trim());
                       // cmd.Parameters.AddWithValue("@flag", "6");

                        j = cmd.ExecuteNonQuery();
                        transaction.Commit();
                        if (j == 1)
                        {
                            //Response.Redirect("payment.aspx");
                            if (pcode.Text == "BTEC" || pcode.Text == "BTECL" || pcode.Text == "MTEC")
                            {
                                //  Response.Redirect("~/Dashboard2018.aspx");
                               // Alert.Show("After final submit you can't change your details.");
                                MultiView1.ActiveViewIndex = 7;
                            }
                            else
                            {
                                Server.Transfer("payment.aspx");
                            }
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
                finally { }
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
            dcode.Text = "Not Any";
            disability.Enabled = false;
            //  nationality.Text = null;
        }
        else if (DropDownList_Nationality.SelectedItem.Value.ToString() == "Indian")
        {
            //nationality.Visible = false;
            //Label_nationality.Text = "Indian";

            //state.SelectedValue = "---Select State---";
            state.Enabled = true;
            disability.Enabled = true;
            category.Enabled = true;
        }
        DropDownList_Nationality.Focus();
    }

    //protected void religion_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    if (religion.SelectedItem.Value.ToString() == "Other Religion")
    //    {
    //        tb_religion.Visible = true;
    //        Label_religion.Text = tb_religion.Text.Trim();
    //    }
    //    else
    //    {
    //        tb_religion.Visible = false;
    //        Label_religion.Text = religion.SelectedItem.Value.ToString();
    //    }
    //    religion.Focus();
    //}

    protected void CheckBox_declaration_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox_declaration.Checked == true)
        {
            Alert.Show("After final submit you can not edit your form");
            accept_submit_button.Visible = true;
        }
        else
        {
            accept_submit_button.Visible = false;
        }
    }

    protected void LinkButton_Personal_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void LinkButton_mailing_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }

    protected void LinkButton_qualification_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }

    protected void LinkButton_fascilities_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }

    protected void LinkButton_upload_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 5;
    }

    protected void LinkButton_payment_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 6;
    }

    protected void LinkButton_logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Logout.aspx");
       // Server.Transfer("~/Account/Logout.aspx");
    }

    protected void LinkButton_dashboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Dashboard2018.aspx");
    }

    protected void LinkButton_final_submit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 7;
    }

    /*
    public void payment_course()
    {
        string strcategorycode = null, strdisabilitycode = null;
        int feeamount = 0, final_amount_course = 0;

        using (constr = new SqlConnection(connection_string))
        {
            constr.Open();
            // set fee start
            try
            {
                string Query = "select temp3,disabilitycode,ccode from registration where regno=@regno";
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
                            Lbl_CourseFinalFee.Text = feeamount.ToString();
                            //fee_amount.Text = feeamount.ToString();
                            //TB_PaymentAmount.Text = feeamount.ToString();
                            strdisabilitycode = dr[1].ToString();
                            strcategorycode = dr[2].ToString();
                        }
                    }

                    if (strdisabilitycode != "Not Any" || strcategorycode == "SC" || strcategorycode == "ST")
                    {
                        final_amount_course = feeamount / 2;
                        Lbl_CourseFinalFee.Text = final_amount_course.ToString();
                        //fee_amount.Text = final_amount_course.ToString();
                        //TB_PaymentAmount.Text = final_amount_course.ToString();
                        //Label_fee_amount.Text = final_amount.ToString();
                        //  Label_Fee_Check.Text = final_amount_course.ToString();
                        ////Alert.Show(final_amount.ToString());
                    }
                    else
                    {
                        final_amount_course = feeamount;
                        Lbl_CourseFinalFee.Text = final_amount_course.ToString();
                        //fee_amount.Text = final_amount_course.ToString();
                        //TB_PaymentAmount.Text = final_amount_course.ToString();
                        //  Label_fee_amount.Text = final_amount_course.ToString();
                        //Label_Fee_Check.Text = final_amount.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Lbl_Exception.Text = ex.ToString();
                //Lbl_exception.Text = ex.ToString();
                //Label_Fee_Check.Text = ex.ToString();
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr.Dispose();
                }
            }
        }
    }
    */

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
        if(CheckBox1.Checked==true)
        {
            maddress.Text = paddress.Text;
            maddress1.Text = paddress1.Text;
            maddress0.Text = paddress0.Text;
        }
    }

  
}