package com.auditude.ads.network.vast.loader;

import com.auditude.ads.network.vast.model.VASTAd;
import com.auditude.ads.network.vast.model.VASTAdBase;
import com.auditude.ads.network.vast.model.VASTAdCreativeBase;
import com.auditude.ads.network.vast.model.VASTClick;
import com.auditude.ads.network.vast.model.VASTCompanionCreative;
import com.auditude.ads.network.vast.model.VASTDocument;
import com.auditude.ads.network.vast.model.VASTInlineAd;
import com.auditude.ads.network.vast.model.VASTLinearCreative;
import com.auditude.ads.network.vast.model.VASTMediaFile;
import com.auditude.ads.network.vast.model.VASTNonLinearCreative;
import com.auditude.ads.network.vast.model.VASTTrackingEvent;
import com.auditude.ads.network.vast.model.VASTTrackingUrl;
import com.auditude.ads.network.vast.model.VASTWrapperAd;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.PingUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.XMLUtil;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class VASTXMLParser
{
  private static final String AD = "Ad";
  private static final String AD_PARAMETERS = "AdParameters";
  private static final String AD_SYSTEM = "AdSystem";
  private static final String AD_TITLE = "AdTitle";
  private static final String ALT_TEXT = "AltText";
  private static final String API_FRAMEWORK = "apiFramework";
  private static final String BITRATE = "bitrate";
  private static final String CLICK_THROUGH = "ClickThrough";
  private static final String CLICK_TRACKING = "ClickTracking";
  private static final String COMPANION = "Companion";
  private static final String COMPANION_ADS = "CompanionAds";
  private static final String COMPANION_CLICK_THROUGH = "CompanionClickThrough";
  private static final String COMPANION_CLICK_TRACKING = "CompanionClickTracking";
  private static final String CREATIVES = "Creatives";
  private static final String CREATIVE_TYPE = "creativeType";
  private static final String CUSTOM_CLICK = "CustomClick";
  private static final String DELIVERY = "delivery";
  private static final String DESCRIPTION = "Description";
  private static final String DURATION = "Duration";
  private static final String ERROR = "Error";
  private static final String EVENT = "event";
  private static final String EXPANDED_HEIGHT = "expandedHeight";
  private static final String EXPANDED_WIDTH = "expandedWidth";
  private static final String EXTENSION = "Extension";
  private static final String EXTENSIONS = "Extensions";
  private static final String HEIGHT = "height";
  private static final String HTML_RESOURCE = "HTMLResource";
  private static final String ID = "id";
  private static final String IFRAME_RESOURCE = "IFrameResource";
  private static final String IMPRESSION = "Impression";
  private static final String INLINE = "InLine";
  private static final String LINEAR = "Linear";
  private static final String MAINTAIN_ASPECT_RATIO = "maintainAspectRatio";
  private static final String MEDIA_FILE = "MediaFile";
  private static final String MEDIA_FILES = "MediaFiles";
  private static final String NON_LINEAR = "NonLinear";
  private static final String NON_LINEAR_ADS = "NonLinearAds";
  private static final String NON_LINEAR_CLICK_THROUGH = "NonLinearClickThrough";
  private static final String OFFSET = "offset";
  private static final String ROOT_TAG = "VAST";
  private static final String SCALABLE = "scalable";
  private static final String SKIPOFFSET = "skipoffset";
  private static final String STATIC_RESOURCE = "StaticResource";
  private static final String SURVEY = "Survey";
  private static final String TRACKING = "Tracking";
  private static final String TRACKING_EVENTS = "TrackingEvents";
  private static final String TYPE = "type";
  private static final String VAST_AD_TAG_URI = "VASTAdTagURI";
  private static final String VERSION = "version";
  private static final String VIDEO_CLICKS = "VideoClicks";
  private static final String WIDTH = "width";
  private static final String WRAPPER = "Wrapper";
  public VASTAd parentAd;
  private XmlPullParser parser;
  
  private void logVastError(VASTInlineAd paramVASTInlineAd, int paramInt)
  {
    if ((paramVASTInlineAd != null) && (errorUrl != null) && (errorUrl.length() > 0)) {
      PingUtil.pingUrl(AuditudeUtil.substituteTags(errorUrl.replaceAll("\\[ERRORCODE\\]", String.valueOf(paramInt)).replaceAll("%5BERRORCODE%5D", String.valueOf(paramInt))));
    }
  }
  
  private VASTAd parseAd()
    throws XmlPullParserException, IOException
  {
    VASTAd localVASTAd = new VASTAd(XMLUtil.attributeAsStringOrDefault(parser, "id", null), parentAd.getFallbackOnInvalidCreative());
    localVASTAd.setSequence(XMLUtil.attributeAsIntOrDefault(parser, "sequence", -1));
    int i = 2;
    Object localObject = parser.getName();
    if (i == 2) {
      if ("InLine".equalsIgnoreCase((String)localObject)) {
        parseVASTAdBase(localVASTAd, new VASTInlineAd());
      }
    }
    while ((i != 3) || (!"Ad".equalsIgnoreCase((String)localObject))) {
      for (;;)
      {
        i = parser.next();
        break;
        if ("Wrapper".equalsIgnoreCase((String)localObject))
        {
          localObject = new VASTWrapperAd();
          followAdditionalWrappers = Boolean.valueOf(XMLUtil.attributeAsBoolOrDefault(parser, "followAdditionalWrappers", true));
          fallbackOnNoAd = XMLUtil.attributeAsStringOrDefault(parser, "fallbackOnNoAd", null);
          allowMultipleAds = XMLUtil.attributeAsStringOrDefault(parser, "allowMultipleAds", null);
          parseVASTAdBase(localVASTAd, (VASTInlineAd)localObject);
        }
      }
    }
    return localVASTAd;
  }
  
  private void parseAdCreativeBaseAttributes(VASTAdCreativeBase paramVASTAdCreativeBase)
  {
    id = XMLUtil.attributeAsStringOrDefault(parser, "id", null);
    width = XMLUtil.attributeAsIntOrDefault(parser, "width", 0);
    height = XMLUtil.attributeAsIntOrDefault(parser, "height", 0);
    expandedWidth = XMLUtil.attributeAsIntOrDefault(parser, "expandedWidth", 0);
    expandedHeight = XMLUtil.attributeAsIntOrDefault(parser, "expandedHeight", 0);
    apiFramework = XMLUtil.attributeAsStringOrDefault(parser, "apiFramework", null);
  }
  
  private void parseCompanionAds(VASTInlineAd paramVASTInlineAd, String paramString)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    String str1 = null;
    String str2 = parser.getName();
    if (i == 2) {
      if ("Companion".equalsIgnoreCase(str2))
      {
        paramString = new VASTCompanionCreative();
        parseAdCreativeBaseAttributes(paramString);
        paramVASTInlineAd.addCompanionAd(paramString);
      }
    }
    label471:
    do
    {
      for (;;)
      {
        i = parser.next();
        str1 = paramString;
        break;
        if ("CompanionClickThrough".equalsIgnoreCase(str2))
        {
          paramString = str1;
          if (str1 != null)
          {
            clickThroughUrl = parser.nextText().replaceAll("\t", "");
            paramString = str1;
          }
        }
        else if ("CompanionClickTracking".equalsIgnoreCase(str2))
        {
          str1.addClickTrakingUrl(parser.nextText().replaceAll("\t", ""));
          paramString = str1;
        }
        else if ("AdParameters".equalsIgnoreCase(str2))
        {
          adParameters = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else if ("AltText".equalsIgnoreCase(str2))
        {
          altText = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else if ("TrackingEvents".equalsIgnoreCase(str2))
        {
          paramString = str1;
          if (str1 != null)
          {
            parseTrackingEvents(str1);
            paramString = str1;
          }
        }
        else if ("StaticResource".equalsIgnoreCase(str2))
        {
          creativeType = XMLUtil.attributeAsStringOrDefault(parser, "creativeType", null);
          resourceType = "static";
          url = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else if (("IFrameResource".equalsIgnoreCase(str2)) && (resourceType != "static"))
        {
          resourceType = "iframe";
          url = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else
        {
          paramString = str1;
          if ("HTMLResource".equalsIgnoreCase(str2))
          {
            paramString = str1;
            if (resourceType == null)
            {
              resourceType = "html";
              url = parser.nextText().replaceAll("\t", "");
              paramString = str1;
              continue;
              paramString = str1;
              if (i == 3)
              {
                if (!"Companion".equalsIgnoreCase(str2)) {
                  break label471;
                }
                paramString = null;
              }
            }
          }
        }
      }
      paramString = str1;
    } while (!"CompanionAds".equalsIgnoreCase(str2));
  }
  
  private void parseCreatives(VASTInlineAd paramVASTInlineAd, String paramString)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    Object localObject = parser.getName();
    if (i == 2) {
      if ("Linear".equalsIgnoreCase((String)localObject)) {
        parseLinearAd(paramVASTInlineAd, paramString);
      }
    }
    while ((i != 3) || (!"Creatives".equalsIgnoreCase((String)localObject))) {
      for (;;)
      {
        i = parser.next();
        break;
        if ("NonLinearAds".equalsIgnoreCase((String)localObject))
        {
          parseNonLinearAds(paramVASTInlineAd, paramString);
        }
        else if ("CompanionAds".equalsIgnoreCase((String)localObject))
        {
          String str = XMLUtil.attributeAsStringOrDefault(parser, "required", "none");
          localObject = str;
          if (str.length() <= 0) {
            localObject = "none";
          }
          companionRequired = ((String)localObject);
          parseCompanionAds(paramVASTInlineAd, paramString);
        }
      }
    }
  }
  
  private void parseExtensions(VASTAdBase paramVASTAdBase)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    String str = parser.getName();
    if (i == 2) {
      if ("Extension".equalsIgnoreCase(str)) {
        paramVASTAdBase.addExtension(parser.getText());
      }
    }
    while ((i != 3) || (!"Extensions".equalsIgnoreCase(str)))
    {
      i = parser.next();
      break;
    }
  }
  
  private void parseLinearAd(VASTInlineAd paramVASTInlineAd, String paramString)
    throws XmlPullParserException, IOException
  {
    VASTLinearCreative localVASTLinearCreative = new VASTLinearCreative();
    adId = paramString;
    paramString = XMLUtil.attributeAsStringOrDefault(parser, "skipoffset", null);
    if ((paramString != null) && ((paramString.matches("(^[-.0-9]+:[-.0-9]+:[-.0-9]+$)")) || (paramString.matches("(^[-.0-9]+%)")))) {
      paramVASTInlineAd.setSkipOffset(paramString);
    }
    int i = parser.next();
    paramString = parser.getName();
    if (i == 2) {
      if ("TrackingEvents".equalsIgnoreCase(paramString)) {
        parseTrackingEvents(localVASTLinearCreative);
      }
    }
    while ((i != 3) || (!"Linear".equalsIgnoreCase(paramString))) {
      for (;;)
      {
        i = parser.next();
        break;
        if ("Duration".equalsIgnoreCase(paramString)) {
          duration = StringUtil.parseDuration(parser.nextText().replaceAll("\t", ""));
        } else if ("AdParameters".equalsIgnoreCase(paramString)) {
          adParameters = parser.nextText().replaceAll("\t", "");
        } else if ("VideoClicks".equalsIgnoreCase(paramString)) {
          parseLinearClick(localVASTLinearCreative);
        } else if ("MediaFiles".equalsIgnoreCase(paramString)) {
          parseMediaFiles(localVASTLinearCreative);
        }
      }
    }
    if ((localVASTLinearCreative.getMediaFiles() != null) && (localVASTLinearCreative.getMediaFiles().size() > 0)) {
      apiFramework = getMediaFilesget0apiFramework;
    }
    linearAd = localVASTLinearCreative;
    if ((!(paramVASTInlineAd instanceof VASTWrapperAd)) && ((linearAd == null) || (linearAd.getMediaFiles() == null) || (linearAd.getMediaFiles().size() <= 0) || (linearAd.duration <= 0))) {
      asInvalideXML = Boolean.valueOf(true);
    }
  }
  
  private void parseLinearClick(VASTLinearCreative paramVASTLinearCreative)
    throws XmlPullParserException, IOException
  {
    VASTClick localVASTClick = new VASTClick();
    int i = parser.next();
    String str = parser.getName();
    if (i == 2) {
      if ("ClickThrough".equalsIgnoreCase(str)) {
        localVASTClick.setUrl(parser.nextText().replaceAll("\t", ""));
      }
    }
    while ((i != 3) || (!"VideoClicks".equalsIgnoreCase(str))) {
      for (;;)
      {
        i = parser.next();
        break;
        if ("ClickTracking".equalsIgnoreCase(str)) {
          localVASTClick.addClickTrackingUrl(parser.nextText().replaceAll("\t", ""));
        } else if ("CustomClick".equalsIgnoreCase(str)) {
          localVASTClick.addCustomClickUrl(parser.nextText().replaceAll("\t", ""));
        }
      }
    }
    click = localVASTClick;
  }
  
  private void parseMediaFiles(VASTLinearCreative paramVASTLinearCreative)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    Object localObject = parser.getName();
    if (i == 2) {
      if ("MediaFile".equalsIgnoreCase((String)localObject))
      {
        localObject = new VASTMediaFile();
        id = XMLUtil.attributeAsStringOrDefault(parser, "id", null);
        bitrate = XMLUtil.attributeAsIntOrDefault(parser, "bitrate", 0);
        width = XMLUtil.attributeAsIntOrDefault(parser, "width", 0);
        height = XMLUtil.attributeAsIntOrDefault(parser, "height", 0);
        delivery = XMLUtil.attributeAsStringOrDefault(parser, "delivery", null);
        type = XMLUtil.attributeAsStringOrDefault(parser, "type", null);
        scalable = XMLUtil.attributeAsBoolOrDefault(parser, "scalable", true);
        maintainAspectRatio = XMLUtil.attributeAsBoolOrDefault(parser, "maintainAspectRatio", true);
        apiFramework = XMLUtil.attributeAsStringOrDefault(parser, "apiFramework", null);
        url = parser.nextText().replaceAll("\t", "");
        paramVASTLinearCreative.addMediaFile((VASTMediaFile)localObject);
      }
    }
    while ((i != 3) || (!"MediaFiles".equalsIgnoreCase((String)localObject)))
    {
      i = parser.next();
      break;
    }
  }
  
  private void parseNonLinearAds(VASTInlineAd paramVASTInlineAd, String paramString)
    throws XmlPullParserException, IOException
  {
    VASTAdCreativeBase localVASTAdCreativeBase = new VASTAdCreativeBase();
    int i = parser.next();
    String str1 = null;
    String str2 = parser.getName();
    if (i == 2) {
      if ("NonLinear".equalsIgnoreCase(str2))
      {
        paramString = new VASTNonLinearCreative();
        parseAdCreativeBaseAttributes(paramString);
        scalable = XMLUtil.attributeAsBoolOrDefault(parser, "scalable", true);
        maintainAspectRatio = XMLUtil.attributeAsBoolOrDefault(parser, "maintainAspectRatio", true);
        paramVASTInlineAd.addNonLinearAd(paramString);
      }
    }
    label417:
    do
    {
      for (;;)
      {
        i = parser.next();
        str1 = paramString;
        break;
        if ("NonLinearClickThrough".equalsIgnoreCase(str2))
        {
          paramString = str1;
          if (str1 != null)
          {
            clickThroughUrl = parser.nextText().replaceAll("\t", "");
            paramString = str1;
          }
        }
        else if ("AdParameters".equalsIgnoreCase(str2))
        {
          adParameters = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else if ("TrackingEvents".equalsIgnoreCase(str2))
        {
          if (str1 != null)
          {
            parseTrackingEvents(str1);
            paramString = str1;
          }
          else
          {
            parseTrackingEvents(localVASTAdCreativeBase);
            paramString = str1;
          }
        }
        else if ("StaticResource".equalsIgnoreCase(str2))
        {
          creativeType = XMLUtil.attributeAsStringOrDefault(parser, "creativeType", null);
          resourceType = "static";
          url = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else if ("IFrameResource".equalsIgnoreCase(str2))
        {
          resourceType = "iframe";
          url = parser.nextText().replaceAll("\t", "");
          paramString = str1;
        }
        else
        {
          paramString = str1;
          if ("HTMLResource".equalsIgnoreCase(str2))
          {
            resourceType = "html";
            url = parser.nextText().replaceAll("\t", "");
            paramString = str1;
            continue;
            paramString = str1;
            if (i == 3)
            {
              if (!"NonLinear".equalsIgnoreCase(str2)) {
                break label417;
              }
              paramString = null;
            }
          }
        }
      }
      paramString = str1;
    } while (!"NonLinearAds".equalsIgnoreCase(str2));
    if ((localVASTAdCreativeBase.getTrackingEvents() != null) && (localVASTAdCreativeBase.getTrackingEvents().size() > 0)) {
      paramVASTInlineAd.setNonLinearAdTrackingEvents(localVASTAdCreativeBase.getTrackingEvents());
    }
  }
  
  private void parseTrackingEvents(VASTAdCreativeBase paramVASTAdCreativeBase)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    Object localObject1 = parser.getName();
    if (i == 2) {
      if ("Tracking".equalsIgnoreCase((String)localObject1))
      {
        str = XMLUtil.attributeAsStringOrDefault(parser, "event", null);
        if (!StringUtil.isNullOrEmpty(str))
        {
          localObject2 = paramVASTAdCreativeBase.getTrackingEventByType(str);
          localObject1 = localObject2;
          if (localObject2 == null)
          {
            localObject1 = new VASTTrackingEvent(str);
            paramVASTAdCreativeBase.addTrackingEvent((VASTTrackingEvent)localObject1);
          }
          localObject2 = XMLUtil.attributeAsStringOrDefault(parser, "offset", null);
          localVASTTrackingUrl = new VASTTrackingUrl(parser.nextText().replaceAll("\t", ""), str);
          if ((localObject2 == null) || (!str.equalsIgnoreCase("progress"))) {
            break label289;
          }
          if (!((String)localObject2).matches("(^[-.0-9]+%)")) {
            break label203;
          }
          localVASTTrackingUrl.setOffset(StringUtil.convertToInt(((String)localObject2).substring(0, ((String)localObject2).indexOf("%"))));
          localVASTTrackingUrl.setOffsetIsPercent(Boolean.valueOf(true));
          ((VASTTrackingEvent)localObject1).addTrackingUrl(localVASTTrackingUrl);
        }
      }
    }
    label203:
    label289:
    while ((i != 3) || (!"TrackingEvents".equalsIgnoreCase((String)localObject1))) {
      for (;;)
      {
        String str;
        Object localObject2;
        VASTTrackingUrl localVASTTrackingUrl;
        i = parser.next();
        break;
        if (((String)localObject2).matches("(^[-.0-9]+:[-.0-9]+:[-.0-9]+$)"))
        {
          localVASTTrackingUrl.setOffset(StringUtil.parseDuration((String)localObject2) * 1000);
          localVASTTrackingUrl.setOffsetIsPercent(Boolean.valueOf(false));
          ((VASTTrackingEvent)localObject1).addTrackingUrl(localVASTTrackingUrl);
        }
        else if (((String)localObject2).matches("(^[0-9]+$)"))
        {
          localVASTTrackingUrl.setOffset(StringUtil.convertToInt((String)localObject2) * 1000);
          localVASTTrackingUrl.setOffsetIsPercent(Boolean.valueOf(false));
          ((VASTTrackingEvent)localObject1).addTrackingUrl(localVASTTrackingUrl);
          continue;
          ((VASTTrackingEvent)localObject1).addTrackingUrl(localVASTTrackingUrl);
        }
      }
    }
  }
  
  private void parseVASTAdBase(VASTAd paramVASTAd, VASTInlineAd paramVASTInlineAd)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    paramVASTInlineAd.setNetworkAdId(paramVASTAd.getID());
    String str = parser.getName();
    if (i == 2) {
      if ("VASTAdTagURI".equalsIgnoreCase(str)) {
        if ((paramVASTInlineAd instanceof VASTWrapperAd)) {
          source = parser.nextText().replaceAll("\t", "");
        }
      }
    }
    do
    {
      do
      {
        for (;;)
        {
          i = parser.next();
          break;
          if ("AdSystem".equalsIgnoreCase(str)) {
            adSystem = parser.nextText().replaceAll("\t", "");
          } else if ("AdTitle".equalsIgnoreCase(str)) {
            adTitle = parser.nextText().replaceAll("\t", "");
          } else if ("Description".equalsIgnoreCase(str)) {
            description = parser.nextText().replaceAll("\t", "");
          } else if ("Survey".equalsIgnoreCase(str)) {
            surveyUrl = parser.nextText().replaceAll("\t", "");
          } else if ("Error".equalsIgnoreCase(str)) {
            errorUrl = parser.nextText().replaceAll("\t", "");
          } else if ("Impression".equalsIgnoreCase(str)) {
            paramVASTInlineAd.addImpressionUrl(new VASTTrackingUrl(parser.nextText().replaceAll("\t", ""), "creativeview"));
          } else if ("Creatives".equalsIgnoreCase(str)) {
            parseCreatives(paramVASTInlineAd, paramVASTAd.getID());
          } else if ("Extensions".equalsIgnoreCase(str)) {
            parseExtensions(paramVASTInlineAd);
          }
        }
      } while (i != 3);
      if ((linearAd != null) && (errorUrl != null) && (errorUrl.length() > 0))
      {
        VASTTrackingEvent localVASTTrackingEvent2 = linearAd.getTrackingEventByType("vasterror");
        VASTTrackingEvent localVASTTrackingEvent1 = localVASTTrackingEvent2;
        if (localVASTTrackingEvent2 == null)
        {
          localVASTTrackingEvent1 = new VASTTrackingEvent("vasterror");
          linearAd.addTrackingEvent(localVASTTrackingEvent1);
        }
        localVASTTrackingEvent1.addTrackingUrl(new VASTTrackingUrl(errorUrl, "vasterror"));
      }
      if (("Wrapper".equalsIgnoreCase(str)) && ((paramVASTInlineAd instanceof VASTWrapperAd)))
      {
        paramVASTAd.setWrapperAd((VASTWrapperAd)paramVASTInlineAd);
        return;
      }
    } while (!"InLine".equalsIgnoreCase(str));
    if (asInvalideXML.booleanValue())
    {
      logVastError(paramVASTInlineAd, 101);
      return;
    }
    paramVASTAd.addInlineAds(paramVASTInlineAd);
  }
  
  private VASTDocument parseXML(XmlPullParser paramXmlPullParser)
    throws IOException, XmlPullParserException
  {
    int i = paramXmlPullParser.getEventType();
    Object localObject1 = null;
    if (i == 1) {
      return (VASTDocument)localObject1;
    }
    Object localObject2;
    switch (i)
    {
    default: 
      localObject2 = localObject1;
    }
    do
    {
      for (;;)
      {
        i = paramXmlPullParser.next();
        localObject1 = localObject2;
        break;
        Object localObject3 = paramXmlPullParser.getName();
        if (((String)localObject3).equalsIgnoreCase("VAST"))
        {
          localObject1 = XMLUtil.attributeAsStringOrDefault(paramXmlPullParser, "version", null);
          if (StringUtil.isNullOrEmpty((String)localObject1)) {
            return null;
          }
          if ((!"2.0".equals(localObject1)) && (!"2.0.0".equals(localObject1)) && (!"2.0.1".equals(localObject1)) && (!"3.0".equals(localObject1))) {
            return null;
          }
          localObject2 = new VASTDocument(parentAd);
          version = ((String)localObject1);
        }
        else
        {
          localObject2 = localObject1;
          if (((String)localObject3).equalsIgnoreCase("Ad"))
          {
            localObject3 = parseAd();
            localObject2 = localObject1;
            if (localObject3 != null)
            {
              ((VASTDocument)localObject1).addVASTAd((VASTAd)localObject3);
              localObject2 = localObject1;
            }
          }
        }
      }
      localObject2 = localObject1;
    } while (!paramXmlPullParser.getName().equalsIgnoreCase("VAST"));
    return (VASTDocument)localObject1;
  }
  
  public final VASTDocument parse(String paramString)
    throws IOException, XmlPullParserException
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return null;
    }
    parser = XmlPullParserFactory.newInstance().newPullParser();
    parser.setInput(new StringReader(paramString));
    return parseXML(parser);
  }
  
  public final VASTDocument parse(XmlPullParser paramXmlPullParser)
    throws IOException, XmlPullParserException
  {
    parser = paramXmlPullParser;
    return parseXML(parser);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.loader.VASTXMLParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */