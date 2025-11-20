##### signaling  

reactome_egfr = c(
  "Signaling by EGFR",
  "Signaling by EGFR in Cancer",
  "Signaling by Ligand-Responsive EGFR Variants in Cancer",
  "Signaling by EGFRvIII in Cancer",
  "Signaling by Overexpressed Wild-Type EGFR in Cancer"
)

reactome_fgfr = c(
  "Signaling by FGFR",
  "Signaling by FGFR in disease",
  "Signaling by FGFR1",
  "Signaling by FGFR1 in disease",
  "FGFR1 mutant receptor activation",
  "Signaling by FGFR1 amplification mutants",
  "Signaling by activated point mutants of FGFR1",
  "Signaling by cytosolic FGFR1 fusion mutants",
  "Signaling by plasma membrane FGFR1 fusions",
  "Signaling by FGFR2",
  "Signaling by FGFR2 in disease",
  "FGFR2 mutant receptor activation",
  "Activated point mutants of FGFR2",
  "Signaling by FGFR2 amplification mutants",
  "Signaling by FGFR2 IIIa TM",
  "Signaling by FGFR2 fusions",
  "Signaling by FGFR3",
  "Signaling by FGFR3 in disease",
  "Signaling by FGFR3 point mutants in cancer",
  "FGFR3 mutant receptor activation",
  "Signaling by activated point mutants of FGFR3",
  "t(4;14) translocations of FGFR3",
  "Signaling by FGFR3 fusions in cancer",
  "Signaling by FGFR4",
  "Signaling by FGFR4 in disease",
  "FGFR4 mutant receptor activation"
)

reactome_erbb2 = c(
  "Signaling by ERBB2",
  "Signaling by ERBB2 in Cancer",
  "Constitutive Signaling by Overexpressed ERBB2",
  "Signaling by ERBB2 KD Mutants",
  "Drug resistance in ERBB2 KD mutants",
  "Signaling by ERBB2 ECD mutants",
  "Signaling by ERBB2 TMD/JMD mutants",
  "Drug resistance in ERBB2 TMD/JMD mutants"
)

reactome_pi3k = c(
  "PI3K/AKT Signaling in Cancer",
  "Constitutive Signaling by Aberrant PI3K in Cancer",
  "Constitutive Signaling by AKT1 E17K in Cancer",
  "PTEN Loss of Function in Cancer"
)

reactome_notch1 = c(
  "Signaling by NOTCH1",
  "Signaling by NOTCH1 in Cancer",
  "Signaling by NOTCH1 t(7;9)(NOTCH1:M1580_K2555) Translocation Mutant",
  "Signaling by NOTCH1 HD Domain Mutants in Cancer",
  "Signaling by NOTCH1 PEST Domain Mutants in Cancer",
  "Signaling by NOTCH1 HD+PEST Domain Mutants in Cancer",
  "FBXW7 Mutants and NOTCH1 in Cancer"
)

reactome_tgfb = c(
  "Signaling by TGF-beta Receptor Complex",
  "Signaling by TGF-beta Receptor Complex in Cancer",
  "Loss of Function of SMAD2/3 in Cancer",
  "SMAD2/3 Phosphorylation Motif Mutants in Cancer",
  "SMAD2/3 MH2 Domain Mutants in Cancer",
  "Loss of Function of SMAD4 in Cancer",
  "Loss of Function of TGFBR1 in Cancer",
  "TGFBR1 LBD Mutants in Cancer",
  "TGFBR1 KD Mutants in Cancer",
  "Loss of Function of TGFBR2 in Cancer",
  "TGFBR2 MSI Frameshift Mutants in Cancer",
  "TGFBR2 Kinase Domain Mutants in Cancer"
)

reactome_wnt = c(
  "Signaling by WNT",
  "Signaling by WNT in cancer",
  "Signaling by APC mutants",
  "Signaling by AXIN mutants",
  "Signaling by AMER1 mutants",
  "Signaling by CTNNB1 phospho-site mutants",
  "Signaling by GSK3beta mutants",
  "Signaling by TCF7L2 mutants",
  "Signaling by LRP5 mutants",
  "Signaling by RNF43 mutants",
  "XAV939 stabilizes AXIN",
  "LGK974 inhibits PORCN"
)

reactome_hh = c(
  "Hh mutants abrogate ligand secretion"
)

reactome_mapk = c(
  "Signaling by RAS mutants",
  "RAS signaling downstream of NF1 loss-of-function variants",
  "Signaling by high-kinase activity BRAF mutants",
  "Signaling by moderate kinase activity BRAF mutants",
  "Paradoxical activation of RAF signaling by kinase inactive BRAF",
  "Signaling by BRAF and RAF fusions",
  "Signaling by RAF1 mutants",
  "Signaling by MAPK mutants",
  "Signaling by MAP2K mutants",
  "Signaling by MRAS-complex mutants"
)

reactome_kit = c(
  "Signaling by KIT in disease",
  "Signaling by juxtamembrane domain KIT mutants",
  "Signaling by extracellular domain mutants of KIT",
  "Signaling by phosphorylated juxtamembrane, extracellular and kinase domain KIT mutants",
  "KIT mutants bind TKIs",
  "Drug resistance of KIT mutants"
)

reactome_pdgfr = c(
  "Signaling by PDGF",
  "Signaling by PDGFR in disease",
  "Signaling by PDGFRA transmembrane, juxtamembrane and kinase domain mutants",
  "Signaling by PDGFRA extracellular domain mutants",
  "Signaling by cytosolic PDGFRA and PDGFRB fusion proteins",
  "Signaling by membrane-tethered fusions of PDGFRA or PDGFRB",
  "PDGFR mutants bind TKIs",
  "Drug resistance of PDGFR mutants"
)

reactome_flt3 = c(
  "FLT3 Signaling",
  "FLT3 signaling in disease",
  "Signaling by FLT3 ITD and TKD mutants",
  "Signaling by FLT3 fusion proteins",
  "FLT3 mutants bind TKIs",
  "Drug resistance of FLT3 mutants"
)

group = list()
group$reactome_egfr = reactome_egfr
group$reactome_fgfr = reactome_fgfr
group$reactome_erbb2 = reactome_erbb2
group$reactome_pi3k = reactome_pi3k
group$reactome_notch1 = reactome_notch1
group$reactome_tgfb = reactome_tgfb
group$reactome_wnt = reactome_wnt
group$reactome_hh = reactome_hh
group$reactome_mapk = reactome_mapk
group$reactome_kit = reactome_kit
group$reactome_pdgfr = reactome_pdgfr
group$reactome_flt3 = reactome_flt3
