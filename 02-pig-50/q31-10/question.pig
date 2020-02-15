-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.csv' USING PigStorage(',')
   AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY, f4:CHARARRAY, f5:CHARARRAY, f6:INT);
y = FOREACH data GENERATE ToString(ToDate(f4,'yyyy-MM-dd'),'yyyy') AS year, f2;
b = GROUP y BY  year;
Result = FOREACH b GENERATE group,COUNT(y.f2); 
STORE Result INTO 'output'USING PigStorage(',');