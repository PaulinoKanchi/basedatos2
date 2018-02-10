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
SELECT * FROM CLIENTE;
SELECT * FROM VENDEDOR;
SELECT * FROM VENTAS;
--Probar el procedimiento con netbeans

create table cliente(numero_cliente integer,numero_almacen integer,nombre_cliente varchar2(80),
                    constraint pk_n_c primary key(numero_cliente),
                    constraint fk1_n_a foreign key(numero_almacen)references almacen (numero_almacen));
                    
                    CREATE OR REPLACE PROCEDURE GUARDAR_CLIENTE(my_num_cliente IN INTEGER,
                                my_num_almacen IN INTEGER,my_nom_cliente IN varchar2)
                                AS 
                                BEGIN
                                --CUERPO O LOGICA DEL PROCEDIMIENTO
                      INSERT INTO cliente values(my_num_cliente,my_num_almacen,my_nom_cliente);
                      end;
                      /
                    
CREATE TABLE VENDEDOR(NUMERO_VENDEDOR INTEGER,NOMBRE_VENDEDOR varchar2(80),area_ventas varchar(60),CONSTRAINT P_N_V PRIMARY KEY(NUMERO_VENDEDOR));
drop table vendedor;
drop table ventas;
   CREATE OR REPLACE PROCEDURE GUARDAR_vendedor(my_num_vendedor IN INTEGER,
                                my_nom_vendedor IN varchar2,my_area_ven in varchar2)
                                AS 
                                BEGIN
                                --CUERPO O LOGICA DEL PROCEDIMIENTO
                      INSERT INTO vendedor values(my_num_vendedor,my_nom_vendedor,my_area_ven);
                      end;
                      /

CREATE TABLE VENTAS(ID_VENTAS INTEGER,NUMERO_CLIENTE INTEGER,NUMERO_VENDEDOR INTEGER,MONTO_VENTAS FLOAT,CONSTRAINT PK_I_V PRIMARY KEY(ID_VENTAS),
                    CONSTRAINT FK1_N_CL FOREIGN KEY (NUMERO_CLIENTE) REFERENCES CLIENTE(NUMERO_CLIENTE),
                    CONSTRAINT FK2_N_VEN FOREIGN KEY(NUMERO_VENDEDOR)REFERENCES VENDEDOR(NUMERO_VENDEDOR));
                    
                    
                    
                                    
CREATE TABLE calificaciones(id_calificaciones integer,materia varchar2(80),valor float,constraint pk_id_cal primary key(id_calificaciones));

create or replace procedure guardar_ventas(
my_id_ventas out integer,my_num_cli in integer,my_mon_ventas in float)
as
begin
select sec_ventas.nextval into my_id_ventas from dual;
insert into ventas values(my_id_ventas,my_num_cli,my_mon_ventas);
end;
/

create Sequence sec_ventas
start with 1
increment by 1
nomaxvalue;

--aqui va el procedimiento 
create or replace procedure guardar_calificacion(
my_id_calificacion out integer,my_materia in varchar2,my_valor in float)
as
begin
select sec_calificaciones.nextval into my_id_calificacion from dual;
insert into calificaciones values(my_id_calificacion,my_materia,my_valor);
end;
/

--probar el procedimeinto
declare
valor integer;
begin
guardar_calificacion(valor,'DMDW',8);
end;
/

--verificar
select * from calificaciones;--realacionado a uncursor implicito
delete from calificaciones where id_calificacionES=2;
select count(*) from calificaciones;--realacionado a uncursor implicito

--EJEMPLO DE CUTRSOR RXPLICITO CON LA TABLA DE CAIFCACIONES 
DECLARE 
CURSOR CUR_CALIF IS SELECT * FROM CALIFICACIONES;
BEGIN
   FOR REC IN CUR_CALIF LOOP
   DBMS_OUTPUT.PUT_LINE('Calificacion '||REC.VALOR||' Materia '||rec.materia);
   END LOOP;
END;
   /
  -- SET SERVEROUTPUT ON;








