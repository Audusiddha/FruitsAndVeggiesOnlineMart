<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .textalign {
            text-align:center;
            vertical-align:middle;
            font-size:12pt;
            color:blue;
        }
        .hedaerstyle {
         font-family:Bahnschrift; 
         font-size: 20pt; 
         color: white; 
         background-color:lightseagreen; 
         vertical-align: middle; 
         text-align: center; 
         height:56px;
     } 
        .aligningContent
        {
            font-family: Bahnschrift; 
            font-size: 12pt; 
            color: #000000;
            height:100px;
            vertical-align:bottom;
            text-align:center;
        }
         body{
        background-color: #080710;
        background-image: url('../images/gif8.gif');
        background-size:800px,800px;
        }
       
    </style>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div style="background-color:gainsboro">
     <table style="width:100%">
          <tr>
           <td  colspan="3" class="hedaerstyle"> <span class="glyphicon glyphicon-dashboard"></span> DashBoard</td>                     
       </tr>
         <tr style="height:50px">
             <td colspan="2"></td>
         </tr>
     <tr class="textalign">
        <%--delivery Status chart--%>
         <td class="textalign"> 
             <asp:Label ID="Label1" runat="server" Font-Size="12pt" ForeColor="#0000CC">Profit:</asp:Label>            
                             <br />
             <asp:Chart ID="Chart1" runat="server" Height="180px" Palette="None" Width="280px" BorderlineDashStyle="Solid" TextAntiAliasingQuality="Normal" ToolTip="User Orders By their Status" BorderlineColor="DarkGray" BorderlineWidth="2">
                 <Series>
                     <asp:Series Name="Series1" YValuesPerPoint="4" BorderDashStyle="NotSet" MarkerStyle="Diamond" Palette="Pastel" ChartArea="ChartArea1" ChartType="SplineArea" LabelBorderDashStyle="NotSet" MarkerBorderColor="Black" MarkerSize="8"></asp:Series>
                 </Series>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1" AlignmentOrientation="None" AlignmentStyle="None">
                         <AxisY LineDashStyle="NotSet">
                             <MajorGrid Enabled="False" />
                         </AxisY>
                         <AxisX LineDashStyle="NotSet">
                             <MajorGrid Enabled="False" />
                         </AxisX>
                         <Area3DStyle LightStyle="None" />
                     </asp:ChartArea>
                 </ChartAreas>
             </asp:Chart>                     
         </td>
         <%--User Sign Up chart--%>
         <td class="textalign">
              Monthly Signups 
             <br />
             <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource2" BorderlineColor="DarkGray" BorderlineDashStyle="Solid" BorderlineWidth="2" Palette="Bright" Height="180px" ToolTip="This Month User Signup" Width="280px">
                 <Series>
                     <asp:Series Name="Series1" MarkerBorderWidth="2" MarkerColor="64, 64, 64" MarkerSize="10" MarkerStyle="Cross" XValueMember="RegDate" YValueMembers="cnt" YValuesPerPoint="2" ChartType="Spline">
                     </asp:Series>
                 </Series>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1" BorderDashStyle="Solid">
                         <AxisY>
                             <MajorGrid Enabled="False" />
                         </AxisY>
                         <AxisX IntervalOffsetType="Months" IntervalType="Weeks" LineDashStyle="NotSet">
                             <MajorGrid Enabled="False" />
                             <MinorTickMark Enabled="True" IntervalOffsetType="Months" IntervalType="Hours" TickMarkStyle="InsideArea" />
                             <LabelStyle IntervalOffsetType="Months" IntervalType="Weeks" />
                             <ScaleView SizeType="Weeks" />
                         </AxisX>
                     </asp:ChartArea>
                 </ChartAreas>
             </asp:Chart>   
                    
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT  COUNT(UID) as cnt,RegDate FROM UserMst GROUP BY RegDate"></asp:SqlDataSource>          
         </td>
         <%--show gender wise user--%>
         <td class="textalign">

            <asp:Label ID="Label2" runat="server" Text="Total Number of Users:" ForeColor="#0000CC"></asp:Label>
             <br />
             <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Height="180px" Palette="None" PaletteCustomColors="Aqua; 255, 128, 255" Width="280px" ToolTip="Gender Wise Users" BackImageAlignment="Top" BorderlineColor="DarkGray" BorderlineDashStyle="Solid" BorderlineWidth="2">
                 <Series>
                     <asp:Series ChartType="Pie" Name="Series1" XValueMember="Gender" YValueMembers="Expr2" Legend="Legend1">
                     </asp:Series>
                 </Series>
                 <MapAreas>
                     <asp:MapArea Coordinates="0,0,0,0" Shape="Circle" />
                 </MapAreas>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1">
                         <AxisY>
                             <MajorGrid Enabled="False" />
                         </AxisY>
                         <AxisX>
                             <MajorGrid Enabled="False" />
                         </AxisX>
                         <Area3DStyle Enable3D="True" />
                     </asp:ChartArea>
                 </ChartAreas>
                 <Legends>
                     <asp:Legend AutoFitMinFontSize="8" BackColor="White" BackImageAlignment="BottomRight" LegendStyle="Column" Name="Legend1" DockedToChartArea="ChartArea1" Docking="Bottom" LegendItemOrder="SameAsSeriesOrder">
                     </asp:Legend>
                 </Legends>
                 <Titles>
                     <asp:Title Alignment="MiddleRight" DockedToChartArea="ChartArea1" Name="Title1">
                     </asp:Title>
                 </Titles>
                 <BorderSkin BorderDashStyle="Solid" PageColor="DimGray" />
             </asp:Chart>  <br />
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="SELECT   Gender, COUNT(UID) AS Expr2  FROM UserMst GROUP BY Gender"></asp:SqlDataSource>
             
         </td>
     </tr>

         <%--Product Stock Alerts--%>
         <tr class="textalign">
             <td colspan="3">
                  <br />
                     <div>Product Stock Alerts</div>               
                 <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource3" Palette="None" PaletteCustomColors="Plum; Navy" Width="800px" BorderlineColor="Gray" BorderlineDashStyle="Solid" BorderlineWidth="2" Height="350px" ToolTip="Product Stock Information">
                     <Series>
                         <asp:Series ChartType="Spline" MarkerColor="Red" MarkerSize="10" MarkerStyle="Star4" Name="Series1" XValueMember="PName" YValueMembers="PQty" BackSecondaryColor="White" BorderColor="64, 64, 64" BorderDashStyle="Dot" BorderWidth="2" Color="Navy" ShadowColor="ActiveCaptionText" ShadowOffset="3" YValuesPerPoint="4">
                         </asp:Series>
                     </Series>
                     <ChartAreas>
                         <asp:ChartArea Name="ChartArea1">
                             <AxisY>
                                 <MajorGrid Enabled="False" />
                             </AxisY>
                             <AxisX>
                                 <MajorGrid Enabled="False" />
                             </AxisX>
                         </asp:ChartArea>
                     </ChartAreas>
                 </asp:Chart>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Mycon %>" SelectCommand="select PName,PQty from ProductMst where PQty&lt;=10"></asp:SqlDataSource>
 
             </td>
         </tr>
 </table>
 </div>
</asp:Content>



