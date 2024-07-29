/*
 * pipeline input parameters
 */
nextflow.enable.dsl = 2

params.outdir = "/hpcnfs/scratch/temporary/adav/bams"
//params.outdir = "/hpcnfs/scratch/ED/CLAM/dbgap/phs000235_dlbcl_fl/data/bams"
params.sratoolkit = "/hpcnfs/scratch/ED/CLAM/dbgap/sratoolkit.3.0.2-ubuntu64/bin/sam-dump"


include { sratool } from './modules/sratool.nf'

workflow {
	
	Channel
        .fromPath( '/hpcnfs/scratch/temporary/adav/sra/*/*.sra' )
		//.fromPath( '/hpcnfs/scratch/ED/CLAM/dbgap/phs000235_dlbcl_fl/data/sra/analysis/*/*.sra' )
        .set { sra_ch }

    sra_ch.map { it -> [it.simpleName, it] }
          .groupTuple()
          .set { final_sra_ch }
    
    bams_ch = sratool(final_sra_ch)

    
}

