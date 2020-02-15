-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
-- salida.
-- 
--    1971-07-08,08,8,jue,jueves
--    1974-05-23,23,23,jue,jueves
--    1973-04-22,22,22,dom,domingo
--    1975-01-29,29,29,mie,miercoles
--    1974-07-03,03,3,mie,miercoles
--    1974-10-18,18,18,vie,viernes
--    1970-10-05,05,5,lun,lunes
--    1969-02-24,24,24,lun,lunes
--    1974-10-17,17,17,jue,jueves
--    1975-02-28,28,28,vie,viernes
--    1969-12-07,07,7,dom,domingo
--    1973-12-24,24,24,lun,lunes
--    1970-08-27,27,27,jue,jueves
--    1972-12-12,12,12,mar,martes
--    1970-07-01,01,1,mie,miercoles
--    1974-02-11,11,11,lun,lunes
--    1973-04-01,01,1,dom,domingo
--    1973-04-29,29,29,dom,domingo
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
y = FOREACH data GENERATE f4,ToDate(f4,'yyyy-MM-dd') AS fecha;
b = FOREACH y GENERATE f4, fecha, ToString(fecha, 'd') AS dia1, ToString(fecha, 'dd') AS dia2, LOWER(ToString(ToDate(f4,'yyyy-MM-dd'),'E')) AS dia3;
c = FOREACH b GENERATE f4,fecha, dia1, dia2, (
case dia3
when 'mon' then 'lun'
when 'tue' then 'mar'
when 'wed' then 'mie'
when 'thu' then 'jue'
when 'fri' then 'vie'
when 'sat' then 'sab'
else 'dom' END
) AS nombre_dia, 
(case dia3
when 'mon' then 'lunes'
when 'tue' then 'martes'
when 'wed' then 'miercoles'
when 'thu' then 'jueves'
when 'fri' then 'viernes'
when 'sat' then 'sabado'
else 'domingo' END
) AS nombre_dia2;
d = FOREACH c GENERATE f4, dia2, dia1, nombre_dia,nombre_dia2;
STORE d INTO 'output'USING PigStorage(',');
