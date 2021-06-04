read -p "How many times you want to loop through the coin: " num
declare -A coinRes
coinRes=( ['h']=0 ['t']=0 )
head=0
tail=1
for(( i=1; i<=$num; i++ ))
do
	toss=$((RANDOM%2))
	if [ $toss -eq $head ]
	then
		coinRes['h']=$(("${coinRes['h']}"+1))
	else
		coinRes['t']=$(("${coinRes['t']}"+1))
	fi
done

sheadPercentage=$(((${coinRes['h']}*100)/num))
stailPercentage=$((100-$sheadPercentage))

echo Heads=${coinRes['h']} Tails=${coinRes['t']}
echo Head Percentage="$sheadPercentage"% Tail Percentage="$stailPercentage"%
