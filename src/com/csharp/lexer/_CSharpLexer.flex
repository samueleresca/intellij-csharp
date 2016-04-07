package com.csharp.lexer;
import com.intellij.lexer.*;
import com.intellij.psi.tree.IElementType;
import static com.csharp.CSharpTypes.*;

%%

%{
  public _CSharpLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _CSharpLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode

EOL="\r"|"\n"|"\r\n"
LINE_WS=[\ \t\f]
WHITE_SPACE=({LINE_WS}|{EOL})+

WS=[ \t\n\x0B\f\r]+
COMMENT="//".*
DIGIT=[0-9]+(\.[0-9]*)?
STRING=('([^'\\]|\\.)*'|\"([^\"\\]|\\.)*\")
ID=[:letter:][a-zA-Z_0-9]*

%%
<YYINITIAL> {
  {WHITE_SPACE}      { return com.intellij.psi.TokenType.WHITE_SPACE; }

  "{"                { return LBRACE; }
  "}"                { return RBRACE; }
  "["                { return LBRACK; }
  "]"                { return RBRACK; }
  "("                { return LPAREN; }
  ")"                { return RPAREN; }
  ":"                { return COLON; }
  ";"                { return SEMI; }
  ","                { return COMMA; }
  "=="               { return EQ; }
  "="                { return ASSIGN; }
  "!="               { return NOT_EQ; }
  "!"                { return NOT; }
  "++"               { return PLUS_PLUS; }
  "+="               { return PLUS_ASSIGN; }
  "+"                { return PLUS; }
  "--"               { return MINUS_MINUS; }
  "-="               { return MINUS_ASSIGN; }
  "-"                { return MINUS; }
  "||"               { return COND_OR; }
  "|="               { return BIT_OR_ASSIGN; }
  "&^="              { return BIT_CLEAR_ASSIGN; }
  "&^"               { return BIT_CLEAR; }
  "&&"               { return COND_AND; }
  "&="               { return BIT_AND_ASSIGN; }
  "&"                { return BIT_AND; }
  "|"                { return BIT_OR; }
  "<<="              { return SHIFT_LEFT_ASSIGN; }
  "<<"               { return SHIFT_LEFT; }
  "<="               { return LESS_OR_EQUAL; }
  "<"                { return LESS; }
  "^="               { return BIT_XOR_ASSIGN; }
  "^"                { return BIT_XOR; }
  "*="               { return MUL_ASSIGN; }
  "*"                { return MUL; }
  "/="               { return QUOTIENT_ASSIGN; }
  "/"                { return QUOTIENT; }
  "%="               { return REMAINDER_ASSIGN; }
  "%"                { return MOD; }
  ">>="              { return SHIFT_RIGHT_ASSIGN; }
  ">>"               { return SHIFT_RIGHT; }
  ">="               { return GREATER_OR_EQUAL; }
  ">"                { return GREATER; }
  "."                { return DOT; }
  "\""               { return QUOTE; }
  "\\"               { return BACK; }
  "using"            { return USING; }
  "namespace"        { return NAMESPACE; }
  "void"             { return VOID; }
  "enum"             { return ENUM; }
  "null"             { return NULL; }
  "new"              { return NEW; }
  "bool"             { return BOOL; }
  "true"             { return TRUE; }
  "false"            { return FALSE; }
  "byte"             { return BYTE; }
  "x"                { return X; }
  "char"             { return CHAR; }
  "APOS"             { return APOS; }
  "float"            { return FLOAT; }
  "u"                { return U; }
  "int"              { return INT; }
  "long"             { return LONG; }
  "short"            { return SHORT; }
  "out"              { return OUT; }
  "for"              { return FOR; }
  "foreach"          { return FOREACH; }
  "in"               { return IN; }
  "switch"           { return SWITCH; }
  "case"             { return CASE; }
  "default"          { return DEFAULT; }
  "return"           { return RETURN; }
  "if"               { return IF; }
  "else"             { return ELSE; }
  "break"            { return BREAK; }
  "continue"         { return CONTINUE; }
  "throw"            { return THROW; }
  "is"               { return IS; }
  "as"               { return AS; }
  "instanceof"       { return INSTANCEOF; }
  "sbyte"            { return SBYTE; }
  "decimal"          { return DECIMAL; }
  "double"           { return DOUBLE; }
  "uint"             { return UINT; }
  "ulong"            { return ULONG; }
  "object"           { return OBJECT; }
  "ushort"           { return USHORT; }
  "var"              { return VAR; }
  "List"             { return LIST; }
  "Dictionary"       { return DICTIONARY; }
  "struct"           { return STRUCT; }
  "class"            { return CLASS; }
  "interface"        { return INTERFACE; }
  "delegate"         { return DELEGATE; }
  "elif"             { return ELIF; }
  "endif"            { return ENDIF; }
  "define"           { return DEFINE; }
  "undef"            { return UNDEF; }
  "warning"          { return WARNING; }
  "error"            { return ERROR; }
  "line"             { return LINE; }
  "region"           { return REGION; }
  "endregion"        { return ENDREGION; }
  "pragma"           { return PRAGMA; }
  "checksum"         { return CHECKSUM; }
  "public"           { return PUBLIC; }
  "private"          { return PRIVATE; }
  "protected"        { return PROTECTED; }
  "internal"         { return INTERNAL; }
  "abstract"         { return ABSTRACT; }
  "async"            { return ASYNC; }
  "const"            { return CONST; }
  "event"            { return EVENT; }
  "extern"           { return EXTERN; }
  "override"         { return OVERRIDE; }
  "partial"          { return PARTIAL; }
  "readonly"         { return READONLY; }
  "sealed"           { return SEALED; }
  "static"           { return STATIC; }
  "unsafe"           { return UNSAFE; }
  "virtual"          { return VIRTUAL; }
  "volatile"         { return VOLATILE; }
  "base"             { return BASE; }
  "catch"            { return CATCH; }
  "do"               { return DO; }
  "finally"          { return FINALLY; }
  "goto"             { return GOTO; }
  "lock"             { return LOCK; }
  "ref"              { return REF; }
  "sizeof"           { return SIZEOF; }
  "stackalloc"       { return STACKALLOC; }
  "this"             { return THIS; }
  "try"              { return TRY; }
  "typeof"           { return TYPEOF; }
  "while"            { return WHILE; }
  "yield"            { return YIELD; }

  {WS}               { return WS; }
  {COMMENT}          { return COMMENT; }
  {DIGIT}            { return DIGIT; }
  {STRING}           { return STRING; }
  {ID}               { return ID; }

  [^] { return com.intellij.psi.TokenType.BAD_CHARACTER; }
}
