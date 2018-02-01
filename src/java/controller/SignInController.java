/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
public class SignInController extends SimpleFormController {
    
    public SignInController() {
        setCommandClass(GmailUserDetails.class);
        setCommandName("signinUser");
    }
    
    @Override
  protected ModelAndView onSubmit(HttpServletRequest request,
          HttpServletResponse response, Object command, BindException errors)	
          throws Exception 
        {
               /* GmailUserDetails gm=(GmailUserDetails)command;
                String pageToReturn="";
                String userName=request.getParameter("userName");
                String password=request.getParameter("password");
                Session session = HibernateUtil.getSessionFactory().openSession();
                session.beginTransaction();
                
                Query q=session.createQuery("from GmailUserDetails where userName=:userName and password=:password");
                q.setParameter("userName",userName);
                q.setParameter("password",password);
                List userList=new ArrayList();
                System.out.print(gm.getUserName());
                System.out.print(userList);
                userList=q.list();
                session.getTransaction().commit();
                if(userList.isEmpty())
                {
                    pageToReturn = "SignInFail";
                }
                    else
                        {
                               mvSuccess.addObject("SignInSuccess",userList);
                               pageToReturn="SignInSuccess";
                        }
                
                return new ModelAndView(pageToReturn,"gm",gm); */
            ModelAndView mvSuccess=new ModelAndView("SignInSuccess");
            ModelAndView mvFail=new ModelAndView("SignInFail");
            ModelAndView mvUpdate=new ModelAndView("UpdateForm");
            GmailUserDetails gm=(GmailUserDetails)command;
            String message="Invalid User or Password";
            try{
            
                Session session=HibernateUtil.getSessionFactory().openSession();
                session.beginTransaction();
                //List stu=session.createQuery("from StudentDetails").list();
                String userName=request.getParameter("userName");
                String password=request.getParameter("password");
                Query q=session.createQuery("from GmailUserDetails where userName=:userName and password=:password");
                q.setParameter("userName",userName);
                q.setParameter("password",password);
                ArrayList userList=new ArrayList();
                userList=(ArrayList) q.list();
                
                if(userList.isEmpty())
                {
                 mvFail.addObject("message",message);
                 return mvFail;
                }
                else if(!userList.isEmpty())
                {
                    mvSuccess.addObject("userDetails",userList);
                    mvUpdate.addObject("userDetails",userList);
                }
                mvSuccess.addObject("userName",userName);
                mvSuccess.addObject("password",password);
                session.getTransaction().commit();

            }
            
            catch(Exception e){e.printStackTrace();}
            return mvSuccess;
        }
}
