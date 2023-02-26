getMolecularFormula<-function(getINK)
{
  ##########################	
  url<- "https://www.metabolomicsworkbench.org/rest/compound/inchi_key/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getINK, "/all"))}, error = function(x) {return(NA)})
  ###########################
  OFOR<-tryCatch({out$formula},error=function(cond){return(NA)})
  ###########################
  return(tryCatch({OFOR[1]},error = function(x) {return(NA)}))
  ###########################

}

