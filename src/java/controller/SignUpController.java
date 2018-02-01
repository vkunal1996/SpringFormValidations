/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GmailUserDetails;
import model.HibernateUtil;
import org.hibernate.Session;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author vkunal1996
 */
public class SignUpController extends SimpleFormController {
    
    public SignUpController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
        setCommandClass(GmailUserDetails.class);
        setCommandName("addUser");
    }
    
    @Override
  protected ModelAndView onSubmit(HttpServletRequest request,
          HttpServletResponse response, Object command, BindException errors)	
          throws Exception 
        {
                GmailUserDetails gm=(GmailUserDetails)command;
                String firstName=request.getParameter("firstName");
                String lastName=request.getParameter("lastName");
                String userName=request.getParameter("userName");
                String password=request.getParameter("password");
                String retypePassword=request.getParameter("retypePassword");
                String dob=request.getParameter("dob");
                String gender=request.getParameter("gender");
                String contact=request.getParameter("contact");
                String currentEmail=request.getParameter("currentEmail");
                String location=request.getParameter("location");
                Session session = HibernateUtil.getSessionFactory().openSession();
                session.beginTransaction();
                
                gm.setFirstName(firstName);
                gm.setLastName(lastName);
                gm.setUserName(userName);
                gm.setPassword(password);
                gm.setRetypePassword(retypePassword);
                gm.setDob(dob);
                gm.setGender(gender);
                gm.setContact(contact);
                gm.setCurrentEmail(currentEmail);
                gm.setLocation(location);
                
                session.save(gm);
                session.getTransaction().commit();
                return new ModelAndView("SignUpSuccess","gm",gm);
        }

    
}
