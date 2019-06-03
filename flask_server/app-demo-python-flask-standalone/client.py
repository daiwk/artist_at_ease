import socket                   # Import socket module

s = socket.socket()             # Create a socket object
host = 'xxxxxxxxxxxx'
port = 60001                    # Reserve a port for your service.

s.connect((host, port))


filename='./client.py'
f = open(filename,'rb')
l = f.read(1024)
while (l):
   s.send(l)
   print('Sent ',repr(l))
   l = f.read(1024)
f.close()

print('finished sending')
   

#with open('received_file', 'wb') as f:
#    print 'file opened'
#    while True:
#        print('receiving data...')
#        data = s.recv(1024)
#        print('data=%s', (data))
#        if not data:
#            break
#        # write data to a file
#        f.write(data)
#
#f.close()
#print('Successfully get the file')
s.close()
print('connection closed')
