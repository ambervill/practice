import socket
def Main():
	host = '127.0.0.1'
	port = 5000
	s = socket.socket()
	s.connect((host, port))
	
	message = input(">> ")
	while message != 'q':
		s.send(message.encode())
		data = s.recv(1024).decode()
		print("Received: " + str(data))
		message = input(">> ")
	s.close()
	
if __name__ == '__main__':
	Main()