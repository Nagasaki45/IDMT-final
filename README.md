![](report/media/slide.png)

## What?

The Schleikess ("suspenders" in Yiddish) are my final project to the Interactive Digital Multimedia Techniques (ESC742P) module, Media and Arts Technology, Queen Mary University of London.

## The concept

A controller for full-body interactive performance that requires force and effort to play with, hopefully facilitating expressiveness. It is composed of a main unit, connected to the one end of two elastic bands (but can easily extends in the future with more bands). The other side of each elastic band is attached to a wrist, an ankle, or other body part. The main unit measures the force applied on each elastic band and send this information for the computer for further processing and creative use.

## The hardware

- I use [physiotherapy elastic bands](http://www.physioroom.com/images/products//full/38990_image2.jpg) as they are very stretchy and goes up to x3 their steady length. They also easily modified (cut / knot).
- The sensors are hacked [digital hanging scales](https://www.amazon.co.uk/PicknBuy®-20g-40kg-Portable-Electronic-Weighing/dp/B00695N01Q/). They are attached between the main unit and each elastic band to measure the applied force. The low signal from the two scales' load cells is amplified and converted to digital by a single [SparkFun HX711 load cell amplifier](https://www.sparkfun.com/products/retired/13230). To run at faster rate I cut the amplifier jumper and got a 8x speedup.
- The arduino reads the signals from the load cells and send them serially over USB to the computer.

## The software

- [The `scale_reader` arduino sketch](https://github.com/Nagasaki45/Schleikess/blob/master/scale_reader/scale_reader.ino) uses [my optimized version of bodge/HX711](https://github.com/nagasaki45/hx711) library to read the value from the HX711 and send the data over serial as comma separated strings.
- [The `serial_to_osc` python script](https://github.com/Nagasaki45/Schleikess/blob/master/serial_to_osc/serial_to_osc.py) reads the serial port and output the received data as OSC messages.
- A generative 16 steps drum machine, codded in pure data (Pd), is controlled by OSC messages (see figure below). The inputs for the drum machine are:
  - **Patterns generation period** - the time (in seconds) until a new pattern will be generate. A new pattern is generated only for one of the 8 samples each time, so there is a continuity.
  - **Density** - the probability for each of the 16  steps in a pattern to contain an onset.
  - **Curve** - weighting the density between the sequencers so sequencer number 0 has the true density value and the rest are gradually attenuated. It is important for allowing certain samples to be more dense than other (for example, hi-hat compared to kick).
  - **Rate** - a frequency multiplier for the samples.
  - **Variance** - to add randomness to the rate above.
  - **Tempo** - self explainatory :-).
- [The Wekinator](http://www.wekinator.org/) is used as a middleware between the python `serial_to_osc` script and the Pd patch to create an interesting mapping between input parameters (the tension of the elastic bands) and synthesis parameters.

![Pd patch.](report/media/pd-patch.png)

# How do I use it?

1. Connect the two load cells to the arduino as TODO schematic.
1. Upload the `scale_reader` sketch to the arduino.
1. When the arduino is connected to the computer run the `serial_to_osc` python script with:

  ```bash
  cd serial_to_osc
  virtualenv env  # using virtualenv is highly  recommended. First run only
  source env/bin/activate
  pip install -r requirements.txt  # First run only
  ./serial_to_osc.py
  ```
1. Open the Wekinator and load the project from `weki/project`.
1. Open the `player/main.pd` patch. On first run, make sure to install [`abl_link~`](https://github.com/libpd/abl_link). It's a dependency for the Pd patch that can be easily downloaded / installed with [`deken`](https://github.com/pure-data/deken).
1. Profit!
