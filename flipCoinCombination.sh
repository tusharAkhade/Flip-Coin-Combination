read -p "How many times you want to loop through the coin: " num
declare -A coinRes
coinRes=( ['HHH']=0 ['HHT']=0 ['HTH']=0 ['HTT']=0 ['THH']=0 ['THT']=0 ['TTH']=0 ['TTT']=0 )

hhh=0
hht=1
hth=2
thh=3
htt=4
tht=5
tth=6
ttt=7
for(( i=1; i<=$num; i++ ))
do
	toss=$((RANDOM%8))
	case $toss in
	$hhh)
		coinRes['HHH']=$((${coinRes['HHH']}+1))
		;;
	$hht)
		coinRes['HHT']=$((${coinRes['HHT']}+1))
		;;
	$hth)
		coinRes['HTH']=$((${coinRes['HTH']}+1))
		;;
	$htt)
		coinRes['HTT']=$((${coinRes['HTT']}+1))
		;;
	$thh)
		coinRes['THH']=$((${coinRes['THH']}+1))
		;;
	$tht)
		coinRes['THT']=$((${coinRes['THT']}+1))
		;;
	$tth)
		coinRes['TTH']=$((${coinRes['TTH']}+1))
		;;
	*)
		coinRes['TTT']=$((${coinRes['TTT']}+1))
		;;
	esac
done

hhhWinPercentage=$(((${coinRes['HHH']}*100)/num))
hhtWinPercentage=$(((${coinRes['HHT']}*100)/num))
hthWinPercentage=$(((${coinRes['HTH']}*100)/num))
httWinPercentage=$(((${coinRes['HTT']}*100)/num))
thhWinPercentage=$(((${coinRes['THH']}*100)/num))
thtWinPercentage=$(((${coinRes['THT']}*100)/num))
tthWinPercentage=$(((${coinRes['TTH']}*100)/num))
tttWinPercentage=$((100-(hhhWinPercentage+hhTWinPercentage+hthWinPercentage+httWinPercentage+thhWinPercentage+thtWinPercentage+tthWinPercentage)))

theadPercentage=$((hhhWinPercentage+((hhtWinPercentage+hthWinPercentage+thhWinPercentage)*2/3)+((httWinPercentage+thtWinPercentage+tthWinPercentage)/3)))
ttailPercentage=$((100-$theadPercentage))

echo "HHH=${coinRes['HHH']} HHT=${coinRes['HHT']} HTH=${coinRes['HTH']} HTT=${coinRes['HTT']} THH=${coinRes['THH']} THT=${coinRes['THT']} TTH=${coinRes['TTH']} TTT=${coinRes['TTT']}"

echo "Triplet head Percentage=$theadPercentage%"
echo "Triplet tail Percentage=$ttailPercentage%"
