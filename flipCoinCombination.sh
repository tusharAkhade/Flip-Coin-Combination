head=1
tail=0
toss=$((RANDOM%2))
if [ $toss -eq $head ]
then
	echo "Heads"
else
	echo "Tails"
fi
