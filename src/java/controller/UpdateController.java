/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.GmailUserDetails;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author vkunal1996
 */
public class UpdateController extends SimpleFormController {
    
    public UpdateController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
         setCommandClass(GmailUserDetails.class);
         setCommandName("updateUser");
    }
    
    protected ModelAndView onSubmit(HttpServletRequest request,
          HttpServletResponse response, Object command, BindException errors)	
          throws Exception 
{
    
            GmailUserDetails gm=(GmailUserDetails)command;
            Session session;
            session=HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String firstName,lastName,userName,password,retypePassword,gender,contact,currentEmail,location;
            firstName=request.getParameter("firstName");
            lastName=request.getParameter("lastName");
            userName=request.getParameter("userName");
            password=request.getParameter("password");
            retypePassword=request.getParameter("retypePassword");
            gender=request.getParameter("gender");
            String dob = request.getParameter("dob");

            contact=request.getParameter("contact");
            currentEmail=request.getParameter("currentEmail");
            location=request.getParameter("location");
            
            String hql="Update GmailUserDetails set firstName=:firstName,lastName=:lastName,password=:password,retypePassword=:retypePassword,gender=:gender,dob=:dob,contact=:contact,currentEmail=:currentEmail,location=:location where userName=:userName";
            Query q = session.createQuery(hql);
            q.setParameter("userName",userName);
            q.setParameter("firstName",firstName);
            q.setParameter("lastName",lastName);
            q.setParameter("password",password);
            q.setParameter("retypePassword",retypePassword);
            q.setParameter("dob",dob);
            q.setParameter("gender",gender);
            q.setParameter("contact",contact);
            q.setParameter("currentEmail",currentEmail);
            q.setParameter("location",location);
            int rl=q.executeUpdate();
            session.getTransaction().commit();
            session.close();
            return new ModelAndView("UpdateSuccess","gm",gm);
}

   
}
