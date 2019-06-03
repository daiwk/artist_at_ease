# artist_at_ease

<p>e.g. your server ip is xxxx</p>
<p>you can see the demo in a month...</p>
click here --> [baidu hackathon demo website](http://xxxxxxx/)


Preparations-git src
--------
* **mkdir && git pull**
<pre><code>mkdir -p /home/work/daiwk && cd /home/work/daiwk/
git clone git@github.com:daiwk/artist_at_ease.git
</code></pre>
OR
<pre><code>mkdir -p /home/work/daiwk && cd /home/work/daiwk/
git clone https://github.com/daiwk/artist_at_ease.git
</code></pre>


Preparations-docker
--------
* **start a docker container**
<pre><code>docker pull daocloud.io/daiwk/dl-server-basic:1.0.2
nohup sh -x run_docker_dl_server_basic.sh 2>&1 &
</code></pre>


Preparations-mysql
--------
* **install mysql-server**
* **load schema & data from sql**
<pre><code>mysql -uroot -p123456
create database artist_at_ease;
mysql -uroot -p123456 artist_at_ease < artist_at_ease.sql
</code></pre>


Preparations-model prepare
--------
* **download mxnet model vgg**
<pre><code>cd /home/work/daiwk/artist_at_ease/docker_server/neural-style/
sh -x download.sh
</code></pre>


Start servers-gt_server
--------
* **login docker container(default password is 123)**
<pre><code>sh root@xxxx -p 50002
</code></pre>

* **inside docker container, run**
<pre><code>cd /notebooks/daiwk/artist_at_ease/docker_server
nohup python gt_server.py 2>&1 &
</code></pre>

Start servers-www server
--------
* **start server for images download**
<pre><code>cd /home/work/daiwk/artist_at_ease/docker_server/neural-style
nohup python -m CGIHTTPServer 8888 2>&1 &
</code></pre>


Start servers-flask server
--------
* **start the flask server which serves our main page**
<pre><code>pip install flask
cd /home/work/daiwk/artist_at_ease/flask_server/app-demo-python-flask-standalone/
nohup python app.py 2>&1 &
</code></pre>


Start crontabs-update task status
--------
* **set crontab job**
<pre><code>*/3 * * * * cd /home/work/daiwk/artist_at_ease/docker_server && sh ct_update_status.sh > ct.log 2>&1
</code></pre>


References:
--------
* [puzzle template](http://www.templatemo.com/tm-477-puzzle)
* [neural-style in mxnet](https://github.com/dmlc/mxnet/tree/master/example/neural-style)
* [neural-style in tensorflow](https://github.com/anishathalye/neural-style)
* [Blog: Generative Models in OpenAI](https://openai.com/blog/generative-models/)
* [Code: InfoGAN](https://github.com/openai/InfoGAN)
