<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ProjectDep.Employee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous"/>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:GridView ID="gvEmployeetable" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                
                
                DataKeyNames="EMPLOYEENUMBER" 
                OnRowCancelingEdit="gvEmployeetable_RowCancelingEdit"
                OnRowEditing="gvEmployeetable_RowEditing"
                OnRowDeleting="gvEmployeetable_RowDeleting"
                OnRowUpdating="gvEmployeetable_RowUpdating"
                OnRowCommand="gvEmployeetable_RowCommand"

                ShowFooter="True" ShowHeaderWhenEmpty="True" Width="16px">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
                <Columns>
                    <asp:TemplateField HeaderText="EMPLOYEE NUMBER">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.EMPLOYEENUMBER") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmployeeNumber" runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.EMPLOYEENUMBER") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmployeeNumberFooter" runat="server" ClientIDMode="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EMPLOYEENAME">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.EMPLOYEENAME") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmployeeName" runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.EMPLOYEENAME") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmployeeNameFooter" runat="server" ClientIDMode="Static" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DATE OF BIRTH">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.DOB") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDob" runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.DOB") %>' />
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/icon/663353.png" Width="20px" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ImageButton1" PopupPosition="BottomRight" TargetControlID="txtEditDob" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDobFooter" runat="server" ClientIDMode="Static" />
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/icon/663353.png" Width="20px" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ImageButton2" PopupPosition="BottomRight" TargetControlID="txtDobFooter" />
                        </FooterTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DATE OF JOINING">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.DATEOFJOINING") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <span>
                            <asp:TextBox ID="txtEditDateOfJoining" runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.DATEOFJOINING") %>' />
                            <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" ImageUrl="~/icon/663353.png" Width="20px" />
                            </span>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3"  Format="dd-MMM-yyyy" PopupButtonID="ImageButton3" PopupPosition="BottomRight" TargetControlID="txtEditDateOfJoining"  runat="server"></ajaxToolkit:CalendarExtender>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDateOfJoiningFooter" runat="server" ClientIDMode="Static" />
                            <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ImageUrl="~/icon/663353.png" Width="20px" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MMM-yyyy" PopupButtonID="ImageButton4" PopupPosition="BottomRight" TargetControlID="txtDateOfJoiningFooter" />
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BASIC PAY">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" CssClass="basicpay" Text='<%# DataBinder.Eval(Container, "DataItem.BASICPAY")%>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditBasicPay" runat="server" ClientIDMode="Static" CssClass="basicpay" onkeyup="editcalculate(this.value);" Text='<%# DataBinder.Eval(Container, "DataItem.BASICPAY") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBasicPayFooter" runat="server" ClientIDMode="Static" CssClass="basicpay" onkeyup="calculate(this.value);" />
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DEARNESS ALLOWANCE">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" CssClass="da" Text='<%# DataBinder.Eval(Container, "DataItem.DA_30") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDa30" runat="server" ClientIDMode="Static" CssClass="da" Text='<%# DataBinder.Eval(Container, "DataItem.DA_30") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDa30Footer" runat="server" ClientIDMode="Static" CssClass="da" />
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="HR ALLOWANCE 25%">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" CssClass="hra" Text='<%# DataBinder.Eval(Container, "DataItem.HRA25") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditHRA25" runat="server" ClientIDMode="Static" CssClass="hra" Text='<%# DataBinder.Eval(Container, "DataItem.HRA25") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtHRA25Footer" runat="server" ClientIDMode="Static" CssClass="hra" />
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OTHER ALLOWANCE 15%">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" CssClass="ota" Text='<%# DataBinder.Eval(Container, "DataItem.OTHERALLOWANCE") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditOTA15" runat="server" ClientIDMode="Static" CssClass="ota" Text='<%# DataBinder.Eval(Container, "DataItem.OTHERALLOWANCE") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtOTA15Footer" runat="server" ClientIDMode="Static" CssClass="ota" />
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TOTAL SALLARY">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" CssClass="totalsallary" Text='<%# DataBinder.Eval(Container, "DataItem.TOTALSALLARY") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditTotalSallary" runat="server" ClientIDMode="Static" CssClass="totalsallary" Text='<%# DataBinder.Eval(Container, "DataItem.TOTALSALLARY") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtTotalSallaryFooter" runat="server" ClientIDMode="Static" CssClass="totalsallary" />
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Right" HeaderText="DEPARTMENT ID">
                        <ItemTemplate>
                            <asp:Label runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.DEPTID") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDeptid" runat="server" ClientIDMode="Static" Text='<%# DataBinder.Eval(Container, "DataItem.DEPTID") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDeptidFooter" runat="server" ClientIDMode="Static" />
                        </FooterTemplate>
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CommandName="Edit" Height="20px" ImageUrl="~/icon/Edit.png" ToolTip="Edit" Width="20px" />
                            <asp:ImageButton runat="server" CommandName="Delete" Height="20px" ImageUrl="~/icon/delete.png" ToolTip="Delete" Width="20px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" CommandName="Update" Height="20px" ImageUrl="~/icon/save.png" ToolTip="Save" Width="20px" />
                            <asp:ImageButton runat="server" CommandName="Cancel" Height="20px" ImageUrl="~/icon/Cancel.png" ToolTip="Cancel" Width="20px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton runat="server" CommandName="AddNew" Height="20px" ImageUrl="~/icon/AddNew.png" ToolTip="AddNew" Width="20px" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />

            <asp:Label ID="Label1" runat="server" ForeColor="Green" Text="" />
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="" />
            <br />
    </form>

    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script>
      function calculate(value) {
          let txtDa30Footer = value * 0.30;
          let txtHRA25Footer = value * 0.25;
          let txtOTA15Footer = value * 0.15;
          let txtTotalSallaryFooter = parseInt(value) + parseInt(txtDa30Footer) + parseInt(txtHRA25Footer) + parseInt(txtOTA15Footer);

          document.getElementById("txtDa30Footer").value = txtDa30Footer;
          document.getElementById("txtHRA25Footer").value = txtHRA25Footer;
          document.getElementById("txtOTA15Footer").value = txtOTA15Footer;
          document.getElementById("txtTotalSallaryFooter").value = txtTotalSallaryFooter;

          
      }

      function editcalculate(value) {
          let txtEditDa30 = value * 0.30;
          let txtEditHRA25 = value * 0.25;
          let txtEditOTA15 = value * 0.15;
          let txtEditTotalSallary = parseInt(value) + parseInt(txtEditDa30) + parseInt(txtEditHRA25) + parseInt(txtEditOTA15);

          document.getElementById("txtEditDa30").value = txtEditDa30;
          document.getElementById("txtEditHRA25").value = txtEditHRA25;
          document.getElementById("txtEditOTA15").value = txtEditOTA15;
          document.getElementById("txtEditTotalSallary").value = txtEditTotalSallary;
      }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <script src="js/js.js"></script>
</body>
</html>
