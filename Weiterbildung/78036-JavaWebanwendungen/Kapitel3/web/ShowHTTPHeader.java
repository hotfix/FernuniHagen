import java.applet.Applet;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;

public class ShowHTTPHeader extends Applet implements ActionListener
{
  private TextArea taAusgabe = new TextArea();
  private TextField tfUrl = new TextField();
  private Button btnStart = new Button();

  public void init()
  {
    btnStart.setLabel("Start");
    btnStart.addActionListener(this);

    this.setLayout(new BorderLayout());
    add("Center", taAusgabe);
    add("North", tfUrl);
    add("South", btnStart);
  }

  public void getHeader()
  {
    String text = "";
    int index = 0;
    HttpURLConnection huc;

    taAusgabe.setText("");
    try
    {
      URL url = new URL(tfUrl.getText());
      try
      {
        huc = (HttpURLConnection)url.openConnection();
        huc.setRequestMethod("HEAD");
        if(huc.getResponseCode() == HttpURLConnection.HTTP_OK)
        {
          while((text = huc.getHeaderField(index)) != null)
          {
            taAusgabe.append(huc.getHeaderFieldKey(index) + "==> " + text + "\n");
            index++;
          }
        }
      }
      catch (IOException ex)
      {}
    }
    catch(MalformedURLException e)
    {}
  }

  public void actionPerformed(ActionEvent e)
  {
    getHeader();
  }
}

