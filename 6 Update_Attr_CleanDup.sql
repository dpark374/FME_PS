-------------------------------
--UPDATE ATTRIBUTE FROM CATALOG
-------------------------------
DO $$
DECLARE
    c CURSOR FOR  SELECT vdict.obj_class,
    ( SELECT columns.table_name
           FROM information_schema.columns
          WHERE columns.table_schema::text = 'lds_vector_t'::text AND columns.column_name::text = ((''::text || lower(vdict.category::text)) || ''::text) AND columns.table_name::text ~~ (((('%'::text || ''::text) || lower(vdict.obj_class::text)) || ''::text) || '%'::text)
         LIMIT 1) AS table_name,
    vdict.category,
    vdict.code,
    vdict.meaning
   FROM lds_vector.vdict
  WHERE (( SELECT columns.table_name
           FROM information_schema.columns
          WHERE columns.table_schema::text = 'lds_vector_t'::text AND columns.column_name::text = ((''::text || lower(vdict.category::text)) || ''::text) AND columns.table_name::text ~ '(1_|2_|3_|4_|5_)'::text  AND columns.table_name::text ~~ (((('%'::text || ''::text) || lower(vdict.obj_class::text)) || ''::text) || '%'::text)
         LIMIT 1)) IS NOT NULL;
		 
    r RECORD;
    n1 INTEGER;
    n2 INTEGER;
    col1 TEXT;
    tbl1 TEXT;
	tbl2 TEXT;
	obj1 TEXT;
	sel1 TEXT;
	sql  TEXT;
	col2 VARCHAR(50);
    col3 VARCHAR(50);
	col4 VARCHAR(50);
    col5 VARCHAR(50);
	mean1 TEXT;
	
