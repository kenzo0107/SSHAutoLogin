cur_file=`basename $0`
cur_dir=`dirname $0`
cd ${cur_dir}
cur_dir=`pwd`


for filename in `ls -A ./ | grep "\.*.sh" | grep -v "${cur_file}"`
do
  rm -rf ~/${filename}
  ln -s ${cur_dir}/${filename} ~/
done
