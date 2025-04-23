package fr.univrouen.rss25;

public class Main {
    public static void main(String[] args) {
        TestXSLT test = new TestXSLT();
        try {
            test.createHTML("test.xml", "rss25.tp3.xslt", "./test.html");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}