package com.hpe.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnlineUserListener
 *
 */
@WebListener
public class OnlineUserListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public OnlineUserListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent ev)  { 
         // TODO Auto-generated method stub
    	System.out.println("Ö´ÐÐ");
    	ServletContext application = ev.getSession().getServletContext();
    	Integer i = (Integer) application.getAttribute("number");
    	System.out.println(i);
    	if(i==null){
    		i=1;
    	}else{
    		i++;
    	}
    	application.setAttribute("number", i);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent ev)  { 
    	ServletContext application = ev.getSession().getServletContext();
    	Integer i = (Integer) application.getAttribute("number");
    	System.out.println(i);
    	if(i==null){
    		i=0;
    	}else{
    		i--;
    	}
    	application.setAttribute("number", i);
    }
	
}
