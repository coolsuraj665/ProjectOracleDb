<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project1.aspx.cs" Inherits="ProjectDep.Project1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
    <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 205px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div>
                <center>

                <asp:GridView ID="gvDepartment" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                    Class="table table-striped table-hover "
                    ShowFooter="True"
                    DataKeyNames="DeptId"
                    OnRowEditing="gvDepartment_RowEditing"
                    OnRowCancelingEdit="gvDepartment_RowCancelingEdit"
                    OnRowDeleting="gvDepartment_RowDeleting"
                    OnRowCommand="gvDepartment_RowCommand"
                    OnRowDataBound="gvDepartment_RowDataBound"
                    OnRowUpdating="gvDepartment_RowUpdating"
                    EmptyDataText="There is no data in the GriedView"
                    AutoGenerateColumns="False" AutoGenerateSelectButton="True" CssClass="GridView" OnSelectedIndexChanged="gvDepartment_SelectedIndexChanged">


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
                        <asp:TemplateField HeaderText="DEPARTMENT ID">
                            <ItemTemplate>
                                <asp:Label Text='<%# DataBinder.Eval(Container, "DataItem.DEPTID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDeptId" Text='<%# DataBinder.Eval(Container, "DataItem.DEPTID") %>' runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtDeptIdFooter" runat="server" />
                            </FooterTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DEPARTMENT NAME">
                            <ItemTemplate>
                                <asp:Label Text='<%# DataBinder.Eval(Container, "DataItem.DEPTNAME") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDeptName" Text='<%# DataBinder.Eval(Container, "DataItem.DEPTNAME") %>' runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtDeptNameFooter" runat="server" />
                            </FooterTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ADDRESS">
                            <ItemTemplate>
                                <asp:Label Text='<%# DataBinder.Eval(Container, "DataItem.ADDRESS") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="txtEditDropdownlist" runat="server">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="txtDropDownListFooter" runat="server">
                                </asp:DropDownList>
                            </FooterTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/icon/Edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/icon/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ImageUrl="~/icon/save.png" runat="server" CommandName="Update" ToolTip="Save" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/icon/Cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ImageUrl="~/icon/AddNew.png" runat="server" CommandName="AddNew" ToolTip="AddNew" Width="20px" Height="20px" />
                            </FooterTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
            </center>
            </div>
            <br />
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />

            <br />
      <%--      <br />
            <table class="w-100">
                <tr>
                    <td class="auto-style1">EMPLOYEENUMBER</td>
                    <td>
                        <asp:TextBox ID="txtEmployeenumber" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">EMPLOYEENAME</td>
                    <td>
                        <asp:TextBox ID="txtEmployeeName" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">DATE OF BIRTH </td>
                    <td>
                        <asp:TextBox ID="txtdob" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">DATE OF JOINING</td>
                    <td>
                        <asp:TextBox ID="txtdoj" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">BASICPAY</td>
                    <td>
                        <asp:TextBox ID="txtbasicpay" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">DEARNESS ALLOWANCE</td>
                    <td>
                        <asp:TextBox ID="txtdaallowance" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">HR ALLOWANCE</td>
                    <td>
                        <asp:TextBox ID="txthrallowance" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">OTHER ALLOWANCE</td>
                    <td>
                        <asp:TextBox ID="txtOtherAllowance" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">TOTAL SALARY</td>
                    <td>
                        <asp:TextBox ID="txttotalsalary" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">DEPARTMENT ID</td>
                    <td>
                        <asp:TextBox ID="txtdeptid" runat="server" Width="228px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="txtbtn" runat="server" BackColor="#CC00CC" CssClass="mt-0" Font-Bold="True" Font-Size="Large" ForeColor="Black" CommandName="AddNew" OnClick="txtbtn_Click" Text="Insert" Width="138px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />--%>
            <br />
            <asp:GridView ID="gvEmployeetable" runat="server"  AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                
                
                DataKeyNames="EMPLOYEENUMBER"
                OnRowEditing="gvEmployeetable_RowEditing"
                OnRowCancelingEdit="gvEmployeetable_RowCancelingEdit"
                OnRowDeleting="gvEmployeetable_RowDeleting"
                OnRowCommand="gvEmployeetable_RowCommand"
                OnRowUpdating="gvEmployeetable_RowUpdating"

                ShowFooter="True" 
                ShowHeaderWhenEmpty="True" 
                Width="16px" 
                EmptyDataText="Data Not Found" >

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
                            <asp:Label runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.EMPLOYEENUMBER") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmployeeNumber" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.EMPLOYEENUMBER") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmployeeNumberFooter" runat="server"  />
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

            <br />
        </div>
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
