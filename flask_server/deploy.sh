jpaas login \
          -u xxxxxxxxxx \
          -p xxxxxxxxx \
          -o idea-show \
          -s artist-at-ease \
          -a http://xxxxxxxxxxx
cd app-demo-python-flask-standalone
tag="0-0-0-1" #tag
pushname="artist-at-ease_${tag}"
jpaas push ${pushname} -i 2 -m 2G
jpaas app ${pushname}
