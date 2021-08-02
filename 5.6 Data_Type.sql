DO $$
DECLARE
    c CURSOR FOR  SELECT columns.table_name, columns.column_name
				  FROM information_schema.columns
				  WHERE columns.table_schema::text = 'lds_vector_t'::text AND columns.table_name::text ~ '(1_|2_|3_|4_|5_)'::text;
	
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
	or col1 = 'catcbl'or col1 = 'catcov'or col1 = 'catcam'or col1 = 'catbua'or col1 = 'buishp'or col1 = 'boyshp'or col1 = 'bcnshp' or col1 = 'fidn' or col1 = 'catdoc'
	or col1 = 'watlev'or col1 = 'catice'or col1 = 'catinb'or col1 = 'catrun'or col1 = 'catras'or col1 = 'trafic'  
	THEN 
			
         raise notice 'Value: %', tbl1||' '||col1;				
         EXECUTE format('ALTER TABLE lds_vector_t."'||tbl1||'" ALTER COLUMN "'||col1||'" TYPE VARCHAR');
	
	ELSIF col1 = 'scamin' or col1 = 'veracc' or col1 = 'verlen' or col1 = 'vallma' or col1 = 'elevat' or col1 = 'height' or col1 = 'horacc' or col1 = 'horclr'
	or col1 = 'drval1'or col1 = 'horlen'or col1 = 'horwid'or col1 = 'orient'or col1 = 'souacc'or col1 = 'sigper'or col1 = 'valmxr'or col1 = 'burdep'
	or col1 = 'verclr'or col1 = 'lifcap'or col1 = 'estrng'or col1 = 'verccl'or col1 = 'vercop'or col1 = 'posacc'or col1 = 'sigfrq'or col1 = 'siggen' 
	or col1 = 'valacm'or col1 = 'curvel'
	THEN	
		 raise notice 'Value: %', tbl1||' '||col1;				
         EXECUTE format('ALTER TABLE lds_vector_t."'||tbl1||'" ALTER COLUMN "'||col1||'" TYPE NUMERIC USING "'||col1||'"::numeric(24,15)');
	
	
	ELSE		

	END IF;
	
    END LOOP;
END;
$$ LANGUAGE plpgsql;
---------------------
---------------------
----------------------
select table_name, column_name,data_type, udt_name, table_schema 
from information_schema.columns 
where table_name::text ~ '(1_|2_|3_|4_|5_)'::text and table_schema = 'lds_vector_t'
and (udt_name = 'int4' or udt_name = 'int8' or udt_name = 'float8');

