# 7.Datenbankzugriff

## 7.1 Einführung

- **Abfrageergebnis**: Es macht in der Regel keinen Sinn, sehr große Datenmengen als Abfrageergebnisse zurückzuliefern. 
- **Performance**: Der Benutzer möchte nicht mehrere Minuten auf eine Antwort warten
- **Benutzerrechte**: Es müssen Voraussetzungen geschaffen und die Benutzerrechte beachtet werden. z.b für Lesen, schreiben, bearbeiten und löschen
- **Webserver**: minimalen Overhead bei der Kommunikation mit dem Webserver.

## 7.3 Zugriff auf MySQL über JDBC
>Zum Herstellen einer Verbindung zu einer Datenbank ist ein so genannter Verbindungs- bzw. Connection-String notwendig. Dieser legt fest, wo sich die Datenbank befindet und übergibt bei Bedarf weitere Informationen wie einen Benutzernamen oder ein Passwort.