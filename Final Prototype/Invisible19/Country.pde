class Country {

  XML[] fileXML, temp;
  XML yourCountry;
  String country;
  String [] allCountries;

  Country(XML[] temp) {
    fileXML = temp;
  }

  void countryEntry() {
    //calling and getting responses from country response column
    allCountries = new String[fileXML.length];
    for (int i = 0; i < fileXML.length; i++) {
      yourCountry = fileXML[i].getChild("gsx:whichcountryareyoulivingcurrently");
      country = yourCountry.getContent();

      //checking for blank responses
      if (country == "") {
        country = "[not mentionned]";
      }

      //associate all responses to an array
      allCountries[i] = country;
    }
  }
}