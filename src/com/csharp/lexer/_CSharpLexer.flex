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

DOUBLE_QUOTED_STRING=\\"([^\\\"]|((\\\"|\\\?|\\\|\\0|\\a|\\b|\\f|\\n|\\r|\\t|\\v)|(\\x[0-9abcdefABCDEF_]{2})|(\\[0-7])|(\\[0-7]{2})|(\\[0-7]{3})|(\\u[0-9abcdefABCDEF_]{4})|(\\U[0-9abcdefABCDEF_]{8})|(\\&([a-zA-Z_])([a-zA-Z0-9_])*;)))*\\"[cwd]*

%%
<YYINITIAL> {
  {WHITE_SPACE}                 { return com.intellij.psi.TokenType.WHITE_SPACE; }

  "abstract"                    { return KW_ABSTRACT; }
  "add"                         { return KW_ADD; }
  "alias"                       { return KW_ALIAS; }
  "__arglist"                   { return KW_ARGLIST; }
  "as"                          { return KW_AS; }
  "ascending"                   { return KW_ASCENDING; }
  "async"                       { return KW_ASYNC; }
  "await"                       { return KW_AWAIT; }
  "base"                        { return KW_BASE; }
  "bool"                        { return KW_BOOL; }
  "break"                       { return KW_BREAK; }
  "by"                          { return KW_BY; }
  "byte"                        { return KW_BYTE; }
  "case"                        { return KW_CASE; }
  "catch"                       { return KW_CATCH; }
  "char"                        { return KW_CHAR; }
  "checked"                     { return KW_CHECKED; }
  "class"                       { return KW_CLASS; }
  "const"                       { return KW_CONST; }
  "continue"                    { return KW_CONTINUE; }
  "decimal"                     { return KW_DECIMAL; }
  "default"                     { return KW_DEFAULT; }
  "delegate"                    { return KW_DELEGATE; }
  "descending"                  { return KW_DESCENDING; }
  "do"                          { return KW_DO; }
  "double"                      { return KW_DOUBLE; }
  "dynamic"                     { return KW_DYNAMIC; }
  "else"                        { return KW_ELSE; }
  "enum"                        { return KW_ENUM; }
  "equals"                      { return KW_EQUALS; }
  "event"                       { return KW_EVENT; }
  "explicit"                    { return KW_EXPLICIT; }
  "extern"                      { return KW_EXTERN; }
  "false"                       { return KW_FALSE; }
  "finally"                     { return KW_FINALLY; }
  "fixed"                       { return KW_FIXED; }
  "float"                       { return KW_FLOAT; }
  "for"                         { return KW_FOR; }
  "foreach"                     { return KW_FOREACH; }
  "from"                        { return KW_FROM; }
  "get"                         { return KW_GET; }
  "goto"                        { return KW_GOTO; }
  "group"                       { return KW_GROUP; }
  "if"                          { return KW_IF; }
  "implicit"                    { return KW_IMPLICIT; }
  "in"                          { return KW_IN; }
  "int"                         { return KW_INT; }
  "interface"                   { return KW_INTERFACE; }
  "internal"                    { return KW_INTERNAL; }
  "into"                        { return KW_INTO; }
  "is"                          { return KW_IS; }
  "join"                        { return KW_JOIN; }
  "let"                         { return KW_LET; }
  "lock"                        { return KW_LOCK; }
  "long"                        { return KW_LONG; }
  "nameof"                      { return KW_NAMEOF; }
  "namespace"                   { return KW_NAMESPACE; }
  "new"                         { return KW_NEW; }
  "null"                        { return KW_NULL; }
  "object"                      { return KW_OBJECT; }
  "on"                          { return KW_ON; }
  "operator"                    { return KW_OPERATOR; }
  "orderby"                     { return KW_ORDERBY; }
  "out"                         { return KW_OUT; }
  "override"                    { return KW_OVERRIDE; }
  "params"                      { return KW_PARAMS; }
  "partial"                     { return KW_PARTIAL; }
  "private"                     { return KW_PRIVATE; }
  "protected"                   { return KW_PROTECTED; }
  "public"                      { return KW_PUBLIC; }
  "readonly"                    { return KW_READONLY; }
  "ref"                         { return KW_REF; }
  "remove"                      { return KW_REMOVE; }
  "return"                      { return KW_RETURN; }
  "sbyte"                       { return KW_SBYTE; }
  "sealed"                      { return KW_SEALED; }
  "select"                      { return KW_SELECT; }
  "set"                         { return KW_SET; }
  "short"                       { return KW_SHORT; }
  "sizeof"                      { return KW_SIZEOF; }
  "stackalloc"                  { return KW_STACKALLOC; }
  "static"                      { return KW_STATIC; }
  "string"                      { return KW_STRING; }
  "struct"                      { return KW_STRUCT; }
  "switch"                      { return KW_SWITCH; }
  "this"                        { return KW_THIS; }
  "throw"                       { return KW_THROW; }
  "true"                        { return KW_TRUE; }
  "try"                         { return KW_TRY; }
  "typeof"                      { return KW_TYPEOF; }
  "uint"                        { return KW_UINT; }
  "ulong"                       { return KW_ULONG; }
  "unchecked"                   { return KW_UNCHECKED; }
  "unsafe"                      { return KW_UNSAFE; }
  "ushort"                      { return KW_USHORT; }
  "using"                       { return KW_USING; }
  "virtual"                     { return KW_VIRTUAL; }
  "void"                        { return KW_VOID; }
  "volatile"                    { return KW_VOLATILE; }
  "when"                        { return KW_WHEN; }
  "where"                       { return KW_WHERE; }
  "while"                       { return KW_WHILE; }
  "yield"                       { return KW_YIELD; }
  "function"                    { return KW_FUNCTION; }
  "super"                       { return KW_SUPER; }
  "unittest"                    { return KW_UNITTEST; }
  ";"                           { return OP_SCOLON; }
  ":"                           { return OP_COLON; }
  "="                           { return OP_EQ; }
  ","                           { return OP_COMMA; }
  "("                           { return OP_PAR_LEFT; }
  ")"                           { return OP_PAR_RIGHT; }
  "["                           { return OP_BRACKET_LEFT; }
  "]"                           { return OP_BRACKET_RIGHT; }
  "{"                           { return OP_BRACES_LEFT; }
  "}"                           { return OP_BRACES_RIGHT; }
  "*"                           { return OP_ASTERISK; }
  ".."                          { return OP_DDOT; }
  "..."                         { return OP_TRIPLEDOT; }
  "@"                           { return OP_AT; }
  "+="                          { return OP_PLUS_EQ; }
  "-="                          { return OP_MINUS_EQ; }
  "*="                          { return OP_MUL_EQ; }
  "/="                          { return OP_DIV_EQ; }
  "%="                          { return OP_MOD_EQ; }
  "&="                          { return OP_AND_EQ; }
  "|="                          { return OP_OR_EQ; }
  "^="                          { return OP_XOR_EQ; }
  "~="                          { return OP_TILDA_EQ; }
  "<<="                         { return OP_SH_LEFT_EQ; }
  ">>="                         { return OP_SH_RIGHT_EQ; }
  ">>>="                        { return OP_USH_RIGHT_EQ; }
  "^^="                         { return OP_POW_EQ; }
  "?"                           { return OP_QUEST; }
  "||"                          { return OP_BOOL_OR; }
  "&&"                          { return OP_BOOL_AND; }
  "|"                           { return OP_OR; }
  "^"                           { return OP_XOR; }
  "<<"                          { return OP_SH_LEFT; }
  ">>"                          { return OP_SH_RIGHT; }
  ">>>"                         { return OP_USH_RIGHT; }
  "+"                           { return OP_PLUS; }
  "-"                           { return OP_MINUS; }
  "~"                           { return OP_TILDA; }
  "/"                           { return OP_DIV; }
  "%"                           { return OP_MOD; }
  "&"                           { return OP_AND; }
  "++"                          { return OP_PLUS_PLUS; }
  "--"                          { return OP_MINUS_MINUS; }
  "!"                           { return OP_NOT; }
  "^^"                          { return OP_POW; }
  "$"                           { return OP_DOLLAR; }
  "=="                          { return OP_EQ_EQ; }
  "!="                          { return OP_NOT_EQ; }
  "<"                           { return OP_LESS; }
  "<="                          { return OP_LESS_EQ; }
  ">"                           { return OP_GT; }
  ">="                          { return OP_GT_EQ; }
  "!<>="                        { return OP_UNORD; }
  "!<>"                         { return OP_UNORD_EQ; }
  "<>"                          { return OP_LESS_GR; }
  "<>="                         { return OP_LESS_GR_EQ; }
  "!>"                          { return OP_NOT_GR; }
  "!>="                         { return OP_NOT_GR_EQ; }
  "!<"                          { return OP_NOT_LESS; }
  "!<="                         { return OP_NOT_LESS_EQ; }
  "=>"                          { return OP_LAMBDA_ARROW; }
  "."                           { return OP_DOT; }
  "shebang"                     { return SHEBANG; }
  "LINE_COMMENT"                { return LINE_COMMENT; }
  "BLOCK_COMMENT"               { return BLOCK_COMMENT; }
  "NESTING_BLOCK_COMMENT"       { return NESTING_BLOCK_COMMENT; }
  "KEYWORD"                     { return KEYWORD; }
  "NUMBER"                      { return NUMBER; }
  "STRING"                      { return STRING; }
  "OPERATOR"                    { return OPERATOR; }
  "PARENTHESES"                 { return PARENTHESES; }
  "BRACES"                      { return BRACES; }
  "BRACKETS"                    { return BRACKETS; }
  "COMMA"                       { return COMMA; }
  "SEMICOLON"                   { return SEMICOLON; }
  "DOT"                         { return DOT; }
  "MODULE_DEFINITION"           { return MODULE_DEFINITION; }
  "FUNCTION_DEFINITION"         { return FUNCTION_DEFINITION; }
  "ID"                          { return ID; }
  "WYSIWYG_STRING"              { return WYSIWYG_STRING; }
  "ALTERNATE_WYSIWYG_STRING"    { return ALTERNATE_WYSIWYG_STRING; }
  "HEX_STRING"                  { return HEX_STRING; }
  "DELIMITED_STRING"            { return DELIMITED_STRING; }
  "INTEGER_LITERAL"             { return INTEGER_LITERAL; }
  "FLOAT_LITERAL"               { return FLOAT_LITERAL; }
  "CHARACTER_LITERAL"           { return CHARACTER_LITERAL; }

  {DOUBLE_QUOTED_STRING}        { return DOUBLE_QUOTED_STRING; }

  [^] { return com.intellij.psi.TokenType.BAD_CHARACTER; }
}
