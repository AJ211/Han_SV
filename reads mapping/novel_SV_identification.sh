## "$4==$8" was used to ensure the consistency of SV types across both studies
bedtools intersect -a SV_in_this_study.bed -b SV_in_previous_study.bed -wa -wb -f 0.5 -r |awk '$4==$8{print}'|cut -f 1-5  > reported_sv.bed
sort SV_in_this_study.bed reported_sv.bed reported_sv.bed | uniq -u  >novel_sv.bed
