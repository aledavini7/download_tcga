/*
 * pipeline input parameters
 */
nextflow.enable.dsl = 2

params.outdir = "/hpcnfs/scratch/temporary/adav/sra"
//params.outdir = "/hpcnfs/scratch/ED/CLAM/dbgap/phs000235_dlbcl_fl/data/sra"
params.sratoolkit_prefetch = "/hpcnfs/scratch/ED/CLAM/dbgap/sratoolkit.3.0.2-ubuntu64/bin/prefetch"
params.my_key = "/hpcnfs/scratch/ED/CLAM/dbgap/my_project_key/prj_32315.ngc"

include { download } from './modules/download_files.nf'

workflow {

    Channel
        .fromPath( "/hpcnfs/scratch/ED/CLAM/dbgap/phs000235_dlbcl_fl/SRR_Acc_List.txt" )
        .splitText().map{it -> it.trim()}
        .set { samples_ch }

    samples_ch.view()

    sra_ch = download(samples_ch)

}

