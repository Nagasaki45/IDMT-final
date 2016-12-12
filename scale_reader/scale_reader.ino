/*
 * The HX711.h is NOT the original one (bodge) but an optimized fork:
 * https://github.com/Nagasaki45/HX711
 * 
 * Download it from github and install it using:
 * Sketch -> Include Library -> Add .ZIP Library...
 * 
 * I cut the SparkFun HX711 jumper to get a faster rate. Before, the rate was
 * ~1 per second, now it's 8x faster.
*/

#include "HX711.h"

#define DOUT 3
#define CLK 2
#define A_GAIN 64
#define B_GAIN 32
// No need to know exact weight. Scaling just to get less data over serial.
#define SCALE_FACTOR 500

HX711 scale(DOUT, CLK);

void setup() {
  Serial.begin(9600);
}

void loop() {
  // `set_gain` also set the channel (load cell) to read
  // and return a reading with previous settings.
  long loadA = scale.set_gain(B_GAIN);
  long loadB = scale.set_gain(A_GAIN);
  Serial.print(loadA / SCALE_FACTOR);
  Serial.print(",");
  Serial.println(loadB / SCALE_FACTOR);
}

