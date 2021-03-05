filepath=$1
dest_directory=$2
directory=`dirname "$filepath"`
filename=$(basename -- "$filepath")
extension="${filename##*.}"
filename="${filename%.*}"
dir_name="${filename}_files"
jupyter nbconvert \
    --FilesWriter.build_directory ${dest_directory}/_drafts\
    --NbConvertApp.output_files_dir $2/assets/$dir_name\
    --to markdown $1

cp -a $directory/$dir_name/. /$2/assets/$dir_name
sed -i "s#($dir_name#(/assets/$dir_name#g" ${dest_directory}/_drafts/$filename.md
sed -i "s#($2/assets#(/assets#g" $2/_drafts/$filename.md

cat $dest_directory/utils/header.md >> $dest_directory/_drafts/temp
line=$(head -n 1 $dest_directory/_drafts/$filename.md)
sed -i "s/<title>/${line#* }/g" $dest_directory/_drafts/temp
sed -i "s/$line//g" $dest_directory/_drafts/$filename.md

datetime=$(date "+%Y-%m-%d %H:%M:%S")
sed -i "s/<date>/$datetime/g" $dest_directory/_drafts/temp

cat $dest_directory/_drafts/$filename.md >> $dest_directory/_drafts/temp
mv $dest_directory/_drafts/temp $dest_directory/_drafts/$filename.md