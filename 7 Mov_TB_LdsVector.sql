

DO $$
DECLARE
    c CURSOR FOR  SELECT tablename FROM pg_tables WHERE tableowner=current_user AND schemaname = 'lds_vector_t' AND tablename::text ~ '(1_|2_|3_|4_|5_)'::text;
	
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
		
             EXECUTE format('DROP TABLE IF EXISTS lds_vector."'||tbl1||'"');
	     EXECUTE format('ALTER TABLE lds_vector_t."'||tbl1||'" SET SCHEMA lds_vector');
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;


---------------------------------------
----------------------------------------

--GRANT SELECT ON ALL TABLES IN SCHEMA lds_vector TO lds_readonly;
--GRANT SELECT ON ALL TABLES IN SCHEMA lds_vector TO hydro_user;

------------------------------------------
--------------------------------------------
DO $$
DECLARE
    c CURSOR FOR  SELECT tablename FROM pg_tables WHERE tableowner=current_user AND schemaname = 'lds_vector' AND tablename::text ~ '(1_|2_|3_|4_|5_)'::text;
	
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
	
	tbl1 = r.tablename;
		
         EXECUTE format('GRANT SELECT ON lds_vector."'||tbl1||'" TO lds_readonly');
	     EXECUTE format('GRANT SELECT ON lds_vector."'||tbl1||'" TO hydro_user');
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;
------------------------------------------
-------------------------------------------

DO $$
DECLARE
    c CURSOR FOR  SELECT tablename FROM pg_tables WHERE tableowner=current_user AND schemaname = 'lds_vector' AND tablename::text ~ '(1_|2_|3_|4_|5_)'::text;
	
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
	
	tbl1 = r.tablename;
		
         EXECUTE format('ALTER TABLE lds_vector."'||tbl1||'" ALTER COLUMN fidn TYPE VARCHAR');
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------
-----------------------------------------
DO $$
DECLARE
    c CURSOR FOR  SELECT columns.table_name, columns.column_name
				  FROM information_schema.columns
				  WHERE columns.table_schema::text = 'lds_vector'::text AND columns.table_name::text ~ '(1_|2_|3_|4_|5_)'::text;
	
    r RECORD;

    col1 TEXT;
	tbl1 TEXT;
	
	
BEGIN
    FOR r IN c LOOP
	
	tbl1 = r.table_name;
	col1 = r.column_name;
		       
	IF col1 = 'verdat' or col1 = 'marsys' or col1 = 'litchr' or col1 = 'exclit' or col1 = 'expsou' or col1 = 'conrad' or col1 = 'condtn' or col1 = 'convis'
	or col1 = 'catwrk'or col1 = 'catwed'or col1 = 'catwat'or col1 = 'catlam'or col1 = 'catfif'or col1 = 'catfog'or col1 = 'catfry'or col1 = 'catgat'or col1 = 'catmfa'
	or col1 = 'catmor'or col1 = 'catnav'or col1 = 'catobs'or col1 = 'catpra'or col1 = 'catpil'or col1 = 'catple'or col1 = 'cattrk'or col1 = 'catpyl'or col1 = 'catslo'
	or col1 = 'catslc'or col1 = 'catsil'or col1 = 'cat_ts'or col1 = 'catcoa'or col1 = 'catctr'or col1 = 'catsea'or col1 = 'catobs'or col1 = 'catqua'or col1 = 'catdam'
	or col1 = 'catcbl'or col1 = 'catcov'or col1 = 'catcam'or col1 = 'catbua'or col1 = 'buishp'or col1 = 'boyshp'or col1 = 'bcnshp' THEN 
			
         raise notice 'Value: %', tbl1||' '||col1;				
         EXECUTE format('ALTER TABLE lds_vector."'||tbl1||'" ALTER COLUMN "'||col1||'" TYPE VARCHAR');
		 
		 
	ELSE		

	END IF;
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;