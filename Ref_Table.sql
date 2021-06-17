---Generate FIdn suffix------------- 
------------------------------------

CREATE TABLE regen_fidn AS
SELECT row_number() over() as fid, A.a || B.b || C.c as seq
FROM unnest(string_to_array('A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',' ')) A
CROSS JOIN unnest(string_to_array('A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',' ')) B 
CROSS JOIN unnest(string_to_array('A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',' ')) C;

----------------17576 ids-----
------------------------------