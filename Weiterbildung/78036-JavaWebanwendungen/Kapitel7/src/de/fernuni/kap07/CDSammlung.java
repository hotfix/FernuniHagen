package de.fernuni.kap07;

/**
 * Created by Alex on 06.01.2016.
 */
public class CDSammlung {
    private int id;
    private String interpreter;
    private String titel;

    public CDSammlung() {
        this(0,"","");
    }
    public CDSammlung(int id, String interpreter, String titel) {
        this.id = id;
        this.interpreter = interpreter;
        this.titel = titel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIntereter() {
        return interpreter;
    }


    public void setIntereter(String intereter) {
        this.interpreter = intereter;
    }

    public String getTitel() {
        return titel;
    }

    public void setTitel(String titel) {
        this.titel = titel;
    }
}
