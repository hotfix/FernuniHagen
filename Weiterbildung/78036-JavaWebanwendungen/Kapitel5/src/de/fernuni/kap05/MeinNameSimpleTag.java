package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

/**
 * Created by Alex on 04.01.2016.
 */
public class MeinNameSimpleTag extends SimpleTagSupport {

    public void doTag()
    {
        try
        {
            JspWriter out = getJspContext().getOut();
            out.println("Alexander");
        }
        catch(IOException ioEx)
        {}

    }
}
