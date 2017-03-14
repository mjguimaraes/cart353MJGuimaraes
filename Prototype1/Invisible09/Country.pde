class Country {


  XML yourCountry;
  String country;
  String [] allCountries;

  Country() {
  }

  void countryEntry(XML[] fileXML) {
    //calling and getting responses from country response column
    allCountries = new String[fileXML.length];
    for (int i = 0; i < fileXML.length; i++) {
      yourCountry = fileXML[i].getChild("gsx:whichcountryareyoulivingcurrently");
      country = yourCountry.getContent();

      //checking for blank responses
      if (country == "") {
        country = "n.a.";
      }
      allCountries[i] = country;
      println(country); //prints country of residence, or "n.a." for blank responses
    }
  }
}