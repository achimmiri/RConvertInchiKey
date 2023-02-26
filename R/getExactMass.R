getExactMass<-function(getINK)
{
  ### ####This function return INCHIKEY to other identifiers like Inchi,Inchikey,Smiles,CompoundID
  url<- "https://www.metabolomicsworkbench.org/rest/compound/inchi_key/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getINK, "/all"))}, error = function(x) {return(NA)})
  ###########################
  OEM<-tryCatch({out$exactmass},error=function(cond){return(NA)})
  ###########################
  return(tryCatch({OEM[1]},error = function(x) {return(0)}))

  ###########################

}

