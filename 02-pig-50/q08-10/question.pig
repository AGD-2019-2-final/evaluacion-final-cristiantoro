-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' 
   AS (f1:CHARARRAY, f2:BAG{t:tuple(p:CHARARRAY)},f3:MAP[]);
r = FOREACH data GENERATE FLATTEN(f2) AS f5,FLATTEN(f3) AS f4;
grupo = GROUP r BY (f5,f4);
top = FOREACH grupo GENERATE group, COUNT($1);
STORE top INTO 'output';