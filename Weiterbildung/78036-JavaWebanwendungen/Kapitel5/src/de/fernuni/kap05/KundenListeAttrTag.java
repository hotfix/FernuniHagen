package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class KundenListeAttrTag extends TagSupport
{
  private String[] Kunden = {"Kunde 1", "Kunde 2", "Kunde 3", "Kunde 4"};
  private boolean useList = false;

  public int doStartTag()
  {
  	try
  	{
  		JspWriter out = pageContext.getOut();
  		for(int i = 0; i < Kunden.length; i++)
  		{
        if(useList)
       		out.println("<li>" + Kunden[i] + "<br />");
       	else
       		out.println(Kunden[i] + "<br />");
      }
  	}
    catch(IOException ioEx)
    {}

    return SKIP_BODY;
  }

  public int doEndTag()
  {
  	try
  	{
  		JspWriter out = pageContext.getOut();
      if(useList)
        out.println("</ul>");
  	}
    catch(IOException ioEx)
    {}

    return EVAL_PAGE;
  }
  
  public void setUseList(String value)
  {
  	useList = value.toUpperCase().equals("TRUE");
  }
}
