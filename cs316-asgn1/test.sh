make
rm -rf Examples16
mkdir Examples16
rm -rf Examples/*.spim
cp Examples/* Examples16/
for i in `seq 1 7`;
do
	./sclp "Examples/test$i.c"
	./sclp16 "Examples16/test$i.c"
	diff "Examples/test$i.c.spim" "Examples16/test$i.c.spim" &> /dev/null
	if [ $? = 0 ];
	then
		echo "Test Case $i alright"
	else
		echo "OOPS! wrong for test case $i"
	fi
done