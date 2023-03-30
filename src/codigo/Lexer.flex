package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Tabulacion Horizontal */
( "\t" ) {return Tab_horizontal;}

/* Tabulacion Vertical */
( "\v" ) {return Tab_vertical;}

/* Retorno */
( "\r" ) {return Retorno;}

/* Avance de Pagina */
( "\f" ) {return Avance_pag;}

/* Retroceso */
( "\b" ) {return Retroceso;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipo de dato Int */
( int ) {lexeme=yytext(); return Entero;}

/* Tipo de dato Float */
( float ) {lexeme=yytext(); return Decimal_simple;}

/* Tipo de dato Double */
( double ) {lexeme=yytext(); return Decimal_doble;}

/* Tipo de dato Long */
( long ) {lexeme=yytext(); return Entero_largo;}

/* Tipo de dato Char */
( char ) {lexeme=yytext(); return Caracter;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Switch */
( switch ) {lexeme=yytext(); return Switch;}

/* Palabra reservada Case */
( case ) {lexeme=yytext(); return Case;}

/* Palabra reservada Continue */
( continue ) {lexeme=yytext(); return Continue;}

/* Palabra reservada Default */
( default ) {lexeme=yytext(); return Default;}

/* Palabra reservada This */
( this ) {lexeme=yytext(); return This;}

/* Palabra reservada Try */
( try ) {lexeme=yytext(); return Try;}

/* Palabra reservada Protected */
( protected ) {lexeme=yytext(); return Protected;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Palabra reservada Return */
( return ) {lexeme=yytext(); return Return;}

/* Palabra reservada Void */
( void ) {lexeme=yytext(); return Void;}

/* Palabra reservada Break */
( break ) {lexeme=yytext(); return Break;}

/* Palabra reservada Public */
( public ) {lexeme=yytext(); return Public;}

/* Palabra reservada Class */
( class ) {lexeme=yytext(); return Class;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operador Numeral */
( "#" ) {lexeme=yytext(); return Numeral;}

/* Operador Porcentaje */
( "%" ) {lexeme=yytext(); return Porcentaje;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/* Especificador de formato */
( "%d" | "%f" | "%c" | "%s" | "|" ) {lexeme=yytext(); return Es_formato;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de programa */
( "main" ) {lexeme=yytext(); return Main;}

/* Importancion de librerias */
( "import" ) {lexeme=yytext(); return Import;}

/* Directiva de procesador */
( "#include") {lexeme=yytext(); return Directiva_incluir;}

/* Direccion de cadena */
( "argv") {lexeme=yytext(); return Direccion_cad;}

/* Numero de cadena */
( "argc") {lexeme=yytext(); return Numero_cad;}

/* Parametro de cadena */
( "args") {lexeme=yytext(); return Para_cad;}

/* Numero de cadena */
( "argc") {lexeme=yytext(); return Numero_cad;}

/*Librerias*/
(java.util.| stdio.h | string.h | math.h | time.h | stdlib.h | ctype.h | assert.h | float.h  )   {lexeme = yytext(); return Librerias;}

/*Funcion de impresion*/
(System.out.println | printf | sprintf | fprintf | snsprintf | asprintf  )   {lexeme = yytext();  return Impresion;}

/*Analizador de datos*/
(scanf | sscanf | fscanf )   {lexeme = yytext();  return Analizador;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}

