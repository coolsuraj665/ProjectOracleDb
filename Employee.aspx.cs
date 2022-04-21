using System;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace ProjectDep
{
    public partial class Employee : System.Web.UI.Page
    {
        OracleConnection objConn;
        OracleCommand objCmd;
        String strSQL;
        protected void Page_Load(object sender, EventArgs e)
        {
            String conStr = "password=123456;USER ID=SYSTEM;DATA SOURCE=localhost:1521/orcl";
            objConn = new OracleConnection(conStr);
            objConn.Open();
            if (!Page.IsPostBack)
            {
                PopulateGridView2();
            }
        }

        void PopulateGridView2()
        {

            String strSQL;
            strSQL = "select employeenumber, employeename, TO_CHAR(dob, 'dd-Mon-yyyy') DOB, to_char(dateofjoining, 'dd-Mon-yyyy') dateofjoining, basicpay, employeetable.da_30, HRA25 , employeetable.otherallowance, totalsallary, deptid FROM employeetable order by employeenumber, deptid";
            OracleDataReader dtReader;
            objCmd = new OracleCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            gvEmployeetable.DataSource = dtReader;
            gvEmployeetable.DataBind();
            dtReader.Close();
            dtReader = null;

        }

        protected void Page_Unload2()
        {
            objConn.Close();
            objConn = null;
        }

        protected void gvEmployeetable_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployeetable.EditIndex = -1;
            gvEmployeetable.ShowFooter = true;
            PopulateGridView2();
        }

        protected void gvEmployeetable_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployeetable.EditIndex = e.NewEditIndex;
            gvEmployeetable.ShowFooter = false;
            PopulateGridView2();

        }

        protected void gvEmployeetable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            strSQL = "DELETE FROM employeetable WHERE EMPLOYEENUMBER = '" + gvEmployeetable.DataKeys[e.RowIndex].Value + "'";
            objCmd = new OracleCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();

            gvEmployeetable.EditIndex = -1;
            PopulateGridView2();
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
                PopulateGridView2();
                Label1.Text = "New Record Added";
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

    }
}