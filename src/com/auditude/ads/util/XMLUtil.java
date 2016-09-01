package com.auditude.ads.util;

import org.xmlpull.v1.XmlPullParser;

public final class XMLUtil
{
  public static boolean attributeAsBoolOrDefault(XmlPullParser paramXmlPullParser, String paramString, boolean paramBoolean)
  {
    paramXmlPullParser = paramXmlPullParser.getAttributeValue(null, paramString);
    if (paramXmlPullParser == null) {
      return paramBoolean;
    }
    return Boolean.parseBoolean(paramXmlPullParser);
  }
  
  public static int attributeAsIntOrDefault(XmlPullParser paramXmlPullParser, String paramString, int paramInt)
  {
    paramXmlPullParser = paramXmlPullParser.getAttributeValue(null, paramString);
    if (paramXmlPullParser == null) {
      return paramInt;
    }
    try
    {
      int i = Integer.parseInt(paramXmlPullParser);
      return i;
    }
    catch (NumberFormatException paramXmlPullParser) {}
    return paramInt;
  }
  
  public static String attributeAsStringOrDefault(XmlPullParser paramXmlPullParser, String paramString1, String paramString2)
  {
    paramXmlPullParser = paramXmlPullParser.getAttributeValue(null, paramString1);
    if (paramXmlPullParser == null) {
      return paramString2;
    }
    return paramXmlPullParser;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.XMLUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */