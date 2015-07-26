# DataCleaning (Code book)
I apologize because I write my comments in Spanish, my mother language.

Proyecto del Curso de obtención y limpieza de datos.

Las fuentes de datos se encuentran en el siguiente documento ZIP: 

<a href="http://https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

Como nombre de las variables se ha escogido los propios de las fuentes de datos originales, para que puedan ser identificadas rpaidamente por los participantes en el curso. Junto a las 66 variables (tBodyAcc-mean()-X, , tBodyAcc-mean()-Y, tBodyAcc-mean()-Z...) que se encuentran descritas en el documento features.txt.Concretmente se han cogido la variables con los siguientes ids: 1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228, 240,241,253,254,266,267,268,269,270,271,345,346,	347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543.

Adicional a esas variables en el dataset se han incorporado <b>3 variables más</b>:

<ul>
<b>Activity</b>, que hace alusión a las 6 actividades medidas, es decir WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

<b>Subject</b>, que hace alusión al sujeto que ha realizado la actividad.

<b>TestTrain</b> Hace referencia a si la medición es de Test o de Train

