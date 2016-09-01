package com.adobe.mediacore;

class TextFormatData
  implements TextFormat
{
  private TextFormat.Color backgroundColor = TextFormat.Color.DEFAULT;
  private int backgroundOpacity = -1;
  private String bottomInset = "default";
  private TextFormat.Color edgeColor = TextFormat.Color.DEFAULT;
  private TextFormat.Color fillColor = TextFormat.Color.DEFAULT;
  private int fillOpacity = -1;
  private TextFormat.Font font = TextFormat.Font.DEFAULT;
  private TextFormat.Color fontColor = TextFormat.Color.DEFAULT;
  private TextFormat.FontEdge fontEdge = TextFormat.FontEdge.DEFAULT;
  private int fontOpacity = -1;
  private TextFormat.Size size = TextFormat.Size.DEFAULT;
  
  public TextFormat.Color getBackgroundColor()
  {
    return backgroundColor;
  }
  
  public int getBackgroundOpacity()
  {
    return backgroundOpacity;
  }
  
  public String getBottomInset()
  {
    return bottomInset;
  }
  
  public TextFormat.Color getEdgeColor()
  {
    return edgeColor;
  }
  
  public TextFormat.Color getFillColor()
  {
    return fillColor;
  }
  
  public int getFillOpacity()
  {
    return fillOpacity;
  }
  
  public TextFormat.Font getFont()
  {
    return font;
  }
  
  public TextFormat.Color getFontColor()
  {
    return fontColor;
  }
  
  public TextFormat.FontEdge getFontEdge()
  {
    return fontEdge;
  }
  
  public int getFontOpacity()
  {
    return fontOpacity;
  }
  
  public TextFormat.Size getSize()
  {
    return size;
  }
  
  public void setBackgroundColor(TextFormat.Color paramColor)
  {
    backgroundColor = paramColor;
  }
  
  public void setBackgroundOpacity(int paramInt)
  {
    backgroundOpacity = paramInt;
  }
  
  public void setBottomInset(String paramString)
  {
    bottomInset = paramString;
  }
  
  public void setEdgeColor(TextFormat.Color paramColor)
  {
    edgeColor = paramColor;
  }
  
  public void setFillColor(TextFormat.Color paramColor)
  {
    fillColor = paramColor;
  }
  
  public void setFillOpacity(int paramInt)
  {
    fillOpacity = paramInt;
  }
  
  public void setFont(TextFormat.Font paramFont)
  {
    font = paramFont;
  }
  
  public void setFontColor(TextFormat.Color paramColor)
  {
    fontColor = paramColor;
  }
  
  public void setFontEdge(TextFormat.FontEdge paramFontEdge)
  {
    fontEdge = paramFontEdge;
  }
  
  public void setFontOpacity(int paramInt)
  {
    fontOpacity = paramInt;
  }
  
  public void setSize(TextFormat.Size paramSize)
  {
    size = paramSize;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TextFormatData
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */