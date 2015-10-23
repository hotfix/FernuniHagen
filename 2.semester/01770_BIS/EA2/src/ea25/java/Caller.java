package de.shureg.fuh.m1770.ea25;

import java.io.IOException;

/**
 * Caller Klasse
 * @author Alexander
 * @date  23.10.2015
 */
public class Caller extends Thread{
    private Client client;
    private boolean isReturned = false;

    public Caller(Client client) {
      this.client = client;
        this.start();
    }

    @Override
    public void run(){
        System.out.println("Caller start ...");

        try {
            System.out.println("Caller do some job... ");
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (this.client != null) {
            this.client.callBack();
        }
        System.out.println("Caller finished job... ");
        this.isReturned = true;
    }

    public boolean returned() {
        return isReturned;
    }
}
