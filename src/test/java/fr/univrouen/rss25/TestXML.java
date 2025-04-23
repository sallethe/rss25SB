package fr.univrouen.rss25;

import org.junit.jupiter.api.Test;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.net.URL;

import static org.junit.jupiter.api.Assertions.*;

public class TestXML {
    private boolean testRessource() {
        Class<TestXML> getter = TestXML.class;
        URL f1 = getter.getResource("rss25.tp1.xsd");
        URL f2 = getter.getResource("rss25.tp2a.xml");

        return f1 == null || f2 == null;
    }

    @Test
    void shouldFilesExists() {
        assertFalse(testRessource());
    }

    @Test
    void testWithDOM() {
        assert !testRessource();
        SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        Source schemaFile = new StreamSource(TestXML.class.getResource("rss25.tp1.xsd").getFile());
        Schema schema;
        try {
            schema = factory.newSchema(schemaFile);
        } catch (SAXException e) {
            fail();
            return;
        }
        Validator validator = schema.newValidator();
        SimpleErrorHandler errorHandler = new SimpleErrorHandler();
        validator.setErrorHandler(errorHandler);
        try {
            validator.validate(new StreamSource(TestXML.class.getResource("rss25.tp2a.xml").getFile()));
        } catch (Exception e) {
            fail();
            return;
        }
        assertFalse(errorHandler.hasError());
    }
}