BEGIN
    FOR r IN c LOOP
       col1 = r.category;

	   tbl2 = 'lds_vector_t."'||r.table_name||'"';
       tbl1 = r.table_name;
	   obj1 = r.obj_class;
	   mean1 = r.meaning;	
	   n1 = r.code;	
		
       IF col1 = 'STATUS' THEN 
	   		   
		    EXECUTE format('SELECT STATUS ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY STATUS',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET STATUS = (SELECT lds_vector._get_status($1, STATUS))',tbl1) USING obj1;	

			ELSE		

			END IF;
				
		ELSEIF col1 = 'RESTRN' THEN 
	   		   
		    EXECUTE format('SELECT RESTRN ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY RESTRN',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET RESTRN = (SELECT lds_vector._get_restrn($1, RESTRN))',tbl1) USING obj1;	

			ELSE		

			END IF;
		
		ELSEIF col1 = 'NATCON' THEN 
	   		   
		    EXECUTE format('SELECT NATCON ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY NATCON',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;		
				EXECUTE format('UPDATE lds_vector_t.%I SET NATCON = (SELECT lds_vector._get_natcon($1, NATCON))',tbl1) USING obj1;	

			ELSE		

			END IF;
		
		ELSEIF col1 = 'CATSPM' THEN 
	   		   
		    EXECUTE format('SELECT CATSPM ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY CATSPM',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET CATSPM = (SELECT lds_vector._get_catspm($1, CATSPM))',tbl1) USING obj1;	

			ELSE		

			END IF;
		
		ELSEIF col1 = 'FUNCTN' THEN 
	   		   
		    EXECUTE format('SELECT FUNCTN ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY FUNCTN',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;		
				EXECUTE format('UPDATE lds_vector_t.%I SET FUNCTN = (SELECT lds_vector._get_functn($1, FUNCTN))',tbl1) USING obj1;	

			ELSE		

			END IF;
		
		ELSEIF col1 = 'CATLIT' THEN 
	   		   
		    EXECUTE format('SELECT CATLIT ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY CATLIT',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET CATLIT = (SELECT lds_vector._get_catlit($1, CATLIT))',tbl1) USING obj1;	

			ELSE		

			END IF;
		
		ELSEIF col1 = 'CATLMK' THEN 
	   		   
		    EXECUTE format('SELECT CATLMK ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY CATLMK',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;		
				EXECUTE format('UPDATE lds_vector_t.%I SET CATLMK = (SELECT lds_vector._get_catlmk($1, CATLMK))',tbl1) USING obj1;	

			ELSE		

			END IF;
			
		
		ELSEIF col1 = 'NATSUR' THEN 
	   		   
		    EXECUTE format('SELECT NATSUR ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY NATSUR',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET NATSUR = (SELECT lds_vector._get_natsur($1, NATSUR))',tbl1) USING obj1;	

			ELSE		

			END IF;
			
			
		ELSEIF col1 = 'NATQUA' THEN 
	   		   
		    EXECUTE format('SELECT NATQUA ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY NATQUA',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;
				EXECUTE format('UPDATE lds_vector_t.%I SET NATQUA = (SELECT lds_vector._get_natqua($1, NATQUA))',tbl1) USING obj1;	

			ELSE		

			END IF;
			
			
		ELSEIF col1 = 'CATLND' THEN 
	   		   
		    EXECUTE format('SELECT CATLND ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY CATLND',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET CATLND = (SELECT lds_vector._get_catlnd($1, CATLND))',tbl1) USING obj1;	

			ELSE		

			END IF;
			
		ELSEIF col1 = 'TECSOU' THEN 
	   		   
		    EXECUTE format('SELECT TECSOU ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY TECSOU',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET TECSOU = (SELECT lds_vector._get_tecsou($1, TECSOU))',tbl1) USING obj1;	

			ELSE		

			END IF;
			
		ELSEIF col1 = 'COLOUR' THEN 
	   		   
		    EXECUTE format('SELECT COLOUR ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY COLOUR',tbl1 ) into col3 ;
				
		    IF col3 = 't' THEN   
                	   raise notice 'Value: %', tbl1||' '||col1;	
				EXECUTE format('UPDATE lds_vector_t.%I SET COLOUR = (SELECT lds_vector._get_colour($1, COLOUR))',tbl1) USING obj1;	

			ELSE		

			END IF;
							
		ELSE	
			
			SELECT data_type INTO col3 FROM information_schema.columns where table_name = tbl1 and column_name = lower(col1) and table_schema = 'lds_vector_t';
			
			 IF col3 = 'numeric' THEN
				EXECUTE format('SELECT '||col1||' FROM lds_vector_t.%I WHERE '||col1||' = '||n1||' ORDER BY '||col1||'', tbl1 ) into col5;	
				
			 	raise notice 'Value: %', col5;
				
			 ELSE		
             	EXECUTE format('SELECT  '||col1||' ~ ''^[0-9\.,]+$'' FROM lds_vector_t.%I ORDER BY '||col1||'', tbl1 ) into col4;	     		
					IF col4 = 't' THEN   
                     
					   EXECUTE format('UPDATE lds_vector_t.%I SET '||col1||' = $1 WHERE '||col1||' = '''||n1||'''',tbl1) using mean1;
					   raise notice 'Value: %', tbl1||' '||col1;
		            ELSE	
			        END IF;


			END IF;
		
		END IF;
		

		
		
    
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-----------------------------
--UPDATE LONGITUDE 180 geometry ST_ShiftLongitude(geometry geomA); NOTE: this function was renamed from "ST_Shift_Longitude" in 2.2.0
-----------------------------
DO $$
DECLARE
    c CURSOR FOR

	SELECT columns.table_name
	FROM information_schema.columns
	WHERE columns.table_schema::text = 'lds_vector_t'::text 
	AND columns.table_name::text ~ '(1_|2_|3_|4_|5_)'::text
	AND column_name ='shape';

r RECORD;
tname VARCHAR(50);	

BEGIN
    FOR r IN c LOOP
	
	tname = r.table_name;
	raise notice 'Value: %', tname;
	
	EXECUTE format('UPDATE lds_vector_t.%I SET shape = ST_Shift_Longitude(shape)',tname);	
    
	
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;

------------------------------
--CLEAN FIDN DUPLICATION
-------------------------------

DO $$
DECLARE
    c CURSOR FOR  SELECT table_name FROM information_schema.columns where  table_schema = 'lds_vector_t' and column_name = 'fidn';
	
    r RECORD;
    n1 INTEGER;
    n2 INTEGER;
    col1 TEXT;
	col2 TEXT;
	col3 INTEGER;
	col4 INTEGER;
	col5 INTEGER;
	tbl1 TEXT;
	
	
BEGIN
    FOR r IN c LOOP
	
	tbl1 = r.table_name;
		EXECUTE format('SELECT fidn, count(fidn) FROM lds_vector_t.%I GROUP BY fidn HAVING count(fidn) > 1', tbl1 ) into col1, col2;
				
			IF col1 is not null THEN
             EXECUTE format('DROP TABLE IF EXISTS lds_vector_t."'||tbl1||'_TMP"');
			 EXECUTE format('CREATE TABLE lds_vector_t."'||tbl1||'_TMP" AS SELECT *, row_number() OVER (PARTITION BY fidn ORDER BY fidn) as rownum FROM lds_vector_t."'||tbl1||'"');
			 EXECUTE format('UPDATE lds_vector_t."'||tbl1||'_TMP" SET fidn = fidn||a.seq FROM (select fid,seq from regen_fidn) a WHERE a.fid=rownum and fidn in (SELECT fidn FROM lds_vector_t."'||tbl1||'" group by fidn having count(fidn) >1)');
		     EXECUTE format('DROP TABLE IF EXISTS lds_vector_t."'||tbl1||'"');
			 EXECUTE format('CREATE TABLE lds_vector_t."'||tbl1||'" AS SELECT * FROM lds_vector_t."'||tbl1||'_TMP"');
			 EXECUTE format('ALTER TABLE lds_vector_t."'||tbl1||'" DROP COLUMN rownum CASCADE');
			 EXECUTE format('DROP TABLE IF EXISTS lds_vector_t."'||tbl1||'_TMP"');
			ELSE
			END IF;
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;

---------------------------------
--FIDN PRIMARY KEY SIZE 10
---------------------------------

DO $$
DECLARE
    c CURSOR FOR

	SELECT columns.table_name
	FROM information_schema.columns
	WHERE columns.table_schema::text = 'lds_vector_t'::text 
	AND columns.table_name::text ~ '(1_|2_|3_|4_|5_)'::text
	AND column_name ='shape';

r RECORD;
tname VARCHAR(50);	

BEGIN
    FOR r IN c LOOP
	
	tname = r.table_name;
	raise notice 'Value: %', tname;
	
	EXECUTE format('ALTER TABLE lds_vector_t."'||tname||'" ADD CONSTRAINT "'||tname||'_PK" PRIMARY KEY (fidn)');
    EXECUTE format('UPDATE lds_vector_t."'||tname||'" SET fidn = lpad(fidn, 10,''0'')');
	EXECUTE format('ALTER TABLE lds_vector_t."'||tname||'" ALTER COLUMN fidn type varchar(10) USING substr(fidn,1,10)');
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;
