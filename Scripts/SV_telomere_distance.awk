#!/bin/awk
NR==FNR{
	a[$1]=$2"\t"$3"\t"$4"\t"$5
	}
NR!=FNR{
	if(a[$1]){ 
		split(a[$1],b,"\t")
		if($3 <= b[2]) ## SV is located at the telomere on the left side of the chromosome
		{   
			if($2-b[1]<=b[2]-$3)
			{
				dis=$2-b[1]
			}
			else
			{
				dis=b[2]-$3
			}
		}
		if($2 > b[2] && $3 < b[3])   ## SV is located in the middle of the telomeres at both ends of the chromosome 
		{
			if($2-b[2] <= b[3]-$3)
			{

				dis=$2-b[2]
			}
			else
			{
				dis=b[3]-$3
			}
		}
		if($2 > b[3])      ## SV is located at the telomere on the right side of the chromosome
		{
			if($2-b[3] <= b[4]-$3)
			{
				dis=$2-b[3]
			}
			else
			{
				dis=b[4]-$3
			}
		}


		print $1,$2,$3,$4,dis
	}

}


