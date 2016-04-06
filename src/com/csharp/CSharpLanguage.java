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

package com.csharp;

import com.intellij.lang.Language;
import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class CSharpLanguage extends Language {
  public static final Language INSTANCE = new CSharpLanguage();

  private CSharpLanguage() {
    super("cs", "text/cs", "text/x-cs", "application/x-cs");
  }

  @NotNull
  @Override
  public String getDisplayName() {
    return "CSharp";
  }

  @Nullable
  @Override
  public LanguageFileType getAssociatedFileType() {
    return CSharpFileType.INSTANCE;
  }

  @Override
  public boolean isCaseSensitive() {
    return true;
  }
}
