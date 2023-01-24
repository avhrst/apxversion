package main;

public class ApexFile {

    private String fileName;
    private String dirName;

    public ApexFile(String fileName, String dirName) {
        this.fileName = fileName;
        this.dirName = dirName;
    }

    public String getFileName() {
        return fileName;
    }

    public String getDirName() {
        return dirName;
    }

}
