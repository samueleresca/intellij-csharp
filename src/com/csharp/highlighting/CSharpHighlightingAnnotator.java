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

import com.csharp.psi.CSharpClassDec;
import com.csharp.psi.CSharpExpr;
import com.csharp.psi.CSharpType;
import com.csharp.psi.CSharpTypeModifier;
import com.intellij.lang.ASTNode;
import com.intellij.lang.Language;
import com.intellij.lang.annotation.AnnotationHolder;
import com.intellij.lang.annotation.Annotator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Iconable;
import com.intellij.openapi.util.Key;
import com.intellij.openapi.util.TextRange;
import com.intellij.psi.*;
import com.intellij.psi.scope.PsiScopeProcessor;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.psi.search.SearchScope;
import com.intellij.psi.tree.IElementType;
import com.intellij.psi.tree.TokenSet;
import com.intellij.util.IncorrectOperationException;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public class CSharpHighlightingAnnotator implements Annotator {


    @Override
    public void annotate(@NotNull PsiElement o, @NotNull AnnotationHolder holder) {
        if (!o.isValid()) return;


        if (o instanceof PsiLiteralExpression) {
            PsiLiteralExpression literalExpression = (PsiLiteralExpression) o;
           literalExpression.getNode();
        }
    }
}


 /* private static void highlightRefIfNeeded(@NotNull GoReferenceExpressionBase o,
                                           @Nullable PsiElement resolve,
                                           @NotNull AnnotationHolder holder) {

    if (resolve instanceof GoTypeSpec) {
      TextAttributesKey key = GoPsiImplUtil.builtin(resolve) ? BUILTIN_TYPE_REFERENCE : getColor((GoTypeSpec)resolve);
      if (o.getParent() instanceof GoType && o.getParent().getParent() instanceof GoReceiver) {
        key = TYPE_REFERENCE;
      }
      setHighlighting(o.getIdentifier(), holder, key);
    }
    else if (resolve instanceof GoConstDefinition) {
      TextAttributesKey color = GoPsiImplUtil.builtin(resolve) ? BUILTIN_TYPE_REFERENCE : getColor((GoConstDefinition)resolve);
      setHighlighting(o.getIdentifier(), holder, color);
    }
    else if (resolve instanceof GoVarDefinition) {
      TextAttributesKey color = GoPsiImplUtil.builtin(resolve) ? BUILTIN_TYPE_REFERENCE : getColor((GoVarDefinition)resolve);
      setHighlighting(o.getIdentifier(), holder, color);
    }
    else if (resolve instanceof GoFieldDefinition) {
      setHighlighting(o.getIdentifier(), holder, getColor((GoFieldDefinition)resolve));
    }
    else if (resolve instanceof GoFunctionOrMethodDeclaration || resolve instanceof GoMethodSpec) {
      setHighlighting(o.getIdentifier(), holder, getColor((GoNamedSignatureOwner)resolve));
    }
    else if (resolve instanceof GoReceiver) {
      setHighlighting(o.getIdentifier(), holder, METHOD_RECEIVER);
    }
    else if (resolve instanceof GoParamDefinition) {
      setHighlighting(o.getIdentifier(), holder, FUNCTION_PARAMETER);
    }
  }

  private static TextAttributesKey getColor(GoConstDefinition o) {
    if (isPackageWide(o)) {
      return o.isPublic() ? PACKAGE_EXPORTED_CONSTANT : PACKAGE_LOCAL_CONSTANT;
    }
    return LOCAL_CONSTANT;
  }

  private static TextAttributesKey getColor(GoFieldDefinition o) {
    return o.isPublic() ? STRUCT_EXPORTED_MEMBER : STRUCT_LOCAL_MEMBER;
  }

  private static TextAttributesKey getColor(GoVarDefinition o) {
    if (PsiTreeUtil.getParentOfType(o, GoForStatement.class) != null ||
        PsiTreeUtil.getParentOfType(o, GoIfStatement.class) != null ||
        PsiTreeUtil.getParentOfType(o, GoSwitchStatement.class) != null) {
      return SCOPE_VARIABLE;
    }

    if (isPackageWide(o)) {
      return o.isPublic() ? PACKAGE_EXPORTED_VARIABLE : PACKAGE_LOCAL_VARIABLE;
    }

    return LOCAL_VARIABLE;
  }

  private static TextAttributesKey getColor(GoNamedSignatureOwner o) {
    if (GoPsiImplUtil.builtin(o)) return BUILTIN_FUNCTION;
    return o.isPublic() ? EXPORTED_FUNCTION : LOCAL_FUNCTION;
  }

  private static TextAttributesKey getColor(@Nullable GoTypeSpec o) {
    GoType type = o != null ? o.getGoType(null) : null;
    if (type != null) {
      type = type instanceof GoSpecType ? ((GoSpecType)type).getType() : type;
      boolean isPublic = o.isPublic();
      if (type instanceof GoInterfaceType) {
        return isPublic ? PACKAGE_EXPORTED_INTERFACE : PACKAGE_LOCAL_INTERFACE;
      }
      else if (type instanceof GoStructType) {
        return isPublic ? PACKAGE_EXPORTED_STRUCT : PACKAGE_LOCAL_STRUCT;
      }
    }
    return TYPE_SPECIFICATION;
  }

  private static void setHighlighting(@NotNull PsiElement element, @NotNull AnnotationHolder holder, @NotNull TextAttributesKey key) {
    holder.createInfoAnnotation(element, null).setEnforcedTextAttributes(TextAttributes.ERASE_MARKER);
    String description = ApplicationManager.getApplication().isUnitTestMode() ? key.getExternalName() : null;
    holder.createInfoAnnotation(element, description).setTextAttributes(key);
  }

  private static boolean isPackageWide(@NotNull GoVarDefinition o) {
    GoVarDeclaration declaration = PsiTreeUtil.getParentOfType(o, GoVarDeclaration.class);
    return declaration != null && declaration.getParent() instanceof GoFile;
  }

  private static boolean isPackageWide(@NotNull GoConstDefinition o) {
    GoConstDeclaration declaration = PsiTreeUtil.getParentOfType(o, GoConstDeclaration.class);
    return declaration != null && declaration.getParent() instanceof GoFile;
  }*/
