-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
data = LOAD 'data.tsv' 
   AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:CHARARRAY);   
r = FOREACH data GENERATE FLATTEN(f2) AS f4;
grupo = GROUP r by f4;
conteo = FOREACH grupo GENERATE group, COUNT($1);
STORE conteo INTO 'output';