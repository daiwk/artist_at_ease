## select * from table where status = running >> file_xx
## check outputfiles is ready or not, if is ready, mod the record in database!!
report_table=neural_style_report
status_table=neural_style
end_date=`date +"%Y-%m-%d %H:%M:%S"`
uniq_id=$1

status=finished 

mysql="mysql -h xxxx -P 3306 -uroot -p123"

$mysql -e " use artist_at_ease;update neural_style set endtime = '${end_date}', status = '$status' where uniq_id = '${uniq_id}';"
$mysql -e " use artist_at_ease;update neural_style_report set endtime = '${end_date}', status = '$status' where uniq_id = '${uniq_id}';"
$mysql -e " use artist_at_ease;select * from neural_style_report where uniq_id = '${uniq_id}';"
