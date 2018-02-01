/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Table;

/**
 *
 * @author vkunal1996
 */
@Table(name="GmailUserDetails")
public class GmailUserDetails implements java.io.Serializable
{
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String retypePassword;
    private String dob;
    private String gender;
    private String contact;
    private String currentEmail;
    private String location;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRetypePassword() {
        return retypePassword;
    }

    public void setRetypePassword(String retypePassword) {
        this.retypePassword = retypePassword;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCurrentEmail() {
        return currentEmail;
    }

    public void setCurrentEmail(String currentEmail) {
        this.currentEmail = currentEmail;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    public GmailUserDetails(){}
    public GmailUserDetails(String userName){
        this.userName=userName;
    }
    public GmailUserDetails(String userName,String contact){
        this.userName=userName;
        this.contact=contact;
    }
    public GmailUserDetails(String firstName,String lastName,String userName,String password,String retypePassword,String dob,String gender,String contact,String currentEmail,String location){
        this.firstName=firstName;
        this.lastName=lastName;
        this.userName=userName;
        this.password=password;
        this.retypePassword=retypePassword;
        this.dob=dob;
        this.gender=gender;
        this.contact=contact;
        this.currentEmail=currentEmail;
        this.location=location;
    }
}
