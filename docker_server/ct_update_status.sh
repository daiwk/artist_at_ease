## select * from table where status = running >> file_xx
## check outputfiles is ready or not, if is ready, mod the record in database!!
report_table=neural_style_report
status_table=neural_style
end_date=`date +"%Y-%m-%d %H:%M:%S"`

FILE_PATH=/home/work/daiwk/mxnet/example/neural-style/output/

check_status=running

status=finished

mysql="mysql -h xxxxxxxxx -P 3306 -uroot -p123"

echo $end_date

$mysql -NBe " use artist_at_ease;select uniq_id, wget_path from neural_style_report where status = '${check_status}';" > running.info

cat running.info |
while read line
do
    local_path=`python -c "val = '$line'.split('\t');local_path = '$FILE_PATH' + val[1].split('output')[1];print local_path" `
    uniq_id=`python -c "print '$line'.split('\t')[0]" `
    if [ -f $local_path ];then
        echo "$local_path exists!"

        $mysql -e " use artist_at_ease;update neural_style set endtime = '${end_date}', status = '$status' where uniq_id = '${uniq_id}';"
        $mysql -e " use artist_at_ease;update neural_style_report set endtime = '${end_date}', status = '$status' where uniq_id = '${uniq_id}';"

        echo "$uniq_id finished status change!!"
    else
        echo "$local_path not exists"
    fi

done



