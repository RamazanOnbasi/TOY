grammar toy;

program		:		'BEGIN' stmts+ 'END'; 
stmts		:		stmt+;
stmt		:		assign | print_stmt;
assign		:		ID ':=' expr ';';
					
expr		:		<assoc=left> '(' expr ')'
		|		<assoc=right> expr '^' expr
		|		<assoc=left> expr ('*' | '/') expr
		|		<assoc=left> expr ('+' | '-') expr
		|		<assoc=left> expr ('<' | '>' | '<=' | '>=' | '==' | '!=') expr
		|		<assoc=left> expr '&&' expr
		|		<assoc=left> expr '||' expr
		|		<assoc=left> ID
		|		<assoc=left> INT
				;

print_stmt	:		'PRINT' (ID | INT | expr) ';';

ID  		:   	[a-zA-Z][a-zA-Z0-9]*;
INT 		:   	[0-9]+; 
WS  		:   	[ \t\n\r]+ -> skip;
