# Define function "singlet" for singlet head and tail percentage.
function singlet () {
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

echo Singlet head Percentage=$sheadPercentage%
echo Singlet tail Percentage=$stailPercentage%
}


# Define function "doublet" for doublet head and tail percentage.
function doublet() {
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

echo ""
echo "Doublet head Percentage=$dheadPercentage%"
echo "Doublet tail Percentage=$((100-$dheadPercentage))%"
}


# Define function "triplet" for triplet head and tail percentage.
function triplet() {
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

echo ""
echo "Triplet head Percentage=$theadPercentage%"
echo "Triplet tail Percentage=$ttailPercentage%"
}


read -p "How many times you want to loop through the coin: " num
echo ""
singlet
doublet
triplet
echo ""
if [ $sheadPercentage -ge $dheadPercentage ] && [ $sheadPercentage -ge $theadPercentage ]
then
	if [ $sheadPercentage -gt $dheadPercentage ] && [ $sheadPercentage -gt $theadPercentage ]
	then
		echo "Winner is Singlet Head. Head percentage=$sheadPercentage%"
	elif [ $sheadPercentage -eq $dheadPercentage ] && [ $sheadPercentage -gt $theadPercentage ]
	then
		echo "Tie between Singlet and Doublet Head. Head percentage=$sheadPercentage%"
	elif [ $sheadPercentage -gt $dheadPercentage ] && [ $sheadPercentage -eq $theadPercentage ]
	then
		echo "Tie between Singlet and triplet Head. Head percentage=$sheadPercentage%"
	else
		echo "Tie between Singlet, Doublet, Triplet Head. Head percentage=$sheadPercentage%"
	fi

elif [ $dheadPercentage -ge $sheadPercentage ] && [ $dheadPercentage -ge $theadPercentage ]
then
	if [ $dheadPercentage -gt $sheadPercentage ] && [ $dheadPercentage -gt $theadPercentage ]
	then
		echo "Winner is Doublet Head. Head percentage=$dheadPercentage%"
	elif [ $dheadPercentage -eq $sheadPercentage ] && [ $dheadPercentage -gt $theadPercentage ]
	then
		echo "Tie between Singlet and Doublet Head. Head percentage=$dheadPercentage%"
	elif [ $dheadPercentage -gt $sheadPercentage ] && [ $dheadPercentage -eq $theadPercentage ]
	then
		echo "Tie between Doublet and triplet Head. Head percentage=$dheadPercentage%"
	fi

else
	if [ $theadPercentage -gt $sheadPercentage ] && [ $theadPercentage -gt $dheadPercentage ]
	then
		echo "Winner is Triplet Head. Head percentage=$dheadPercentage%"
	elif [ $theadPercentage -eq $sheadPercentage ] && [ $theadPercentage -gt $dheadPercentage ]
	then
		echo "Tie between Triplet and Singlet Head. Head percentage=$dheadPercentage%"
	elif [ $theadPercentage -gt $sheadPercentage ] && [ $theadPercentage -eq $dheadPercentage ]
	then
		echo "Tie between Triplet and Doublet Head. Head percentage=$dheadPercentage%"
	fi
fi


if [ $stailPercentage -ge $dtailPercentage ] && [ $stailPercentage -ge $ttailPercentage ]
then
	if [ $stailPercentage -gt $dtailPercentage ] && [ $stailPercentage -gt $ttailPercentage ]
	then
		echo "Winner is Singlet tail. Tail percentage=$stailPercentage%"
	elif [ $stailPercentage -eq $dtailPercentage ] && [ $stailPercentage -gt $ttailPercentage ]
	then
		echo "Tie between Singlet and Doublet tail. Tail percentage=$stailPercentage%"
	elif [ $stailPercentage -gt $dtailPercentage ] && [ $stailPercentage -eq $ttailPercentage ]
	then
		echo "Tie between Singlet and triplet tail. Tail percentage=$stailPercentage%"
	else
		echo "Tie between Singlet, Doublet, Triplet tail. Tail percentage=$stailPercentage%"
	fi

elif [ $dtailPercentage -ge $stailPercentage ] && [ $dtailPercentage -ge $ttailPercentage ]
then
	if [ $dtailPercentage -gt $stailPercentage ] && [ $dtailPercentage -gt $ttailPercentage ]
	then
		echo "Winner is Doublet tail. Tail percentage=$dtailPercentage%"
	elif [ $dtailPercentage -eq $stailPercentage ] && [ $dtailPercentage -gt $ttailPercentage ]
	then
		echo "Tie between Singlet and Doublet tail. Tail percentage=$dtailPercentage%"
	elif [ $dtailPercentage -gt $stailPercentage ] && [ $dtailPercentage -eq $ttailPercentage ]
	then
		echo "Tie between Doublet and triplet tail. Tail percentage=$dtailPercentage%"
	fi

else
	if [ $ttailPercentage -gt $stailPercentage ] && [ $ttailPercentage -gt $dtailPercentage ]
	then
		echo "Winner is Triplet tail. Tail percentage=$dtailPercentage%"
	elif [ $ttailPercentage -eq $stailPercentage ] && [ $ttailPercentage -gt $dtailPercentage ]
	then
		echo "Tie between Triplet and Singlet tail. Tail percentage=$dtailPercentage%"
	elif [ $ttailPercentage -gt $stailPercentage ] && [ $ttailPercentage -eq $dtailPercentage ]
	then
		echo "Tie between Triplet and Doublet tail. Tail percentage=$dtailPercentage%"
	fi

fi
