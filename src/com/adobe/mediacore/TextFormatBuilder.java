package com.adobe.mediacore;

public final class TextFormatBuilder
{
  private TextFormatData textFormat = new TextFormatData();
  
  public TextFormatBuilder() {}
  
  public TextFormatBuilder(TextFormat.Font paramFont, TextFormat.Size paramSize, TextFormat.FontEdge paramFontEdge, TextFormat.Color paramColor1, TextFormat.Color paramColor2, TextFormat.Color paramColor3, TextFormat.Color paramColor4, int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    textFormat.setFont(paramFont);
    textFormat.setSize(paramSize);
    textFormat.setFontEdge(paramFontEdge);
    textFormat.setFontColor(paramColor1);
    textFormat.setBackgroundColor(paramColor2);
    textFormat.setFillColor(paramColor3);
    textFormat.setEdgeColor(paramColor4);
    textFormat.setFontOpacity(paramInt1);
    textFormat.setBackgroundOpacity(paramInt2);
    textFormat.setFillOpacity(paramInt3);
    textFormat.setBottomInset(paramString);
  }
  
  public TextFormatBuilder setBackgroundColor(TextFormat.Color paramColor)
  {
    textFormat.setBackgroundColor(paramColor);
    return this;
  }
  
  public TextFormatBuilder setBackgroundOpacity(int paramInt)
  {
    textFormat.setBackgroundOpacity(paramInt);
    return this;
  }
  
  public TextFormatBuilder setBottomInset(String paramString)
  {
    textFormat.setBottomInset(paramString);
    return this;
  }
  
  public TextFormatBuilder setEdgeColor(TextFormat.Color paramColor)
  {
    textFormat.setEdgeColor(paramColor);
    return this;
  }
  
  public TextFormatBuilder setFillColor(TextFormat.Color paramColor)
  {
    textFormat.setFillColor(paramColor);
    return this;
  }
  
  public TextFormatBuilder setFillOpacity(int paramInt)
  {
    textFormat.setFillOpacity(paramInt);
    return this;
  }
  
  public TextFormatBuilder setFont(TextFormat.Font paramFont)
  {
    textFormat.setFont(paramFont);
    return this;
  }
  
  public TextFormatBuilder setFontColor(TextFormat.Color paramColor)
  {
    textFormat.setFontColor(paramColor);
    return this;
  }
  
  public TextFormatBuilder setFontEdge(TextFormat.FontEdge paramFontEdge)
  {
    textFormat.setFontEdge(paramFontEdge);
    return this;
  }
  
  public TextFormatBuilder setFontOpacity(int paramInt)
  {
    textFormat.setFontOpacity(paramInt);
    return this;
  }
  
  public TextFormatBuilder setSize(TextFormat.Size paramSize)
  {
    textFormat.setSize(paramSize);
    return this;
  }
  
  public TextFormat toTextFormat()
  {
    return textFormat;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TextFormatBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */