%{

int COMMENT=0;

%}

id [a-zA-Z][a-zA-Z0-9]*

%%
#.*           {printf("\n%s preprocessor\n\n",yytext);}

"/*"          {COMMENT=1;}
"*/"          {COMMENT=0;}
"//".*        {}

\{            {if(!COMMENT)printf("LBRACE ");}
\}            {if(!COMMENT)printf("RBRACE ");}

\( 	          {if(!COMMENT)printf("LPAREN ");}
\) 	          {if(!COMMENT)printf("RPAREN ");}

\!            {if(!COMMENT)printf("BANG ");}
\,            {if(!COMMENT)printf("COMMA");}
[;]           {if(!COMMENT)printf("SEMI ");}


\+            {if(!COMMENT)printf("OPERATOR(PLUS)");}
\-            {if(!COMMENT)printf("OPERATOR(MINUS)");}
\*            {if(!COMMENT)printf("OPERATOR(MULT)");}
\/            {if(!COMMENT)printf("OPERATOR(DIV)");}
\\\\          {if(!COMMENT)printf("OPERATOR(MOD)");}
\%            {if(!COMMENT)printf("OPERATOR(PERC)");}

\+\+          {if(!COMMENT) printf("OPERATOR(INCREMENT) ");}
\-\-          {if(!COMMENT) printf("OPERATOR(DECREMENT) ");}

\*=           {if(!COMMENT) printf("OPERATOR(MULT_ASSIGN) ");}
\/=           {if(!COMMENT) printf("OPERATOR(DIV_ASSIGN) ");}


and           {if(!COMMENT) printf("LOGIC_OP(AND) ");}
or 	          {if(!COMMENT) printf("LOGIC_OP(OR) ");}
==            {if(!COMMENT) printf("LOGIC_OP(EQUAL) ");}
!=            {if(!COMMENT) printf("LOGIC_OP(DIFF) ");}

\<=           {if(!COMMENT) printf("COMP_OP(LESS_EQUAL_THAN) ");}
\>=           {if(!COMMENT) printf("COMP_OP(MORE_EQUAL_THAN) ");}
\<            {if(!COMMENT) printf("COMP_OP(LESS_THAN) ");}
\>            {if(!COMMENT) printf("COMP_OP(MORE_THAN) ");} 

=             {if(!COMMENT) printf("ASSIGN");}


int           {if(!COMMENT)printf("INT");}
float         {if(!COMMENT)printf("FLOAT");}
char          {if(!COMMENT)printf("CHAR");}
double        {if(!COMMENT)printf("DOUBLE");}
long          {if(!COMMENT)printf("LONG");}
void          {if(!COMMENT)printf("VOID");}
goto          {if(!COMMENT)printf("GOTO");}
if            {if(!COMMENT)printf("IF");}
for           {if(!COMMENT)printf("FOR");}
while         {if(!COMMENT)printf("WHILE");}
return        {if(!COMMENT)printf("RETURN ");}


{id}(\[[0-9]*\])?     {if(!COMMENT) printf("ID(%s)",yytext);}
\".*\"                {if(!COMMENT)printf("STRING(%s)",yytext);}
[0-9]+                {if(!COMMENT) printf("NUM(%s)",yytext);}
[+-]?[0-9]+[.][0-9]*? {if(!COMMENT)printf("REAL(%s0)",yytext);}
%%

int main(int argc, char **argv)
{
    yylex();
    printf("\n");
    return(0);
}
