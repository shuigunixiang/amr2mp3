#!/bin/sh

start_convert(){    
    for file2 in `ls -A $1`    
    do          
      
	if [ -d "$1/$file2" ];then    
		##递归调用
		start_convert  "$1/$file2"

	elif [ -f "$1/$file2" ]; then
		file_name=$(dirname $1/$file2)/$(basename $1/$file2)
		if [ ${file_name##*.} = "amr" ];then
			echo  $file_name converting  ${file_name%.*}.mp3 
			ffmpeg -i  $file_name  ${file_name%.*}.mp3			
		fi

        fi     
    done    
}    
    
start_convert /mnt/igancao/upload/chatfiles


echo "============= Total amr2mp3 Over! ============="
