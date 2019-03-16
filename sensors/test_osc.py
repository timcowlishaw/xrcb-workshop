# OSC integration from https://rbnrpi.wordpress.com/sonic-pi-3-says-hello-to-raspberry-pi-gpio/

from pythonosc import udp_client, osc_message_builder
import random
from time import sleep

def brownian(n):
    if n > 50 and (n == 150 or random.random() < 0.5):
        return n - 1
    else:
        return n + 1

if __name__ == "__main__":
    try:
        client = udp_client.SimpleUDPClient("127.0.0.1", 4559)
        val = random.randint(50, 150)
        while True:
            val = brownian(val) 
            print(val)
            msg = osc_message_builder.OscMessageBuilder(address="/xrcb/ldr")
            msg.add_arg(val)
            client.send(msg.build())
            sleep(0.05)
    except KeyboardInterrupt:
        pass
    finally:
        pass
