read -p "How many times you want to loop through the coin: " num
declare -A coinRes
coinRes=( ['HH']=0 ['HT']=0 ['TH']=0 ['TT']=0 )
hh=0
ht=1
th=2
tt=3
for(( i=1; i<=$num; i++ ))
do
	toss=$((RANDOM%4))
	case $toss in
	$hh)
		coinRes['HH']=$((${coinRes['HH']}+1))
		;;
	$ht)
		coinRes['HT']=$((${coinRes['HT']}+1))
		;;
	$th)
		coinRes['TH']=$((${coinRes['TH']}+1))
		;;
	*)
		coinRes['TT']=$((${coinRes['TT']}+1))
		;;
	esac
done

hhWinPercentage=$(((${coinRes['HH']}*100)/num))
htWinPercentage=$(((${coinRes['HT']}*100)/num))
thWinPercentage=$(((${coinRes['TH']}*100)/num))
ttWinPercentage=$((100-(hhWinPercentage+htWinPercentage+thWinPercentage)))

dheadPercentage=$(($hhWinPercentage+($thWinPercentage+$htWinPercentage)/2))
dtailPercentage=$((100-$dheadPercentage))

echo HH=${coinRes['HH']} HT=${coinRes['HT']} TH=${coinRes['TH']} TT=${coinRes['TT']}
echo "Doublet head Percentage=$dheadPercentage%"
echo "Doublet tail Percentage=$((100-$dheadPercentage))%"
