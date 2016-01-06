package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class KundenListeSimpleTag extends SimpleTagSupport
{
  private String[] Kunden = {"Kunde 1", "Kunde 2", "Kunde 3", "Kunde 4"};

  public void doTag()
  {
  	try
  	{
  		JspWriter out = getJspContext().getOut();
  		for(int i = 0; i < Kunden.length; i++)
     		out.println(Kunden[i] + "<br />");
  	}
    catch(IOException ioEx)
    {}
  }
}

