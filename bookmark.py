#!/usr/bin/env python
""" what's the event ID we stopped at? """
import sys
import pickle

filename = sys.argv[1]

with open(filename, "rb") as fileobj:
    print(pickle.Unpickler(fileobj).load())
