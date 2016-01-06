package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

/**
 * Created by Alex on 05.01.2016.
 */
public class UpperTag extends BodyTagSupport{
    private String error = "";

    public int doStartTag()
    {
        return EVAL_BODY_BUFFERED ;
    }

    public int doAfterBody()
    {
        BodyContent bc = getBodyContent();
        String      bodyString  = bc.getString();
        JspWriter   out         = bc.getEnclosingWriter();

        try
        {
            if(!error.equals(""))
                out.print(error);
            else
                out.println(bodyString.toUpperCase());
        }
        catch(IOException ioEx)
        {}

        return SKIP_BODY;
    }
}
