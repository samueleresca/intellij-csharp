package com.csharp;


import com.csharp.lexer.CSharpLexerAdapter;
import com.csharp.parser.CSharpParser;
import com.intellij.lang.ASTNode;
import com.intellij.lang.Language;
import com.intellij.lang.ParserDefinition;
import com.intellij.lang.PsiParser;
import com.intellij.lexer.Lexer;
import com.intellij.openapi.project.Project;
import com.intellij.psi.FileViewProvider;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFile;
import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IFileElementType;
import com.intellij.psi.tree.TokenSet;
import org.jetbrains.annotations.NotNull;

import static com.csharp.CSharpTypes.*;

public class CSharpParserDefinition implements ParserDefinition{
  public static final TokenSet WHITE_SPACES = TokenSet.create(TokenType.WHITE_SPACE);

  public static final IFileElementType FILE = new IFileElementType(Language.findInstance(CSharpLanguage.class));
  public static final TokenSet COMMENTS = TokenSet.create(COMMENT);

  public static final TokenSet STRING_DEFINITION = TokenSet.create(STRING_DEC);
  public static final TokenSet NUMBERS = TokenSet.create(INT, FLOAT, DOUBLE); // todo: HEX, OCT,
  public static final TokenSet KEYWORDS = TokenSet.create(
    USING, BREAK, CASE,  CONST, CONTINUE, DEFAULT, ELSE,  FOR, GOTO, IF,
    INTERFACE,   RETURN,  STRUCT, SWITCH, PUBLIC, ABSTRACT, PRIVATE, PROTECTED, OVERRIDE, VOID, PROTECTED,
    THIS, ABSTRACT, STATIC, STRUCT, CLASS, NAMESPACE);
  public static final TokenSet OPERATORS = TokenSet.create(
    EQ, EQ, NOT_EQ, NOT, PLUS_PLUS,  PLUS, MINUS_MINUS, MINUS);


  @NotNull
  @Override
  public Lexer createLexer(Project project) {
    return new CSharpLexerAdapter();
  }

  @NotNull
  public TokenSet getWhitespaceTokens() {
    return WHITE_SPACES;
  }

  @NotNull
  public TokenSet getCommentTokens() {
    return COMMENTS;
  }

  @NotNull
  public TokenSet getStringLiteralElements() {
    return STRING_DEFINITION;
  }

  @NotNull
  public PsiParser createParser(final Project project) {
    return new CSharpParser();
  }

  @Override
  public IFileElementType getFileNodeType() {
    return FILE;
  }

  public PsiFile createFile(FileViewProvider viewProvider) {
    return new CSharpFile(viewProvider);
  }

  public SpaceRequirements spaceExistanceTypeBetweenTokens(ASTNode left, ASTNode right) {
    return SpaceRequirements.MAY;
  }

  @NotNull
  public PsiElement createElement(ASTNode node) {
    return CSharpTypes.Factory.createElement(node);
  }
}