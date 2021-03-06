package db.bean;

import java.io.Serializable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author test
 */
public class ActivityTimetableBean implements Serializable {

    String activityTimeTableID;
    String activitiesID;
    String detail;
    String startTime;
    String finishTime;

    public ActivityTimetableBean() {
    }

    public ActivityTimetableBean(String activityTimeTableID, String activitiesID, String detail, String startTime, String finishTime) {
        this.activityTimeTableID = activityTimeTableID;
        this.activitiesID = activitiesID;
        this.detail = detail;
        this.startTime = startTime;
        this.finishTime = finishTime;
    }

    public String getActivityTimeTableID() {
        return activityTimeTableID;
    }

    public void setActivityTimeTableID(String activityTimeTableID) {
        this.activityTimeTableID = activityTimeTableID;
    }

    public String getActivitiesID() {
        return activitiesID;
    }

    public void setActivitiesID(String activitiesID) {
        this.activitiesID = activitiesID;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

}
