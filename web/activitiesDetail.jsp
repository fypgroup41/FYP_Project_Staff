<%-- 
    Document   : newjsp
    Created on : Jan 18, 2016, 5:51:54 PM
    Author     : test
--%>

<%@page import="ict.caculate.DateCalculate"%>
<%@page import="db.bean.MemberBean"%>
<%@page import="db.bean.ActivitiesRecordBean"%>
<%@page import="db.bean.Atype_ABean"%>
<%@page import="db.bean.ActivityTypeBean"%>
<%@page import="db.bean.DistrictBean"%>
<%@page import="db.bean.UserBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="db.bean.ActivitiesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.handle.DB_Select"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/sourceLink.jsp"/>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <body>

        <jsp:include page="/header.jsp"/>
        <%
            DateCalculate dc = new DateCalculate();
            SimpleDateFormat sdfbd = new SimpleDateFormat("yyyy-MM-dd");
            String dbUser = this.getServletContext().getInitParameter("dbUsername");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            DB_Select db_select = new DB_Select(dbUrl, dbUser, dbPassword);
            ArrayList district_data = db_select.queryDistrict();
            ArrayList activityType = db_select.queryListAll("activityType", "");
            ArrayList activityTypeActivities = db_select.queryListAll("atype_A", " where activitiesID='" + request.getParameter("actID") + "'");
        %>
        
        <%            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            UserBean user = (UserBean) session.getAttribute("userInfo");
            //ArrayList aryData = db_select.queryActivitiesBySql("SELECT * FROM activities where activitiesID=\"" + request.getParameter("actID") + "\"");

            ArrayList aryData = db_select.queryListAll("activities", " where activitiesID=\"" + request.getParameter("actID") + "\"");
            for (int i = 0; i < aryData.size(); i++) {
                ActivitiesBean act = (ActivitiesBean) aryData.get(i);
        %>



        <%                    String dateInString = act.getDate();
            Date date = sdf.parse(dateInString);
        %>
        <br>
        <span style="text-align:center"><h1><%= act.getName()%></h1></span>
        <br>
        <br>



        <form method="post" action="updateServlet">
            <input type="hidden" name="table_type" value="activities") >
            <input type="hidden" name="item_id" value="<%=act.getActivitiesID()%>">
            <table  align="center" >

                <tr><td>ActivitiesID</td><td><%=act.getActivitiesID()%></td></tr>
                <tr><td>Name</td><td><input type="text" name="name" value="<%=act.getName()%>" size="35"></td></tr>

                <tr><td>districtNo</td><td>       <select name="districtNo">
                            <%          for (int j = 0; j < district_data.size(); j++) {
                                    DistrictBean district = (DistrictBean) district_data.get(j);
                            %>
                            <% if (!act.getDistrictNo().toString().equals(district.getDistrictID().toString())) {%>
                            <option value="<%=district.getDistrictID()%>"><%=district.getName()%></option>
                            <% } else {%>
                            <option value="<%=district.getDistrictID()%>" selected><%=district.getName()%></option>
                            <%   }
                                }

                            %>
                        </select></td></tr>
                <tr><td>quota</td><td><input type="text" name="quota" value="<%=act.getQuota()%>" size="35" min="0"></td></tr>

                <tr><td>targetAgeMax</td><td>
                        <input type="range" style="width:auto;display: initial;" name="targetAgeMax"  value="<%=act.getTargetAgeMax()%>"  size="35" min="3" max="99"  onchange="targetAgeMax_show(this.value)"><span id ="targetAgeMax_show"><%=act.getTargetAgeMax()%></span>
                        <script type="text/javascript">
                            function targetAgeMax_show(newValue)
                            {
                                document.getElementById("targetAgeMax_show").innerHTML = newValue;
                            }
                        </script>
                    </td></tr>
                <tr><td>targetAgeMin</td><td><input type="range" style="width:auto;display: initial;" name="targetAgeMin" value="<%=act.getTargetAgeMin()%>" size="35"  min="3" max="99" onchange="targetAgeMin_show(this.value)"><span id ="targetAgeMin_show"><%=act.getTargetAgeMin()%></span>
                        <script type="text/javascript">
                            function targetAgeMin_show(newValue)
                            {
                                document.getElementById("targetAgeMin_show").innerHTML = newValue;
                            }
                        </script>

                    </td></tr>
                <tr><td>deadline</td><td><input type="text" name="deadline" value="<%=act.getDeadline()%>" size="35"></td></tr>
                <tr><td>venue</td><td><input type="text" name="venue" value="<%=act.getVenue()%>" size="35"></td></tr>
                <tr><td>date</td><td><input type="text" name="date" value="<%=act.getDate()%>" size="35"></td></tr>
                <tr><td>tag</td><td><input type="text" name="tag" value="<%=act.getTag()%>" size="35"></td></tr>
                <tr><td>description</td><td><textarea name="description" ><%=act.getDescription()%></textarea></td></tr>
                <tr><td>districtNo</td><td>       <select name="activityType">
                            <%
                                Atype_ABean activityTypeActivities_val = (Atype_ABean) activityTypeActivities.get(0);
                                for (int j = 0; j < activityType.size(); j++) {
                                    ActivityTypeBean activityType_val = (ActivityTypeBean) activityType.get(j);
                            %>
                            <% if (!activityType_val.getActivityTypeID().toString().equals(activityTypeActivities_val.getActivityTypeID().toString())) {%>
                            <option value="<%=activityType_val.getActivityTypeID()%>"><%=activityType_val.getTypeName()%></option>
                            <% } else {%>
                            <option value="<%=activityType_val.getActivityTypeID()%>" selected><%=activityType_val.getTypeName()%></option>
                            <%   }
                                }

                            %>
                        </select></td></tr>                


                <tr><td>       <br><br>    <input type="submit" value="Update"></td><td></td></tr>



            </table>


            <br>




            <a href="deleteServlet?table_type=activities&item_id=<%=act.getActivitiesID()%>">Delete Link</a>



            <%   }

            %>


        </form>
        <h3>Activities Member Record</h3>
        <table border="1">

            <%         ArrayList activitiesRecord = db_select.queryListAll("ActivitiesRecord", " where activitiesID=\"" + request.getParameter("actID") + "\"");
                for (int j = 0; j < activitiesRecord.size(); j++) {
                    ActivitiesRecordBean activitiesRecord_val = (ActivitiesRecordBean) activitiesRecord.get(j);
                    ArrayList member_aryData = db_select.queryListAll("member", " where memberID='" + activitiesRecord_val.getMemberID() + "'");
                    MemberBean member_val = (MemberBean) member_aryData.get(j);

            %>

            <tr><th>Member ID</th><th>District ID</th><th>Age</th><th>Nick Name</th><th>Status</th></tr>
            <tr><td><%= activitiesRecord_val.getMemberID()%></td><td><%=member_val.getDistrictID()%></td><td>
                    <%
                        String bate = member_val.getBirthday();
                        Date bd = sdfbd.parse(bate);
                        out.print(dc.calculateAge(bd));
                    %>




                </td><td><%=member_val.getNickName()%></td><td><%= activitiesRecord_val.getState()%></td></tr>




            <%

                }
            %>



        </table>



    </body>
</html>
