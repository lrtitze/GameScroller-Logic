# Game Scroller Logic

This simple iOS testbed illustrates a way to control the motion of a character against a background on a device with a display smaller than the background.

I chose to use Swift because the purpose of this exercise was to graphically show someone programming in Lua how the algorithm might work. I felt that the syntax of Objective-C might obscure the simplicity of the concepts.

The actual algorithm is in the *moveBy* and *moveOnAxis* functions in *SimulationView.swift*

**NOTE:** This was actually only written to be tested on an iPad in landscape mode. Handling of other devices and orientations is left as an exercise for the reader. Sorry.