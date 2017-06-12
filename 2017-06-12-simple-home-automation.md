
This DIY project to automate a light & fan using raspberry pi.

## Things Required

1. Raspberry Pi Any Model will be fine
2. 220v - 5v Relay
3. Jumper Cables

## Connection to Light & Fan

Any Electrical Device that work with AC will have two wires going into it. One of them is called Live & the other in neutral. To control the current flow to that a swith is connected in middle of the live so when the switch is off, Circuit is open and current won't flow through the device. We are going to do the same with the relay.  

## Relay
Relay will help in controlling 220v Live wire with help of 5v. Basically Our Pi works with 5v so it can manage 220v line with its 5v with the help of a Relay.

Relay have two sides. One Side we will connect the Live wire. and the other Side we will connect the wires from the Pi.

## Raspberry Pi
Rapsberry Pi have pins on the side of it.  Each pin have a number to identify and each of them have a purpose. The pi side of relay has to be powered from the Pi. for this purpose they provide
two pins VCC & GND, in Pi pin diagram you can see these pins. Connect them to the Pi,  Now to control the relay we need an input wire. Connect any of the GPIO pin to the third pin. Now we can control the Relay from PI

These GPIO ports can be controlled by program running in the Pi. So we can send either HIGH or LOW into the INPUT pin of relay through these programs.

Now Identify the live wire in the connection to your device. and connect them to other side of relay. Be very careful Its 220v, it can kill you !!!

## Programming Pi

Pi can be controlled by running programs inside it.  Default they have libraries to do this.
following is a simple versin using python.

```python
#!/usr/bin/python

#import GPIO library
import RPi.GPIO as GPIO

# set GPIO mode to BCM
GPIO.setmode(GPIO.BCM)

# here 23 is  GPIO23 port in the PI where I connected the input wire from relay
# change it which ever port you used
# since we are gonna send data to relay set it to output mode 
GPIO.setup(23, GPIO.OUT)

# GPIO port work in Binary mode. so set either 1 or 0 to control it.
GPIO.output(port, 1)
```

Remeber we have connected the VCC, GND, and another line to GPIO.  So the above code will control the GPIO port.

When you write a 1 to the port. GPIO will enable the port and Relay will allow current to flow & your device will Turn on and If you write a 0 it will turn off the relay opening the circuit and your device will turn off.




