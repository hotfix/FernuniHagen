package de.fernuni.kap08;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedProperty;

@ManagedBean
@SessionScoped
public class AlterBean {
    @ManagedProperty(value = "10")
    private int alter;
    public int getAlter()
    {
        return alter;
    }
    public void setAlter(int wert)
    {
        alter = wert;
    }
    public String pruefeAlter()
    {
        if(alter < 1)
            return "error";
        else
            return "success";
    }
}
