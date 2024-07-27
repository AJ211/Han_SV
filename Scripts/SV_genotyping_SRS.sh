vcf=paragraph_input.vcf
file=sample_info.txt
dir=$PWD
nt=8
ref=$dir/1000G-30X-BAM/Homo_sapiens_assembly38.fasta

/public/home/fan_lab/gongjiao/miniconda3/envs/paragraph/bin/python3.7 /public/home/fan_lab/gongjiao/miniconda3/envs/paragraph/bin/multigrmpy.py \
 -i ${vcf} \
 -m ${file}  \
 -o para_outs/para_out_${sample}  \
 -r ${ref}  \
 -t $nt   \
 -M 600
