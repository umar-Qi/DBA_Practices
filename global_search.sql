select t.table_schema,
		t.table_name,
		c.column_name
		from information_schema.tables t join information_schema.columns c 
		on t.table_schema = c.table_schema and t.table_name = c.table_name
		and t.table_schema not in ('information_shcema','pg_catalog')
		and t.table_type in ('BASE TABLE')
		where c.column_name like ('%prescribe%')
		order by t.table_schema