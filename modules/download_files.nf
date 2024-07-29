

process download {

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

