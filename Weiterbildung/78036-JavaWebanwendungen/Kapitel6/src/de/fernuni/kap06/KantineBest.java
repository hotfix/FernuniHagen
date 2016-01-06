package de.fernuni.kap06;

public class KantineBest
{
  private String name = "";
  private String vorname = "";
  private String essen = "";
  private String wochentag = "";
  private String personalnr = "";
  private String telefonnr = "";
  private String errorText = "";

  public String getTelefonnr() {
    return telefonnr;
  }

  public void setTelefonnr(String telefonnr) {
    if (telefonnr == null)
      this.telefonnr = null;
    else
      this.telefonnr = telefonnr;
  }

  public String getPersonalnr() {
    return personalnr;
  }

  public void setPersonalnr(String personalnr) {
    if(personalnr == null)
      this.personalnr = "";
    else
      this.personalnr = personalnr;
  }


  public void setName(String wert)
  {
    if(wert == null)
      name = "";
    else
      name = wert;
  }
  public String getName()
  {
  	return name;
  }
  public void setVorname(String wert)
  {
    if(wert == null)
      vorname = "";
    else
      vorname = wert;
  }
  public String getVorname()
  {
  	return vorname;
  }
  public void setEssen(String wert)
  {
    if(wert == null)
      essen = "";
    else
      essen = wert;
  }
  public String getEssen()
  {
  	return essen;
  }
  public void setWochentag(String wert)
  {
    if(wert == null)
      wochentag = "";
    else
      wochentag = wert;
  }
  public String getWochentag()
  {
  	return wochentag;
  }
  public void setErrorText(String wert)
  {
    if(wert == null)
      errorText = "";
    else
      errorText = wert;
  }
  public String getErrorText()
  {
  	return errorText;
  }

  public boolean checkKonto()
  {
    if(name.equals("Meier"))
    {
    	errorText = "Konto nicht gedeckt!";
      return false;
    }
    else
    {
      errorText = "";
      return true;
    }
  }

  public boolean checkInput()
  {
  	if (name.equals("") | vorname.equals("") | essen.equals("") | personalnr.equals(""))
  	{
  	  errorText = "Es müssen alle Felder ausgefüllt und mindestens ein Essen gewählt sein!";
  	  return false;
  	}
  	else
  	{
  	  errorText = "";
  	  return true;
  	}
  }
}

