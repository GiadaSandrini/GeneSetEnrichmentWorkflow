
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

signals_2msg= c( 
  "Intracellular signaling by second messengers",
  "PIP3 activates AKT signaling",
  "AKT phosphorylates targets in the cytosol",
  "AKT phosphorylates targets in the nucleus",
  "Negative regulation of the PI3K/AKT network",
  "PI5P, PP2A and IER3 Regulate PI3K/AKT Signaling",
  "PTEN Regulation",
  "Regulation of PTEN gene transcription",
  "Regulation of PTEN mRNA translation",
  "Regulation of PTEN localization",
  "Regulation of PTEN stability and activity",
  "DAG and IP3 signaling",
  "CaM pathway",
  "Calmodulin induced events",
  "PKA-mediated phosphorylation of CREB",
  "PKA activation",
  "CaMK IV-mediated phosphorylation of CREB",
  "Cam-PDE 1 activation"
  )

signals_rhogtp= c(
  "Signaling by Rho GTPases, Miro GTPases and RHOBTB3",
  "Signaling by Rho GTPases",
  "RHO GTPase cycle",
  "RHOA GTPase cycle",
  "RHOB GTPase cycle",
  "RHOC GTPase cycle",
  "RHOD GTPase cycle",
  "RHOF GTPase cycle",
  "RHOG GTPase cycle",
  "RHOH GTPase cycle",
  "RHOJ GTPase cycle",
  "RHOQ GTPase cycle",
  "RHOU GTPase cycle",
  "RHOV GTPase cycle",
  "RAC1 GTPase cycle",
  "RAC2 GTPase cycle",
  "RAC3 GTPase cycle",
  "CDC42 GTPase cycle",
  "RHOBTB GTPase Cycle",
  "RND1 GTPase cycle",
  "RND2 GTPase cycle",
  "RND3 GTPase cycle",
  "RHO GTPase Effectors",
  "RHO GTPases Activate ROCKs",
  "RHO GTPases activate PAKs",
  "RHO GTPases activate PKNs",
  "RHO GTPases activate CIT",
  "RHO GTPases activate KTN1",
  "RHO GTPases activate IQGAPs",
  "RHO GTPases regulate CFTR trafficking",
  "RHO GTPases Activate WASPs and WAVEs",
  "RHO GTPases Activate Formins",
  "RHO GTPases Activate Rhotekin and Rhophilins",
  "RHO GTPases Activate NADPH Oxidases",
  "RHOBTB1 GTPase cycle",
  "RHOBTB2 GTPase cycle",
  "RHOBTB3 ATPase cycle",
  "Miro GTPase Cycle",
  "RHOT1 GTPase cycle",
  "RHOT2 GTPase cycle"
)

signals_nrtk= c(
  "Signaling by Non-Receptor Tyrosine Kinases",
  "Signaling by PTK6",
  "PTK6 Expression",
  "ERBB2 Activates PTK6 Signaling",
  "PTK6 Activates STAT3",
  "PTK6 Regulates Cell Cycle",
  "PTK6 Regulates RHO GTPases, RAS GTPase and MAP kinases",
  "PTK6 Regulates Proteins Involved in RNA Processing",
  "PTK6 Regulates RTKs and Their Effectors AKT1 and DOK1",
  "PTK6 promotes HIF1A stabilization",
  "PTK6 Down-Regulation"
  )

signals_mtor= c(
  "MTOR signalling",
  "Inhibition of TSC complex formation by PKB",
  "mTORC1-mediated signalling",
  "Energy dependent regulation of mTOR by LKB1-AMPK"
  )

signals_drs= c(
  "Death Receptor Signalling",
  "FasL/ CD95L signaling",
  "TNF signaling",
  "TNFR1-induced NFkappaB signaling pathway",
  "TNFR1-induced proapoptotic signaling",
  "TNFR1-mediated ceramide production",
  "Regulation of TNFR1 signaling",
  "TRAIL  signaling",
  "p75 NTR receptor-mediated signalling",
  "NFG and proNGF binds to p75NTR",
  "Cell death signalling via NRAGE, NRIF and NADE",
  "NRAGE signals death through JNK",
  "NRIF signals cell death from the nucleus",
  "NADE modulates death signalling",
  "p75NTR negatively regulates cell cycle via SC1",
  "p75NTR signals via NF-kB",
  "p75NTR recruits signalling complexes",
  "NF-kB is activated and signals survival",
  "Ceramide signalling",
  "p75NTR regulates axonogenesis",
  "Axonal growth stimulation",
  "Axonal growth inhibition (RHOA activation)",
  "Regulated proteolysis of p75NTR"
  )

signals_ery= c(
  "Signaling by Erythropoietin",
  "Erythropoietin activates STAT5",
  "Erythropoietin activates Phosphoinositide-3-kinase (PI3K)",
  "Erythropoietin activates RAS",
  "Erythropoietin activates Phospholipase C gamma (PLCG)"
  )

signals_other= c(
  "Signaling by Hippo",
  "Signaling by Leptin"
)

 
group = list()

group$signals_2msg = signals_2msg
group$signals_rhogtp = signals_rhogtp
group$signals_nrtk = signals_nrtk
group$signals_mtor = signals_mtor
group$signals_drs = signals_drs
group$signals_ery = signals_ery
group$signals_other = signals_other
group$sigtras_mst1 = sigtras_mst1
