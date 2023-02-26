getisomericsmiles<-function(getINK)
{
  ###### This Functions return Isomeric smiles	
  url<- "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/inchikey/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getINK, "/JSON"))}, error = function(x) {return(NA)})
  prop.names  <-tryCatch({out$PC_Compounds$props[[1]][[1]]}, error = function(x) {return(NA)})
  prop.values <- tryCatch({out$PC_Compounds$props[[1]][[2]]}, error = function(x) {return(NA)})
  sm <-tryCatch({grep("smiles", prop.names[,"label"], ignore.case = TRUE)}, error = function(x) {return(NA)})
  csmiles<-c()
  if(length(sm) == 2 & !sjmisc::is_empty(sm)) {
    can <- tryCatch({grep("canonical", prop.names[,"name"], ignore.case = TRUE)}, error = function(x) {return(NA)})
    can1<-tryCatch({prop.values[sm[2],"sval"]},error= function(x) {return(NA)})
    csmiles<-c(csmiles,can1)
  }else{
    csmiles<-c(csmiles,NA)
  }
  return(csmiles)
  
}
