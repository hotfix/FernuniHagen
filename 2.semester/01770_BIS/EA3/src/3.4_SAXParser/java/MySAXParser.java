package de.shureg.fuh.m1770.ea34;

import javax.xml.parsers.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import java.io.*;


/**
 * XML Parser mit Hilfe  von SAX Parser
 * @author Alexander
 * @date   01.11.2015
 */
public class MySAXParser {

    public static void main(String ... args){

        final String FILE_PATH = "src/de/shureg/fuh//m1770/ea31/student.xml";

        try {

            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser saxParser = factory.newSAXParser();

            // eigenen Defaulthandler erzeugen und Methoden überschreiben
            DefaultHandler handler = new DefaultHandler(){

                @Override
                public void startDocument() {
                    System.out.println("Document starts.");
                }

                @Override
                public void startElement(String namespaceURI, String localName,
                                         String qName, Attributes atts) {
                    System.out.println("qName Start: " + qName);
                    for (int i = 0; i < atts.getLength(); i++)
                        System.out.printf("Attribut no. %d: %s = %s%n", i,
                                atts.getQName(i), atts.getValue(i));
                }

                @Override
                public void endElement(String namespaceURI, String localName, String qName) {
                    System.out.println("qName End: " + qName);
                }

                @Override
                public void characters(char[] ch, int start, int length) {
                    System.out.println("Characters: " + new String(ch, start, length));
                }


                @Override
                public void endDocument() {
                    System.out.println("Document ends.");
                }
            };
            saxParser.parse( new File(FILE_PATH), handler );

        } catch (ParserConfigurationException | SAXException | IOException e) {
            e.printStackTrace();
        }
    }
}
