class Country {

  String country;
  
  Country() {
  }

  void countryEntry(XML[] fileXML) {
    //calling and getting responses from country response column
    for (int i = 0; i < fileXML.length; i++) {
      yourCountry = fileXML[i].getChild("gsx:whichcountryareyoulivingcurrently");
      country = yourCountry.getContent();
      
      //checking for blank responses
      if (country == "") {
        country = "n.a.";
      }
      
      println(country); //prints country of residence, or "n.a." for blank responses
    }
  }
}