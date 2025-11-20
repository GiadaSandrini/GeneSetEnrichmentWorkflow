
# "Prepare_Enrichment" prepares the genesets according to predefined biological processes (GROUPS)

#' Prepares and organizes gene sets required for downstream enrichment analyses.
#' The function loads pathway collections from predefined biological GROUPS
#' (e.g., Hallmarks, KEGG, Reactome, MitoCarta) and formats them into a structure
#' that can be used by Compute_Enrichment and Plot_Enrichment.
#'
#' Reactome and MitoCarta gene sets must be downloaded beforehand:
#' - MitoCarta: https://www.broadinstitute.org/mitocarta/mitocarta30-inventory-mammalian-mitochondrial-proteins-and-pathways
#' - Reactome: https://reactome.org -> Download -> Pathway Information -> Reactome Pathways Gene Set
#'
#' @param my_species Species name, either "Homo sapiens" or "Mus musculus".
#' @param sorted_pathway_directory Path to the directory containing sorted pathway files.
#' Each file must define an object containing the gene sets for that biological category.
#' If users want to reproduce or customize this structure, the complete
#' directory can be downloaded.
#'
#' @return
#' A named list in which each element corresponds to a biological GROUP.
#' Each element contains a vector or list of gene sets formatted for enrichment
#' analysis.
#' This output is meant to be passed directly to `Compute_Enrichment`.
#'
#' @examples
#' Prepare enrichment data for human
#' Prepare_Enrichment(my_species = "Homo sapiens", sorted_pathway_directory = "path/to/Sorted_pathways")}

Prepare_Enrichment = function(my_species = "Homo sapiens", sorted_pathway_directory){

  # Download Genesets for Hallmark, Kegg pathways
  GSEA_H_dataframe = msigdbr(species = my_species, collection = "H")
  GSEA_K_dataframe = msigdbr(species = my_species, collection = "C2", subcollection = "CP:KEGG_LEGACY")
  #GSEA_K_dataframe_medicus = msigdbr(species = my_species, collection = "C2", subcollection = "CP:KEGG_MEDICUS")

  # Load reactome pathways
  GSEA_R = fgsea::gmtPathways(paste0(sorted_pathway_directory, "/ReactomePathways.gmt"))

  if(my_species == "Mus musculus"){

    human <- useMart("ensembl", dataset = "hsapiens_gene_ensembl", host = "https://dec2021.archive.ensembl.org/")
    mouse <- useMart("ensembl", dataset = "mmusculus_gene_ensembl", host = "https://dec2021.archive.ensembl.org/")

    human_genes = unique(unlist(GSEA_R))
    converted_genes <- getLDS(attributes = c("hgnc_symbol"), filters = "hgnc_symbol",
                              values = human_genes, mart = human,
                              attributesL = c("mgi_symbol"), martL = mouse,
                              uniqueRows = TRUE)

    for(i_pathway in names(GSEA_R)){
      GSEA_R[[i_pathway]] = converted_genes %>% filter(HGNC.symbol %in% GSEA_R[[i_pathway]]) %>% pull(MGI.symbol)
    }
  }

  # Load Mitocarta pathways
  if(my_species == "Homo sapiens"){
    GSEA_M = cmapR::parse_gmx(paste0(sorted_pathway_directory, "/Human.MitoPathways3.0.gmx"))}
  if(my_species == "Mus musculus"){
    GSEA_M = cmapR::parse_gmx(paste0(sorted_pathway_directory, "/Mouse.MitoPathways3.0.gmx"))}
  GSEA_M = lapply(names(GSEA_M), function(x) GSEA_M[[x]][[4]]) %>% setNames(names(GSEA_M))

  # Convert dataframes to named lists
  GSEA_H = lapply(unique(GSEA_H_dataframe$gs_name), function(i_GS)
    as.matrix(filter(GSEA_H_dataframe, gs_name == i_GS))[,"gene_symbol"])
  names(GSEA_H) = unique(GSEA_H_dataframe$gs_name)
  GSEA_K = lapply(unique(GSEA_K_dataframe$gs_name), function(i_GS)
    as.matrix(filter(GSEA_K_dataframe, gs_name == i_GS))[,"gene_symbol"])
  names(GSEA_K) = unique(GSEA_K_dataframe$gs_name)

  # Combine gene sets from Hallmark, KEGG, Reactome, and Mitocarta
  GSEA_combined = c(GSEA_H, GSEA_K, GSEA_R, GSEA_M)

  ### Loading sorted pathways for enrichment analysis

  sorted_pathways = list()

  for (i_GROUP in c("hallmarks", "kegg_metabolism", "kegg_gip", "kegg_cprocess",
                    "kegg_orgsys", "reactome_cellcycle", "reactome_cellcomm",
                    "reactome_develop", "reactome_signaling", "reactome_damage",
                    "reactome_transcription", "reactome_transcription_targets",
                    "reactome_metab_carbo", "reactome_metab_lipids", "reactome_metab_energy",
                    "reactome_metab_other", "reactome_immune_innate", "reactome_immune_adaptive",
                    "reactome_immune_cytokines", "reactome_apoptosis", "reactome_protlocalization",
                    "reactome_vmtransport", "reactome_sig_rtk1", "reactome_sig_rtk2",
                    "reactome_sig_other1", "reactome_sig_other2", "Mitocarta_1",
                    "Mitocarta_2")){
    #print(i_GROUP)
    source(paste0(sorted_pathway_directory, "/", i_GROUP, ".R"))
    sorted_pathways[[i_GROUP]] = group
  }
  return(list(sorted_pathways = sorted_pathways, GSEA_combined = GSEA_combined))
}

