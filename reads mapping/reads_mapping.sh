dir=$PWD
nt=16
ref=hg38.fa
fq=${sample}_reads.fq.gz
samtools=/public/home/fan_lab/gongjiao/miniconda3/bin/samtools

## mapping
ngmlr -t $nt -r ${ref} -x ont -q $fq -o ${dir}/bam/${sample}.sam

## convert SAM format to BAM
$samtools view -bS -@ ${nt}  ${dir}/bam/${sample}.sam|$samtools sort -@ ${nt} -   > ${dir}/bam/${sample}_ngmlr_sort.bam
$samtools index  ${dir}/bam/${sample}_ngmlr_sort.bam
