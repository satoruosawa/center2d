PImage img;

void setup() {
  img = loadImage("./data/poland.png");
  // img = loadImage("./data/japan.png");
  // img = loadImage("./data/honshu.png");

  long totalX = 0;
  long totalY = 0;
  int count = 0;

  PVector northPixel = new PVector(0, img.height);
  PVector southPixel = new PVector(0, -1);
  PVector westPixel = new PVector(img.width, 0);
  PVector eastPixel = new PVector(-1, 0);

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int index = y * img.width + x;
      color c = img.pixels[index];
      if (alpha(c) > 125) {
        if (y < northPixel.y) northPixel = new PVector(x, y);
        if (y > southPixel.y) southPixel = new PVector(x, y);
        if (x < westPixel.x) westPixel = new PVector(x, y);
        if (x > eastPixel.x) eastPixel = new PVector(x, y);
        totalX += x;
        totalY += y;
        count++;
      }
    }
  }
  float avgX = totalX / (float)count;
  float avgY = totalY / (float)count;
  println("count = ", count);
  println("avgX = ", avgX);
  println("avgY = ", avgY);

  println("northPixel = ", northPixel);
  println("southPixel = ", southPixel);
  println("westPixel = ", westPixel);
  println("eastPixel = ", eastPixel);

  // Poland
  float westLong = 14.07;
  float eastLong = 24.09;
  float northLat = 54.50088;
  float southLat = 49.;

  // Japan
  // float westLong = 122.5557;
  // float eastLong = 148.893; // temp
  // float northLat = 45.3328;
  // float southLat = 24.0458; // temp

  // Honshu
  // float westLong = 130.51;
  // float eastLong = 142.4;
  // float northLat = 41.33;
  // float southLat = 33.26;

  float avgLong = map(avgX, westPixel.x, eastPixel.x, westLong, eastLong);
  float avgLat = map(avgY, northPixel.y, southPixel.y, northLat, southLat);
  println("(avgLat, avgLong) = ", avgLat, avgLong);

  // Poland 51.896675 19.255575
  // Japan 36.993397 138.5817
  // Honshu 36.428276 138.1137
}

void draw() {
  background(255);
}
