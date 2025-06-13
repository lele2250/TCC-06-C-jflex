/* Código do usuário */
class Token {
  private int linha;
  private int coluna;
  private String lexema;
  private String descricao;

  public Token(int linha, int coluna, String lexema, String descricao) {
    this.linha = linha;
    this.coluna = coluna;
    this.lexema = lexema;
    this.descricao = descricao;
  }

  public void imprimir() {
    System.out.println("[" + linha + "]" + "[" + coluna + "] " + lexema + ": " + descricao + ".");
  }

  public void dispararExcecao() {
    imprimir();
    throw new RuntimeException(descricao + ": " + lexema);
  }
}

%%

%standalone
%line
%column
%class c

%{
  Token token;
%}

/* Macros */
BRANCO = [ \t\r\n]+
INT = int
WHILE = while
RETURN = return
IF = if
THEN = then
PONTOEVIRGULA = ";"
ABREPARENTESE = "("
FECHAPARENTESE = ")"
ABRECHAVE = \{
FECHACHAVE = \}
SOMA = \+
SUBTRACAO = \-
MULT = \*
DIV = \/
MENOR_IGUAL = <=
MENOR = <
MAIOR = >
MAIOR_IGUAL = >=
IGUAL = ==
DIFERENTE = \!=
ATRIBUICAO = =
INTEIRO = 0|[1-9][0-9]*
ID = [_a-zA-Z][_a-zA-Z0-9]*

%%

{BRANCO}         { token = new Token(yyline, yycolumn, yytext(), "Espaço em branco"); token.imprimir(); }
{ABREPARENTESE}  { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
{FECHAPARENTESE} { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
{ABRECHAVE}      { token = new Token(yyline, yycolumn, yytext(), "Abre chave"); token.imprimir(); }
{FECHACHAVE}     { token = new Token(yyline, yycolumn, yytext(), "Fecha chave"); token.imprimir(); }
{PONTOEVIRGULA}  { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }
{ATRIBUICAO}     { token = new Token(yyline, yycolumn, yytext(), "Atribuição"); token.imprimir(); }
{INT}            { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada int"); token.imprimir(); }
{WHILE}          { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada while"); token.imprimir(); }
{RETURN}         { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada return"); token.imprimir(); }
{IF}             { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada if"); token.imprimir(); }
{THEN}           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada then"); token.imprimir(); }
{ID}             { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }
{SOMA}           { token = new Token(yyline, yycolumn, yytext(), "Operador de soma"); token.imprimir(); }
{SUBTRACAO}      { token = new Token(yyline, yycolumn, yytext(), "Operador de subtração"); token.imprimir(); }
{MULT}           { token = new Token(yyline, yycolumn, yytext(), "Operador de multiplicação"); token.imprimir(); }
{DIV}            { token = new Token(yyline, yycolumn, yytext(), "Operador de divisão"); token.imprimir(); }
{MENOR_IGUAL}    { token = new Token(yyline, yycolumn, yytext(), "Operador menor ou igual"); token.imprimir(); }
{MENOR}          { token = new Token(yyline, yycolumn, yytext(), "Operador menor que"); token.imprimir(); }
{MAIOR}          { token = new Token(yyline, yycolumn, yytext(), "Operador maior que"); token.imprimir(); }
{MAIOR_IGUAL}    { token = new Token(yyline, yycolumn, yytext(), "Operador maior ou igual"); token.imprimir(); }
{IGUAL}          { token = new Token(yyline, yycolumn, yytext(), "Operador igual"); token.imprimir(); }
{DIFERENTE}      { token = new Token(yyline, yycolumn, yytext(), "Operador diferente"); token.imprimir(); }
{INTEIRO}        { token = new Token(yyline, yycolumn, yytext(), "Número inteiro"); token.imprimir(); }
.                { token = new Token(yyline, yycolumn, yytext(), "Caracter inválido"); token.dispararExcecao(); }
