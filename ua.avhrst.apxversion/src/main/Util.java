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

  // Declaring ANSI_RESET so that we can reset the color
   static final String ANSI_RESET = "\u001B[0m";
  
  // Declaring the color
  // Custom declaration
   static final String ANSI_YELLOW = "\u001B[33m";
   static final String ANSI_BLUE = "\u001B[34m";
   static final String ANSI_GREEN = "\u001B[32m";
  

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

  public static String GetPropertyValue(String valueName, String askDescription, BufferedReader consReader,
      String defValue) throws IOException {
    String val = props.getProperty(valueName);
    if (val == null) {
      System.out.println(askDescription);
      val = consReader.readLine();
      if (val.equals("") && defValue != null) {
        val = defValue;
        System.out.println("Default value is set: " + defValue);
      } else {

        if (val.equals("")) {
          System.out.println("The value " + valueName + " cannot be empty!");
          System.exit(0);

        }
      }
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

  public static String GetChangeID(BufferedReader consReader, String valueName) throws IOException {
    String changeID = props.getProperty(valueName);
    String val = null;
    if (changeID != null) {
      System.out.print(ANSI_GREEN);
      System.out.print("Do you want to restore changes from " + changeID + " ? (Y/N) default: N");
      System.out.println(ANSI_RESET);
      String resp = consReader.readLine();
      if (resp.equals("Y")) {
        val = changeID;
        System.out.println("Changes with changeID: " + changeID + " will be loaded");
      }
    }
    return val;
  }

  public static void saveFile(String appId, String dirName, String fileName, String textScript) {

   String fileFullPath = App.mainPath + "/" + dirName + "/" + fileName;
   String fullDirPath = App.mainPath + "/" + dirName;
   File exportFile = new File(fileFullPath);
   if (!exportFile.exists() && textScript != null) {
      try {
        Files.createDirectories(Paths.get(fullDirPath));
      } catch (IOException e1) {
        System.out.println("The files of the exported application (application " + appId
            + ") were not found! Please export the application from apex (zip) and unpack it into the current directory.");
        System.out
            .println("The new version of the page will be written in " + fileFullPath);
        e1.printStackTrace();
        return;
      }
    }

    if (textScript != null) {
      try {
        FileWriter fileWriter = new FileWriter(fileFullPath);
        PrintWriter printWriter = new PrintWriter(fileWriter);
        printWriter.print(textScript);
        printWriter.close();
        System.out.print(ANSI_YELLOW);
        System.out.print("+ loaded file: " +fileFullPath);
        System.out.println(ANSI_RESET);
        fileWriter.close();
      } catch (IOException e1) {
        e1.printStackTrace();
        return;
      }
    } else {
      try {
        Files.delete(Paths.get(fileFullPath));
        System.out.print(ANSI_BLUE);
        System.out.print("- deleted file: " + fileFullPath);
        System.out.println(ANSI_RESET);
      } catch (IOException e) {
       // e.printStackTrace();
      }

    }

  }

}
