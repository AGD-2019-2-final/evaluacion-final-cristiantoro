-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u
--    WHERE 
--        color REGEXP 'blue|green';
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
r = FOREACH data GENERATE f2, f5;
y =  FILTER r BY f5 MATCHES 'blue|green';
result = FOREACH y GENERATE $0, $1;
STORE result INTO 'output';