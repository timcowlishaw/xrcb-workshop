# capacitor timing trick to measure resistance from https://pimylifeup.com/raspberry-pi-light-sensor/
# OSC integration from https://rbnrpi.wordpress.com/sonic-pi-3-says-hello-to-raspberry-pi-gpio/

import time
import RPi.GPIO as GPIO
import pythonosc as OSC

def rc_time(pin_to_circuit):
    count = 0

    GPIO.setup(pin_to_circuit, GPIO.OUT)
    GPIO.output(pin_to_circuit, GPIO.LOW)
    time.sleep(0.1)

    GPIO.setup(pin_to_circuit, GPIO.IN)

    while  (GPIO.input(pin_to_circuit) == GPIO.LOW):
        count += 1

    return count;

if __name__ == "__main__":
    try:
        client = OSC.udp_client.SimpleUDPClient("127.0.0.1", 4559)
        while True:
            val = rc_time(pin_to_circuiot)
            msg = OSC.osc_message_builder.OscMessageBuilder(address="/xrcb/ldr")
            msg.add_arg(val)
            client.send(msg.build())
    except KeyboardInterrupt:
        pass
    finally:
        GPIO.cleanup()

