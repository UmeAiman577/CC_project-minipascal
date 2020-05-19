	int num_lines = 0, num_chars = 0;
	FILE * fp;
SPECIALSYMBOL "+"|"-"|"*"|"="|"<>"|"<"|">"|"<="|">="|"("|")"|"["|"]"|":="|"."|","|";"|":"|".."|"div"|"or"|"and"|"not"|"if'|"then"|"else"|"of"|"while"|"do"|"begin"|"end"|"read"|"write"|"var"|"array"|"procedure"|"program"
DIGIT	0|1|2|3|4|5|6|7|8|9
LETTER	[a-zA-Z]
PREID	"integer"|"Boolean"|"true"|"false"
%%
	fp = fopen("tokenClass","w");
(SPECIALSYMBOL)+	fprintf(fp, "<%s,SpecialSymbol>\n",yytext);num_chars++;
(LETTER|DIGIT)+	fprintf(fp, "<%s,constant>\n",yytext);num_chars++;
{PREID}+	fprintf(fp, "<%s,preid>\n",yytext);num_chars++;
{LETTER}+(LETTER|DIGIT)*	fprintf(fp, "<%s,id>\n",yytext);num_chars++;
{DIGIT}+	fprintf(fp, "<%s,int>\n",yytext);num_chars++;
\n	++num_lines; ++num_chars;
	fcloase(fp);
%%
main()
{
yylex();
printf("# of lines = %d, #of chars = %d\n",
	num_lines, num_chars);
}
//{LETTER}+{LETTER|DIGIT}*	fprintf(fp, "<%s,id>\n",yytext);num_chars++;

