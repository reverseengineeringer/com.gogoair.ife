package com.auditude.ads.response;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.loader.AdRequest;
import com.auditude.ads.loader.DataLoader;
import com.auditude.ads.loader.DataLoader.DataLoaderListener;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.BaseElement;
import com.auditude.ads.model.Click;
import com.auditude.ads.model.IClick;
import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.INonLinearAsset;
import com.auditude.ads.model.LinearAsset;
import com.auditude.ads.model.NonLinearAsset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.model.smil.Par;
import com.auditude.ads.model.smil.Ref;
import com.auditude.ads.model.smil.Sequence;
import com.auditude.ads.model.smil.SmilElementType;
import com.auditude.ads.model.tracking.ParStateSubmission;
import com.auditude.ads.model.tracking.Submission;
import com.auditude.ads.model.tracking.Submissions;
import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.XMLUtil;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class AuditudeResponseParser
  implements DataLoader.DataLoaderListener, IResponseParser
{
  private static String CRENABLED = "crenabled";
  private static final String MIME_TYPE_TEXT_HTML = "text/html";
  private static String SCR = "scr";
  private AdRequest adRequest;
  private AdResponse adResponse;
  private HashMap ads = new HashMap();
  private ArrayList breaks = new ArrayList();
  private ArrayList chapters = new ArrayList();
  private DataLoader dataLoader;
  private IResponseParser.ResponseParserListener listener;
  private XmlPullParser parser;
  private HashMap refs = new HashMap();
  private Submissions submissions = new Submissions();
  private int timeout;
  
  private Asset GetAssetForType(String paramString, BaseElement paramBaseElement)
  {
    if ("linear".equals(paramString)) {
      return new LinearAsset(paramBaseElement);
    }
    if ("nonlinear".equals(paramString)) {
      return new NonLinearAsset(paramBaseElement);
    }
    if ("companion".equals(paramString)) {
      return new OnPageAsset(paramBaseElement);
    }
    return null;
  }
  
  private void NotifyError(String paramString) {}
  
  private void applyAdsOnRefs()
  {
    Iterator localIterator = refs.entrySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        refs.clear();
        refs = null;
        return;
      }
      Object localObject = (Map.Entry)localIterator.next();
      Ref localRef = (Ref)((Map.Entry)localObject).getKey();
      localObject = (String)((Map.Entry)localObject).getValue();
      if ((!StringUtil.isNullOrEmpty((String)localObject)) && (ads.containsKey(localObject)))
      {
        localObject = (Ad)ads.get(localObject);
        localRef.setAd((Ad)localObject);
        localRef.setAssets(((Ad)localObject).getAssetsBySegment(localRef.getID()));
      }
    }
  }
  
  private Boolean hasMimeType(ArrayList paramArrayList1, ArrayList paramArrayList2)
  {
    if (paramArrayList1 != null) {
      paramArrayList1 = paramArrayList1.iterator();
    }
    do
    {
      if (!paramArrayList1.hasNext()) {
        return Boolean.valueOf(false);
      }
    } while (!((Asset)paramArrayList1.next()).hasAssetsWithMimeType(paramArrayList2).booleanValue());
    return Boolean.valueOf(true);
  }
  
  private void parseAd()
    throws XmlPullParserException, IOException
  {
    Ad localAd = new Ad(null);
    localAd.setID(XMLUtil.attributeAsStringOrDefault(parser, "id", null));
    HashMap localHashMap1 = new HashMap();
    Object localObject3 = new HashMap();
    Object localObject2 = new ArrayList();
    int i = parser.next();
    Object localObject1 = null;
    Object localObject4 = parser.getName();
    if (i == 2) {
      if ("wrapper".equalsIgnoreCase((String)localObject4))
      {
        localAd.setIsNetworkAd(true);
        localAd.setNetworkAdType(parser.getAttributeValue(null, "adSystem"));
        localAd.setNetworkAdSource(parser.getAttributeValue(null, "adTagURI"));
      }
    }
    for (;;)
    {
      i = parser.next();
      break;
      if ("behavior".equalsIgnoreCase((String)localObject4))
      {
        localObject4 = XMLUtil.attributeAsStringOrDefault(parser, "type", null);
        if ((localObject4 != null) && (!((String)localObject4).equalsIgnoreCase(SCR))) {
          if (((String)localObject4).equalsIgnoreCase(CRENABLED)) {
            localAd.setRepackagingEnabled(Boolean.valueOf(parser.nextText()).booleanValue());
          } else {
            localHashMap1.put(localObject4, StringUtil.ConvertToKeysAndValues(parser.nextText(), "&", "="));
          }
        }
      }
      else if ("submission".equalsIgnoreCase((String)localObject4))
      {
        parseSubmission(localAd);
      }
      else if ("asset".equalsIgnoreCase((String)localObject4))
      {
        localObject4 = parseAsset(localAd);
        if (localObject4 != null) {
          if (localAd.getIsNetworkAd())
          {
            localAd.addTrackingAsset((Asset)localObject4);
            if (((localObject4 instanceof ILinearAsset)) || ((localObject4 instanceof INonLinearAsset))) {
              localAd.setAuditudeParams(((Asset)localObject4).getAuditudeParams());
            }
            if ((localObject4 instanceof OnPageAsset)) {
              ((Asset)localObject4).addTrackingUrlForType(new ParStateSubmission(((Asset)localObject4).getUrl(), "creativeview"), "creativeview");
            }
          }
          else
          {
            ((ArrayList)localObject2).add(localObject4);
          }
        }
      }
      else if ("customdata".equalsIgnoreCase((String)localObject4))
      {
        localObject4 = XMLUtil.attributeAsStringOrDefault(parser, "type", null);
        if (localObject4 != null) {
          ((HashMap)localObject3).put(localObject4, parser.nextText().split("&"));
        }
      }
      else if ("smil".equalsIgnoreCase((String)localObject4))
      {
        localObject1 = parseAdSmil(localAd);
        continue;
        if ((i == 3) && ("ad".equalsIgnoreCase((String)localObject4)))
        {
          if (!StringUtil.isNullOrEmpty(localAd.getID()))
          {
            boolean bool = false;
            if (adResponse.getAdSettings().getProperty("repackageCreativeEnabled") != null) {
              bool = Boolean.valueOf(adResponse.getAdSettings().getProperty("repackageCreativeEnabled").toString()).booleanValue();
            }
            if ((localAd.getIsNetworkAd()) || (bool)) {
              ads.put(localAd.getID(), localAd);
            }
          }
          else
          {
            localObject4 = ((ArrayList)localObject2).iterator();
            label547:
            if (((Iterator)localObject4).hasNext()) {
              break label650;
            }
            if (localObject1 == null) {
              break label861;
            }
            localObject3 = ((HashMap)localObject1).entrySet().iterator();
            localObject1 = localObject2;
            if (((Iterator)localObject3).hasNext()) {
              break label739;
            }
          }
          for (;;)
          {
            localHashMap1.clear();
            ((ArrayList)localObject1).clear();
            return;
            localObject4 = (ArrayList)adResponse.getAdSettings().getProperty("validMimeTypes");
            if ((localObject4 != null) && (!hasMimeType((ArrayList)localObject2, (ArrayList)localObject4).booleanValue())) {
              break;
            }
            ads.put(localAd.getID(), localAd);
            break;
            label650:
            Asset localAsset = (Asset)((Iterator)localObject4).next();
            if (localHashMap1.containsKey(localAsset.getID()))
            {
              HashMap localHashMap2 = (HashMap)localHashMap1.get(localAsset.getID());
              if ((localHashMap2 != null) && (localHashMap2.containsKey("format"))) {
                localAsset.setFormat((String)localHashMap2.get("format"));
              }
            }
            localAsset.setCustomData((HashMap)localObject3);
            localAd.addAsset(localAsset);
            break label547;
            label739:
            localObject1 = (Map.Entry)((Iterator)localObject3).next();
            localObject2 = (String)((Map.Entry)localObject1).getKey();
            localObject4 = (ArrayList)((Map.Entry)localObject1).getValue();
            localObject1 = new ArrayList();
            if (StringUtil.isNotNullOrEmpty((String)localObject2)) {
              localObject4 = ((ArrayList)localObject4).iterator();
            }
            for (;;)
            {
              if (!((Iterator)localObject4).hasNext())
              {
                localAd.addSegmentById((String)localObject2, (Asset[])((ArrayList)localObject1).toArray(new Asset[((ArrayList)localObject1).size()]));
                break;
              }
              localAsset = localAd.getAssetById((String)((Iterator)localObject4).next());
              if (localAsset != null) {
                ((ArrayList)localObject1).add(localAsset);
              }
            }
            label861:
            localObject1 = localObject2;
          }
        }
      }
    }
  }
  
  private HashMap parseAdSmil(Ad paramAd)
    throws XmlPullParserException, IOException
  {
    HashMap localHashMap = new HashMap();
    int i = parser.next();
    Object localObject2 = null;
    Object localObject3 = null;
    Object localObject1 = parser.getName();
    Object localObject4;
    Object localObject5;
    if (i == 2)
    {
      if ("par".equalsIgnoreCase((String)localObject1))
      {
        localObject4 = XMLUtil.attributeAsStringOrDefault(parser, "id", null);
        localObject5 = new ArrayList();
      }
      do
      {
        do
        {
          i = parser.next();
          localObject3 = localObject5;
          localObject2 = localObject4;
          break;
          localObject5 = localObject3;
          localObject4 = localObject2;
        } while (!"ref".equalsIgnoreCase((String)localObject1));
        localObject1 = XMLUtil.attributeAsStringOrDefault(parser, "asset", null);
        localObject5 = localObject3;
        localObject4 = localObject2;
      } while (StringUtil.isNullOrEmpty((String)localObject1));
      localObject1 = ((String)localObject1).split("\\.");
      if (localObject1.length == 1) {
        localObject1 = localObject1[0];
      }
    }
    for (;;)
    {
      localObject5 = localObject3;
      localObject4 = localObject2;
      if (StringUtil.isNullOrEmpty((String)localObject1)) {
        break;
      }
      ((ArrayList)localObject3).add(localObject1);
      localObject5 = localObject3;
      localObject4 = localObject2;
      break;
      if ((localObject1.length == 2) && (paramAd.getID().equals(localObject1[0])))
      {
        localObject1 = localObject1[1];
        continue;
        localObject5 = localObject3;
        localObject4 = localObject2;
        if (i != 3) {
          break;
        }
        if ("par".equalsIgnoreCase((String)localObject1))
        {
          localObject5 = localObject3;
          localObject4 = localObject2;
          if (StringUtil.isNullOrEmpty((String)localObject2)) {
            break;
          }
          localHashMap.put(localObject2, localObject3);
          localObject5 = localObject3;
          localObject4 = localObject2;
          break;
        }
        localObject5 = localObject3;
        localObject4 = localObject2;
        if (!"smil".equalsIgnoreCase((String)localObject1)) {
          break;
        }
        return localHashMap;
      }
      localObject1 = null;
    }
  }
  
  private Asset parseAsset(Ad paramAd)
    throws XmlPullParserException, IOException
  {
    Asset localAsset = GetAssetForType(XMLUtil.attributeAsStringOrDefault(parser, "contentType", null), paramAd);
    if (localAsset == null) {
      return null;
    }
    localAsset.setID(XMLUtil.attributeAsStringOrDefault(parser, "id", null));
    localAsset.setDurationInMillis(XMLUtil.attributeAsIntOrDefault(parser, "runtime", 0) * 1000);
    localAsset.setLeadTimeInMillis(XMLUtil.attributeAsIntOrDefault(parser, "timeOffset", 15) * 1000);
    Object localObject = StringUtil.ConvertToKeysAndValues(XMLUtil.attributeAsStringOrDefault(parser, "parameters", ""), "&", "=");
    if ((paramAd.getNetworkAdType() != null) && (paramAd.getNetworkAdType().equalsIgnoreCase("VMAP")) && (((HashMap)localObject).containsKey("daisy_chaining"))) {
      ((HashMap)localObject).remove("daisy_chaining");
    }
    localAsset.setAuditudeParams((HashMap)localObject);
    int i = parser.next();
    paramAd = parser.getName();
    if (i == 2) {
      if ("mediaFile".equalsIgnoreCase(paramAd))
      {
        localObject = parseMediaFile(localAsset);
        if (localObject != null)
        {
          localAsset.setCreativeType(mimeType);
          if (!"text/html".equals(mimeType)) {
            break label241;
          }
          paramAd = "iframe";
          localAsset.setResourceType(paramAd);
          localAsset.AddMediaFile((MediaFile)localObject);
        }
      }
    }
    label241:
    while ((i != 3) || (!"asset".equalsIgnoreCase(paramAd))) {
      for (;;)
      {
        i = parser.next();
        break;
        paramAd = "static";
        continue;
        if ("click".equalsIgnoreCase(paramAd)) {
          parseClick(localAsset);
        } else if ("tracking".equalsIgnoreCase(paramAd)) {
          parseTracking(localAsset);
        } else if ("submission".equalsIgnoreCase(paramAd)) {
          parseSubmission(localAsset);
        }
      }
    }
    if ("linear".equals(localAsset.getType()))
    {
      paramAd = localAsset.getTrackingEventByType("creativeprogress");
      if ((paramAd != null) && (paramAd.getTrackingUrls() != null) && (paramAd.getTrackingUrls().size() > 0))
      {
        paramAd = (TrackingUrl)paramAd.getTrackingUrls().get(0);
        if (paramAd != null)
        {
          localAsset.addTrackingUrlForType(new Submission(paramAd.getUrl(), "start"), "start");
          localAsset.addTrackingUrlForType(new Submission(paramAd.getUrl(), "firstquartile"), "firstquartile");
          localAsset.addTrackingUrlForType(new Submission(paramAd.getUrl(), "midpoint"), "midpoint");
          localAsset.addTrackingUrlForType(new Submission(paramAd.getUrl(), "thirdquartile"), "thirdquartile");
          localAsset.addTrackingUrlForType(new Submission(paramAd.getUrl(), "complete"), "complete");
        }
      }
    }
    if (((localAsset instanceof OnPageAsset)) && (localAsset.getClick() != null)) {
      ((Click)localAsset.getClick()).setShouldAppendParState(true);
    }
    return localAsset;
  }
  
  private void parseClick(Asset paramAsset)
    throws XmlPullParserException, IOException
  {
    Click localClick2 = (Click)paramAsset.getClick();
    Click localClick1 = localClick2;
    if (localClick2 == null)
    {
      localClick1 = new Click(paramAsset);
      paramAsset.setClick(localClick1);
    }
    localClick1.setUrl(XMLUtil.attributeAsStringOrDefault(parser, "href", null));
    localClick1.setTitle(XMLUtil.attributeAsStringOrDefault(parser, "title", null));
    localClick1.setID(XMLUtil.attributeAsStringOrDefault(parser, "id", null));
    if (paramAsset.isNetworkAd()) {
      localClick1.addTrackingUrlForType(new TrackingUrl(localClick1.getUrl(), "click"), "click");
    }
    int i;
    do
    {
      for (;;)
      {
        i = parser.nextTag();
        paramAsset = parser.getName();
        if (i != 2) {
          break;
        }
        if ("submission".equals(paramAsset)) {
          parseSubmission(localClick1);
        }
      }
    } while ((i != 3) || (!"click".equals(paramAsset)));
  }
  
  private MediaFile parseMediaFile(Asset paramAsset)
    throws XmlPullParserException, IOException
  {
    paramAsset = new MediaFile();
    source = XMLUtil.attributeAsStringOrDefault(parser, "src", null);
    width = XMLUtil.attributeAsIntOrDefault(parser, "width", 0);
    height = XMLUtil.attributeAsIntOrDefault(parser, "height", 0);
    mimeType = XMLUtil.attributeAsStringOrDefault(parser, "type", null);
    return paramAsset;
  }
  
  private Par parsePar()
    throws XmlPullParserException, IOException
  {
    Par localPar = new Par();
    int i = parser.next();
    Object localObject = parser.getName();
    if (i == 2) {
      if ("meta".equalsIgnoreCase((String)localObject)) {
        if (XMLUtil.attributeAsStringOrDefault(parser, "name", "").equals("priority")) {
          localPar.setPriority(XMLUtil.attributeAsIntOrDefault(parser, "content", 0));
        }
      }
    }
    while ((i != 3) || (!"par".equalsIgnoreCase((String)localObject))) {
      for (;;)
      {
        i = parser.next();
        break;
        if ("setvalue".equalsIgnoreCase((String)localObject))
        {
          localObject = XMLUtil.attributeAsStringOrDefault(parser, "ref", null);
          if (!StringUtil.isNullOrEmpty((String)localObject)) {
            localPar.addState((String)localObject, XMLUtil.attributeAsStringOrDefault(parser, "value", ""));
          }
        }
        else if ("ref".equalsIgnoreCase((String)localObject))
        {
          localObject = parseRef(localPar);
          if (localObject != null) {
            localPar.addRef((Ref)localObject);
          }
        }
      }
    }
    return localPar;
  }
  
  private Ref parseRef(Par paramPar)
    throws XmlPullParserException, IOException
  {
    Ref localRef = new Ref(paramPar);
    paramPar = parser.getAttributeValue(null, "src");
    if ((!StringUtil.isNullOrEmpty(paramPar)) && (paramPar.indexOf("urn:ad:") == 0))
    {
      paramPar = paramPar.substring(new String("urn:ad:").length());
      if (paramPar.indexOf("#") <= 0) {
        break label112;
      }
      String str = paramPar.substring(0, paramPar.indexOf("#"));
      localRef.setID(paramPar.substring(paramPar.indexOf("#") + 1));
      paramPar = str;
    }
    label112:
    for (;;)
    {
      refs.put(localRef, paramPar);
      return localRef;
    }
  }
  
  private void parseSMIL()
    throws XmlPullParserException, IOException
  {
    Object localObject1 = null;
    int i = -1;
    int n = 2;
    int k = 0;
    int j = 0;
    Object localObject2 = parser.getName();
    if (n == 2) {
      if ("head".equalsIgnoreCase((String)localObject2)) {
        parseSMILSubmissions(submissions);
      }
    }
    for (;;)
    {
      n = parser.next();
      break;
      if ("seq".equalsIgnoreCase((String)localObject2))
      {
        int m = i + 1;
        Sequence localSequence = parseSequence();
        i = m;
        if (localSequence == null) {
          break;
        }
        if (localObject1 != null)
        {
          localObject2 = localObject1;
          i = j;
          if (((Group)localObject1).getType() == localSequence.getType()) {}
        }
        else
        {
          if ((m == 0) && (!localSequence.isLinear()))
          {
            localObject1 = new Group(SmilElementType.LINEAR, j, adResponse.getAdSettings());
            ((Group)localObject1).setStartTime(0);
            breaks.add(localObject1);
          }
          localObject2 = new Group(localSequence.getType(), j, adResponse.getAdSettings());
          if (!((Group)localObject2).isLinear()) {
            break label256;
          }
          ((Group)localObject2).setStartTime(k);
          breaks.add(localObject2);
          i = j;
        }
        for (;;)
        {
          j = k;
          if (!localSequence.isLinear()) {
            j = k + localSequence.getDuration();
          }
          ((Group)localObject2).addSequence(localSequence);
          n = i;
          localObject1 = localObject2;
          i = m;
          k = j;
          j = n;
          break;
          label256:
          i = j + 1;
          ((Group)localObject2).setStartTime(k);
          chapters.add(localObject2);
        }
        if ((n == 3) && ("smil".equalsIgnoreCase((String)localObject2))) {
          return;
        }
      }
    }
  }
  
  private void parseSMILData(BaseElement paramBaseElement)
    throws XmlPullParserException, IOException
  {
    HashMap localHashMap = new HashMap();
    paramBaseElement.setState(localHashMap);
    int i = parser.next();
    String str = parser.getName();
    if (i == 2) {
      localHashMap.put(str, parser.nextText());
    }
    while ((i != 3) || (!"data".equalsIgnoreCase(str)))
    {
      i = parser.next();
      break;
    }
    paramBaseElement.setState(localHashMap);
  }
  
  private void parseSMILSubmissions(BaseElement paramBaseElement)
    throws XmlPullParserException, IOException
  {
    int i = parser.next();
    String str = parser.getName();
    if (i == 2) {
      if ("data".equalsIgnoreCase(str)) {
        parseSMILData(paramBaseElement);
      }
    }
    while ((i != 3) || (!"head".equalsIgnoreCase(str))) {
      for (;;)
      {
        i = parser.next();
        break;
        if ("submission".equalsIgnoreCase(str)) {
          parseSubmission(paramBaseElement);
        }
      }
    }
  }
  
  private Sequence parseSequence()
    throws XmlPullParserException, IOException
  {
    Sequence localSequence = new Sequence(null, SmilElementType.LINEAR);
    int i = parser.next();
    Object localObject = parser.getName();
    if (i == 2) {
      if ("meta".equalsIgnoreCase((String)localObject))
      {
        localObject = XMLUtil.attributeAsStringOrDefault(parser, "name", "");
        if (((String)localObject).equals("dur")) {
          localSequence.setDuration(XMLUtil.attributeAsIntOrDefault(parser, "content", 0) * 1000);
        }
      }
    }
    label279:
    while ((i != 3) || (!"seq".equalsIgnoreCase((String)localObject))) {
      for (;;)
      {
        i = parser.next();
        break;
        if (((String)localObject).equals("max-dur"))
        {
          localSequence.setMaxDuration(XMLUtil.attributeAsIntOrDefault(parser, "content", 0) * 1000);
        }
        else if (((String)localObject).equals("count"))
        {
          localSequence.setCount(XMLUtil.attributeAsIntOrDefault(parser, "content", 0));
        }
        else if (((String)localObject).equals("max-count"))
        {
          localSequence.setMaxCount(XMLUtil.attributeAsIntOrDefault(parser, "content", 0));
        }
        else if (((String)localObject).equals("creativemaxdur"))
        {
          localSequence.setCreativeMaxDuration(XMLUtil.attributeAsIntOrDefault(parser, "content", 0) * 1000);
        }
        else if (((String)localObject).equals("ctype"))
        {
          if (XMLUtil.attributeAsStringOrDefault(parser, "content", "").equals("linear")) {}
          for (localObject = SmilElementType.LINEAR;; localObject = SmilElementType.NON_LINEAR)
          {
            if (localObject == localSequence.getType()) {
              break label279;
            }
            localSequence.setType((SmilElementType)localObject);
            break;
          }
          continue;
          if ("setvalue".equalsIgnoreCase((String)localObject))
          {
            localObject = XMLUtil.attributeAsStringOrDefault(parser, "ref", null);
            if (!StringUtil.isNullOrEmpty((String)localObject)) {
              localSequence.addState((String)localObject, XMLUtil.attributeAsStringOrDefault(parser, "value", ""));
            }
          }
          else if ("par".equalsIgnoreCase((String)localObject))
          {
            localObject = parsePar();
            if (localObject != null) {
              localSequence.addPar((Par)localObject);
            }
          }
          else if ("send".equalsIgnoreCase((String)localObject))
          {
            localObject = XMLUtil.attributeAsStringOrDefault(parser, "submission", null);
            if (StringUtil.isNotNullOrEmpty((String)localObject)) {
              localSequence.setSubmissionId((String)localObject);
            }
          }
        }
      }
    }
    return localSequence;
  }
  
  private void parseSubmission(BaseElement paramBaseElement)
  {
    paramBaseElement.addTrackingUrlForType(new Submission(parser.getAttributeValue(null, "action"), parser.getAttributeValue(null, "id")), parser.getAttributeValue(null, "id"));
  }
  
  private void parseTracking(Asset paramAsset)
  {
    String str = XMLUtil.attributeAsStringOrDefault(parser, "action", null);
    Object localObject = XMLUtil.attributeAsStringOrDefault(parser, "actuate", null);
    if ((StringUtil.isNullOrEmpty((String)localObject)) && (!StringUtil.isNullOrEmpty(str))) {
      paramAsset.addTrackingUrlForType(new TrackingUrl(str, "creativeview"), "creativeview");
    }
    do
    {
      return;
      if (((String)localObject).equals("click"))
      {
        Click localClick = (Click)paramAsset.getClick();
        localObject = localClick;
        if (localClick == null)
        {
          localObject = new Click(paramAsset);
          paramAsset.setClick((IClick)localObject);
        }
        ((Click)localObject).addTrackingUrlForType(new TrackingUrl(str, "click"), "click");
        return;
      }
    } while (((String)localObject).indexOf("%") <= 0);
    switch (Integer.parseInt(((String)localObject).substring(0, ((String)localObject).length() - 1)))
    {
    default: 
      return;
    case 0: 
      paramAsset.addTrackingUrlForType(new TrackingUrl(str, "start"), "start");
      return;
    case 25: 
      paramAsset.addTrackingUrlForType(new TrackingUrl(str, "firstquartile"), "firstquartile");
      return;
    case 50: 
      paramAsset.addTrackingUrlForType(new TrackingUrl(str, "midpoint"), "midpoint");
      return;
    case 75: 
      paramAsset.addTrackingUrlForType(new TrackingUrl(str, "thirdquartile"), "thirdquartile");
      return;
    }
    paramAsset.addTrackingUrlForType(new TrackingUrl(str, "complete"), "complete");
  }
  
  private Boolean parseXML(String paramString)
    throws XmlPullParserException, IOException
  {
    if (StringUtil.isNullOrEmpty(paramString))
    {
      NotifyError("Adserver response is empty");
      return Boolean.valueOf(true);
    }
    parser = XmlPullParserFactory.newInstance().newPullParser();
    parser.setInput(new StringReader(paramString));
    int i = parser.getEventType();
    paramString = Boolean.valueOf(false);
    if (i == 1)
    {
      if (paramString.booleanValue())
      {
        applyAdsOnRefs();
        return Boolean.valueOf(true);
      }
    }
    else
    {
      Object localObject;
      switch (i)
      {
      default: 
        localObject = paramString;
      }
      for (;;)
      {
        i = parser.next();
        paramString = (String)localObject;
        break;
        String str = parser.getName();
        if (str.equalsIgnoreCase("response"))
        {
          localObject = Boolean.valueOf(true);
        }
        else
        {
          if (str.equalsIgnoreCase("error"))
          {
            NotifyError(parser.nextText());
            return Boolean.valueOf(true);
          }
          if (str.equalsIgnoreCase("smil"))
          {
            parseSMIL();
            localObject = paramString;
          }
          else
          {
            localObject = paramString;
            if (str.equalsIgnoreCase("ad"))
            {
              parseAd();
              localObject = paramString;
            }
          }
        }
      }
    }
    return Boolean.valueOf(false);
  }
  
  public void cancel()
  {
    if (dataLoader != null) {
      dataLoader.cancel();
    }
  }
  
  public final void dispose()
  {
    Iterator localIterator = breaks.iterator();
    if (!localIterator.hasNext())
    {
      breaks = null;
      localIterator = chapters.iterator();
      label30:
      if (localIterator.hasNext()) {
        break label107;
      }
      chapters = null;
      localIterator = ads.entrySet().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        ads = null;
        if (dataLoader != null)
        {
          dataLoader.setDataLoaderListener(null);
          dataLoader = null;
        }
        return;
        ((Group)localIterator.next()).dispose();
        break;
        label107:
        ((Group)localIterator.next()).dispose();
        break label30;
      }
      ((Ad)((Map.Entry)localIterator.next()).getValue()).dispose();
    }
  }
  
  public void loadAdRequest(AdResponse paramAdResponse, AdRequest paramAdRequest, int paramInt)
  {
    adResponse = paramAdResponse;
    adRequest = paramAdRequest;
    timeout = paramInt;
    dataLoader = new DataLoader();
    dataLoader.setDataLoaderListener(this);
    dataLoader.load(adRequest.getAdRequestUrl(), adRequest.getKeyValueString(), timeout);
  }
  
  public void onRequestComplete(String paramString)
  {
    try
    {
      paramString = parseXML(paramString);
      adResponse.setBreaks(breaks);
      adResponse.setChapters(chapters);
      adResponse.setSubmissions(submissions);
      adResponse.setAds(ads);
      if (paramString.booleanValue())
      {
        listener.onRequestComplete(null);
        return;
      }
      listener.onRequestFailed(null);
      return;
    }
    catch (XmlPullParserException paramString)
    {
      paramString.printStackTrace();
      return;
    }
    catch (IOException paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    listener.onRequestFailed(paramThrowable);
  }
  
  public void setResponseParserListener(IResponseParser.ResponseParserListener paramResponseParserListener)
  {
    listener = paramResponseParserListener;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.AuditudeResponseParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */