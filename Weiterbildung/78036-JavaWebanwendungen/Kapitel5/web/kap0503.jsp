<%@ taglib uri="/Kap05Tags" prefix="t" %>
<html>
  <head></head>
  <body>
    <h3>Kundeliste Version 1</h3>
    <t:KundenListe1 />

    <h3>Kundeliste Version 2</h3>
    <t:KundenListe2 />

    <h3>Kundeliste Version 3</h3>
    <t:KundenListe3 useList="true" />

    <h3>Iterationen</h3>
    
    <table>
    <t:Iteration from="1" to="4" step="1">
      <tr>
        <t:Iteration from="1" to="2" step="1">
          <td>
            Test
          <td>
        </t:Iteration>
      </tr>
    </t:Iteration>
    </table>
  </body>
</html>

