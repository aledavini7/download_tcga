/*
 * pipeline input parameters
 */
nextflow.enable.dsl = 2

//params.outdir = "/hpcscratch/ieo/ieo5898/tcga_aml/bams"
//params.gdc_client = "/hpcnfs/scratch/ED/CLAM/gdc-client"
//params.gdc_token = "/hpcnfs/scratch/ED/CLAM/gdc_token/gdc-user-token.2024-06-27T15_25_22.163Z.txt"

include { download } from './modules/download_files.nf'

workflow {

    Channel
        .fromPath("/data/davini/ids.txt")
        .splitText().map{it -> it.trim()}
        .set { samples_ch }

    samples_ch.view()

    bams_ch = download(samples_ch)


}
