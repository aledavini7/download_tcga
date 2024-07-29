

process download {

    conda '/hpcnfs/home/ieo5898/miniconda3/envs/snake'

    publishDir "${params.outdir}", mode: 'copy'

    input:
    val(x)
    
    output:
    tuple val(x), path("${x}")

    script:
    """
    $params.gdc_client download -t $params.gdc_token $x
    """

}

