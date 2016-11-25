## What?

My final project to the Interactive Digital Multimedia Techniques (ESC742P) module, Media and Arts Technology, Queen Mary University of London.

## The concept

A controller for full-body interactive performances that requires force and effort to play with, hopefully facilitating expressiveness. It will be composed of a main unit, connected to the one end of two or four elastic bands. The other side of each elastic band will be attached to a wrist, an ankle, or other body part. The main unit will measure the force applied on each elastic band and send this information for the computer for further processing and creative use.

## The hardware / technology

- I plan to use [physiotherapy elastic bands](http://www.physioroom.com/images/products//full/38990_image2.jpg) as they are very stretchy and goes up to x3 their steady length. They also easily modified (cut / knot).
- I'm leaning towards attaching a hacked [digital hanging scale](http://www.ebay.co.uk/itm/331768570719) between the main unit and each band to measure the applied force. I already ordered one to experiment with. Alternatively, a [S shaped load cell](http://www.ebay.co.uk/itm/Waterproof-S-Type-Beam-Load-Cell-Scale-Sensor-Weighting-Sensor-50kg-With-Cable-/191436100115?hash=item2c927b1213:g:JqQAAOSwIgNXvXY1) and [amplifier](https://learn.sparkfun.com/tutorials/load-cell-amplifier-hx711-breakout-hookup-guide) can be used. But it's much more expensive. I prefer not to use a [stretch sensor](https://www.adafruit.com/product/519), as it way less stretchy compared to the elastic band (can stretch only up to x1.5) and requires measuring the distant part of the band.
- The main unit will be the arduino. If I will have enough time I might switch to an [esp8266](https://en.wikipedia.org/wiki/ESP8266) due to its wireless (WiFi) capabilities.

## Demo

To demo the controller I will use [Rebecca Fiebrink's Wekinator](http://www.wekinator.org/) for processing the incoming sensor measurements and a max synth / hardware synth.
