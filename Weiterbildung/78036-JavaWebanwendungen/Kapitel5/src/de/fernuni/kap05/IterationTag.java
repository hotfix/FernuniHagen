package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class IterationTag extends BodyTagSupport
{
  private int from = 0;
  private int to = 0;
  private int step = 0;
  private String error = "";

  public void setFrom(String value)
  {
  	try
  	{
  		from = Integer.parseInt(value);
  	}
  	catch(NumberFormatException nfe)
  	{
  		error = "Attribute 'From' enthält keine gültige Zahl.";
  	}
  }

  public void setTo(String value)
  {
  	try
  	{
  		to = Integer.parseInt(value);
  	}
  	catch(NumberFormatException nfe)
  	{
  		error = "Attribute 'To' enthält keine gültige Zahl.";
  	}
  }

  public void setStep(String value)
  {
  	try
  	{
  		step = Integer.parseInt(value);
  	}
  	catch(NumberFormatException nfe)
  	{
  		error = "Attribute 'Step' enthält keine gültige Zahl.";
  	}
  }

  public int doStartTag()
  {
    return EVAL_BODY_TAG;
  }

  public int doAfterBody()
  {
  	BodyContent bc = getBodyContent();
  	JspWriter jw = bc.getEnclosingWriter();

  	try
   	{
   		if(!error.equals(""))
   		  jw.print(error);
   		else
        for(int idx = from; idx <= to; idx += step)
          bc.writeOut(jw);
    }
    catch(IOException ioEx)
    {}

	  return SKIP_BODY;
  }
}
