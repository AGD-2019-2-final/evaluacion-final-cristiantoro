-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
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
data = LOAD 'data.csv' USING PigStorage(',')
   AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY, f4:CHARARRAY, f5:CHARARRAY, f6:INT);
letra1 = FOREACH data GENERATE f2, SUBSTRING(f2, 0, 1) AS letra;
mayor_m = FILTER letra1 by letra >= 'M';
resultado = FOREACH mayor_m GENERATE f2;
STORE resultado INTO 'output';
