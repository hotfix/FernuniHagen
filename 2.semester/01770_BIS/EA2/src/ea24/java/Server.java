package de.shureg.fuh.m1770.ea24;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Kurs 1770 - Betriebliche Informationssysteme
 * Implementierung des Server/Handler-Konzepts
 * Erstellt :  05.08.2014
 * Ersteller:  Ren?© Ramacher
 */
public class Server {

    public Server() {
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                runServer();
            }
        });
        t.start();
    }

    public void runServer() {
        while( true ) {
            try {
                System.out.println("Server > waiting for new task ... ");
                InputStreamReader isr = new InputStreamReader(System.in);
                BufferedReader br = new BufferedReader(isr);

                String test = br.readLine();
                System.out.println("Server > "+ test);
                System.out.println("Server > new handler started");
                Handler handler = new Handler(test);
                Thread.sleep(50);
            } catch( Exception ignored) {

            }
        }
    }

    public static void main(String[] args) {
        new Server();
    }
}