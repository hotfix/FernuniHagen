package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class KundenListeTag extends TagSupport
{
  private String[] Kunden = {"Kunde 1", "Kunde 2", "Kunde 3", "Kunde 4"};

  public int doStartTag()
  {
  	try
  	{
  		JspWriter out = pageContext.getOut();
  		for(int i = 0; i < Kunden.length; i++)
     		out.println(Kunden[i] + "<br />");
  	}
    catch(IOException ioEx)
    {}

    return SKIP_BODY;
  }
}
