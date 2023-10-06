select tab.table_schema,
       tab.table_name,
       'not found' as constraint_,
	    pg_size_pretty(pg_relation_size('"'||tab.table_schema||'"."'||tab.table_name||'"')) as size_of_table
       from information_schema.tables tab
where tab.table_schema not in ('information_schema', 'pg_catalog') 
      and tab.table_type ='BASE TABLE'
      and tab.table_schema || '.' || tab.table_name not in
          (select distinct table_schema || '.' || table_name
           from information_schema.table_constraints
           where constraint_type in ('FOREIGN KEY','PRIMARY KEY','UNIQUE','CHECK'))
order by tab.table_schema,
         tab.table_name;