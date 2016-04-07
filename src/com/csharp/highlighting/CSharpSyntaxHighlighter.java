/*
 * Copyright 2013-2016 Sergey Ignatov, Alexander Zolotov, Florin Patan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.csharp.highlighting;

import com.csharp.CSharpParserDefinition;
import com.csharp.CSharpTypes;
import com.csharp.lexer.CSharpLexerAdapter;
import com.intellij.lexer.Lexer;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase;
import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IElementType;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

import static com.csharp.highlighting.CSharpSyntaxHighlightingColors.*;


public class CSharpSyntaxHighlighter extends SyntaxHighlighterBase {
  private static final Map<IElementType, TextAttributesKey> ATTRIBUTES = new HashMap<IElementType, TextAttributesKey>();

  static {
    fillMap(ATTRIBUTES, PARENTHESES, CSharpTypes.LBRACE, CSharpTypes.RBRACE);
    fillMap(ATTRIBUTES, BRACES, CSharpTypes.LBRACE, CSharpTypes.RBRACE);
    fillMap(ATTRIBUTES, BRACKETS, CSharpTypes.LBRACE, CSharpTypes.RBRACE);
    fillMap(ATTRIBUTES, BAD_CHARACTER, TokenType.BAD_CHARACTER);

    fillMap(ATTRIBUTES, IDENTIFIER, CSharpTypes.IDENTIFIER);

    fillMap(ATTRIBUTES, BLOCK_COMMENT, CSharpTypes.COMMENT);

    fillMap(ATTRIBUTES, DOUBLE_QUOTED_STRING, CSharpTypes.STRING);


    fillMap(ATTRIBUTES, DOT, CSharpTypes.DOT, CSharpTypes.DOT);
    fillMap(ATTRIBUTES, COLON, CSharpTypes.COLON);

    fillMap(ATTRIBUTES, CSharpParserDefinition.OPERATORS, OPERATOR);
    fillMap(ATTRIBUTES, CSharpParserDefinition.KEYWORDS, KEYWORD);
    fillMap(ATTRIBUTES, CSharpParserDefinition.NUMBERS, NUMBER);
  }

  @NotNull
  public Lexer getHighlightingLexer() {
    return new CSharpLexerAdapter();
  }

  @NotNull
  public TextAttributesKey[] getTokenHighlights(IElementType tokenType) {
    return pack(ATTRIBUTES.get(tokenType));
  }
}