

process download {

    publishDir "${params.outdir}", mode: 'copy'

    input:
    val(x)
    
    output:
    tuple val(x), path("${x}")

    script:
    """
    $params.gdc_client download $x --token-file $params.gdc_token
    """

}

