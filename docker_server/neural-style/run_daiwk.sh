echo "MONITOR: START at `date`"
export PYTHONPATH=/root/mxnet/python
python=python
input_file=$1 #input/lzj-daye.jpg
style_file=$2 #input/starry_night.jpg 
output_name=$3
uniq_id=$4
max_num_epochs=$5 #200

mkdir -p output/${output_name}/
/bin/rm -rf output/${output_name}/*

output_file=output/${output_name}/${output_name}_${max_num_epochs}.jpg #output/final_${max_num_epochs}.jpg

$python run.py --content-image $input_file --style-image $style_file --gpu -1 --save-epochs 5 --max-num-epochs ${max_num_epochs} --output $output_file


echo "MONITOR: END at `date`"
