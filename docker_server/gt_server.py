#encoding=gbk
import time

import os
import pickle
import cgitb
import json
import socket
cgitb.enable()  ## This line enables CGI error reporting
from CGIHTTPServer import CGIHTTPRequestHandler
from BaseHTTPServer import HTTPServer

BACKEND_PATH = "/notebooks/daiwk/mxnet/example/neural-style/" 
GAN_BACKEND_PATH = "/notebooks/daiwk/hackathon/InfoGAN/"


class TestHTTPHandler(CGIHTTPRequestHandler):
    def do_GET(self):

        buf = "It works"
        self.protocal_version = "HTTP/1.1" 

        self.send_response(200)

        self.send_header("Welcome", "Contect")       

        self.end_headers()

        self.wfile.write(buf)

    def do_POST(self):

        length = self.headers.getheader('content-length')
        nbytes = int(length)
        data = self.rfile.read(nbytes)

        try:
            req_data = json.loads(data, encoding="gbk")
            print "req_data: ", req_data
            method = req_data["method"]
        except:
            method = self.headers.getheader('method')

        res_dict = {}
        if method == "sendfile":
            short_filename = self.headers.getheader('filename')
            filename = BACKEND_PATH + short_filename
            filecontent = data
            print filename
            with open(filename, 'wb') as fout:
                for i in filecontent:
                    fout.write(i)
            

        if method == "getNeuralStyle":
            input_file = req_data["input_file"]
            style_file = req_data["style_file"]
            output_name = req_data["output_name"]
            uniq_id = req_data["uniq_id"]
            max_num_epochs = req_data["max_num_epochs"]
            # mxnet version
            #os.system("cd /root/hackathon/neural-style && nohup sh -x run_daiwk.sh %s %s %s %s > log/%s.log 2>&1  &" % \
            #                    (input_file, style_file, output_name, max_num_epochs, output_name))

            # tf version
            #os.system("cd /notebooks/daiwk/hackathon/neural-style && nohup sh -x run_daiwk.sh %s %s %s %s > log/%s.log 2>&1  &" % \
            os.system("cd %s && nohup sh -x run_daiwk.sh %s %s %s %s %s > log/%s.log 2>&1  &" % \
                        (BACKEND_PATH, input_file, style_file, output_name, uniq_id, max_num_epochs, output_name))

            res_dict["method"] = method
            res_dict["status"] = "success"
            self.send_response(200)

        elif method == "getGAN":
            os.system("cd %s && nohup sh -x run_daiwk.sh > log/%s.log 2>&1  &" % \
                    (GAN_BACKEND_PATH, method))

            res_dict["method"] = method
            res_dict["status"] = "success"
            self.send_response(200)


        buf = json.dumps(res_dict, encoding="gbk").decode("unicode_escape").encode('gbk')
        self.protocal_version = "HTTP/1.1" 


        self.send_header("Welcome", "Contect")       
#        self.send_header("Content-Type", "application/json")

        self.end_headers()

        self.wfile.write(buf)


def start_server(port):
    ip = socket.gethostbyname(socket.gethostname())
    server_address = (ip, port)
    http_server = HTTPServer(server_address, TestHTTPHandler)
    http_server.serve_forever()

start_server(9000)
