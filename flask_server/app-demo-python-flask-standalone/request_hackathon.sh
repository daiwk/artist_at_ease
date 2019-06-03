#curl xxxxx:8888 -d '{"userid":111, "word_list": ["øß∑»Õı◊”“ª∫≈µÍ", "…®√ËÃΩ’Îœ‘Œ¢æµ"]}'
#curl http://xxxxx/ -d '{"userid":111, "word_list": ["øß∑»Õı◊”“ª∫≈µÍ", "…®√ËÃΩ’Îœ‘Œ¢æµ"]}'
#curl http://xxxxx/ -d '{"input_file": "input/lzj-daye.jpg", "max_num_epochs": 200, "style_file": "style/starry_night.jpg", "output_name": "lzj_starry_night", "method": "getNeuralStyle"}'


host_name=xxxxx:8888
#host_name=http://xxxxx/
neural_style_path=/notebooks/daiwk/neural-style/
neural_style_input=$neural_style_path/input/
neural_style_style=$neural_style_path/style/


##style-picasso.jpg
##style-shuimohua.jpg
##style-vanGogh.jpg

##building.jpg
##cat1.jpg
##cat2.jpg
##sky1.jpg
##sky2.jpg
##sleeping.jpg

##curl $host_name -d '{"input_file": "'$neural_style_input'/building.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-picasso.jpg", "output_name": "building_picasso", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/building.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-vanGogh.jpg", "output_name": "building_vangogh", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/building.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-shuimohua.jpg", "output_name": "building_shuimohua", "method": "getNeuralStyle"}'
##
##curl $host_name -d '{"input_file": "'$neural_style_input'/cat1.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-picasso.jpg", "output_name": "cat1_picasso", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/cat1.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-vanGogh.jpg", "output_name": "cat1_vangogh", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/cat1.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-shuimohua.jpg", "output_name": "cat1_shuimohua", "method": "getNeuralStyle"}'
##
##
##curl $host_name -d '{"input_file": "'$neural_style_input'/cat2.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-picasso.jpg", "output_name": "cat2_picasso", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/cat2.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-vanGogh.jpg", "output_name": "cat2_vangogh", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/cat2.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-shuimohua.jpg", "output_name": "cat2_shuimohua", "method": "getNeuralStyle"}'
##
##
##curl $host_name -d '{"input_file": "'$neural_style_input'/sky1.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-picasso.jpg", "output_name": "sky1_picasso", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/sky1.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-vanGogh.jpg", "output_name": "sky1_vangogh", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/sky1.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-shuimohua.jpg", "output_name": "sky1_shuimohua", "method": "getNeuralStyle"}'
##
##
##curl $host_name -d '{"input_file": "'$neural_style_input'/sky2.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-picasso.jpg", "output_name": "sky2_picasso", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/sky2.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-vanGogh.jpg", "output_name": "sky2_vangogh", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/sky2.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-shuimohua.jpg", "output_name": "sky2_shuimohua", "method": "getNeuralStyle"}'
##
##
##curl $host_name -d '{"input_file": "'$neural_style_input'/sleeping.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-picasso.jpg", "output_name": "sleeping_picasso", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/sleeping.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-vanGogh.jpg", "output_name": "sleeping_vangogh", "method": "getNeuralStyle"}'
##curl $host_name -d '{"input_file": "'$neural_style_input'/sleeping.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/style-shuimohua.jpg", "output_name": "sleeping_shuimohua", "method": "getNeuralStyle"}'

curl $host_name -d '{"input_file": "'$neural_style_input'/lzj-daye.jpg", "max_num_epochs": 200, "style_file": "'$neural_style_style'/starry_night.jpg", "output_name": "lzj_starry_night", "method": "getGAN"}'
