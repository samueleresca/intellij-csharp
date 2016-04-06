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

  public static final IFileElementType FILE = new IFileElementType(Language.<CSharpLanguage>findInstance(CSharpLanguage.class));
  public static final TokenSet COMMENTS = TokenSet.create(BLOCK_COMMENT, LINE_COMMENT);

  public static final TokenSet STRING_DEFINITION = TokenSet.create(DOUBLE_QUOTED_STRING);
  public static final TokenSet NUMBERS = TokenSet.create(KW_INT, KW_FLOAT, KW_DOUBLE); // todo: HEX, OCT,
  public static final TokenSet KEYWORDS = TokenSet.create(
    KW_USING, KW_BREAK, KW_CASE,  KW_CONST, KW_CONTINUE, KW_DEFAULT, KW_ELSE,  KW_FOR, KW_GOTO, KW_IF,
    INTERFACE,   KW_RETURN,  KW_STRUCT, KW_SWITCH, KW_PUBLIC, KW_ABSTRACT, KW_PRIVATE, KW_PROTECTED, KW_OVERRIDE, KW_VOID, KW_PROTECTED,
    KW_THIS, KW_ABSTRACT, KW_STATIC, KW_STRUCT, KW_CLASS, KW_NAMESPACE);
  public static final TokenSet OPERATORS = TokenSet.create(
    OP_EQ, OP_EQ, OP_NOT_EQ, OP_NOT, OP_PLUS_PLUS, OP_PLUS_EQ, OP_PLUS, OP_MINUS_MINUS, OP_MINUS_EQ, OP_MINUS);


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