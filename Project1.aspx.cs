using System;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace ProjectDep
{

    public partial class Project1 : System.Web.UI.Page
    {
        OracleConnection objConn;
        OracleCommand objCmd;
        String strSQL;
        String conStr = "password=123456;USER ID=SYSTEM;DATA SOURCE=localhost:1521/orcl";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            objConn = new OracleConnection(conStr);
            objConn.Open();
            if (!Page.IsPostBack)
            {
                PopulateGridView();
                PopulateGridView2();

            }

        }

        void PopulateGridView()
        {
            OracleConnection objConn = new OracleConnection(conStr);
            String strSQL = "Select *from department Order by Deptid";
            OracleDataReader dtReader;
            objCmd = new OracleCommand(strSQL, objConn);
            objConn.Open();
            dtReader = objCmd.ExecuteReader();

            gvDepartment.DataSource = dtReader;
            gvDepartment.DataBind();

            dtReader.Close();
            dtReader = null;
            objConn.Close();
            objConn = null;

        }

        void PopulateGridView2()
        {
            OracleConnection objConn = new OracleConnection(conStr);
            String strSQL = "select * from employeetable order by employeenumber";
            OracleDataReader dtReader;
            objCmd = new OracleCommand(strSQL, objConn);
            objConn.Open();
            dtReader = objCmd.ExecuteReader();
            gvEmployeetable.DataSource = dtReader;

            gvEmployeetable.DataBind();
            // dtReader.Close();
            //  dtReader = null;
            objConn.Close();
            // objConn = null;
        }


        public DataTable DataTableAddressCode()
        {
            OracleDataAdapter dtAdapter = new OracleDataAdapter();
            DataTable dt = new DataTable();
            String conStr = "password=123456;USER ID=SYSTEM;DATA SOURCE=localhost:1521/orcl";
            objConn = new OracleConnection(conStr);
            objConn.Open();

            string strSQL = null;
            strSQL = "select * from Department";

            dtAdapter = new OracleDataAdapter(strSQL, objConn);
            dtAdapter.Fill(dt);

            dtAdapter = null;
            return dt;
        }

        protected void gvDepartment_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDepartment.EditIndex = e.NewEditIndex;
            gvDepartment.ShowFooter = false;
            PopulateGridView();
        }

        protected void gvDepartment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDepartment.EditIndex = -1;
            gvDepartment.ShowFooter = true;
            PopulateGridView();
        }

        protected void gvDepartment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                strSQL = "DELETE FROM Department WHERE Deptid = '" + gvDepartment.DataKeys[e.RowIndex].Value + "'";
                objCmd = new OracleCommand(strSQL, objConn);
                objCmd.ExecuteNonQuery();
                gvDepartment.EditIndex = -1;
                PopulateGridView();
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = "New Record Deleted";
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddNew")
                {
                    TextBox txtDeptId = (TextBox)gvDepartment.FooterRow.FindControl("txtDeptIdFooter");
                    TextBox txtDeptName = (TextBox)gvDepartment.FooterRow.FindControl("txtDeptNameFooter");
                    DropDownList txtAddress = (DropDownList)gvDepartment.FooterRow.FindControl("txtDropDownListFooter");



                    strSQL = "INSERT INTO department (DEPTID, DEPTNAME, ADDRESS) " +
                             " VALUES ('" + txtDeptId.Text + "','" + txtDeptName.Text + "','" + txtAddress.SelectedItem.Value + "')";
                    objCmd = new OracleCommand(strSQL, objConn);
                    objCmd.ExecuteNonQuery();
                    PopulateGridView();
                    lblSuccessMessage.Text = "New Record Added";
                    lblErrorMessage.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            /******Footer***/
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                /**********Address**********/
                DropDownList txtAddress = (DropDownList)e.Row.FindControl("txtDropDownListFooter");
                if (txtAddress != null)
                {
                    txtAddress.DataSource = (DataTable)DataTableAddressCode();
                    txtAddress.DataTextField = "Address";
                    txtAddress.DataValueField = "Address";
                    txtAddress.DataBind();
                }
            }
            /***********Edit*********/

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtDeptId = (TextBox)e.Row.FindControl("txtDeptIdFooter");
                if (txtDeptId != null)
                {
                    txtDeptId.Text = (string)DataBinder.Eval(e.Row.DataItem, "DeptId");
                }

                TextBox txtDeptName = (TextBox)e.Row.FindControl("txtDeptNameFooter");
                if (txtDeptName != null)
                {
                    txtDeptName.Text = (string)DataBinder.Eval(e.Row.DataItem, "DeptName");
                }
                DropDownList txtAddress = (DropDownList)e.Row.FindControl("txtEditDropdownlist");
                if (txtAddress != null)
                {
                    txtAddress.DataSource = (DataTable)DataTableAddressCode();
                    txtAddress.DataTextField = "Address";
                    txtAddress.DataValueField = "Address";
                    txtAddress.DataBind();
                    txtAddress.SelectedIndex = txtAddress.Items.IndexOf(txtAddress.Items.FindByValue((string)DataBinder.Eval(e.Row.DataItem, "Address")));

                }
                gvDepartment.EditIndex = -1;
                gvDepartment.ShowFooter = true;
            }

        }

        protected void gvDepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtDeptId = (TextBox)gvDepartment.Rows[e.RowIndex].FindControl("txtEditDeptId");
            TextBox txtDeptName = (TextBox)gvDepartment.Rows[e.RowIndex].FindControl("txtEditDeptName");
            DropDownList txtAddress = (DropDownList)gvDepartment.Rows[e.RowIndex].FindControl("txtEditDropdownlist");
            strSQL = "UPDATE department SET Deptid = '" + txtDeptId.Text + "' " +
                ",DEPTNAME = '" + txtDeptName.Text + "' " +
                ",ADDRESS = '" + txtAddress.Text + "' " +
                "WHERE DeptId = '" + gvDepartment.DataKeys[e.RowIndex].Value + "'";
            objCmd = new OracleCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();
            PopulateGridView();
            gvDepartment.EditIndex = -1;
            gvDepartment.ShowFooter = true;
            
        }


        protected void gvDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            String strSQL;
            strSQL = "select employeenumber, employeename, TO_CHAR(dob, 'dd-Mon-yyyy') DOB, to_char(dateofjoining, 'dd-Mon-yyyy') dateofjoining, basicpay, employeetable.da_30, HRA25 , employeetable.otherallowance, totalsallary, deptid from employeetable where deptid = '" + gvDepartment.SelectedValue.ToString() + "' order by employeenumber";
            OracleDataReader dtReader;
            objCmd = new OracleCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            gvEmployeetable.DataSource = dtReader;
            gvEmployeetable.DataBind();
            dtReader.Close();
            dtReader = null;
            objConn.Close();
            objConn = null;

        }




        /***************Employee***************/

        protected void gvEmployeetable_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployeetable.EditIndex = e.NewEditIndex;
            
            gvEmployeetable.ShowFooter = true;

            PopulateGridView2();
        }

        protected void gvEmployeetable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                strSQL = "DELETE FROM employeetable WHERE EMPLOYEENUMBER = '" + gvEmployeetable.DataKeys[e.RowIndex].Value + "'";
                objCmd = new OracleCommand(strSQL, objConn);
                objCmd.ExecuteNonQuery();

                gvEmployeetable.EditIndex = -1;
                PopulateGridView2();
                Label1.Text = "";
                Label2.Text = "Record Deleted";
            }
            catch (Exception ex)
            {

                Label1.Text = "";
                Label2.Text = ex.Message;
            }

        }

        protected void gvEmployeetable_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TextBox txtEmployeeID = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditEmployeeNumber");
                TextBox txtEmployeeName = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditEmployeeName");
                TextBox txtDob = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditDob");
                TextBox txtDoj = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditDateOfJoining");
                TextBox txtBasicPay = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditBasicPay");
                TextBox txtDa30 = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditDa30");
                TextBox txtHra25 = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditHRA25");
                TextBox txtOta15 = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditOTA15");
                TextBox txtTotalSallery = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditTotalSallary");
                TextBox txtDeptId = (TextBox)gvEmployeetable.Rows[e.RowIndex].FindControl("txtEditDeptid");
                strSQL = "UPDATE employeetable SET EMPLOYEENUMBER = '" + txtEmployeeID.Text + "' " +
                    ",EMPLOYEENAME = '" + txtEmployeeName.Text + "' " +
                    ",DOB = '" + txtDob.Text + "' " +
                    ",DATEOFJOINING = '" + txtDoj.Text + "' " +
                    ",BASICPAY = '" + txtBasicPay.Text + "' " +
                    ",DA_30 = '" + txtDa30.Text + "' " +
                    ",HRA25 = '" + txtHra25.Text + "' " +
                    ",OTHERALLOWANCE = '" + txtOta15.Text + "' " +
                    ",TOTALSALLARY = '" + txtTotalSallery.Text + "' " +
                    ",DEPTID = '" + txtDeptId.Text + "' " +
                    "WHERE EMPLOYEENUMBER = '" + gvEmployeetable.DataKeys[e.RowIndex].Value + "'";
                objCmd = new OracleCommand(strSQL, objConn);
                objCmd.ExecuteNonQuery();
                gvEmployeetable.ShowFooter = true;
                PopulateGridView2();
                
                Label1.Text = "Record Updated";
                Label2.Text = "";
            }
            catch (Exception ex)
            {

                Label1.Text = "";
                Label2.Text = ex.Message;
            }
        }

        protected void gvEmployeetable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddNew")
                {
                    TextBox txtEmployeeID = (TextBox)gvEmployeetable.FooterRow.FindControl("txtEmployeeNumberFooter");
                    TextBox txtEmployeeName = (TextBox)gvEmployeetable.FooterRow.FindControl("txtEmployeeNameFooter");
                    TextBox txtDob = (TextBox)gvEmployeetable.FooterRow.FindControl("txtDobFooter");
                    TextBox txtDoj = (TextBox)gvEmployeetable.FooterRow.FindControl("txtDateOfJoiningFooter");
                    TextBox txtBasicPay = (TextBox)gvEmployeetable.FooterRow.FindControl("txtBasicPayFooter");
                    TextBox txtDa30 = (TextBox)gvEmployeetable.FooterRow.FindControl("txtDa30Footer");
                    TextBox txtHra25 = (TextBox)gvEmployeetable.FooterRow.FindControl("txtHRA25Footer");
                    TextBox txtOta15 = (TextBox)gvEmployeetable.FooterRow.FindControl("txtOTA15Footer");
                    TextBox txtTotalSallery = (TextBox)gvEmployeetable.FooterRow.FindControl("txtTotalSallaryFooter");
                    TextBox txtDeptId = (TextBox)gvEmployeetable.FooterRow.FindControl("txtDeptidFooter");
                    strSQL = "INSERT INTO employeetable  (EMPLOYEENUMBER, EMPLOYEENAME, DOB, DATEOFJOINING, BASICPAY, DA_30, HRA25, OTHERALLOWANCE, TOTALSALLARY, DEPTID) " +
                        "VALUES('" + txtEmployeeID.Text + "', " +
                        "'" + txtEmployeeName.Text + "', " +
                        "'" + txtDob.Text + "', " +
                        "'" + txtDoj.Text + "', " +
                        "'" + txtBasicPay.Text + "', " +
                        "'" + txtDa30.Text + "', " +
                        "'" + txtHra25.Text + "', " +
                        "'" + txtOta15.Text + "', " +
                        "'" + txtTotalSallery.Text + "', " +
                        "'" + txtDeptId.Text + "')";
                    objCmd = new OracleCommand(strSQL, objConn);
                    objCmd.ExecuteNonQuery();
                    PopulateGridView2();
                    gvEmployeetable.ShowFooter = true;
                    Label1.Text = "New Record Added";
                    Label2.Text = "";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "";
                Label2.Text = ex.Message;
            }

        }

        protected void gvEmployeetable_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployeetable.EditIndex = -1;
            gvEmployeetable.ShowFooter = true;
            PopulateGridView2();

        }

       
    }
}