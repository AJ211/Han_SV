## step1 SV De novo calling per sample
dir=$PWD
nt=8
vcf=${dir}/vcf_outfile/${sample}.cuteSV.vcf
ref=hg38.fa
cuteSV=/public/home/fan_lab/gongjiao/miniconda3/bin/cuteSV
bam=${dir}/bam/${sample}_ngmlr_sorted.bam
$cuteSV --max_cluster_bias_INS 100 --diff_ratio_merging_INS 0.3 --max_cluster_bias_DEL 100 --diff_ratio_merging_DEL 0.3 -S $sample -t ${nt} -s 3 --genotype ${bam} ${ref}  ${vcf}  ${dir}/${sample}

## step2 merge SVs across all samples
ls ${dir}/vcf_outfile/${sample}.cuteSV.vcf >vcf_input.txt
SURVIVOR merge vcf_input.txt  500 1 1 -1 -1 -1 merge_SV.vcf

## SV re-genotyping using LRcaller
bam=$dir/${sample}_ngmlr_sorted.bam
vcf_input=merge_SV.vcf
lrcaller -nt  ${nt} -mapQ 20 -fa ${ref}  ${bam}  ${vcf_input}  ${dir}/geno_out/${sample}_lrcaller_out.vcf

## merge SVs again across all samples
bcftools merge -Oz -o 945samples_merge.vcf.gz -l merge_vcf_list.txt
