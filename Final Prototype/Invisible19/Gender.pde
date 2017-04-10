class Gender {

  XML[] fileXML, temp;
  XML yourGender;
  String gender, genderType;
  String [] allGenders;

  Gender(XML[] temp) {
    fileXML = temp;
  }

  void genderEntry() {
    allGenders = new String[fileXML.length];
    //calling and getting responses from gender response column
    for (int i = 0; i < fileXML.length; i++) {
      yourGender = fileXML[i].getChild("gsx:whatisyourgender");
      gender = yourGender.getContent();

      if (gender.equals("Female")) {
        genderType = "woman";
      } else if (gender.equals("Male")) {
        genderType = "man";
      } else if (gender.equals("Prefer not to say")) {
        genderType = "[preferred not mentionning gender]";
      } else if (gender.equals("Other")) {
        genderType = "Other";
      }

      //associate all responses to an array
      allGenders[i] = genderType;
    }
  }
}