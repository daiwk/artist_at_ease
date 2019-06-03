#encoding=gbk
import md5
import httplib
import time
import json
import urllib
import urllib2
import sys

import os
import pickle
import cgitb
import json
import socket


from flask import Flask, render_template

app = Flask(__name__)

cgitb.enable()  ## This line enables CGI error reporting
from CGIHTTPServer import CGIHTTPRequestHandler
from BaseHTTPServer import HTTPServer

MAX_IDEA_PER_TERM = 100
dic_term_idea = {}

class TestHTTPHandler(CGIHTTPRequestHandler):

    @app.route('/')
    def do_GET(self):

        env = ['%s=%s' % (k, v) for k, v in os.environ.items()]
        render_template('index.html')
        return 

        buf = "It works"
        self.protocal_version = "HTTP/1.1" 

        self.send_response(200)

        self.send_header("Welcome", "Contect")       

        self.end_headers()

        self.wfile.write(buf)

    def send_to_gt(self, data, method):
        #    json_data = json.JSONDecoder().decode(data)
        json_data = data
        date = time.strftime('%Y%m%d')
        post_url = "xxxxxxxxx"
        #post_url = "xxxxxxxxxx"
        port = 8001
        headers = {'Content-Type': 'application/x-www-form-urlencoded', \
                        'Cache-Control': 'no-cache'}
        body = data
##        post_json = json.dumps({
##            "pid": 1875,
##            "date": date,
##            "total_pv": json_data["data"]["total_pv"],
##            "total_apps": json_data["data"]["total_apps"],
##            "apis": json_data["data"]["apis"]
##            })
##        params = urllib.urlencode({
##            "json": post_json,
##            "platformKey" : token
##            })

        conn = httplib.HTTPConnection(post_url, port)
        conn.request("POST", method, body, headers)
        #conn.request("POST", method, body, headers)
        response = conn.getresponse()
        res = response.read()
        print res
        return res



    def do_POST(self):
        ## get request data
        length = self.headers.getheader('content-length')
        nbytes = int(length)
        data = self.rfile.read(nbytes)
        
        # according to method: 
        #getGAN: send request to get result of GAN
        #getNeuralStyle: send request to get result of Neural-Style
        req_data = data
        method = json.loads(req_data, encoding="gbk")["method"]
        res_dict = self.send_to_gt(req_data, method)
        buf = json.dumps(res_dict, encoding="gbk").decode("unicode_escape").encode('gbk')
        self.protocal_version = "HTTP/1.1" 

        self.send_response(200)

        self.send_header("Welcome", "Contect")       
#        self.send_header("Content-Type", "application/json")

        self.end_headers()

        self.wfile.write(buf)


def start_server(port):
    ip = socket.gethostbyname(socket.gethostname())
    server_address = (ip, port)
    http_server = HTTPServer(server_address, TestHTTPHandler)
    http_server.serve_forever()

start_server(8888)
