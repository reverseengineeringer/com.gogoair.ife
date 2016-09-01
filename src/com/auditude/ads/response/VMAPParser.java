package com.auditude.ads.response;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.PlayerErrorEvent;
import com.auditude.ads.exception.AssetException;
import com.auditude.ads.loader.AdRequest;
import com.auditude.ads.loader.DataLoader;
import com.auditude.ads.loader.DataLoader.DataLoaderListener;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.model.smil.Par;
import com.auditude.ads.model.smil.Ref;
import com.auditude.ads.model.smil.Sequence;
import com.auditude.ads.model.smil.SmilElementType;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.network.vast.model.VASTDocument;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.EventDispatcher;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.xmlpull.v1.XmlPullParserException;

public class VMAPParser
  extends EventDispatcher
  implements DataLoader.DataLoaderListener, IResponseParser
{
  public static final String VMAP = "VMAP";
  private ArrayList adBreaks = new ArrayList();
  private AdRequest adRequest;
  private AdResponse adResponse;
  private ArrayList breaks = new ArrayList();
  private ArrayList chapters = new ArrayList();
  private DataLoader dataLoader;
  private IResponseParser.ResponseParserListener listener;
  private Boolean loadFailed = Boolean.valueOf(false);
  private int timeout;
  private Ad trackingAd;
  private VmapXmlParser xmlParser = new VmapXmlParser();
  
  private void appendSequenceState(ArrayList paramArrayList1, ArrayList paramArrayList2)
  {
    int i = 0;
    Group localGroup1;
    Group localGroup2;
    int j;
    for (;;)
    {
      if (i >= paramArrayList2.size()) {
        return;
      }
      localGroup1 = (Group)paramArrayList2.get(i);
      if (paramArrayList1.size() > i)
      {
        localGroup2 = (Group)paramArrayList1.get(i);
        j = 0;
        if (j < localGroup1.getSequenceList().size()) {
          break;
        }
      }
      i += 1;
    }
    Object localObject = (Sequence)localGroup1.getSequenceList().get(j);
    Sequence localSequence;
    Iterator localIterator;
    if (localGroup2.getSequenceList().size() > j)
    {
      localSequence = (Sequence)localGroup2.getSequenceList().get(j);
      localSequence.setSubmissionId(((Sequence)localObject).getSubmissionId());
      localObject = ((Sequence)localObject).getState();
      localIterator = ((HashMap)localObject).keySet().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        j += 1;
        break;
      }
      String str = (String)localIterator.next();
      localSequence.addState(str, (String)((HashMap)localObject).get(str));
    }
  }
  
  private String constructURL(String paramString)
  {
    Iterator localIterator = adResponse.getBreaks().iterator();
    String str2 = "";
    int i = 1;
    if (!localIterator.hasNext()) {
      if ((Integer)AuditudeEnv.getInstance().getAdSettings().getProperty("duration") == null) {
        break label310;
      }
    }
    label310:
    for (i = ((Integer)AuditudeEnv.getInstance().getAdSettings().getProperty("duration")).intValue();; i = -1)
    {
      if (i > 0) {}
      for (;;)
      {
        String str1 = String.valueOf(adRequest.getMediaId());
        return AuditudeUtil.substituteTags(AuditudeUtil.substituteCustomPublisherTags(paramString, AuditudeEnv.getInstance().getAdSettings().getPassThroughParams()).replaceAll("\\[vdur\\]", Integer.valueOf(i).toString()).replaceAll("\\[pvrn\\]", "[random]").replaceAll("\\[vprn\\]", "[random]").replaceAll("\\[vid\\]", str1).replaceAll("\\[slot\\]", str2));
        Group localGroup = (Group)localIterator.next();
        if ((localGroup.getStartTime() <= 0) || (localGroup.getStartTime() >= 10000000)) {
          break;
        }
        String str3 = "pod" + Integer.valueOf(i).toString();
        str1 = "midroll";
        if (localGroup.getStartTime() <= 0) {
          str1 = "preroll";
        }
        for (;;)
        {
          int j = localGroup.getStartTime() / 1000;
          str2 = str2 + "slid=" + str3 + "&slau=" + str1 + "&h=[height]&w=[width]&tpos=" + j + "&ptgt=a&cpsq=" + Integer.valueOf(i) + ";";
          i += 1;
          break;
          if (localGroup.getStartTime() >= 10000000) {
            str1 = "postroll";
          }
        }
        i = 1320;
      }
    }
  }
  
  private void createGroups()
  {
    int j = 0;
    Collections.sort(adBreaks, new sortOnStartTime());
    Object localObject2 = adBreaks.iterator();
    int m = 0;
    int i = 0;
    if (!((Iterator)localObject2).hasNext())
    {
      if (m < 100000)
      {
        localObject1 = new Group(SmilElementType.NON_LINEAR, i, adResponse.getAdSettings());
        ((Group)localObject1).setStartTime(m * 1000);
        localObject2 = new Sequence(null, SmilElementType.NON_LINEAR);
        ((Sequence)localObject2).setDuration(100000000);
        ((Group)localObject1).addSequence((Sequence)localObject2);
        chapters.add(localObject1);
      }
      return;
    }
    VMAPAdBreak localVMAPAdBreak = (VMAPAdBreak)((Iterator)localObject2).next();
    int k = j;
    if (j == 0)
    {
      k = j;
      if (localVMAPAdBreak.getStartTime() != 0)
      {
        localObject1 = new Group(SmilElementType.LINEAR, j, adResponse.getAdSettings());
        ((Group)localObject1).addSequence(new Sequence(null, SmilElementType.LINEAR));
        breaks.add(localObject1);
        k = j + 1;
      }
    }
    Object localObject1 = getBreakAt(localVMAPAdBreak.getStartTime() * 1000);
    if (localObject1 == null)
    {
      localObject1 = new Group(SmilElementType.LINEAR, k, adResponse.getAdSettings());
      ((Group)localObject1).setStartTime(localVMAPAdBreak.getStartTime() * 1000);
      breaks.add(localObject1);
    }
    for (j = k + 1;; j = k)
    {
      Sequence localSequence = new Sequence(null, SmilElementType.LINEAR);
      localSequence.setDuration(100000000);
      ((Group)localObject1).addSequence(localSequence);
      localObject1 = localVMAPAdBreak.getTrackingUrls().iterator();
      label302:
      if (!((Iterator)localObject1).hasNext())
      {
        localObject1 = localVMAPAdBreak.getVastDocuments().iterator();
        if (((Iterator)localObject1).hasNext()) {
          break label461;
        }
        if (localVMAPAdBreak.getStartTime() == m) {
          break label685;
        }
        localObject1 = new Group(SmilElementType.NON_LINEAR, i, adResponse.getAdSettings());
        ((Group)localObject1).setStartTime(m * 1000);
        localSequence = new Sequence(null, SmilElementType.NON_LINEAR);
        localSequence.setDuration((localVMAPAdBreak.getStartTime() - m) * 1000);
        ((Group)localObject1).addSequence(localSequence);
        chapters.add(localObject1);
        i += 1;
      }
      label461:
      label685:
      for (;;)
      {
        m = localVMAPAdBreak.getStartTime();
        break;
        Object localObject3 = (TrackingUrl)((Iterator)localObject1).next();
        localSequence.addTrackingUrlForType((TrackingUrl)localObject3, ((TrackingUrl)localObject3).getType());
        break label302;
        Object localObject4 = (VASTDocument)((Iterator)localObject1).next();
        localObject3 = new Ad(null);
        ((Ad)localObject3).setIsFromVmapDoc(Boolean.valueOf(true));
        ((Ad)localObject3).setDispatchError(Boolean.valueOf(false));
        ((Ad)localObject3).setIsNetworkAd(true);
        ((Ad)localObject3).setNetworkAdType("vast");
        ((Ad)localObject3).setFollowRedirects(localVMAPAdBreak.getFollowRedirects());
        ((Ad)localObject3).setAllowMultipleAds(localVMAPAdBreak.getAllowMultipleAds());
        if (trackingAd != null)
        {
          ((Ad)localObject3).setID(trackingAd.getID());
          ((Ad)localObject3).setRepackagingEnabled(trackingAd.isRepackagingEnabled());
          ((Ad)localObject3).addTrackingAsset(trackingAd.getTrackingAssetByType("linear"));
          ((Ad)localObject3).addTrackingAsset(trackingAd.getTrackingAssetByType("nonlinear"));
          ((Ad)localObject3).addTrackingAsset(trackingAd.getTrackingAssetByType("companion"));
        }
        if (adTagURI != null) {
          ((Ad)localObject3).setNetworkAdSource(adTagURI);
        }
        for (;;)
        {
          localObject4 = new Par(localSequence);
          Ref localRef = new Ref((Par)localObject4);
          ((Par)localObject4).addRef(localRef);
          localRef.setAd((Ad)localObject3);
          localSequence.addPar((Par)localObject4);
          break;
          ((Ad)localObject3).setNetworkAdSource(localObject4);
        }
      }
    }
  }
  
  private void createRepeatBreaks(VMAPAdBreak paramVMAPAdBreak, int paramInt)
  {
    int i = paramVMAPAdBreak.getStartTime();
    int j = paramVMAPAdBreak.getRepeatAfter();
    ArrayList localArrayList = new ArrayList();
    Object localObject = adBreaks.iterator();
    if (!((Iterator)localObject).hasNext()) {
      Collections.sort(localArrayList);
    }
    for (;;)
    {
      if (i + j > paramInt)
      {
        return;
        VMAPAdBreak localVMAPAdBreak = (VMAPAdBreak)((Iterator)localObject).next();
        if (localVMAPAdBreak.getStartTime() <= i) {
          break;
        }
        localArrayList.add(Integer.valueOf(localVMAPAdBreak.getStartTime()));
        break;
      }
      i += j;
      if ((localArrayList.size() <= 0) || (((Integer)localArrayList.get(0)).intValue() >= i))
      {
        localObject = paramVMAPAdBreak.getCopy(i);
        adBreaks.add(localObject);
      }
      while ((localArrayList.size() <= 0) || (((Integer)localArrayList.get(0)).intValue() <= i)) {
        localArrayList.remove(0);
      }
    }
  }
  
  private VMAPAdBreak getAdBreakAt(int paramInt)
  {
    VMAPAdBreak localVMAPAdBreak = new VMAPAdBreak(paramInt);
    adBreaks.add(localVMAPAdBreak);
    return localVMAPAdBreak;
  }
  
  private AssetException getAssetException(int paramInt, String paramString)
  {
    paramString = new AssetException(paramInt, paramString);
    if (trackingAd != null) {
      adId = trackingAd.getID();
    }
    return paramString;
  }
  
  private Group getBreakAt(int paramInt)
  {
    Iterator localIterator = breaks.iterator();
    Group localGroup;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localGroup = (Group)localIterator.next();
    } while (localGroup.getStartTime() != paramInt);
    return localGroup;
  }
  
  private int getTimeOffset(String paramString)
  {
    if ((paramString == null) || (paramString.length() <= 0)) {
      return -1;
    }
    if ((Integer)AuditudeEnv.getInstance().getAdSettings().getProperty("duration") != null) {}
    for (int i = ((Integer)AuditudeEnv.getInstance().getAdSettings().getProperty("duration")).intValue();; i = -1)
    {
      if (paramString.equalsIgnoreCase("start")) {
        return 0;
      }
      if (paramString.equalsIgnoreCase("end")) {
        return 100000;
      }
      if (paramString.matches("(^[-.0-9]+:[-.0-9]+:[-.0-9]+$)")) {
        return StringUtil.parseDuration(paramString);
      }
      if ((!paramString.contains("%")) || (i <= 0)) {
        break;
      }
      int j = StringUtil.convertToInt(paramString.replaceAll("%", ""));
      if (j >= 100) {
        return 100000;
      }
      return (int)(i * j / 100.0F) / 1000;
    }
  }
  
  public static Boolean isValidParserForResponse(AdResponse paramAdResponse)
  {
    if (paramAdResponse != null)
    {
      paramAdResponse = paramAdResponse.getAds();
      if ((paramAdResponse != null) && (paramAdResponse.size() > 0)) {
        paramAdResponse = paramAdResponse.entrySet().iterator();
      }
    }
    Ad localAd;
    do
    {
      if (!paramAdResponse.hasNext()) {
        return Boolean.valueOf(false);
      }
      localAd = (Ad)((Map.Entry)paramAdResponse.next()).getValue();
    } while ((!localAd.getIsNetworkAd()) || (!localAd.getNetworkAdType().equalsIgnoreCase("VMAP")));
    return Boolean.valueOf(true);
  }
  
  private void loadVMAP(String paramString)
  {
    if (paramString != null)
    {
      dataLoader = new DataLoader();
      dataLoader.setDataLoaderListener(this);
      paramString = constructURL(paramString);
      dataLoader.load(paramString, null, timeout);
      return;
    }
    adResponse.setBreaks(breaks);
    adResponse.setChapters(chapters);
    paramString = "VMAP load failed";
    if (trackingAd != null) {
      paramString = "VMAP load failed" + ": " + trackingAd.getNetworkAdSource();
    }
    listener.onRequestComplete(getAssetException(1109, paramString));
    logError(1109, paramString);
    loadFailed = Boolean.valueOf(true);
  }
  
  private void parseLinearBreak(VmapXmlNode paramVmapXmlNode)
  {
    int i = getTimeOffset(paramVmapXmlNode.getAttributeByName("timeOffset"));
    VMAPAdBreak localVMAPAdBreak;
    Object localObject1;
    Object localObject2;
    String str;
    if (i >= 0)
    {
      localVMAPAdBreak = getAdBreakAt(i);
      i = getTimeOffset(paramVmapXmlNode.getAttributeByName("repeatAfter"));
      if (i >= 0) {
        localVMAPAdBreak.setRepeatAfter(i);
      }
      localObject1 = paramVmapXmlNode.getChildeNodesByName("AdSource");
      if ((localObject1 != null) && (((ArrayList)localObject1).size() > 0))
      {
        localObject2 = (VmapXmlNode)((ArrayList)localObject1).get(0);
        localObject1 = ((VmapXmlNode)localObject2).getAttributeByName("allowMultipleAds");
        str = ((VmapXmlNode)localObject2).getAttributeByName("followRedirects");
        localObject2 = ((VmapXmlNode)localObject2).getChildNodes();
        if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
        {
          localObject2 = ((ArrayList)localObject2).iterator();
          if (((Iterator)localObject2).hasNext()) {
            break label193;
          }
        }
      }
      paramVmapXmlNode = paramVmapXmlNode.getChildeNodesByName("TrackingEvents");
      if ((paramVmapXmlNode != null) && (paramVmapXmlNode.size() > 0))
      {
        paramVmapXmlNode = ((VmapXmlNode)paramVmapXmlNode.get(0)).getChildeNodesByName("Tracking");
        if ((paramVmapXmlNode != null) && (paramVmapXmlNode.size() > 0)) {
          paramVmapXmlNode = paramVmapXmlNode.iterator();
        }
      }
    }
    for (;;)
    {
      if (!paramVmapXmlNode.hasNext())
      {
        return;
        label193:
        Object localObject3 = (VmapXmlNode)((Iterator)localObject2).next();
        VASTDocument localVASTDocument;
        if (((VmapXmlNode)localObject3).getName().equalsIgnoreCase("AdTagURI"))
        {
          localVMAPAdBreak.setAllowMultipleAds((String)localObject1);
          localVMAPAdBreak.setFollowRedirects(str);
          localVASTDocument = new VASTDocument(null);
          adTagURI = ((VmapXmlNode)localObject3).getValue();
          localVMAPAdBreak.addVastDocument(localVASTDocument);
        }
        if (!((VmapXmlNode)localObject3).getName().equalsIgnoreCase("VASTAdData")) {
          break;
        }
        localObject3 = ((VmapXmlNode)localObject3).getVastDocuments().iterator();
        while (((Iterator)localObject3).hasNext())
        {
          localVASTDocument = (VASTDocument)((Iterator)localObject3).next();
          if (localVASTDocument != null)
          {
            localVMAPAdBreak.setAllowMultipleAds((String)localObject1);
            localVMAPAdBreak.setFollowRedirects(str);
            localVMAPAdBreak.addVastDocument(localVASTDocument);
          }
        }
        break;
      }
      localObject1 = (VmapXmlNode)paramVmapXmlNode.next();
      localVMAPAdBreak.addTrackingUrl(((VmapXmlNode)localObject1).getAttributeByName("event"), ((VmapXmlNode)localObject1).getValue());
    }
  }
  
  private void parseXML(String paramString)
    throws XmlPullParserException, IOException
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      xmlParser.parseXML(paramString);
      paramString = xmlParser.getChildeNodesByName("AdBreak");
      if (paramString != null)
      {
        paramString = paramString.iterator();
        if (paramString.hasNext()) {
          break label173;
        }
      }
    }
    int i = -1;
    if ((Integer)AuditudeEnv.getInstance().getAdSettings().getProperty("duration") != null) {
      i = ((Integer)AuditudeEnv.getInstance().getAdSettings().getProperty("duration")).intValue();
    }
    Object localObject;
    if (i > 0)
    {
      paramString = new ArrayList();
      localObject = adBreaks.iterator();
      label105:
      if (((Iterator)localObject).hasNext()) {
        break label215;
      }
      paramString = paramString.iterator();
    }
    for (;;)
    {
      if (!paramString.hasNext())
      {
        if (adBreaks.size() > 0)
        {
          createGroups();
          appendSequenceState(breaks, adResponse.getBreaks());
          appendSequenceState(chapters, adResponse.getChapters());
        }
        return;
        label173:
        localObject = (VmapXmlNode)paramString.next();
        if (!localObject.getAttributeByName("breakType").split(",")[0].equalsIgnoreCase("linear")) {
          break;
        }
        parseLinearBreak((VmapXmlNode)localObject);
        break;
        label215:
        VMAPAdBreak localVMAPAdBreak = (VMAPAdBreak)((Iterator)localObject).next();
        if (localVMAPAdBreak.getRepeatAfter() <= 0) {
          break label105;
        }
        paramString.add(localVMAPAdBreak);
        break label105;
      }
      createRepeatBreaks((VMAPAdBreak)paramString.next(), i / 1000);
    }
  }
  
  public void cancel()
  {
    if (dataLoader != null) {
      dataLoader.cancel();
    }
  }
  
  public void loadAdRequest(AdResponse paramAdResponse, AdRequest paramAdRequest, int paramInt)
  {
    adResponse = paramAdResponse;
    adRequest = paramAdRequest;
    timeout = paramInt;
    if (adResponse != null)
    {
      paramAdResponse = adResponse.getAds();
      if ((paramAdResponse != null) && (paramAdResponse.size() > 0))
      {
        paramAdResponse = paramAdResponse.entrySet().iterator();
        if (paramAdResponse.hasNext()) {
          break label71;
        }
      }
    }
    listener.onRequestComplete(null);
    label71:
    do
    {
      return;
      paramAdRequest = (Ad)((Map.Entry)paramAdResponse.next()).getValue();
      if ((!paramAdRequest.getIsNetworkAd()) || (!paramAdRequest.getNetworkAdType().equalsIgnoreCase("VMAP"))) {
        break;
      }
      trackingAd = paramAdRequest;
    } while (!(paramAdRequest.getNetworkAdSource() instanceof String));
    loadVMAP((String)paramAdRequest.getNetworkAdSource());
  }
  
  protected final void logError(int paramInt, String paramString)
  {
    paramString = getAssetException(paramInt, paramString);
    AuditudeEnv.getInstance().getAPI().dispatchEvent("playerError", new PlayerErrorEvent(this, paramString));
  }
  
  public void onRequestComplete(String paramString)
  {
    try
    {
      parseXML(paramString);
      adResponse.setBreaks(breaks);
      adResponse.setChapters(chapters);
      paramString = "VMAP returned no ads";
      if (trackingAd != null) {
        paramString = "VMAP returned no ads" + ": " + trackingAd.getNetworkAdSource();
      }
      if (listener != null) {
        listener.onRequestComplete(getAssetException(1108, paramString));
      }
      if ((!loadFailed.booleanValue()) && (breaks.size() <= 0)) {
        logError(1108, paramString);
      }
      return;
    }
    catch (XmlPullParserException paramString)
    {
      do
      {
        paramString.printStackTrace();
        logError(1103, "");
      } while (listener == null);
      listener.onRequestComplete(null);
      return;
    }
    catch (IOException paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    adResponse.setBreaks(breaks);
    adResponse.setChapters(chapters);
    if ((paramThrowable instanceof SocketTimeoutException))
    {
      listener.onRequestComplete(null);
      logError(1112, "");
    }
    for (;;)
    {
      loadFailed = Boolean.valueOf(true);
      return;
      paramThrowable = "VMAP load failed";
      if (trackingAd != null) {
        paramThrowable = "VMAP load failed" + ": " + trackingAd.getNetworkAdSource();
      }
      listener.onRequestComplete(getAssetException(1109, paramThrowable));
      logError(1109, paramThrowable);
    }
  }
  
  public void setResponseParserListener(IResponseParser.ResponseParserListener paramResponseParserListener)
  {
    listener = paramResponseParserListener;
  }
  
  public class sortOnStartTime
    implements Comparator
  {
    public sortOnStartTime() {}
    
    public int compare(VMAPAdBreak paramVMAPAdBreak1, VMAPAdBreak paramVMAPAdBreak2)
    {
      return paramVMAPAdBreak1.getStartTime() - paramVMAPAdBreak2.getStartTime();
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.VMAPParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */