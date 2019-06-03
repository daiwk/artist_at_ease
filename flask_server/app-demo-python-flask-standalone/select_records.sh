
status=running # 1: running, 0: finished, 2: failed

mysql="mysql -h xxxxxxx -P 3306 -uroot -p123"

#$mysql -NBe " use artist_at_ease;select task_name, starttime, endtime, status, wget_path from neural_style_report where status = '${status}';"
$mysql -NBe " use artist_at_ease;select task_name, starttime, endtime, status, wget_path from neural_style_report limit 50;"
