/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import db.handle.DB_Select;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class InsertServlet extends HttpServlet {

    private DB_Select db_select;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String dbUser = this.getServletContext().getInitParameter("dbUsername");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db_select = new DB_Select(dbUrl, dbUser, dbPassword);
        PrintWriter out = response.getWriter();
        try {

            String table_type = null;
            table_type = request.getParameter("table_type");

            if (table_type.equals("activities")) {
                String item_id = null;
                String name = null;
                String districtNo = null;
                String quota = null;
                String targetAgeMax = null;
                String targetAgeMin = null;
                String deadline = null;
                String venue = null;
                String date = null;
                String tag = null;
                String activityType = null;
                String description = null;
                activityType = request.getParameter("activityType");
                item_id = request.getParameter("item_id");
                name = request.getParameter("name");
                districtNo = request.getParameter("districtNo");
                quota = request.getParameter("quota");
                targetAgeMax = request.getParameter("targetAgeMax");
                targetAgeMin = request.getParameter("targetAgeMin");
                deadline = request.getParameter("deadline");
                venue = request.getParameter("venue");
                date = request.getParameter("date");
                tag = request.getParameter("tag");
                description = request.getParameter("description");
                String sql = " INSERT INTO `activities` (`activitiesID`, `name`, `districtNo`, `quota`, `remain`, `targetAgeMax`, `targetAgeMin`, `deadline`, `venue`, `date`, `tag`, `staffID`, `sqID`, `description`) VALUES ('92', 'Activity9aaa', '4', '24', '17', '65', '32', '2016-09-25 17:00:00', 'Sham Shui Po District - 417', '2016-10-25 01:07:00', '#aerobic, #sport', '10', '1', 'Activity9 ... to be coming soon.....')";
                boolean isSuccess = db_select.editRecordBySql(sql);
                sql = " UPDATE ATYPE_A SET activityTypeID='" + activityType + "' WHERE activitiesID='" + item_id + "'";
                isSuccess = db_select.editRecordBySql(sql);
                request.setAttribute("status", "Update Success");
                RequestDispatcher rd
                        = request.getServletContext().getRequestDispatcher("/updateSucess.jsp");
                rd.forward(request, response);

            }

            if (table_type.equals("activityBudget")) {
                String item_id = null;
                String itemName = null;
                String itemType = null;
                String cost = null;
                String number = null;
                String remark = null;
                item_id = request.getParameter("item_id");
                itemName = request.getParameter("itemName");
                itemType = request.getParameter("itemType");
                cost = request.getParameter("cost");
                number = request.getParameter("number");
                remark = request.getParameter("remark");
                String sql = " UPDATE ACTIVITYBUDGET SET  itemName='" + itemName + "', itemType='" + itemType + "', cost=" + cost + ",number=" + number + " ,remark='" + remark + "' WHERE itemID='" + item_id + "'";
                boolean isSuccess = db_select.editRecordBySql(sql);
                request.setAttribute("status", "Update Success");
                RequestDispatcher rd
                        = request.getServletContext().getRequestDispatcher("/activitiesBudget.jsp");
                rd.forward(request, response);
            }

        } catch (Exception ex) {

            out.println(ex.getMessage());
        }
    }

}
