package com.auditude.ads.util.view;

import com.auditude.ads.util.Base64Coder;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.URLUtil;

public final class OnPageAssetUtil
{
  public static String GetHTMLForIFrameURL(String paramString, double paramDouble1, double paramDouble2, String[] paramArrayOfString)
  {
    return "<iframe width=\"" + paramDouble1 + "\" height=\"" + paramDouble2 + "\" frameborder=\"0\" scrolling=\"no\" " + "allowtransparency=\"true\" leftmargin=\"0\" rightmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" " + "src=\"" + paramString + "\"></iframe>" + GetTrackingPixels(paramArrayOfString);
  }
  
  public static String GetHTMLForImageURL(String paramString1, String paramString2, double paramDouble1, double paramDouble2, String paramString3, String[] paramArrayOfString)
  {
    if (StringUtil.isNullOrEmpty(paramString1)) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder("");
    if (StringUtil.isNullOrEmpty(paramString2)) {
      localStringBuilder.append("<img width=\"" + paramDouble1 + "\" height=\"" + paramDouble2 + "\" src=\"" + paramString1 + "\" alt=\"" + paramString3 + "\" border=\"0\"/>");
    }
    for (;;)
    {
      localStringBuilder.append(GetTrackingPixels(paramArrayOfString));
      return localStringBuilder.toString();
      localStringBuilder.append("<a href=\"" + paramString2 + "\"  target=\"_blank\">");
      localStringBuilder.append("<img width=\"" + paramDouble1 + "\" height=\"" + paramDouble2 + "\" src=\"" + paramString1 + "\" alt=\"" + paramString3 + "\" border=\"0\"/>");
      localStringBuilder.append("</a>");
    }
  }
  
  public static String GetHTMLForSWFURL(String paramString1, String paramString2, String paramString3, String paramString4, double paramDouble1, double paramDouble2, String[] paramArrayOfString)
  {
    String str = paramString3;
    if (StringUtil.isNullOrEmpty(paramString3)) {
      str = "";
    }
    return GetSWFObjectTag(paramString1, paramString4, paramDouble1, paramDouble2, "au=" + URLUtil.urlEncode(paramString2) + "&cu=" + Base64Coder.encodeString(str) + "&cw=" + paramDouble1 + "&ch=" + paramDouble2 + "&" + GetTrackingPixelsAsParamString(paramArrayOfString), "", "#000000");
  }
  
  public static String GetSWFObjectTag(String paramString1, String paramString2, double paramDouble1, double paramDouble2, String paramString3, String paramString4, String paramString5)
  {
    String str1 = paramString3;
    if (StringUtil.isNullOrEmpty(paramString3)) {
      str1 = "";
    }
    String str2 = "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" id=\"" + paramString2 + "\" width=\"" + paramDouble1 + "px\" height=\"" + paramDouble2 + "px\"";
    paramString3 = str2;
    if (!StringUtil.isNullOrEmpty(paramString4)) {
      paramString3 = str2 + " style=\"" + paramString4 + "\" ";
    }
    return paramString3 + "codebase=\"http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab\"><param name=\"movie\" value=\"" + paramString1 + "\"/>" + "<param name=\"bgColor\" value=\"" + paramString5 + "\"/>" + "<param name=\"flashVars\" value=\"" + str1 + "\"/>" + "<param name=\"quality\" value=\"high\"/>" + "<param name=\"allowScriptAccess\" value=\"always\"/>" + "<param name=\"loop\" VALUE=\"true\"/>" + "<param name=\"play\" VALUE=\"true\"/>" + "<embed src=\"" + paramString1 + "\" bgColor=\"" + paramString5 + "\" flashVars=\"" + str1 + "\" " + "width=\"" + paramDouble1 + "px\" height=\"" + paramDouble2 + "px\" name=\"" + paramString2 + "\" align=\"middle\" " + "play=\"true\" loop=\"true\" quality=\"high\" allowScriptAccess=\"always\" " + "type=\"application/x-shockwave-flash\" " + "pluginspage=\"http://www.adobe.com/go/getflashplayer\">" + "</embed>" + "</object>";
  }
  
  public static String GetTrackingPixel(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return "";
    }
    return "<img src=\"" + paramString + "\" width=\"1\" height=\"1\" border=\"0\" " + "style=\"height:1px;width:1px;border:0;position:absolute;top:0;" + "left:0;background-color:Transparent;background-image:none;padding:0;margin:0;\" />";
  }
  
  public static String GetTrackingPixels(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0)) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder("");
    int j = paramArrayOfString.length;
    int i = 0;
    if (i >= j) {
      return localStringBuilder.toString();
    }
    String str = paramArrayOfString[i];
    if (StringUtil.isNullOrEmpty(str)) {}
    for (;;)
    {
      i += 1;
      break;
      localStringBuilder.append("\n");
      localStringBuilder.append(GetTrackingPixel(str));
    }
  }
  
  public static String GetTrackingPixelsAsParamString(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0)) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder("");
    int i = 0;
    if (i >= paramArrayOfString.length) {
      return localStringBuilder.toString();
    }
    if (StringUtil.isNullOrEmpty(paramArrayOfString[i])) {}
    for (;;)
    {
      i += 1;
      break;
      localStringBuilder.append("im=" + URLUtil.urlEncode(paramArrayOfString[i]));
      if (i < paramArrayOfString.length - 1) {
        localStringBuilder.append("&");
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.view.OnPageAssetUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */