# gt4opencv
Glamorous Toolkit for the OpenCV

## How to load

You can load the whole code in Pharo 7.0 using the following snippet:

```
EpMonitor current disable.
[ 
  Metacello new
    baseline: 'GToolkit4OpenCV';
    repository: 'github://feenkcom/gt4opencv/src';
    load
] ensure: [ EpMonitor current enable ].
```
