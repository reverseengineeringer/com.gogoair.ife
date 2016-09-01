package com.auditude.ads.network.vast.loader;

import com.auditude.ads.network.vast.model.VASTAd;
import com.auditude.ads.network.vast.model.VASTClick;
import com.auditude.ads.network.vast.model.VASTDocument;
import com.auditude.ads.network.vast.model.VASTInlineAd;
import com.auditude.ads.network.vast.model.VASTLinearCreative;
import com.auditude.ads.network.vast.model.VASTTrackingEvent;
import com.auditude.ads.network.vast.model.VASTTrackingUrl;
import com.auditude.ads.network.vast.model.VASTWrapperAd;
import com.auditude.ads.network.vast.repackaging.VastAssetRepackager.VastAssetRepackagingCompletionListener;
import com.auditude.ads.network.vast.repackaging.VastAssetRepackagerInfo;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.PingUtil;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.EventDispatcher;
import com.auditude.ads.util.event.IEventListener;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParserException;

public class VASTDocumentProcessor
  extends EventDispatcher
  implements VastAssetRepackager.VastAssetRepackagingCompletionListener, IEventListener
{
  public static final String PROCESS_COMPLETE = "processComplete";
  public static final String PROCESS_FAILED = "processFailed";
  private VASTDocument document;
  private Throwable error;
  private Boolean fallbackOnInvalidCreative = Boolean.valueOf(false);
  private int maxNumWrapperRedirects = 6;
  private ArrayList mimeTypes = null;
  private int numLoadsToComplete = 0;
  private int repackagingCount = 0;
  VastAssetRepackagerInfo vastAssetRepackagerInfo = null;
  private VASTDocument wrapperDocument;
  
  public VASTDocumentProcessor(int paramInt, ArrayList paramArrayList, VastAssetRepackagerInfo paramVastAssetRepackagerInfo, Boolean paramBoolean)
  {
    maxNumWrapperRedirects = paramInt;
    mimeTypes = paramArrayList;
    vastAssetRepackagerInfo = paramVastAssetRepackagerInfo;
    fallbackOnInvalidCreative = paramBoolean;
  }
  
  private void checkCompletion(VASTDocument paramVASTDocument)
  {
    numLoadsToComplete -= 1;
    if (numLoadsToComplete <= 0) {
      repackageIncompatibleCreatives();
    }
  }
  
  private Boolean checkForFallbackAds()
  {
    if (vastAssetRepackagerInfo.repackaginEnabled.booleanValue())
    {
      mimeTypes = new ArrayList();
      mimeTypes.add(vastAssetRepackagerInfo.requiredFormat);
    }
    Boolean localBoolean = Boolean.valueOf(true);
    Object localObject1 = localBoolean;
    if (wrapperDocument != null)
    {
      localObject1 = localBoolean;
      if (wrapperDocument.getAds() != null)
      {
        localObject1 = localBoolean;
        if (wrapperDocument.getAds().size() > 0) {
          localObject1 = wrapperDocument.getAds().iterator();
        }
      }
    }
    label139:
    VASTAd localVASTAd2;
    do
    {
      VASTAd localVASTAd1;
      boolean bool;
      Object localObject2;
      do
      {
        if (!((Iterator)localObject1).hasNext())
        {
          localObject1 = localBoolean;
          return (Boolean)localObject1;
        }
        localVASTAd1 = (VASTAd)((Iterator)localObject1).next();
        if ((mimeTypes == null) || (localVASTAd1.hasAssetsWithMimeType(mimeTypes).booleanValue())) {
          break;
        }
        bool = false;
        localObject2 = Boolean.valueOf(bool);
      } while ((!localVASTAd1.getFallbackOnNoAd().booleanValue()) || ((((Boolean)localObject2).booleanValue()) && (localVASTAd1.getInlineAds() != null) && (localVASTAd1.getInlineAds().size() > 0)));
      localVASTAd2 = localVASTAd1.getDocument().getNextUnusedAd();
      if ((localVASTAd2 != null) && ((localVASTAd2.hasAssetsWithMimeType(mimeTypes).booleanValue()) || (localVASTAd2.getWrapperAd() != null) || (localVASTAd1.getFallbackOnInvalidCreative().booleanValue())))
      {
        if ((localVASTAd1.getInlineAds() != null) && (localVASTAd1.getInlineAds().size() > 0) && (!((Boolean)localObject2).booleanValue())) {
          localObject2 = localVASTAd1.getInlineAds().iterator();
        }
        for (;;)
        {
          if (!((Iterator)localObject2).hasNext())
          {
            wrapperDocument.replaceAd(localVASTAd1, localVASTAd2);
            if (!shouldLoadVASTWrapper(localVASTAd2).booleanValue()) {
              break;
            }
            loadVASTWrapper(localVASTAd2);
            numLoadsToComplete = getNumVASTWrappers(localVASTAd2.getDocument());
            localBoolean = Boolean.valueOf(false);
            break;
            bool = true;
            break label139;
          }
          logVastError((VASTInlineAd)((Iterator)localObject2).next(), 403);
        }
      }
    } while (localVASTAd2 == null);
    return checkForFallbackAds();
  }
  
  private int getNumVASTWrappers(VASTDocument paramVASTDocument)
  {
    int j = 0;
    paramVASTDocument = paramVASTDocument.getAds();
    int i = j;
    if (paramVASTDocument != null)
    {
      i = j;
      if (paramVASTDocument.size() > 0)
      {
        paramVASTDocument = paramVASTDocument.iterator();
        i = 0;
      }
    }
    for (;;)
    {
      if (!paramVASTDocument.hasNext()) {
        return i;
      }
      if (shouldLoadVASTWrapper((VASTAd)paramVASTDocument.next()).booleanValue()) {
        i += 1;
      }
    }
  }
  
  private void loadVASTWrapper(VASTAd paramVASTAd)
  {
    VASTXMLLoader localVASTXMLLoader = new VASTXMLLoader(Math.max(-1, maxNumWrapperRedirects - 1), mimeTypes, vastAssetRepackagerInfo, fallbackOnInvalidCreative);
    State = paramVASTAd;
    localVASTXMLLoader.addEventListener("complete", this);
    localVASTXMLLoader.addEventListener("failed", this);
    localVASTXMLLoader.init(getWrapperAdsource);
  }
  
  private void loadVASTWrappers(VASTDocument paramVASTDocument)
  {
    numLoadsToComplete = getNumVASTWrappers(paramVASTDocument);
    paramVASTDocument = paramVASTDocument.getAds();
    if ((paramVASTDocument != null) && (paramVASTDocument.size() > 0)) {
      paramVASTDocument = paramVASTDocument.iterator();
    }
    for (;;)
    {
      if (!paramVASTDocument.hasNext()) {
        return;
      }
      VASTAd localVASTAd = (VASTAd)paramVASTDocument.next();
      if ((localVASTAd != null) && (localVASTAd.getWrapperAd() != null)) {
        loadVASTWrapper(localVASTAd);
      }
    }
  }
  
  private void logVastError(VASTInlineAd paramVASTInlineAd, int paramInt)
  {
    if ((paramVASTInlineAd != null) && (errorUrl != null) && (errorUrl.length() > 0)) {
      PingUtil.pingUrl(AuditudeUtil.substituteTags(errorUrl.replaceAll("\\[ERRORCODE\\]", String.valueOf(paramInt)).replaceAll("%5BERRORCODE%5D", String.valueOf(paramInt))));
    }
  }
  
  private void mergeAd(VASTInlineAd paramVASTInlineAd, VASTWrapperAd paramVASTWrapperAd)
  {
    if (paramVASTWrapperAd == null) {
      return;
    }
    Iterator localIterator;
    if (paramVASTWrapperAd.getImpressionUrls() != null)
    {
      localIterator = paramVASTWrapperAd.getImpressionUrls().iterator();
      label20:
      if (localIterator.hasNext()) {}
    }
    else if ((linearAd != null) && (linearAd.getTrackingEvents() != null) && (linearAd != null))
    {
      localIterator = linearAd.getTrackingEvents().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        if ((linearAd == null) || (linearAd.click == null) || (linearAd == null)) {
          break;
        }
        paramVASTWrapperAd = linearAd.click;
        paramVASTInlineAd = linearAd.click;
        paramVASTWrapperAd = paramVASTWrapperAd.getTrackingUrls();
        if ((paramVASTWrapperAd == null) || (paramVASTInlineAd == null)) {
          break;
        }
        paramVASTWrapperAd = paramVASTWrapperAd.iterator();
        while (paramVASTWrapperAd.hasNext()) {
          paramVASTInlineAd.addClickTrackingUrl((String)paramVASTWrapperAd.next());
        }
        break;
        paramVASTInlineAd.addImpressionUrl((VASTTrackingUrl)localIterator.next());
        break label20;
      }
      VASTTrackingEvent localVASTTrackingEvent = (VASTTrackingEvent)localIterator.next();
      linearAd.addTrackingEvent(localVASTTrackingEvent);
    }
  }
  
  private void mergeAds(VASTAd paramVASTAd, VASTDocument paramVASTDocument)
  {
    if (paramVASTDocument == null) {
      return;
    }
    if ((paramVASTAd != null) && (paramVASTAd.getDocument() != null)) {
      getDocumentreachedMaxWrapper = reachedMaxWrapper;
    }
    if ((paramVASTDocument.getAds() != null) && (paramVASTDocument.getAds().size() > 0)) {
      paramVASTDocument = paramVASTDocument.getAds().iterator();
    }
    for (;;)
    {
      if (!paramVASTDocument.hasNext())
      {
        paramVASTAd.setWrapperAd(null);
        return;
      }
      Object localObject = (VASTAd)paramVASTDocument.next();
      if ((localObject != null) && (((VASTAd)localObject).getInlineAds() != null))
      {
        localObject = ((VASTAd)localObject).getInlineAds().iterator();
        while (((Iterator)localObject).hasNext())
        {
          VASTInlineAd localVASTInlineAd = (VASTInlineAd)((Iterator)localObject).next();
          mergeAd(localVASTInlineAd, paramVASTAd.getWrapperAd());
          paramVASTAd.addInlineAds(localVASTInlineAd);
        }
      }
    }
  }
  
  private void onWrapperLoadComplete(Object paramObject)
  {
    Object localObject = null;
    VASTXMLLoader localVASTXMLLoader;
    VASTAd localVASTAd;
    if ((paramObject instanceof VASTXMLLoader))
    {
      localVASTXMLLoader = (VASTXMLLoader)paramObject;
      localVASTXMLLoader.removeEventListener("complete", this);
      localVASTXMLLoader.removeEventListener("failed", this);
      localVASTAd = (VASTAd)State;
      if (localVASTAd == null) {
        break label134;
      }
    }
    label134:
    for (paramObject = localVASTAd.getWrapperAd();; paramObject = null)
    {
      if ((State instanceof VASTAd)) {
        localObject = State;
      }
      mergeAds((VASTAd)localObject, localVASTXMLLoader.getDocument());
      if ((State != null) && ((State instanceof VASTAd)) && ((localVASTAd.getInlineAds() == null) || (localVASTAd.getInlineAds().size() == 0))) {
        logVastError((VASTInlineAd)paramObject, 303);
      }
      checkCompletion(localVASTAd.getDocument());
      return;
      paramObject = null;
      break;
    }
  }
  
  private void onWrapperLoadFailed(Object paramObject)
  {
    if ((paramObject instanceof VASTXMLLoader)) {}
    for (;;)
    {
      paramObject = (VASTXMLLoader)paramObject;
      ((VASTXMLLoader)paramObject).removeEventListener("complete", this);
      ((VASTXMLLoader)paramObject).removeEventListener("failed", this);
      if ((State != null) && ((State instanceof VASTAd))) {
        logVastError(((VASTAd)State).getWrapperAd(), 301);
      }
      checkCompletion(null);
      return;
      paramObject = null;
    }
  }
  
  private void repackageIncompatibleCreatives()
  {
    repackagingCount = 0;
    if ((vastAssetRepackagerInfo.repackaginEnabled.booleanValue()) && (wrapperDocument != null) && (wrapperDocument.getAds() != null) && (wrapperDocument.getAds().size() > 0))
    {
      localIterator = wrapperDocument.getAds().iterator();
      if (localIterator.hasNext()) {}
    }
    while (!checkForFallbackAds().booleanValue()) {
      for (;;)
      {
        Iterator localIterator;
        return;
        ((VASTAd)localIterator.next()).repackageIncompatibleCreatives(this, vastAssetRepackagerInfo);
      }
    }
    document = wrapperDocument;
    dispatchEvent("processComplete", new Event(this));
  }
  
  private Boolean shouldLoadVASTWrapper(VASTAd paramVASTAd)
  {
    if ((paramVASTAd != null) && (paramVASTAd.getWrapperAd() != null) && ((maxNumWrapperRedirects == -1) || (maxNumWrapperRedirects > 0))) {
      return Boolean.valueOf(true);
    }
    return Boolean.valueOf(false);
  }
  
  public final VASTDocument getDocument()
  {
    return document;
  }
  
  public final Throwable getError()
  {
    return error;
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if (paramString.equalsIgnoreCase("complete")) {
      onWrapperLoadComplete(((Event)paramObject).getOwner());
    }
    while (!paramString.equalsIgnoreCase("failed")) {
      return;
    }
    onWrapperLoadFailed(((Event)paramObject).getOwner());
  }
  
  public void onRepackagingComplete(VASTLinearCreative paramVASTLinearCreative, boolean paramBoolean)
  {
    repackagingCount += 1;
    if ((repackagingCount >= wrapperDocument.getAds().size()) && (checkForFallbackAds().booleanValue()))
    {
      document = wrapperDocument;
      dispatchEvent("processComplete", new Event(this));
    }
  }
  
  public final void process(VASTDocument paramVASTDocument)
  {
    if (paramVASTDocument != null)
    {
      if (getNumVASTWrappers(paramVASTDocument) > 0)
      {
        wrapperDocument = paramVASTDocument;
        loadVASTWrappers(wrapperDocument);
        return;
      }
      if ((parentAd != null) && (parentAd.getIsFromVmapDoc().booleanValue()) && (fallbackOnInvalidCreative.booleanValue()))
      {
        Iterator localIterator = paramVASTDocument.getAds().iterator();
        for (;;)
        {
          if (!localIterator.hasNext())
          {
            wrapperDocument = paramVASTDocument;
            repackageIncompatibleCreatives();
            return;
          }
          ((VASTAd)localIterator.next()).setFallbackOnNoAd(Boolean.valueOf(true));
        }
      }
      document = paramVASTDocument;
      dispatchEvent("processComplete", new Event(this));
      return;
    }
    dispatchEvent("processFailed", new Event(this));
  }
  
  public final void process(String paramString, VASTAd paramVASTAd)
  {
    VASTXMLParser localVASTXMLParser = new VASTXMLParser();
    parentAd = paramVASTAd;
    try
    {
      paramString = localVASTXMLParser.parse(paramString);
      if (paramString != null) {
        if (getNumVASTWrappers(paramString) > 0)
        {
          wrapperDocument = paramString;
          loadVASTWrappers(wrapperDocument);
          i = 0;
          if (i != 0) {
            dispatchEvent("processFailed", new Event(this));
          }
          return;
        }
      }
    }
    catch (IOException paramString)
    {
      for (;;)
      {
        error = paramString;
        paramString = null;
      }
    }
    catch (XmlPullParserException paramString)
    {
      for (;;)
      {
        error = paramString;
        paramString = null;
        continue;
        if ((paramVASTAd != null) && (paramVASTAd.getIsFromVmapDoc().booleanValue()) && (fallbackOnInvalidCreative.booleanValue()))
        {
          paramVASTAd = paramString.getAds().iterator();
          label122:
          if (!paramVASTAd.hasNext())
          {
            wrapperDocument = paramString;
            repackageIncompatibleCreatives();
            label140:
            if ((document == null) || (document.getAds() == null) || (document.getAds().size() <= 0)) {
              break label280;
            }
            paramString = document.getAds().iterator();
          }
        }
        for (;;)
        {
          if (!paramString.hasNext())
          {
            i = 0;
            break;
            ((VASTAd)paramVASTAd.next()).setFallbackOnNoAd(Boolean.valueOf(true));
            break label122;
            document = paramString;
            dispatchEvent("processComplete", new Event(this));
            break label140;
          }
          paramVASTAd = (VASTAd)paramString.next();
          if (paramVASTAd.getWrapperAd() != null)
          {
            document.reachedMaxWrapper = true;
            logVastError(paramVASTAd.getWrapperAd(), 302);
          }
        }
        int i = 1;
        continue;
        label280:
        i = 0;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.loader.VASTDocumentProcessor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */