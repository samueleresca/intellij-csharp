package com.csharp.highlighting.tests;

import com.csharp.highlighting.CSharpSyntaxHighlighterFactory;
import com.intellij.openapi.vfs.newvfs.impl.VfsRootAccess;
import com.intellij.testFramework.fixtures.LightCodeInsightFixtureTestCase;

public class CSharpHighlightingAnnotatorTests extends LightCodeInsightFixtureTestCase {
    @Override
    protected void setUp() throws Exception {
        VfsRootAccess.SHOULD_PERFORM_ACCESS_CHECK = false; // TODO: a workaround for v15
        super.setUp();
    }

    @Override
    protected String getTestDataPath() {
        return "testData/highlighting/";
    }

    protected  String getTestFile(){
            return getTestDataPath()+"Highlighting.cs";
    }

    public void testAnnotator() {
        myFixture.configureByFiles("Highlighting.cs");
        myFixture.getFile();
    }

   /* public void testFormatter() {
        myFixture.configureByFiles("FormatterTestData.simple");
        CodeStyleSettingsManager.getSettings(getProject()).SPACE_AROUND_ASSIGNMENT_OPERATORS = true;
        CodeStyleSettingsManager.getSettings(getProject()).KEEP_BLANK_LINES_IN_CODE = 2;
        new WriteCommandAction.Simple(getProject()) {
            @Override
            protected void run() throws Throwable {
                CodeStyleManager.getInstance(getProject()).reformat(myFixture.getFile());
            }
        }.execute();
        myFixture.checkResultByFile("DefaultTestData.simple");
    }

    public void testRename() {
        myFixture.configureByFiles("RenameTestData.java", "RenameTestData.simple");
        myFixture.renameElementAtCaret("websiteUrl");
        myFixture.checkResultByFile("RenameTestData.simple", "RenameTestDataAfter.simple", false);
    }

    public void testFolding() {
        myFixture.configureByFiles("DefaultTestData.simple");
        myFixture.testFolding(getTestDataPath() + "/FoldingTestData.java");
    }

    public void testFindUsages() {
        Collection<UsageInfo> usageInfos = myFixture.testFindUsages("FindUsagesTestData.simple", "FindUsagesTestData.java");
        assertEquals(1, usageInfos.size());
    }

    public void testCommenter() {
        myFixture.configureByText(CSharpFileType.INSTANCE, "<caret>website = http://en.wikipedia.org/");
        CommentByLineCommentAction commentAction = new CommentByLineCommentAction();
        commentAction.actionPerformedImpl(getProject(), myFixture.getEditor());
        myFixture.checkResult("#website = http://en.wikipedia.org/");
        commentAction.actionPerformedImpl(getProject(), myFixture.getEditor());
        myFixture.checkResult("website = http://en.wikipedia.org/");
    }

    public void testReference() {
        myFixture.configureByFiles("ReferenceTestData.java", "DefaultTestData.simple");
        PsiElement element = myFixture.getFile().findElementAt(myFixture.getCaretOffset()).getParent();
        assertEquals("http://en.wikipedia.org/", ((CSharpProperty) element.getReferences()[0].resolve()).getValue());
    }*/
}