#' Identification_DEmethod
#'
#' This function is part of "Compute_Enrichment". It identifies the method used for
#' differential expression analysis (DESeq2, limma, or proDA) based on column names
#' in the input and returns the associated parameter names required for enrichment.
#' When parameters are already provided, the function skips detection and uses the
#' user-defined inputs.
#'
#' @param temp_DE_output A data frame containing differential expression results.
#' @param my_p_value Optional. Name of the p-value column supplied by the user.
#' @param my_log2FC Optional. Name of the log2 fold-change column.
#' @param symbol_weight Optional. Name of the column used as ranking statistic.
#'
#' @return A list with the column names for p-value, log2FC, feature weight and symbol.

Identification_DEmethod = function(list_DE_outputs, my_p_value, symbol_weight, Feature_name, my_log2FC){

  # Identify DE method based on the column names
  DE_method = "none"
  if(all(c("padj", "stat", "SYMBOL", "log2FoldChange") %in% colnames(list_DE_outputs[[1]]))){
    DE_method = "Deseq"}
  if(all(c("adj.P.Val", "t", "logFC") %in% colnames(list_DE_outputs[[1]]))){
    DE_method = "limma"}
  if(all(c("adj_pval", "t_statistic", "name", "diff") %in% colnames(list_DE_outputs[[1]]))){
    DE_method = "proDA"}

  # Set default values if parameters are NULL

  if(is.null(my_p_value)){
    if (DE_method == "Deseq"){my_p_value = "padj"}
    if (DE_method == "limma"){my_p_value = "adj.P.Val"}
    if (DE_method == "proDA"){my_p_value = "adj_pval"}
  }
  if(is.null(symbol_weight)){
    if (DE_method == "Deseq"){symbol_weight = "stat"}
    if (DE_method == "limma"){symbol_weight = "t"}
    if (DE_method == "proDA"){symbol_weight = "t_statistic"}
  }
  if(is.null(Feature_name)){
    if (DE_method == "Deseq"){Feature_name = "SYMBOL"}
    if (DE_method == "limma"){list_DE_outputs = lapply(list_DE_outputs, function(df){
      df$Symbol_names = rownames(df)
      return(df)
    })
    Feature_name = "Symbol_names"}
    if (DE_method == "proDA"){Feature_name = "name"}
  }
  if(is.null(my_log2FC)){
    if (DE_method == "Deseq"){my_log2FC = "log2FoldChange"}
    if (DE_method == "limma"){my_log2FC = "logFC"}
    if (DE_method == "proDA"){my_log2FC = "diff"}
  }

  Variables = list(my_p_value = my_p_value, symbol_weight = symbol_weight,
                   Feature_name = Feature_name, my_log2FC = my_log2FC)

  return(Variables)
}


