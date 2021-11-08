# Oracle APEX version control tool
The utility is designed to implement version control of APEX application pages.

## 2.0 New version.
- Added automatic generation of the install.sql file when adding or modifying components.
- Versioning changes to application settings.
- Versioning of almost all APEX components. Templates and breadcrumbs are not versioned, everything else is tracked.
- In the parameter file, you can specify the path to the application files.
- Missing directories and files are automatically created if they are missing. Existing files are overwritten.

## 1.1 update - support LOV versioning
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/oqcI-fjBfIY/0.jpg)](https://www.youtube.com/watch?v=oqcI-fjBfIY)


## How it works
 - The developer exports the application (zip archive) and unpacks it to a directory that is connected to the version control system.
 - Runs the utility in the root of this directory.
 - The utility checks with an interval (by default 5 seconds) changes in APEX pages.
 - The developer must lock the page, make changes and unlock the page.
 - At the moment of unlocking the page, the utility will download and save the current version of the page to the local directory.
 - If the developer forgot to lock the page, the utility will automatically lock the page.

Permanently saving the page file (PL / SQL) and applying version control techniques allows you to organize teamwork with change control and the CICD process.

## Demo

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/JBrtDeZcNE4/0.jpg)](https://www.youtube.com/watch?v=JBrtDeZcNE4)

## Install

Copy the jar file to your project directory and run the command
``` 
java -jar apxversion.jar
```
At the first start, you must specify the parameters necessary for the utility to work.
The parameters can be changed in the config.properties file. If you need to reinstall the settings, simply delete the config.properties file.

