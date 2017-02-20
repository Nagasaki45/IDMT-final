#!/usr/bin/env python
"""
Read serial data and send OSC messages to Wekinator.
"""

import glob

from pythonosc import udp_client
import serial  # pySerial

SERIAL_PORT = '/dev/ttyACM*'
SERIAL_BAUD_RATE = 9600
OSC_PORT = 12000  # Pd is listening


def connect_serial_port():
    """Tries to connect to ports. Return the one that connects."""
    port = glob.glob(SERIAL_PORT)[0]
    print("Connecting to {}".format(port))
    return serial.Serial(port, SERIAL_BAUD_RATE)


def main():
    osc_client = udp_client.SimpleUDPClient('localhost', OSC_PORT)
    serial = connect_serial_port()
    while True:
        values = serial.readline().strip().split(b',')
        values = [float(x) for x in values]
        osc_client.send_message('/', values)


if __name__ == '__main__':
    main()