#' Compute_Enrichment
#'
#' Performs pathway enrichment analysis across multiple comparisons using
#' differential expression (DE) outputs and curated gene sets.
#' Supported enrichment methods include:
#' - **GSEA** (via fgsea)
#' - **camera** (from limma)
#' - **ORA** (via clusterProfiler)
#'
#' The function automatically detects the DE method (DESeq2, limma, or proDA)
#' using `Identification_DEmethod`, **but only when the relevant parameters
#' (p-value column, log2FC column, ranking statistic)** have not been specified
#' by the user.
#' When these parameters are manually provided, no automatic detection is performed.
#'
#' Multiple testing correction is applied **within each biological GROUP**, in
#' accordance with the structure defined in `Prepare_Enrichment`.
#'
#' @param DE_output_list A named list of differential expression dataframes. Each
#'        element corresponds to a comparison.
#' @param my_p_value Name of the column containing adjusted or raw p-values.
#'        If not provided, the function attempts to infer it automatically.
#' @param my_log2FC Name of the log2 fold-change column. Can be left empty when
#'        using methods that do not require fold changes (e.g., camera).
#' @param symbol_weight Name of the column used as ranking statistic for GSEA.
#'        If not provided, the function attempts to detect it.
#' @param Feature_name Name of the gene identifier column (e.g., "SYMBOL").
#' @param enrich_method Enrichment strategy to use: `"GSEA"`, `"camera"`, or `"ORA"`.
#' @param p_threshold_enrich adjusted P-value threshold used to filter significant
#'        enrichment results.
#' @param my_gene_list A prepared list of gene sets, the output of `Prepare_Enrichment`.
#'
#' @return
#' A named list in which each element corresponds to one biological GROUP.
#' Each element contains:
#' - an enrichment table for each comparison,
#' - adjusted p-values within the GROUP,
#' - the standardized pathway order defined in `Prepare_Enrichment`.
#'
#' @examples
#' # Camera enrichment using detected DE parameters
#' results <- Compute_Enrichment(
#'   list_DE_outputs   = DE_list,
#'   my_GeneSet        = gene_sets,
#'   my_sorted_pathways = sorted_paths,
#'   enrich_method     = "camera")

