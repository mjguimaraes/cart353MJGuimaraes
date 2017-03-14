class Source {

  //variable to store Google spreadsheet ID
  String spreadsheetID;
  //variables to store XML data
  XML invisible; 
  XML[] entriesArray;

  Source() {
  }

  XML[] entries() {
    //calling Google spreadsheet XML responses file
    spreadsheetID = "1zLK2gKb-BaVQATpt5bH1aVI8Imnw24cF3Ss8sDfl_QY";
    invisible = loadXML("https://spreadsheets.google.com/feeds/list/" + spreadsheetID + "/1/public/full");
    //creating a XML Array object to store columns from spreadsheet
    XML[] entriesArray = invisible.getChildren("entry");
    return entriesArray;
  }
}