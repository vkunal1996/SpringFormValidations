/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validator;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.GmailUserDetails;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author vkunal1996
 */
public class SignUpValidator implements Validator
{
        private Pattern pattern,pattern1,pattern2;
        private Matcher matcher,matcher1,matcher2;
    
        String STRING_PATTERN = "[a-z,A-Z, ]*";
        private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        
        private static final String PHONE_PATTERN="d{10}";
        
        private static final String PASSWORD_PATTERN ="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*])(?=.{8,})";

    @Override
    public boolean supports(Class<?> gmailUserDetails) {
        return GmailUserDetails.class.isAssignableFrom(gmailUserDetails);
    }

    @Override
    public void validate(Object object, Errors errors) {
        
            GmailUserDetails gm=(GmailUserDetails)object;
            
            /*Password Validation*/
            
                
            
                if(gm.getPassword()!=null && !gm.getPassword().isEmpty())
                {
                    if(gm.getPassword().length()<8)
                    {
                     errors.rejectValue("password", "password.notCorrect",
                       "Password must be atleast 8 Character long ");
                    
                        }
                    else{
                    /*pattern2 = Pattern.compile(PASSWORD_PATTERN);
                    matcher2 = pattern2.matcher(gm.getPassword());
                    if (!matcher2.matches()) {
                     errors.rejectValue("password", "password.notCorrect",
                       "Password must contains 1 lowercase ,1 uppercase ,1 numeric  1 special character ");
                    }*/
                    int countlowerchar=0,countupperchar=0,countnumeric=0,countspecial=0;
                    String temppass=gm.getPassword();
                    int length=gm.getPassword().length();
                    int i;
                        for(i=0;i<length;i++)
                        {
                            if(Character.isLowerCase(temppass.charAt(i)))
                            {
                                countlowerchar++;
                            }
                            if(Character.isUpperCase(temppass.charAt(i)))
                            {
                                countupperchar++;
                            }
                            if(temppass.charAt(i)=='!'||temppass.charAt(i)=='@'||temppass.charAt(i)=='#'||temppass.charAt(i)=='$'||temppass.charAt(i)=='%'||temppass.charAt(i)=='^'||temppass.charAt(i)=='&'||temppass.charAt(i)=='*')
                            {
                                countspecial++;
                            }
                            if(Character.isDigit(temppass.charAt(i)))
                            {
                                countnumeric++;
                            }
                        }
                        
                        System.out.println(countlowerchar);
                        System.out.println(countupperchar);
                        System.out.println(countspecial);System.out.println(countnumeric);
                        
                        
                        if(!(countlowerchar>=1&&countupperchar>=1&&countnumeric>=1&&countspecial>=1))
                        {
                            errors.rejectValue("password", "password.notCorrect",
                            "Password must contains 1 lowercase ,1 uppercase ,1 numeric  1 special character(!,@,#,$,%,^,&,*) ");
                   
                        }
                   }
                }
            
            /*--------------------*/
        
            /*Validations for Empty Fields*/
            
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "required", "FirstName is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "required", "LastName is required.");
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "required", "UserName is required.");
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required", "Password is required.");
                
        
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "retypePassword", "required", "Password is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contact", "required", "Contact is required.");
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentEmail", "required", "Email is required.");
                ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location", "required", "Location is required.");
           
            /*-------------------------------*/  
            
            /* SelectBox Validations */
                
             
            /*-------------------------------*/
            
            /*Email Validations*/
            
            if (gm.getCurrentEmail()!= null && !gm.getCurrentEmail().isEmpty()) {
                    pattern = Pattern.compile(EMAIL_PATTERN);
                    matcher = pattern.matcher(gm.getCurrentEmail());
                    if (!matcher.matches()) {
                     errors.rejectValue("currentEmail", "currentEmail.notCorrect",
                       "Enter a valid Email Id");
                    }
            }
            /*---------------------*/
            /*Contact Validations*/
            if(gm.getContact()!=null&& !gm.getContact().isEmpty()){
            
                long temp=0;
                try
                {
                     temp=Long.parseLong(gm.getContact());
                     String temp1=Long.toString(temp);
                     int len=temp1.length();
                     if(len<10)
                     {
                       errors.rejectValue("contact", "contact.notCorrect",
                       "Enter a valid Cotnact Number");
                     }
                }
                catch(Exception e)
                {
                    errors.rejectValue("contact", "contact.notCorrect",
                       "Enter a valid Cotnact Number");
                    
                }
                
                
                
            }
           /*---------------------*/
           
           /*Pasword Validations*/
            if((gm.getPassword()!=null && !gm.getPassword().isEmpty()) && (gm.getRetypePassword()!=null)&&!gm.getRetypePassword().isEmpty()){
                
                if(!gm.getPassword().equals(gm.getRetypePassword()))
                {
                    errors.rejectValue("retypePassword", "retypePassword.notCorrect",
                       "Password Don't Match");
                }
            }
            /*------------------*/
                
            /*User name Validations and email check validations*/
             Session session = HibernateUtil.getSessionFactory().openSession();
             session.beginTransaction();
                if(gm.getUserName()!=null && !gm.getUserName().isEmpty())
                {
                           String hql = "from GmailUserDetails s where s.userName = :first";
                           Query query = session.createQuery(hql);
                           query.setParameter("first",gm.getUserName());
                           List signList = query.list();
        
                           if(!signList.isEmpty()) {
                                  errors.rejectValue("userName", "userName.alreadyExsist",
                                 "Username already exsists");
                           }
                }
                
                if(gm.getCurrentEmail()!=null && !gm.getCurrentEmail().isEmpty())
                {
                           String hql = "from GmailUserDetails s where s.currentEmail = :first";
                           Query query = session.createQuery(hql);
                           query.setParameter("first",gm.getCurrentEmail());
                           List signList = query.list();
        
                           if(!signList.isEmpty()) {
                                  errors.rejectValue("currentEmail", "currentEmail.alreadyExsist",
                                 "Email is already registered with another Account ");
                           }
                }
            
            /*---------------------*/
                
            /*List Box Validations*/
            
              if(gm.getDob().equals("mm/dd/yyyy"))
              {
                  errors.rejectValue("dob", "dob.alreadyExsist",
                                 "Select Valid Date of Birth ");
              }
              
              if(gm.getLocation().equals("Choose"))
              {
                  errors.rejectValue("location", "location.alreadyExsist",
                                 "Select Valid Location ");
              }
              
              if(gm.getGender().equals("Choose"))
              {
                  errors.rejectValue("gender", "gender.alreadyExsist",
                                 "Select Valid Gender ");
              }
            
            /*--------------------------------*/
    }
    
}
