/* Regular definitions */

WS	[ \t\n]
D	[0-9]
L	[A-Za-z_]
FOR	([Ff][Oo][Rr])
IF	([Ii][Ff])
ID	({L}|"$")({L}|{D}|"$")*
INT	{D}+
FLOAT	{INT}("."{INT})?([Ee]("+"|"-")?{INT})?
MAIG	">="
MEIG	"<="
IG	"=="
DIF "!="
COMENTARIO	([\/][\/][^\n]*)|(([\/][\*](([\*][^\/])|([\/][^\/])|[^\/])*[\*][\/]))
STRING ["]([^\n\"]|["]["]|("\\\""))*["]

%%

{WS}	{ /* ignora espaços, tabs e '\n' */ } 
{COMENTARIO}	{ return _COMENTARIO; }
{STRING}	{ return _STRING; }
{FOR}	{ return _FOR; }
{IF}	{ return _IF; }
{MAIG}	{ return _MAIG; }
{MEIG}	{ return _MEIG; }
{IG}	{ return _IG; }
{DIF}	{ return _DIF; }
{INT}	{ return _INT; }
{FLOAT}	{ return _FLOAT; }
{ID}	{ return _ID; }
.       { return *yytext; 
          /* Essa deve ser a última regra. Dessa forma qualquer caractere isolado será retornado pelo seu código ascii. */ }
%%


















