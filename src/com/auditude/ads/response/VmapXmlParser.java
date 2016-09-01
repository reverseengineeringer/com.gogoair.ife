package com.auditude.ads.response;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.network.vast.loader.VASTXMLParser;
import com.auditude.ads.network.vast.model.VASTAd;
import com.auditude.ads.network.vast.model.VASTDocument;
import com.auditude.ads.network.vast.model.VASTWrapperAd;
import com.auditude.ads.util.XMLUtil;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class VmapXmlParser
{
  private VASTAd parentAd = null;
  private XmlPullParser parser;
  private VmapXmlNode rootNode;
  
  private VmapXmlNode parseNode()
    throws XmlPullParserException, IOException
  {
    VmapXmlNode localVmapXmlNode = new VmapXmlNode();
    localVmapXmlNode.setName(parser.getName());
    setAttributes(localVmapXmlNode);
    int i = parser.next();
    if (i == 3) {
      return localVmapXmlNode;
    }
    Object localObject;
    if (i == 2) {
      if ("VAST".equalsIgnoreCase(parser.getName()))
      {
        localObject = parseVAST(parentAd);
        if (localObject != null) {
          localVmapXmlNode.addVastDocument((VASTDocument)localObject);
        }
      }
    }
    for (;;)
    {
      i = parser.next();
      break;
      if ("AdSource".equalsIgnoreCase(parser.getName()))
      {
        localObject = new VASTWrapperAd();
        followAdditionalWrappers = Boolean.valueOf(XMLUtil.attributeAsBoolOrDefault(parser, "followRedirects", true));
        boolean bool = false;
        AdSettings localAdSettings = AuditudeEnv.getInstance().getAdSettings();
        if (localAdSettings.getProperty("fallbackOnInvalidCreative") != null) {
          bool = Boolean.valueOf(localAdSettings.getProperty("fallbackOnInvalidCreative").toString()).booleanValue();
        }
        parentAd = new VASTAd(XMLUtil.attributeAsStringOrDefault(parser, "id", String.valueOf(Math.round(Math.random() * 1000.0D))), Boolean.valueOf(bool));
        parentAd.setWrapperAd((VASTWrapperAd)localObject);
      }
      localVmapXmlNode.addChild(parseNode());
      continue;
      if (i == 4) {
        localVmapXmlNode.setValue(parser.getText());
      }
    }
  }
  
  private VASTDocument parseVAST(VASTAd paramVASTAd)
    throws XmlPullParserException, IOException
  {
    Object localObject = null;
    int i = parser.getEventType();
    parser.getName();
    String str = parser.getName();
    if ((i == 2) && ("VAST".equalsIgnoreCase(str)))
    {
      localObject = new VASTXMLParser();
      parentAd = paramVASTAd;
      localObject = ((VASTXMLParser)localObject).parse(parser);
      i = parser.getEventType();
      str = parser.getName();
    }
    for (;;)
    {
      if ((i == 3) && ("VAST".equalsIgnoreCase(str))) {
        return (VASTDocument)localObject;
      }
      i = parser.next();
      break;
    }
  }
  
  private void setAttributes(VmapXmlNode paramVmapXmlNode)
  {
    int j;
    int i;
    if (paramVmapXmlNode != null)
    {
      j = parser.getAttributeCount();
      i = 0;
    }
    for (;;)
    {
      if (i >= j) {
        return;
      }
      paramVmapXmlNode.setAttribute(parser.getAttributeName(i), parser.getAttributeValue(i));
      i += 1;
    }
  }
  
  public ArrayList getChildNodes()
  {
    return rootNode.getChildNodes();
  }
  
  public ArrayList getChildeNodesByName(String paramString)
  {
    return rootNode.getChildeNodesByName(paramString);
  }
  
  public void parseXML(String paramString)
    throws XmlPullParserException, IOException
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      XmlPullParserFactory localXmlPullParserFactory = XmlPullParserFactory.newInstance();
      localXmlPullParserFactory.setNamespaceAware(true);
      parser = localXmlPullParserFactory.newPullParser();
      parser.setInput(new StringReader(paramString));
    }
    for (int i = parser.getEventType();; i = parser.next())
    {
      if (i == 1) {
        return;
      }
      if ((i != 0) && (i != 1) && (i == 2)) {
        rootNode = parseNode();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.VmapXmlParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */