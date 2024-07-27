dir=$PWD
nt=8
bam=$dir/${sample}.bam
#m ${bam} \
ref=hg38.fa
/public/home/fan_lab/gongjiao/software/manta-1.6.0.centos6_x86_64/bin/configManta.py \
--referenceFasta ${ref} \
--runDir ${dir}/${sample}   \
--generateEvidenceBam

${dir}/${sample}/runWorkflow.py  -j $nt

## delly
delly call -g $ref -d  $dir/output/${sample}_reads.txt.gz  $bam   > $dir/output/${sample}.vcf
