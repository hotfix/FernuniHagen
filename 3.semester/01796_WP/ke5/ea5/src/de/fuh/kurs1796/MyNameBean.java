package de.fuh.kurs1796; /**
 * Created by Alex on 13.05.2016.
 */
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;


@Named
@RequestScoped
public class MyNameBean {

    private String nname;
    private String vname;

    public String getNname() {
        return nname;
    }

    public void setNname(String nname) {
        this.nname = nname;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

}
