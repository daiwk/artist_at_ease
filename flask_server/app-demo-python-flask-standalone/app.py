import os
import json
import time
import httplib
import socket                   # Import socket module

from flask import Flask, render_template
from flask import render_template
from flask import send_from_directory
from flask import request
from werkzeug import secure_filename

app = Flask(__name__, static_url_path='')

#UPLOAD_FOLDER = ""

MAIN_URL_PATH = "http://xxxxxxxxxxxx/" # offline

GT_SERVER_PATH = "xxxxx"
GT_SERVER_PORT = 8001
MAX_NUM_EPOCHS = 120

WGET_PATH_MAIN = "http://" + GT_SERVER_PATH + ":8888/output/"

#MAIN_URL_PATH = "http://xxxxxxxxxxxx/" # online
#GT_SERVER_PATH = "xxxxxxxxxxxxx" # offline -not used...

UPLOAD_FOLDER = "./static/upload/"

app.config['MAIN_URL_PATH'] = MAIN_URL_PATH
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['GT_SERVER_PATH'] = GT_SERVER_PATH
app.config['GT_SERVER_PORT'] = GT_SERVER_PORT
app.config["MAX_NUM_EPOCHS"] = MAX_NUM_EPOCHS


method_arr = [("Decorator", "getNeuralStyle"), ("Creator", "getGAN")]
method_arr = [("Decorator", "getNeuralStyle")]

userid = "0"
CUR_STATUS_FILE = "./all_records.info.%s" % (userid)

ALLOWED_EXTENSIONS=set(['txt','pdf','png','jpg','jpeg','gif'])

def get_status_arr():
    cur_status_file = CUR_STATUS_FILE
    os.system('sh -x select_records.sh > %s' % (cur_status_file))
    status_arr = []
    with open(cur_status_file, 'rb') as fin:
        idx = 1
        for line in fin:
            vals = line.strip().split('\t')
            record_all = (idx, ) + tuple(vals)
            status_arr.append(record_all)
            idx += 1

    print status_arr
    return status_arr


@app.route('/', methods=['GET', 'POST'])
def jpaas_env():
    if request.method == "GET" or request.method == "POST":
        status_arr = get_status_arr()

        return render_template('index.html', \
                method_arr=method_arr, \
                status_arr=status_arr)

def send_file_to_gt(local_filename, remote_filename):
    host = app.config['GT_SERVER_PATH']
    port = app.config['GT_SERVER_PORT']

    method = "sendfile"

    filename = local_filename
    f = open(filename,'rb')
    l = f.read()
    headers = {'Content-Type': 'multipart/form-data', \
                    'Cache-Control': 'no-cache'}
    headers["method"] = method
    headers["filename"] = remote_filename

    #raw_body = {"content": l, "method": method, "filename": "style-picasso.jpg"}
    body = l
    print remote_filename
    conn = httplib.HTTPConnection(host, port)
    conn.request("POST", method, body, headers)
    response = conn.getresponse()
    res = response.read()
    print res
    return res

def send_to_gt(data, method):
    #    json_data = json.JSONDecoder().decode(data)
    json_data = data
    post_url = app.config['GT_SERVER_PATH']
    port = app.config['GT_SERVER_PORT']
    headers = {'Content-Type': 'application/x-www-form-urlencoded', \
                    'Cache-Control': 'no-cache'}
    body = data
    conn = httplib.HTTPConnection(post_url, port)
    conn.request("POST", method, body, headers)
    response = conn.getresponse()
    res = response.read()
    print res
    return res

#@app.route('/static/<path:path>')
@app.route('/static/<path:filename>')
def send_js(filename):
    return send_from_directory('static',filename)
    ## which means http://xxxxxxxxx/static/images/2.jpg

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.',1)[1].lower() in ALLOWED_EXTENSIONS

def upload_file(file):
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        local_filename = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(local_filename)
        return (local_filename, filename)
    return "NULL"


@app.route('/process', methods=['GET', 'POST'])
def my_func():
    if request.method == "GET":
        return render_template('process.html')
    elif request.method == "POST":
        print "ffff"
        if "back_button" in request.form:
            print "fuck"
            status_arr = get_status_arr()
            return render_template('index.html', \
                method_arr=method_arr, \
                status_arr=status_arr)

        method = request.form["select_method"]
        inputfile = request.files["inputfile"]
        stylefile = request.files["stylefile"]

        input_local_filename, input_shortname = upload_file(inputfile)
        style_local_filename, style_shortname = upload_file(stylefile)

        input_prefix = input_local_filename.strip().split('.')[-2].split("/")[-1]
        style_prefix = style_local_filename.strip().split('.')[-2].split("/")[-1]
        output_name = "_".join([input_prefix, style_prefix])
        print "QQQ"


        if input_local_filename != "NULL" and \
            style_local_filename != "NULL":

            if method == "getGAN":
                data = {}
                data["method"] = method
                data_str = json.dumps(data, encoding="gbk")
                res = send_to_gt(data_str, method)
            elif method == "getNeuralStyle":
                print "xxx"
                max_num_epochs = app.config["MAX_NUM_EPOCHS"]
                remote_dir = "input"
                input_remote_filename = '/'.join([remote_dir, input_local_filename.split('/')[-1]])
                res = send_file_to_gt(input_local_filename, input_remote_filename)
                remote_dir = "style"
                style_remote_filename = '/'.join([remote_dir, style_local_filename.split('/')[-1]])
                res = send_file_to_gt(style_local_filename, style_remote_filename)
                wget_path = WGET_PATH_MAIN + output_name + "/" + output_name + "_" + str(max_num_epochs) + ".jpg"

                date = time.strftime('%Y%m%d_%H:%M:%S')
                uniq_id = '_'.join(str(j) for j in [date, output_name, max_num_epochs])
                data = {}
                data["method"] = method
                data["input_file"] = "input/" + input_shortname
                data["style_file"] = "style/" + style_shortname
                data["output_name"] = output_name
                data["max_num_epochs"] = max_num_epochs
                data["uniq_id"] = uniq_id
                data_str = json.dumps(data, encoding="gbk")
                print data_str, "ccc"

                res = send_to_gt(data_str, method)
                print data_str
            
                ## need max_epoch in add_record && table schema!!!
                os.system('sh ./add_record.sh %s %s %s %s %d %s %s' % \
                        (method, input_remote_filename, style_remote_filename, \
                         output_name, max_num_epochs, uniq_id, wget_path))
            
            env = ['%s=%s' % (k, v) for k, v in os.environ.items()]
            return render_template('process.html', env=env)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8888)
