#####################################
#path: Camino absoluto donde se encuentran las fuentes de datos. Por ejemplo. C:/coursera/datacleaning
#
#
####################################

run_analysis <- function(path){
  
  setwd(path)
  
  #Vector con las logintudes de las 561 medidas cogidas por vector, que ocntando espacio en blanco es de 16 caracteres.
  longitudes <- c(1:561)
  longitudes[c(1:561)] = 16
  
  #Cogemos los datos de Test
  
  #Primero cogemos las medidas
  dfxTest <- read.fwf("./test/X_test.txt", longitudes)

  #Cogemos los sujetos
  dfsubjectsTest <- read.table("./test/subject_test.txt")
  
  #Fusionamos los dos data frame creados
  dfsubject_X_test <- cbind.data.frame(dfsubjectsTest,sfxTest)
  
  #Sólo cogemos las medidas asociadas a mean y std, columans de la 1 a la 6 de dfxTest, junto con el sujeto del que se ha obtenido la medición
  medidasTest <- subject_X_test[c(1:7)]
  
  #renombramos las dimensiones del data frame
  names(medidasTest) <- c("subject", "tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y", "tBodyAcc-std()-Z)")
  
  #Leemos las actividades realizadas por cada sujeto
  dfactivitiesTest <- read.table("./test/y_test.txt")
  
  #Asignamos nombre a la columna
  names(dfactivitiesTest) <- c("activityID")
  
  #Leemos el literal de cada actividad
  dfactivityLabelsTest <- read.table("activity_labels.txt")
  
  
  
}
