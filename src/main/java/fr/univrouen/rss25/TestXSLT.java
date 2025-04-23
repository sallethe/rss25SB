package fr.univrouen.rss25;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.net.URL;

public class TestXSLT {
    public void createHTML(String xmlPath, String xsltPath, String output)
            throws ParserConfigurationException, TransformerException, IOException, SAXException {
        ClassLoader loader = TestXSLT.class.getClassLoader();
        InputStream xml = loader.getResourceAsStream(xmlPath);
        URL xslt = loader.getResource(xsltPath);
        if (xslt == null) throw new FileNotFoundException("XSLT file not found");

        Document xmlDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml);
        Source style = new StreamSource(xslt.openStream(), xslt.toExternalForm());
        Transformer t = TransformerFactory.newInstance().newTransformer(style);

        StringWriter buffer = new StringWriter();
        t.transform(new DOMSource(xmlDoc), new StreamResult(buffer));

        File file = new File(output);
        if (!file.exists()) file.createNewFile();
        BufferedWriter outputWriter = new BufferedWriter(new FileWriter(file));
        outputWriter.write(buffer.toString());
        outputWriter.close();
    }
}
