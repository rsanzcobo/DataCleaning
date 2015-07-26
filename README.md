# DataCleaning (Code book)
I apologize because I write my comments in Spanish, my mother language.

Proyecto del Curso de obtención y limpieza de datos.

Las fuentes de datos se encuentran en el siguiente documento ZIP: 

<a href="http://https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

El Script se encuentra en el archivo .R denominando <b>run_analysis.R</b>. Para ejecutarlo es necesario indicar donde se encuentra la carpeta "UCI HAR Dataset" como path, por ejemplo <u>run_analysis("./UCI HAR Dataset")</u> si la carpeta se encuentra en nuestra carpeta de trabajo.

La funcionalidad del Script es incompleta.  El estado de cada punto es el siguiente. En verde se codifica aquel que se ha conseguido y en rojo el que no.

<ul>
  <li>Merges the training and the test sets to create one data set.(OK)</li>
  <li>Extracts only the measurements on the mean and standard deviation for each measurement. (OK)</li>
  <li>Uses descriptive activity names to name the activities in the data set (OK)</li>
  <li>Appropriately labels the data set with descriptive variable names.(NO OK)</li>
</ul>

<b>Variables</b>

Hay un total de 66 + 4 variables:

<ul>

  <li><b>Variables de Medición (66)</b>: Como nombre de las variables se ha escogido los propios de las fuentes de datos originales, para que puedan ser identificadas rpaidamente por los participantes en el curso. Junto a las 66 variables (tBodyAcc-mean()-X, , tBodyAcc-mean()-Y, tBodyAcc-mean()-Z...) que se encuentran descritas en el documento <b>features.txt</b>.Concretmente se han cogido la variables con los siguientes ids: 1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228, 240,241,253,254,266,267,268,269,270,271,345,346,	347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543.</li>

  <li><b>ActivityID</b>, que hace referencia al ID de cada actividad medida.</li>

  <li><b>Activity</b>, que hace alusión a las 6 actividades medidas, es decir WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.</li>

  <li><b>Subject</b>, que hace alusión al sujeto que ha realizado la actividad.</li>

  <li><b>TestTrain</b> Hace referencia a si la medición es de Test o de Train</li>
</ul>

Al final se obtiene un juego de datos con la siguiente estructura

<table>
  <tr>
    <td>activityID</td>  <td>Activity</td>  <td>subject</td> <td>tBodyAcc-mean()-X</td>  <td>tBodyAcc-mean()-Y</td> <td>...</td> <td>fBodyBodyGyroJerkMag-std()</td>  <td>TestTrain</td>
    </tr>
    <tr>
  <td> 1</td>  <td>WALKING</td>      <td>12</td>     <td>0.2160924</td>         <td>-4.176104e-03</td> <td> ... </td> <td>-0.43997979</td> <td>Test</td>
  </table>
