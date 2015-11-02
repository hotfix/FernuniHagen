package de.shureg.fuh.m1770.ea35;
import org.w3c.dom.*;
import org.xml.sax.SAXException;
import javax.xml.parsers.*;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;

/**
 * XML Parser mit Hilfe  von DOM Parser
 * @author Alexander
 * @date   01.11.2015
 */
public class MyDOMParser {

    public static void main(String...args) {
        final String FILE_PATH = "src/de/shureg/fuh//m1770/ea31/";
        final String FILE_NAME = "student.xml";
        try {
            File fXmlFile = new File(FILE_PATH+""+FILE_NAME);
            DocumentBuilderFactory dbFactory= DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document document = dBuilder.parse(fXmlFile);
            // XML werte korrigieren
            document.getDocumentElement().normalize();
            printTree(document.getChildNodes().item(1));

            // Add Node
            Document doc = addLeistungsnachweis(document);
            writeXML2File(doc,FILE_PATH+"newStudent1.xml");

            doc = changeKonto(document);
            writeXML2File(doc,FILE_PATH+"newStudent2.xml");
        } catch (SAXException | IOException | ParserConfigurationException e) {
            e.printStackTrace();
        }

    }

    public static void printTree(Node node) {
        // do something with the current node instead of System.out
        System.out.println("Element: " + node.getNodeName());
        if (node.hasAttributes())
            for (int j = 0; j < node.getAttributes().getLength(); j++)
                System.out.println("Attribut: " + node.getAttributes().item(j));


        NodeList nodeList = node.getChildNodes();
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node currentNode = nodeList.item(i);
            if (currentNode.getNodeType() == Node.ELEMENT_NODE || currentNode.hasChildNodes()) {
                //calls this method for all the children which is Element
                printTree(currentNode);

            } else if (currentNode.getNodeType() == Node.TEXT_NODE && !currentNode.getNodeValue().contains("\n")){
                  System.out.println("Value: " + currentNode.getNodeValue().replaceAll("\\s+","") );
            }
        }
    }

    public static Document addLeistungsnachweis(Document document){
        Node leistungsnachweis = document.getElementsByTagName("Leistungsnachweise").item(0);
        Element kursElement = document.createElement("Kurs");
        kursElement.setAttribute("nummer","1873");
        Element note = document.createElement("Note");
        note.appendChild(document.createTextNode("3,3"));
        Element gesamtpunkte = document.createElement("Gesamtpunkte");
        gesamtpunkte.appendChild(document.createTextNode("100"));
        Element datum = document.createElement("Datum");
        datum.appendChild(document.createTextNode("01.03.2015"));
        Element anzahlVersuche = document.createElement("AnzahlVersuche");
        anzahlVersuche.appendChild(document.createTextNode("3"));
        kursElement.appendChild(note);
        kursElement.appendChild(gesamtpunkte);
        kursElement.appendChild(datum);
        kursElement.appendChild(anzahlVersuche);

        leistungsnachweis.appendChild(kursElement);
        return document;

    }

    public static Document changeKonto(Document document){
        document.getElementsByTagName("Kontonummer").item(0).setTextContent("98654321");
        document.getElementsByTagName("Kontoinhaber").item(0).setTextContent("B.B.");
        document.getElementsByTagName("Bankleitzahl").item(0).setTextContent("21050505");
        return document;
    }

    public static void writeXML2File(Document document,String path){
        // write the content into xml file
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = transformerFactory.newTransformer();
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        }
        DOMSource source = new DOMSource(document);
        StreamResult result = new StreamResult(new File(path));
        try {
            transformer.transform(source, result);
        } catch (TransformerException e) {
            e.printStackTrace();
        }
    }

}
