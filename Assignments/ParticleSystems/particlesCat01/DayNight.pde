class DayNight {

  int brightLevel;

  DayNight() {
    camera.start(); //starting camera
  }

  int getBrightness() {
    if (camera.available() == true) {
      camera.read();
    }
    camera.loadPixels();
    //collects camera pixels to read the brightness of colour
    for (int x = 0; x < camera.width; x++) {
      for (int y = 0; y < camera.height; y++) {
        int loc = x + y * camera.width;
        float r = red (camera.pixels[loc]);
        float g = green (camera.pixels[loc]);
        float b = blue (camera.pixels[loc]);
        int c = color(r, g, b);
        brightLevel = int(brightness(c));
      }
    }
    return brightLevel;
  }
}