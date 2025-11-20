# KEGG-GENETIC INFORMATION PROCESSING
kegg.gip_transcription = 
  c(
    # Carbohydrate metabolism
    "KEGG_RNA_POLYMERASE",
    "KEGG_BASAL_TRANSCRIPTION_FACTORS",
    "KEGG_SPLICEOSOME"
  )
kegg.gip_translation = 
  c(      
    # Energy metabolism
    "KEGG_RIBOSOME",
    "KEGG_AMINOACYL_TRNA_BIOSYNTHESIS"
  )
kegg.gip_foldsortdegra = 
  c(      
    # Lipid metabolism
    "KEGG_PROTEIN_EXPORT",
    "KEGG_SNARE_INTERACTIONS_IN_VESICULAR_TRANSPORT",
    "KEGG_ABC_TRANSPORTERS",
    "KEGG_UBIQUITIN_MEDIATED_PROTEOLYSIS",
    "KEGG_PROTEASOME",
    "KEGG_RNA_DEGRADATION"
  )


group = list()
group$kegg.gip_transcription = kegg.gip_transcription
group$kegg.gip_translation = kegg.gip_translation
group$kegg.gip_foldsortdegra = kegg.gip_foldsortdegra