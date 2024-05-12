#!/usr/bin/env python3
import argparse
import sys

ADJ_VAL = 10
MIN_ON = 10
MAX_ON = 255
DEV_PATH='/sys/class/leds/asus::screenpad/brightness'

def get_current_val():
    with open(DEV_PATH, 'r') as dev:
        return int(dev.read())

def set_brightness(level):
    with open(DEV_PATH, 'w') as dev:
        dev.write(str(level))
        dev.flush()

def increase_brightness():
    print("brightness+")
    current_val = get_current_val()
    current_val += ADJ_VAL
    current_val = min(MAX_ON, current_val)
    set_brightness(current_val)

def decrease_brightness():
    print("brightness-")
    current_val = get_current_val()
    current_val -= ADJ_VAL
    current_val = max(MIN_ON, current_val)
    set_brightness(current_val)

def toggle_screen():
    screen_val = get_current_val()

    brightness = 75
    if screen_val:
        brightness = 0

    set_brightness(brightness)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group() #required=True)
    group.add_argument("-i", "--increase", help="increase screenpad brightness.", action="store_const", dest='action', const=increase_brightness)
    group.add_argument("-d", "--decrease", help="decrease screenpad brightness.", action="store_const", dest='action', const=decrease_brightness)
    group.add_argument("-t", "--toggle", help="toggle screenpad on or off.", action="store_const", dest='action', const=toggle_screen)
    args = parser.parse_args()

    if not args.action:
        parser.print_help()
        sys.exit(1)

    args.action()




