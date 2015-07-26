#####################################
#path: Camino absoluto donde se encuentran las fuentes de datos. Por ejemplo. C:/coursera/datacleaning
#
#
####################################

run_analysis <- function(path){
  
  setwd(path)
  
  print(getwd())
  #Vector con las logintudes de las 561 medidas cogidas por vector, que ocntando espacio en blanco es de 16 caracteres.
  longitudes <- c(1:561)
  longitudes[c(1:561)] = 16
  
  # Mediciones de Mean() y STD()
  mediciones <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)
  
  ###### Cogemos los datos de Test ######
  
  #Primero cogemos las medidas
  dfxTest <- read.fwf("./test/X_test.txt", longitudes)
  
  #Cogemos todas las mediciones de mean() y std()
  dfxTest <- dfxTest[mediciones]
  
  #Cojo el nombre de las variables que queremos utilizar
  features <- read.table("features.txt")
  features <- features[mediciones,2]
  
  #Asignamos el nombre a cada variable
  names(dfxTest) <- features

  #Cogemos los sujetos
  dfsubjectsTest <- read.table("./test/subject_test.txt")
  names(dfsubjectsTest) <- c("subject")
  
  #Fusionamos los dos data frame creados
  dfsubject_X_test <- cbind.data.frame(dfsubjectsTest,dfxTest)
  
  #Sólo cogemos las medidas asociadas a mean y std, columans de la 1 a la 6 de dfxTest, junto con el sujeto del que se ha obtenido la medición
  #medidasTest <- dfsubject_X_test[c(1:7)]
  
  #renombramos las dimensiones del data frame
  #names(medidasTest) <- c("subject", "tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y", "tBodyAcc-std()-Z)")
  
  #Leemos las actividades realizadas por cada sujeto
  dfactivitiesTest <- read.table("./test/y_test.txt")
  
  #Asignamos nombre a la columna
  names(dfactivitiesTest) <- c("activityID")
  
  #Leemos el literal de cada actividad
  dfactivityLabelsTest <- read.table("activity_labels.txt")
  
  #Asignamos  nombre para poder fusionar.
  names(dfactivityLabelsTest) <- c("activityID", "Activity")

  # Fusionamos las mediciones con las actividades para después poder hacer el merge por el activityID con las etiquetas  
  dfTestDataSet <- cbind(dfactivitiesTest, dfsubject_X_test)
  
  #Fusionamos X, Y, Subject y Labels
  dfTestDataSet <- merge(dfactivityLabelsTest, dfTestDataSet)
  
  ##### Vamos a hacer lo mismo para la parte de Training ######
  
  print("Procesamos Training")
  
  #Cogemos los datos de Test
  
  #Primero cogemos las medidas
  dfxTrain <- read.fwf("./train/X_train.txt", longitudes)

  #Cogemos todas las mediciones de mean() y std()
  dfxTrain <- dfxTrain[mediciones]
  
  #Asignamos el nombre a las variables
  names(dfxTrain) <- features
  
  #Cogemos los sujetos
  dfsubjectsTrain <- read.table("./train/subject_train.txt")
  
  #Asignamos nombre a la variable
  names(dfsubjectsTrain) <- c("subject")
  
  #Fusionamos los dos data frame creados
  dfsubject_X_train <- cbind.data.frame(dfsubjectsTrain,dfxTrain)
  
  #Sólo cogemos las medidas asociadas a mean y std, columans de la 1 a la 6 de dfxTest, junto con el sujeto del que se ha obtenido la medición
  #medidasTrain <- dfsubject_X_train[c(1:7)]
  
  #renombramos las dimensiones del data frame
  #names(medidasTrain) <- c("subject", "tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y", "tBodyAcc-std()-Z)")
  
  #Leemos las actividades realizadas por cada sujeto
  dfactivitiesTrain <- read.table("./train/y_train.txt")
  
  #Asignamos nombre a la columna
  names(dfactivitiesTrain) <- c("activityID")
  
  #Leemos el literal de cada actividad
  dfactivityLabelsTrain <- read.table("activity_labels.txt")
  
  #Asignamos  nombre para poder fusionar.
  names(dfactivityLabelsTrain) <- c("activityID", "Activity")
  
  # Fusionamos las mediciones con las actividades para después poder hacer el merge por el activityID con las etiquetas  
  dfTrainDataSet <- cbind(dfactivitiesTrain, dfsubject_X_train)
  
  #Fusionamos X, Y, Subject y Labels
  dfTrainDataSet <- merge(dfactivityLabelsTrain, dfTrainDataSet)
  
  ############ Fusionamos Test y Train ############
  
  #Añadimos una columna para identificar Test/Train para la máquina de aprendizaje
  dfTrainDataSet$"TestTrain" <- "Train"
  dfTestDataSet$"TestTrain" <- "Test"
  
  #Fusionamos los dos data set.
  dfDataSet <- rbind.data.frame(dfTestDataSet,dfTrainDataSet)
  
  #Agrupamos por Subject y Activity
  group <- group_by(dfDataSet,subject, Activity)
  
  #Calculamos la media a cada agrupación
  tidy_dataset <- summarise_each(group, funs(mean))
  
  #Devolvemos el juego de datos ordenado
  tidy_dataset
  
}
