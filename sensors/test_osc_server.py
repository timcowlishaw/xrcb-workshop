from pythonosc import dispatcher, osc_server
dispatch = dispatcher.Dispatcher()

def handler(address, msg):
    print("On server", address, msg)

dispatch.map("/*", handler)

server = osc_server.ThreadingOSCUDPServer( 
        ("127.0.0.1", 4559), dispatch)
server.serve_forever()
