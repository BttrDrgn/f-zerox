#!/usr/bin/env python3

VERSION="us"

def apply(config, args):
    config["baseimg"] = f"baserom.{VERSION}.z64"
    config["myimg"] = f"build/f-zerox.{VERSION}.z64"
    config["mapfile"] = f"build/f-zerox.{VERSION}.map"
    config["source_directories"] = ["src", "include"]
