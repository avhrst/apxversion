package main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

import org.jasypt.util.text.BasicTextEncryptor;

public class Util {

  static File propertiesFile = new File("../config.properties");
  static Properties props = new Properties();

  static String secretKey = "PI31415926";

  public static void SetProperty(String propertyName, String PropertyValue) throws IOException {
    FileWriter writer = new FileWriter(propertiesFile);
    props.setProperty(propertyName, PropertyValue);
    props.store(writer, null);
    writer.close();

  }

  public static void NewPropertyFile() throws IOException {
    FileWriter writer = new FileWriter(propertiesFile);
    writer.close();

  }

  public static void ReadPropertyFile() throws IOException {
    // Read properties from disk
    FileReader reader = new FileReader(propertiesFile);
    props.load(reader);
    reader.close();
  }

  public static String GetPropertyValue(String valueName, String askDescription, BufferedReader consReader)
      throws IOException {
    String val = props.getProperty(valueName);
    if (val == null) {
      System.out.println(askDescription);
      val = consReader.readLine();
      SetProperty(valueName, val);
    }
    return val;
  }

  public static String GetPasswordProperty(String valueName, String askDescription, BufferedReader consReader)
      throws IOException {
    String encryptedPassword = props.getProperty(valueName);
    String dbPassword;
    BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
    textEncryptor.setPassword(secretKey);
    if (encryptedPassword == null) {
      System.out.println("Enter the password to connect to the database");
      dbPassword = consReader.readLine();
      encryptedPassword = textEncryptor.encrypt(dbPassword);
      SetProperty(valueName, encryptedPassword);
    } else {
      dbPassword = textEncryptor.decrypt(encryptedPassword);
    }

    return dbPassword;
  }

}