Compute_Enrichment = function(list_DE_outputs, my_GeneSet, my_sorted_pathways,
                              p_threshold = 0.05, FC_threshold = 0.5, p_threshold_enrich = 0.05,
                              enrich_method,
                              my_p_value = NULL, symbol_weight = NULL, Feature_name = NULL,
                              my_log2FC = NULL){

  # Step 1: Call Identification_DEmethod to identify or verify parameter names.
  Variables = Identification_DEmethod(list_DE_outputs, my_p_value, symbol_weight, Feature_name, my_log2FC)

  # Extract parameters
  my_p_value = Variables$my_p_value
  symbol_weight = Variables$symbol_weight
  Feature_name = Variables$Feature_name
  my_log2FC = Variables$my_log2FC

  # Step 2: Preparing GeneSet object

  sorted_pathways_genes = list()

  for (i_group in names(my_sorted_pathways)){   # Considering each GROUP of pathways (1 GROUP = 1 image)
    keep_pathways = as.character(unlist(my_sorted_pathways[[i_group]])) # Selecting all pathways which belong to i_group
    my_GROUP_GeneSet = lapply(keep_pathways, function(x) my_GeneSet[[x]])
    names(my_GROUP_GeneSet) = keep_pathways
    sorted_pathways_genes[[i_group]] = my_GROUP_GeneSet
  }

  # Step 3: Perform enrichment analysis

  Enrich_res = list()
  Enrich_res_up = list()
  Enrich_res_down = list()

  # Iterate over each pathway group
  for (i_group in names(my_sorted_pathways)){
    print(i_group)

    # Retrieve the list of pathways associated with the current group
    temp_sorted_pathway = sorted_pathways_genes[[i_group]]

    # Define a dataframe that maintains the order of pathways (useful for visualization)
    Order_temp = data.frame(GeneSet = names(temp_sorted_pathway),
                            Order = 1:length(names(temp_sorted_pathway)))

    # Create a dataframe that links gene sets to their corresponding group
    my_sorted_pathways_df = plyr::ldply(my_sorted_pathways[[i_group]], data.frame) %>%
      dplyr::rename(., GeneSetGroup = .id, GeneSet = X..i..)

    # Iterate over different DE comparisons
    for (i_DE_output in names(list_DE_outputs)){

      # Extract the DE results
      temp_DE_output = list_DE_outputs[[i_DE_output]] %>% distinct(!!sym(Feature_name), .keep_all = TRUE) %>% data.frame()

      # Performing enrichment analysis

      # Performing enrichment with camera function
      if(enrich_method == "camera"){
        input_enrich = structure(temp_DE_output[,symbol_weight], names = temp_DE_output[,Feature_name])
        idx.my_pathway = limma::ids2indices(temp_sorted_pathway, id=names(input_enrich))
        idx.my_pathway = idx.my_pathway[c(unique(names(idx.my_pathway)))]
        Enrich_res_temp = cameraPR.default(statistic = input_enrich, idx.my_pathway, use.ranks = T)

        # Defining some variables usefull to generate the plot in the next session
        Enrich_res[[i_group]][[i_DE_output]] = Enrich_res_temp %>% mutate(GeneSet = rownames(Enrich_res_temp),
                                                                          Comparison = i_DE_output,
                                                                          Score = -1*log10(Enrich_res_temp$FDR),
                                                                          Direction = factor(dplyr::case_when(Direction == "Up" & FDR < p_threshold_enrich ~ "Up",
                                                                                                              Direction == "Down" & FDR < p_threshold_enrich ~ "Down",
                                                                                                              TRUE ~ "Not sig"), levels = c("Up", "Down", "Not sig"))) %>%
          left_join(., my_sorted_pathways_df, by = "GeneSet") %>%
          left_join(., Order_temp, by = "GeneSet", relationship = "many-to-many") # It is possible that a geneset maps multiple groups
      }

      # Performing enrichment with gsea function
      if(enrich_method == "gsea"){
        input_enrich = structure(temp_DE_output[,symbol_weight], names = temp_DE_output[,Feature_name])# stat is used as weight
        input_enrich = sort(input_enrich, decreasing = TRUE)
        Enrich_res_temp = fgsea::fgseaMultilevel(pathways = temp_sorted_pathway,
                                                 stats = input_enrich,
                                                 minSize=15, ## minimum gene set size
        )
        Enrich_res[[i_group]][[i_DE_output]] = Enrich_res_temp %>% mutate(GeneSet = pathway,
                                                                          Comparison = i_DE_output,
                                                                          Score = -1*log10(Enrich_res_temp$padj),
                                                                          Direction = factor(dplyr::case_when(NES > 0 & padj < p_threshold_enrich ~ "Up",
                                                                                                              NES < 0 & padj < p_threshold_enrich ~ "Down",
                                                                                                              TRUE ~ "Not sig"), levels = c("Up", "Down", "Not sig"))) %>%
          left_join(., my_sorted_pathways_df, by = "GeneSet") %>%
          left_join(., Order_temp, by = "GeneSet", relationship = "many-to-many") # It is possible that a geneset maps multiple groups
      }

      # Performing over-reppresentation analysis (ORA)

      if(enrich_method == "ORA"){

        # Define the background gene set
        background_set = temp_DE_output[,Feature_name]

        # Identify significantly upregulated and downregulated genes based on thresholds (p_threshold and FC_threshold)
        Set_to_test_UP = temp_DE_output %>% data.frame() %>%
          filter(!!sym(my_p_value) < p_threshold & !!sym(my_log2FC) > FC_threshold)
        Set_to_test_DOWN = temp_DE_output %>% data.frame() %>%
          filter(!!sym(my_p_value) < p_threshold & !!sym(my_log2FC) < FC_threshold)

        # Create a mapping of pathways to genes
        TERM2GENE_temp = plyr::ldply(temp_sorted_pathway, data.frame) %>%
          dplyr::rename(gs_name = .id, gene_symbol = X..i..)

        # Perform ORA for UP-regulated genes

        Enrich_res_up_temp = clusterProfiler::enricher(
          gene = Set_to_test_UP[,Feature_name], # A vector of your genes of interest
          pvalueCutoff = 0.1,
          pAdjustMethod = "BH",
          universe = background_set, # A vector containing your background set genes
          # The pathway information should be a data frame with a term name or
          # identifier and the gene identifiers
          TERM2GENE = TERM2GENE_temp
        )

        # Perform ORA for DOWN-regulated genes

        Enrich_res_down_temp = clusterProfiler::enricher(
          gene = Set_to_test_DOWN[,Feature_name], # A vector of your genes of interest
          pvalueCutoff = 0.05, # Can choose a FDR cutoff
          pAdjustMethod = "BH", # Method to be used for multiple testing correction
          universe = background_set, # A vector containing your background set genes
          # The pathway information should be a data frame with a term name or
          # identifier and the gene identifiers
          TERM2GENE = TERM2GENE_temp
        )

        # Store results for UP-regulated gene sets if enrichment is detected

        if(!is.null(Enrich_res_up_temp)){
          Enrich_res_up[[i_group]][[i_DE_output]] = Enrich_res_up_temp@result %>% mutate(GeneSet = ID,
                                                                                         Comparison = i_DE_output,
                                                                                         Score = -1*log10(.$p.adjust),
                                                                                         Direction = factor(dplyr::case_when(p.adjust < p_threshold_enrich ~ "Up",
                                                                                                                             TRUE ~ "Not sig"), levels = c("Up", "Not sig"))) %>%
            left_join(., my_sorted_pathways_df, by = "GeneSet") %>%
            left_join(., Order_temp, by = "GeneSet", relationship = "many-to-many") # It is possible that a geneset maps multiple groups
        }

        # Store results for DOWN-regulated gene sets if enrichment is detected
        if(!is.null(Enrich_res_down_temp)){
          Enrich_res_down[[i_group]][[i_DE_output]] = Enrich_res_down_temp@result %>% mutate(GeneSet = ID,
                                                                                             Comparison = i_DE_output,
                                                                                             Score = -1*log10(.$p.adjust),
                                                                                             Direction = factor(dplyr::case_when(p.adjust < p_threshold_enrich ~ "Down",
                                                                                                                                 TRUE ~ "Not sig"), levels = c("Down", "Not sig"))) %>%
            left_join(., my_sorted_pathways_df, by = "GeneSet") %>%
            left_join(., Order_temp, by = "GeneSet", relationship = "many-to-many") # It is possible that a geneset maps multiple groups
        }
      }
    }
  }

  # The Enrich_res object stores the results of enrichment analysis for all comparisons and pathway groups.
  # It is structured as a nested list:
  #   - First level: Pathway groups
  #   - Second level: DE comparisons

  # If ORA method is used, return separate results for upregulated and downregulated genes
  if(enrich_method == "ORA"){
    Enrich_res = list(UP = Enrich_res_up, DOWN = Enrich_res_down)}

  # Return the final enrichment analysis results
  return(Enrich_res)
}

