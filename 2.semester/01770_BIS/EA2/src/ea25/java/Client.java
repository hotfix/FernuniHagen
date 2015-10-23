package de.shureg.fuh.m1770.ea25;

/**
 * Kurs 1770 - Betriebliche Informationssysteme
 * Implementierung des Asynchronen Aufrufs
 * Erstellt :  05.08.2014
 * Ersteller:  Ren?© Ramacher
 */
public class Client {

    public Client() {
        try {
            Caller caller1 = new Caller(null);

            while( !caller1.returned() ) {
                System.out.println("Client is waiting or doing some other work");
                Thread.sleep(500);
            }
            System.out.println("Results received from caller");

            Caller caller2 = new Caller(this);
            System.out.println("Doing a lot of other work");


        } catch( Exception ignored) {

        }
    }

    public void callBack() {
        System.out.println("Results received via callback");
    }

    public static void main(String[] args) {
        new Client();
    }
}