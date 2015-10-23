package de.shureg.fuh.m1770.ea24;


/**
 * @author Alexander Albrant
 * @date 18.10.2015
 */
class Handler extends Thread {

    private String command;


    public Handler(String command) {
        this.command = command;
        this.start();
    }

    @Override
    public void run() {
        System.out.println("Handler > starts work ... " +this.command);
        try {
            Thread.sleep(10000);
        } catch (InterruptedException exc) {
            exc.printStackTrace();
        }
        System.out.println("Handler > finished .. " +this.command);
    }
}


