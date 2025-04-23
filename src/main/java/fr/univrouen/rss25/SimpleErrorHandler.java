package fr.univrouen.rss25;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class SimpleErrorHandler implements ErrorHandler {
    private boolean errorOccured = false;

    @Override
    public void warning(SAXParseException exception) throws SAXException {
        errorOccured = true;
    }

    @Override
    public void error(SAXParseException exception) throws SAXException {
        errorOccured = true;
    }

    @Override
    public void fatalError(SAXParseException exception) throws SAXException {
        errorOccured = true;
    }

    boolean hasError() {
        return this.errorOccured;
    }
}
