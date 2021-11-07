package main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Properties;

import org.jasypt.util.text.BasicTextEncryptor;

public class Util {

  static File propertiesFile = new File("config.properties");
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
      System.out.println(askDescription);
      dbPassword = consReader.readLine();
      encryptedPassword = textEncryptor.encrypt(dbPassword);
      SetProperty(valueName, encryptedPassword);
    } else {
      dbPassword = textEncryptor.decrypt(encryptedPassword);
    }

    return dbPassword;
  }

  public static void saveFile(String appId, String dirName, String fileName, String textScript) {
    FileWriter fileWriter;
    try {
      fileWriter = new FileWriter(App.mainPath +"/"+ dirName +"/"+ fileName);

    } catch (Exception e) {
      try {
        Files.createDirectories(Paths.get(App.mainPath +"/"+ dirName));
        fileWriter = new FileWriter(App.mainPath +"/"+ dirName +"/"+ fileName);

      } catch (IOException e1) {
        System.out.println("The files of the exported application (application " + appId
            + ") were not found! Please export the application from apex (zip) and unpack it into the current directory.");
        System.out.println("The new version of the page will be written in " + App.mainPath +"/"+ dirName +"/"+ fileName);
        e1.printStackTrace();
        return;

      }

    }
    PrintWriter printWriter = new PrintWriter(fileWriter);

    printWriter.print(textScript);
    printWriter.close();
    System.out.println("Loaded file: " + App.mainPath +"/"+ dirName +"/"+ fileName);
  }

}
