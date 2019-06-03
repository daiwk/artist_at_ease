start_date=`date +"%Y-%m-%d %H:%M:%S"`
method=$1
input_path=$2
style_path=$3
output_name=$4
max_num_epochs=$5
uniq_id=$6
wget_path=$7

end_date="1900-01-01 00:00:00"

status=running # 1: running, 0: finished, 2: failed

mysql="mysql -h 180.76.146.23 -P 3306 -uroot -p123"

$mysql -e " use artist_at_ease;insert into neural_style (uniq_id, method, input_path, style_path, output_name, max_num_epochs, starttime, endtime, status) values('${uniq_id}', '${method}', '${input_path}', '${style_path}', '${output_name}', '${max_num_epochs}', '${start_date}', '${end_date}', '${status}');"
$mysql -e " use artist_at_ease;insert into neural_style_report (uniq_id, task_name, wget_path, starttime, endtime, status) values('${uniq_id}', '${output_name}', '${wget_path}', '${start_date}', '${end_date}', '${status}');"
