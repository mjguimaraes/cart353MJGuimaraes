class Gender {


  XML yourGender;
  String gender, genderType;

  Gender() {
  }

  void genderEntry(XML[] fileXML) {
    //calling and getting responses from gender response column
    for (int i = 0; i < fileXML.length; i++) {
      yourGender = fileXML[i].getChild("gsx:whatisyourgender");
      gender = yourGender.getContent();

      if (gender.equals("Female")) {
        genderType = "Woman";
      } else if (gender.equals("Male")) {
        genderType = "Man";
      } else if (gender.equals("Prefer not to say")) {
        genderType = "n.a.";
      } else if (gender.equals("Other")) {
        genderType = "Other";
      }

      println(genderType);
    }
  }
}