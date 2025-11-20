# Gene Set Enrichment Workflow
A collection of R functions designed to streamline and standardize transcriptomic and proteomic data analysis. This repository includes utilities for data preprocessing, differential expression analysis, pathway and gene set enrichment, visualization, and biological interpretation.

This repository contains utilities for data preprocessing, differential expression analysis, pathway and gene set enrichment, visualization, and biological interpretation. The R functions are designed to perform gene set enrichment analysis across multiple comparisons and improve the biological interpretability of results. The workflow allows grouping pathways into predefined biological categories and visualizing multiple comparisons at once, making it easier to interpret complex data.

---

## Functions

`Prepare_Enrichment` prepares gene sets from various sources including Hallmarks, KEGG, Reactome, and MitoCarta. It organizes them into structured biological groups and returns a combined list ready for downstream enrichment analysis. This function handles both human and mouse genes, converting orthologs when necessary.

`Identification_DEmethod` identifies the differential expression (DE) method used (DESeq2, limma, or proDA) based on the input data columns and returns the relevant column names for p-values, fold changes, gene identifiers, and ranking statistics. If parameters are provided by the user, the function uses those instead.

`Compute_Enrichment` performs enrichment analysis using the prepared gene sets and DE results. It supports GSEA, camera, and ORA methods, and applies multiple testing correction within each biological group. The function returns enrichment results organized by pathway group and by comparison, including separate results for up- and down-regulated genes if ORA is used.

`Plot_Enrichment` generates publication-ready dot plots summarizing enrichment results. Each plot corresponds to a biological group and preserves the predefined ordering of pathways. The function also saves SVG plots and Excel tables with the underlying data.

---

## Additional Files

The repository includes a folder called `Sorted_pathways` which contains all the files defining the pathway groups (GROUPS) used by the functions. Additionally, there is an HTML file with example documentation showing how to use the functions and interpret the results.

---
