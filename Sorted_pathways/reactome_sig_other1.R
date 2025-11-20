
signals_tgfbfam = c(
  "Signaling by TGFB family members",
  "TGF-beta receptor signaling activates SMADs",
  "Downregulation of TGF-beta receptor signaling",
  "TGF-beta receptor signaling in EMT (epithelial to mesenchymal transition)",
  "Transcriptional activity of SMAD2/SMAD3:SMAD4 heterotrimer",
  "SMAD2/SMAD3:SMAD4 heterotrimer regulates transcription",
  "Downregulation of SMAD2/3:SMAD4 transcriptional activity",
  "Signaling by BMP",
  "Signaling by Activin",
  "Antagonism of Activin by Follistatin"
)

signals_gpcr = c(
  "Signaling by GPCR",
  "GPCR ligand binding",
  "Class A/1 (Rhodopsin-like receptors)",
  "Peptide ligand-binding receptors",
  "Amine ligand-binding receptors",
  "Muscarinic acetylcholine receptors",
  "Adrenoceptors",
  "Dopamine receptors",
  "Histamine receptors",
  "Serotonin receptors",
  "Hormone ligand-binding receptors",
  "Eicosanoid ligand-binding receptors",
  "Prostanoid ligand receptors",
  "Leukotriene receptors",
  "Nucleotide-like (purinergic) receptors",
  "P2Y receptors",
  "Adenosine P1 receptors",
  "Hydroxycarboxylic acid-binding receptors",
  "Lysosphingolipid and LPA receptors",
  "Opsins",
  "Free fatty acid receptors",
  "Class B/2 (Secretin family receptors)",
  "Calcitonin-like ligand receptors",
  "Glucagon-type ligand receptors",
  "Class C/3 (Metabotropic glutamate/pheromone receptors)",
  "GPCR downstream signalling",
  "G alpha (s) signalling events",
  "G alpha (i) signalling events",
  "G alpha (z) signalling events",
  "G alpha (q) signalling events",
  "G alpha (12/13) signalling events",
  "G-protein beta:gamma signalling"
)

signals_wnt= c(
  "Signaling by WNT",
  "WNT ligand biogenesis and trafficking",
  "Degradation of beta-catenin by the destruction complex",
  "Beta-catenin phosphorylation cascade",
  "Repression of WNT target genes",
  "TCF dependent signaling in response to WNT",
  "WNT mediated activation of DVL",
  "Disassembly of the destruction complex and recruitment of AXIN to the membrane",
  "Formation of the beta-catenin:TCF transactivating complex",
  "Binding of TCF/LEF:CTNNB1 to target gene promoters",
  "Deactivation of the beta-catenin transactivating complex",
  "Degradation of DVL",
  "Degradation of AXIN",
  "Regulation of FZD by ubiquitination",
  "Negative regulation of TCF-dependent signaling by WNT ligand antagonists",
  "Negative regulation of TCF-dependent signaling by DVL-interacting proteins",
  "Beta-catenin independent WNT signaling",
  "PCP/CE pathway",
  "Ca2+ pathway"
)


  
signals_notch = c(
  "Signaling by NOTCH",
  "Pre-NOTCH Expression and Processing",
  "Pre-NOTCH Transcription and Translation",
  "Pre-NOTCH Processing in the Endoplasmic Reticulum",
  "Pre-NOTCH Processing in Golgi",
  "Signaling by NOTCH1",
  "Activated NOTCH1 Transmits Signal to the Nucleus",
  "NOTCH1 Intracellular Domain Regulates Transcription",
  "Signaling by NOTCH2",
  "NOTCH2 Activation and Transmission of Signal to the Nucleus",
  "NOTCH2 intracellular domain regulates transcription",
  "Signaling by NOTCH3",
  "NOTCH3 Activation and Transmission of Signal to the Nucleus",
  "NOTCH3 Intracellular Domain Regulates Transcription",
  "Signaling by NOTCH4",
  "NOTCH4 Activation and Transmission of Signal to the Nucleus",
  "NOTCH4 Intracellular Domain Regulates Transcription",
  "Negative regulation of NOTCH4 signaling"
)
  
signals_hedgehog= c(
  "Signaling by Hedgehog",
  "Hedgehog ligand biogenesis",
  "Release of Hh-Np from the secreting cell",
  "Hedgehog 'off' state",
  "Hedgehog 'on' state"
  )

signals_integrin= c(   
  "Integrin signaling",
  "GRB2:SOS provides linkage to MAPK signaling for Integrins",
  "p130Cas linkage to MAPK signaling for integrins"
  )

signals_nucrec= c(   
  "Signaling by Nuclear Receptors",
  "Signaling by Retinoic Acid",
  "RA biosynthesis pathway",
  "ESR-mediated signaling",
  "Estrogen-dependent gene expression",
  "Extra-nuclear estrogen signaling",
  "Estrogen-stimulated signaling through PRKCZ",
  "Estrogen-dependent nuclear events downstream of ESR-membrane signaling",
  "NR1H2 and NR1H3-mediated signaling",
  "NR1H3 & NR1H2 regulate gene expression linked to cholesterol transport and efflux",
  "NR1H2 & NR1H3 regulate gene expression to limit cholesterol uptake",
  "NR1H2 & NR1H3 regulate gene expression linked to lipogenesis",
  "NR1H2 & NR1H3 regulate gene expression linked to triglyceride lipolysis in adipose",
  "NR1H2 & NR1H3 regulate gene expression to control bile acid homeostasis",
  "NR1H2 & NR1H3 regulate gene expression linked to gluconeogenesis"
)

signals_mapk= c(   
  "MAPK family signaling cascades",
  "MAPK1/MAPK3 signaling",
  "RAF/MAP kinase cascade",
  "RAS processing",
  "RAF activation",
  "MAP2K and MAPK activation",
  "Negative regulation of MAPK pathway",
  "Negative feedback regulation of MAPK pathway",
  "Regulation of RAS by GAPs",
  "RAF-independent MAPK1/3 activation",
  "MAPK3 (ERK1) activation",
  "MAPK1 (ERK2) activation",
  "MAPK6/MAPK4 signaling"
  )


group = list()
group$signals_tgfbfam = signals_tgfbfam
group$signals_gpcr = signals_gpcr
group$signals_wnt = signals_wnt
group$signals_notch = signals_notch
group$signals_hedgehog = signals_hedgehog
group$signals_integrin = signals_integrin
group$signals_nucrec = signals_nucrec
group$signals_mapk = signals_mapk