#' Plot_Enrichment
#'
#' Generates publication-ready dot plots summarizing enrichment results across
#' biological GROUPS. Each plot corresponds to one GROUP and preserves the
#' predefined ordering of pathways for consistent visual interpretation.
#'
#' The function automatically:
#' - extracts results for each GROUP,
#' - filters and formats the enrichment table,
#' - generates ggplot2 dot plots with color-coded statistics,
#' - saves the plots as **SVG** files, and
#' - exports the underlying results table as **Excel (.xlsx)**.
#'
#' This function is fully compatible with the output produced by
#' `Compute_Enrichment`, and it is intended as the final visualization step
#' in the enrichment workflow.
#'
#' @param Enrich_res A named list of enrichment results, typically the output of
#'        `Compute_Enrichment`. Each element corresponds to a biological GROUP
#'        and contains enrichment tables for each comparison.
#' @param fold_name Path to the directory where plots and data tables should be
#'        saved. The function automatically creates subdirectories when needed.
#'
#' @return
#' A named list of ggplot objects, one for each biological GROUP.
#'
#' @examples
#' # Example usage:
#' Plot_Enrichment(Enrich_res = my_enrichment_results, fold_name = "Enrichment_Plots")

Plot_Enrichment = function(Enrich_res, fold_name){

  if (!dir.exists(fold_name)){dir.create(fold_name)}

  P_list = list() # Initialize an empty list to store plots for each pathway group

  for (i_pathways in names(Enrich_res)){ # Loop through each pathway group

    Enrich_res_temp = Enrich_res[[i_pathways]] # Extract enrichment results for the current pathway group
    Enrich_res_temp_matrix = do.call(rbind, Enrich_res_temp) # Convert list to a matrix/data frame

    if (nrow(Enrich_res_temp_matrix) != 0){ # Proceed only if there are significant pathways

      # Generate dot plot
      P = ggplot(Enrich_res_temp_matrix, aes(x = Comparison, y = fct_reorder(GeneSet, Order))) +
        geom_point(shape = 21, na.rm = T, aes(size = Score, color = Direction, fill = Direction)) +
        scale_color_manual(values = c("Up" = "red3", "Down" = "blue3", "Not sig" = "grey")) +
        scale_fill_manual(values = c("Up" = "red3", "Down" = "blue3", "Not sig" = "grey")) +
        theme_bw() +
        labs(title = i_pathways, x = NULL, y = NULL) +
        facet_grid(GeneSetGroup ~ ., scale="free_y", space = "free_y") +
        theme(strip.text.y = element_text(size = 6),
              strip.background = element_rect(fill = "white",
                                              colour = "black"),
              axis.text.x=element_text(size = 10, colour="black", angle = 60, vjust=1, hjust = 1),
              axis.text.y=element_text(size = 10, colour="black"),
              plot.title = element_text(size = 18, hjust = 0.5))

      # Compute dynamic plot dimensions based on the number of pathways
      my_height = 1 + ((length(unique(P$data$GeneSet))/5) +
                         (15/length(unique(P$data$GeneSet))))
      my_width = (max(nchar(P$data$GeneSet))/15) + 1.5 + length(unique(P$data$Comparison))/2
      # Adjust width if pathway names are in uppercase (suggesting longer names)
      if(P$data$GeneSet[1] == toupper(P$data$GeneSet[1])){my_width = my_width+1.5}

      # Save plot as an SVG file
      ggsave(paste0(fold_name, "/", i_pathways, ".svg"), P, height = my_height, width = my_width, limitsize = FALSE)

      # Save enrichment data as an Excel file
      if ("pathway" %in% colnames(P$data)){
        openxlsx::write.xlsx(P$data %>% data.frame() %>% dplyr::select(Comparison, GeneSet, GeneSetGroup, size, pval, padj, log2err, ES, NES, Score, Direction), file = paste0(fold_name, "/", i_pathways, ".xlsx"), sep = "\t", rowNames = F)}
      if ("PValue" %in% colnames(P$data)){
        openxlsx::write.xlsx(P$data %>% data.frame() %>% dplyr::select(Comparison, GeneSet, GeneSetGroup, NGenes, PValue, FDR, Score, Direction), file = paste0(fold_name, "/", i_pathways, ".xlsx"), sep = "\t", rowNames = F)}
      if ("ID" %in% colnames(P$data)){
        openxlsx::write.xlsx(P$data %>% data.frame() %>% dplyr::select(Comparison, GeneSet, GeneSetGroup, GeneRatio, BgRatio, RichFactor, FoldEnrichment, zScore, pvalue, p.adjust, qvalue, Score, Direction, geneID), file = paste0(fold_name, "/", i_pathways, ".xlsx"), sep = "\t", rowNames = F)}

      # Store the plot in the list
      P_list[[i_pathways]] = P
    }
  }

  # Return the list of generated plots
  return(P_list)
}

