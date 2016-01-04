package de.fernuni.kap04;

import java.util.*;

public class Kreise
{
    private Random r = null;
    private int anzahl = 0;

    public Kreise()
    {
        r = new Random();
        anzahl = r.nextInt(10) + 1;
    }

    public int getAnzahl() {
        return anzahl;
    }

    public String getContent()
    {
        String html = "";

        for(int i = 1; i <= anzahl; i++)
            html = html + "<img src=\"images/Kreis.gif\">&nbsp;&nbsp;";

        return html;
    }
}