create table Almacen(Numero_Almacen integer,Ubicacion_Almacen varchar2(50),
                      constraint PK_NUM_ALM PRIMARY KEY (Numero_Almacen));
                      
CREATE OR REPLACE PROCEDURE guardar_almacen(my_num_alm IN INTEGER,
                                my_ubicacion IN varchar2)
                                AS 
                                BEGIN
                                --CUERPO O LOGICA DEL PROCEDIMIENTO
                      INSERT INTO almacen values(my_num_alm,my_ubicacion);
                      end;
                      /
--usaremos un bloque PL SQL para probar que esta bien nuestro procedimiento

BEGIN
guardar_almacen(321,'ECATEPEC');
END;
/

SELECT * FROM ALMACEN;
--Probar el procedimiento con netbeans 
