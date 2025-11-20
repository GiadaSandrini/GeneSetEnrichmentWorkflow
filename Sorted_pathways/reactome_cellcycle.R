# REACTOME CELL CYCLE

reactome.ckp = c(
  "Cell Cycle",
  "Cell Cycle Checkpoints")

reactome.ckp_g1 = c(
  
  "G1/S DNA Damage Checkpoints",
  "p53-Dependent G1/S DNA damage checkpoint",
  "p53-Independent G1/S DNA damage checkpoint"
)

reactome.ckp_g2 = c(
  "G2/M Checkpoints",
  "G2/M DNA damage checkpoint",
  "G2/M DNA replication checkpoint",
  "Activation of ATR in response to replication stress"
)

reactome.ckp_ms = c(
  "Mitotic Spindle Checkpoint",
  "Amplification of signal from the kinetochores"
)

reactome.cc = c(
  "Cell Cycle, Mitotic"
)

reactome.cc_g1 = c(
  "Mitotic G1 phase and G1/S transition",
  "G0 and Early G1",
  "G1 Phase",
  "G1/S Transition",
  "Cyclin E associated events during G1/S transition",
  "G1/S-Specific Transcription",
  "Activation of the pre-replicative complex",
  "E2F mediated regulation of DNA replication"
)

reactome.cc_s = c(    
  
  "S Phase",
  "Cyclin A:Cdk2-associated events at S phase entry",
  "Synthesis of DNA",
  "Ubiquitin-dependent degradation of Cyclin D",
  "Establishment of Sister Chromatid Cohesion"
)

reactome.cc_g2m = c(
  "Mitotic G2-G2/M phases"
)

reactome.cc_g2 = c(    
  "G2 Phase",
  "G2/M Transition",
  "Cyclin A/B1/B2 associated events during G2/M transition",
  "Regulation of PLK1 Activity at G2/M Transition",
  "Polo-like kinase mediated events",
  "Centrosome maturation",
  "The role of GTSE1 in G2/M progression after G2 checkpoint",
  "AURKA Activation by TPX2",
  "FBXL7 down-regulates AURKA during mitotic entry and in early mitosis",
  "Interaction between PHLDA1 and AURKA"
)

reactome.cc_m = c(        
  "M Phase",
  "Mitotic Prophase",
  "Golgi Cisternae Pericentriolar Stack Reorganization",
  "Condensation of Prophase Chromosomes",
  "MASTL Facilitates Mitotic Progression",
  "Nuclear Envelope Breakdown",
  "Mitotic Prometaphase",
  "Resolution of Sister Chromatid Cohesion",
  "Condensation of Prometaphase Chromosomes",
  "Recruitment of NuMA to mitotic centrosomes",
  "EML4 and NUDC in mitotic spindle formation",
  "Mitotic Metaphase and Anaphase",
  "Mitotic Metaphase/Anaphase Transition",
  "Mitotic Anaphase",
  "Mitotic Telophase/Cytokinesis",
  "Cohesin Loading onto Chromatin",
  "Regulation of mitotic cell cycle"
)

reactome_disease_cc =c(
  "Diseases of mitotic cell cycle",
  "Aberrant regulation of mitotic cell cycle due to RB1 defects",
  "Aberrant regulation of mitotic G1/S transition in cancer due to RB1 defects",
  "Aberrant regulation of mitotic exit in cancer due to RB1 defects",
  "Alternative Lengthening of Telomeres (ALT)"
)

reactome.dnareplication = c(
  "DNA Replication",
  "DNA Replication Pre-Initiation",
  "Assembly of the ORC complex at the origin of replication",
  "CDC6 association with the ORC:origin complex",
  "CDT1 association with the CDC6:ORC:origin complex",
  "DNA replication initiation",
  "Switching of origins to a post-replicative state",
  "Orc1 removal from chromatin",
  "CDK-mediated phosphorylation and removal of Cdc6",
  "DNA strand elongation",
  "Unwinding of DNA",
  "Leading Strand Synthesis",
  "Lagging Strand Synthesis"
)

reactome.chrm = c(    
  
  "Chromosome Maintenance",
  "Nucleosome assembly",
  "Telomere Maintenance",
  "Extension of Telomeres",
  "Packaging Of Telomere Ends",
  "Inhibition of DNA recombination at telomere"
)

reactome.meiosis = c( 
  "Meiosis",
  "Meiotic recombination",
  "Meiotic synapsis"
)


group = list()
group$reactome.ckp = reactome.ckp
group$reactome.ckp_g1 = reactome.ckp_g1
group$reactome.ckp_g2 = reactome.ckp_g2
group$reactome.ckp_ms = reactome.ckp_ms
group$reactome.cc = reactome.cc
group$reactome.cc_g1 = reactome.cc_g1
group$reactome.cc_s = reactome.cc_s
group$reactome.cc_g2m = reactome.cc_g2m
group$reactome.cc_g2 = reactome.cc_g2
group$reactome.cc_m = reactome.cc_m
group$reactome_disease_cc = reactome_disease_cc
group$reactome.dnareplication = reactome.dnareplication
group$reactome.chrm = reactome.chrm
group$reactome.meiosis = reactome.meiosis