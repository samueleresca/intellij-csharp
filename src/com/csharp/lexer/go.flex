package com.csharp.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import com.csharp.CSharpTypes;
import java.util.*;
import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.csharp.CSharpParserDefinition.*;

%%


%{
  public _CSharpLexer() {
    this((java.io.Reader)null);
  }
%}

%unicode
%class _CSharpLexer
%implements FlexLexer, CSharpTypes
%unicode
%public

%function advance
%type IElementType

%eof{
  return;
%eof}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////// User code //////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

%{

  private Stack<IElementType> gStringStack = new Stack<IElementType>();
  private Stack<IElementType> blockStack = new Stack<IElementType>();

  private int afterComment = YYINITIAL;
  private int afterNls = YYINITIAL;
  private int afterBrace = YYINITIAL;

  private void clearStacks(){
    gStringStack.clear();
    blockStack.clear();
  }

  private Stack<IElementType> braceCount = new Stack<IElementType>();

%}


NL = [\r\n] | \r\n      // NewLine
WS = [ \t\f]            // Whitespaces


LINE_COMMENT = "//" [^\r\n]*

LETTER = [:letter:] | "_"
DIGIT =  [:digit:]

HEX_DIGIT = [0-9A-Fa-f]
INT_DIGIT = [0-9]
OCT_DIGIT = [0-7]

NUM_INT = "0" | ([1-9] {INT_DIGIT}*)
NUM_HEX = ("0x" | "0X") {HEX_DIGIT}+
NUM_OCT = "0" {OCT_DIGIT}+

FLOAT_EXPONENT = [eE] [+-]? {DIGIT}+
NUM_FLOAT = ( ( ({DIGIT}+ "." {DIGIT}*) | ({DIGIT}* "." {DIGIT}+) ) {FLOAT_EXPONENT}?) | ({DIGIT}+ {FLOAT_EXPONENT})

IDENT = {LETTER} ({LETTER} | {DIGIT} )*

STR =      "\""
ESCAPES = [abfnrtv]

%state MAYBE_SEMICOLON

%%

<YYINITIAL> {
"|"                                       { return BIT_OR; }


{LINE_COMMENT}                             { return COMMENT; }


"."                                       { return DOT; }

"'" [^\\] "'"                                           { yybegin(MAYBE_SEMICOLON); return CHAR; }
"'" \n "'"                                              { yybegin(MAYBE_SEMICOLON); return CHAR; }
"'\\" [abfnrtv\\\'] "'"                                 { yybegin(MAYBE_SEMICOLON); return CHAR; }
"'\\'"                                                  { yybegin(MAYBE_SEMICOLON); return BAD_CHARACTER; }
"'\\" {OCT_DIGIT} {OCT_DIGIT} {OCT_DIGIT} "'"           { yybegin(MAYBE_SEMICOLON); return CHAR; }
"'\\x" {HEX_DIGIT} {HEX_DIGIT} "'"                      { yybegin(MAYBE_SEMICOLON); return CHAR; }
"'\\u" {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} "'"
                                                        { yybegin(MAYBE_SEMICOLON); return CHAR; }
"'\\U" {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} {HEX_DIGIT} "'"
                                                        { yybegin(MAYBE_SEMICOLON); return CHAR; }

{STR} ( [^\"\\\n\r] | "\\" ("\\" | {STR} | {ESCAPES} | [0-8xuU] ) )* {STR}? { yybegin(MAYBE_SEMICOLON); return STRING; }
"{"                                       { return LBRACE; }
"}"                                       { yybegin(MAYBE_SEMICOLON); return RBRACE; }

"["                                       { return LBRACK; }
"]"                                       { yybegin(MAYBE_SEMICOLON); return RBRACK; }

"("                                       { return LPAREN; }
")"                                       { yybegin(MAYBE_SEMICOLON); return RPAREN; }

":"                                       { return COLON; }
";"                                       { return SEMI; }
","                                       { return COMMA; }

"=="                                      { return EQ; }
"="                                       { return ASSIGN; }

"!="                                      { return NOT_EQ; }
"!"                                       { return NOT; }

"++"                                      { yybegin(MAYBE_SEMICOLON); return PLUS_PLUS; }
"+="                                      { return PLUS_ASSIGN; }
"+"                                       { return PLUS; }

"--"                                      { yybegin(MAYBE_SEMICOLON); return MINUS_MINUS; }
"-="                                      { return MINUS_ASSIGN; }
"-"                                       { return MINUS; }

"||"                                      { return COND_OR; }
"|="                                      { return BIT_OR_ASSIGN; }

"&^="                                     { return BIT_CLEAR_ASSIGN; }
"&^"                                      { return BIT_CLEAR; }
"&&"                                      { return COND_AND; }

"&="                                      { return BIT_AND_ASSIGN; }
"&"                                       { return BIT_AND; }

"<<="                                     { return SHIFT_LEFT_ASSIGN; }
"<<"                                      { return SHIFT_LEFT; }
"<="                                      { return LESS_OR_EQUAL; }
"<"                                       { return LESS; }

"^="                                      { return BIT_XOR_ASSIGN; }
"^"                                       { return BIT_XOR; }

"*="                                      { return MUL_ASSIGN; }
"*"                                       { return MUL; }

"/="                                      { return QUOTIENT_ASSIGN; }
"/"                                       { return QUOTIENT; }

"%="                                      { return REMAINDER_ASSIGN; }

">>="                                     { return SHIFT_RIGHT_ASSIGN; }
">>"                                      { return SHIFT_RIGHT; }
">="                                      { return GREATER_OR_EQUAL; }
">"                                       { return GREATER; }


"break"                                   { yybegin(MAYBE_SEMICOLON); return BREAK;  }
"return"                                  { yybegin(MAYBE_SEMICOLON); return RETURN ;  }
"public"                                  { yybegin(MAYBE_SEMICOLON); return PUBLIC ;  }
"continue"                                { yybegin(MAYBE_SEMICOLON); return CONTINUE ;  }

"default"                                 { return DEFAULT;  }
"using"                                 { return USING;  }

"interface"                               { return INTERFACE;  }

"case"                                    { return CASE;  }


"struct"                                  {  return STRUCT;  }
"else"                                    {  return ELSE;  }
"switch"                                  {  return SWITCH;  }
"const"                                   {  return CONST; }

"if"                                      {  return IF ;  }
"for"                                     {  return FOR ;  }

"var"                                     {  return VAR;  }

{IDENT}                                  {  yybegin(MAYBE_SEMICOLON); return ID; }

{NUM_FLOAT}                              {  yybegin(MAYBE_SEMICOLON); return FLOAT; }
{NUM_INT}                                {  yybegin(MAYBE_SEMICOLON); return INT; }

.                                        {  return BAD_CHARACTER; }
}

<MAYBE_SEMICOLON> {
{NL}               { yybegin(YYINITIAL); yypushback(yytext().length()); return SEMI; }
{LINE_COMMENT}       { return COMMENT; }

.           { yybegin(YYINITIAL); yypushback(yytext().length()); }
}

