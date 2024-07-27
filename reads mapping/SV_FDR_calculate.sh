## false negative rate
neg=`gorpipe "Audano_SV.gor | join -snpseg -f 500  Han_SV.gor" |awk '$5!=0{print} ($5 ==0 && $7-$2 <= 500) || ($5 ==0 && $2-$6 <= 500){print}'|cut -f 1-4 |sort|uniq |wc -l`
total=`cat Audano_SV.gor|wc -l`
false_nega_rate=$(echo "scale=2; $neg / $total" | bc)
printf "the false negative rate of SVs in this study is: %.2f\n" $false_nega_rate

## false positive rate
pos=`gorpipe "Han_SV.gor | join -snpseg -f 500 Audano_SV.gor" |awk '$8!=0{print} ($8 ==0 && $10-$2 <= 500) || ($8 ==0 && $2-$9 <= 500){print}'|cut -f 6 |sort|uniq |wc -l`
total=`cat Han_SV.gor|wc -l`
false_posi_rate=$(echo "scale=2; $pos / $total" | bc)
printf "the false positive rate of SVs in this study is: %.2f\n" $false_posi_rate
