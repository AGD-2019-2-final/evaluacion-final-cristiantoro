-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' 
   AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)},f3:MAP[]);
r = FOREACH data GENERATE FLATTEN(f3) AS f4;
grupo = GROUP r by $0;
conteo = FOREACH grupo GENERATE group, COUNT($1);
STORE conteo INTO 'output' USING PigStorage(',');