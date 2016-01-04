package de.fernuni.kap05;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
/**
 * Created by Alex on 04.01.2016.
 */
public class MeinNameTag extends TagSupport{

    public int doStartTag()
    {
        try
        {
            JspWriter out = pageContext.getOut();
            out.println("Alexander");
        }
        catch(IOException ioEx)
        {}

        return SKIP_BODY;
    }
}



