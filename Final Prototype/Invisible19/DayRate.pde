class DayRate {

  //variables to store info about bad/good day
  XML[] fileXML, temp;
  XML yourDayRate;
  int yourRate;
  String yourDay;
  int [] allRates;
  String [] allDayRates;

  DayRate(XML[] temp) {
    fileXML = temp;
  }

  void rateEntry() {
    allRates = new int[fileXML.length];
    allDayRates = new String[fileXML.length];
    //calling and getting responses from day rate response column
    for (int i = 0; i < fileXML.length; i++) {
      yourDayRate = fileXML[i].getChild("gsx:howwouldyourateyourdaytoday");
      //responses from spreadsheet return an integer
      yourRate = yourDayRate.getIntContent(); 

      //associate to a string
      if (yourRate == 1) {
        yourDay = "bad day";
      } else if (yourRate == 2) {
        yourDay = "regular day";
      } else if (yourRate == 3) {
        yourDay = "good day";
      } else {
        yourDay = "[not mentionned]"; //checking for blank responses
      }

      //associate all responses to 2 arrays, one for the text other for the value of survey
      allRates[i] = yourRate;
      allDayRates[i] = yourDay;
    }
  }
}