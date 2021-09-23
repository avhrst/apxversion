package main;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

public class Util {

    public static void SetProperty(File propertiesFile, Properties props, String propertyName, String PropertyValue) throws IOException{
          FileWriter writer = new FileWriter(propertiesFile);
            props.setProperty(propertyName, PropertyValue);
            props.store(writer, null);
            writer.close();

    }

    
    
}
