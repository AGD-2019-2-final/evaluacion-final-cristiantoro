-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' 
   AS (f1:CHARARRAY, f2:BAG{t:tuple(p:CHARARRAY)},f3:MAP[]);
r = FOREACH data GENERATE f1,COUNT(f2.p) AS f4, SIZE(f3) AS f5;
top= ORDER r BY f1,f4,f5;
STORE top INTO 'output' USING PigStorage(',');