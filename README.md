# Oracle APEX version control tool
The utility is designed to implement version control of APEX application pages.

## How it works
 - The developer exports the application (zip archive) and unpacks it to a directory that is connected to the version control system.
 - Runs the utility in the root of this directory.
 - The utility checks with an interval (by default 5 seconds) changes in APEX pages.
 - The developer must lock the page, make changes and unlock the page.
 - At the moment of unlocking the page, the utility will download and save the current version of the page to the local directory.
 - If the developer forgot to lock the page, the utility will automatically lock the page.

Permanently saving the page file (PL / SQL) and applying version control techniques allows you to organize teamwork with change control and the CICD process.

## Demo

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/060cchJqN4I/0.jpg)](https://www.youtube.com/watch?v=060cchJqN4I)

## Install

Copy the jar file to your project directory and run the command
``` 
java -jar apxversion.jar
```
At the first start, you must specify the parameters necessary for the utility to work.
The parameters can be changed in the config.properties file. If you need to reinstall the settings, simply delete the config.properties file.

## Test
Clone git repo
Run
``` 
java -jar apxversion.jar
```
Open APEX IDE

https://test.apex.rest:8443/ords

Workspace: vcontrol
User: test
Password: Pi31415

Lock page, change page an unlock :)