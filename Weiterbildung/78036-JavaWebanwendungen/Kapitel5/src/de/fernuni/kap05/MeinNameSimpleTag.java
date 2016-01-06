package de.fernuni.kap05;

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

/**
 * Created by Alex on 04.01.2016.
 */
public class MeinNameSimpleTag extends SimpleTagSupport {
    private boolean useOnlyFirstName = false;
    private boolean useCity = false;

    public void setUseOnlyFirstName(boolean useOnlyFirstName) {
        this.useOnlyFirstName = useOnlyFirstName;
    }

    public void setUseCity(boolean useCity) {
        this.useCity = useCity;
    }

    public void doTag()
    {
        try
        {
            JspWriter out = getJspContext().getOut();
            if (useOnlyFirstName) {
                out.println("Alexander");
            }else{
                out.println("Alexander XYZ");
                if (useCity){
                    out.println("aus Hamburg");
                }
            }

        }
        catch(IOException ioEx)
        {}

    }
}
