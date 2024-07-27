dir=$PWD
bam=$dir/${sample}_ngmlr_sort.bam

## extract fasta sequence from BAM file
samtools view -bh  ${bam}  $bed  > ${sample}.bam
samtools index ${sample}.bam
samtools bam2fq  ${sample}.bam  > ${sample}.fq
bioawk -c fastx '{print ">"$name;print $seq }' ${sample}.fq   >> input.fa

## local assembly
flye --nano-raw input.fa --out-dir flye_out --threads 6
