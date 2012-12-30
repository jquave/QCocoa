QCocoa
======

A collection of common classes I use in my development of Cocoa apps for Mac OS.

# QTintedView
This is an NSView subclass that allows for setting a background color or gradient (using QGradient class included)

# Examples:
* This sets the background color of a settings window to have a blue background
  [settingsWindow setBackgroundColor:[NSColor clearColor]];
  [settingsView setBackgroundColor:[NSColor blueColor]];

* This sets the background color of a window to have a green to red gradient at a 90 degree angle (straight up and down)
  [settingsWindow setBackgroundColor:[NSColor clearColor]];
  [settingsView setGradient:[QGradient gradientWithStartColor:[NSColor greenColor] andEndColor:[NSColor redColor]]];

* This sets the background color of a window to have a green to red gradient at a 0 degree angle (straight left to right)
  [settingsWindow setBackgroundColor:[NSColor clearColor]];
  [settingsView setGradient:[QGradient gradientWithStartColor:[NSColor greenColor] andEndColor:[NSColor redColor]  andAngle:0]];