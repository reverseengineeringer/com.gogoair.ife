package com.auditude.ads.network.vast.loader;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.network.vast.model.VASTAd;
import com.auditude.ads.network.vast.model.VASTDocument;
import com.auditude.ads.network.vast.repackaging.VastAssetRepackagerInfo;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.EventDispatcher;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.util.http.AsyncHttpConnection;
import java.util.ArrayList;

public class VASTXMLLoader
  extends EventDispatcher
  implements IEventListener
{
  public static final String COMPLETE = "complete";
  public static final String FAILED = "failed";
  public Object State;
  private VASTDocument document;
  private Throwable error;
  private Boolean fallbackOnInvalidCreative = Boolean.valueOf(false);
  private AsyncHttpConnection httpClient;
  private int maxNumWrapperRedirects = 6;
  private ArrayList mimeTypes = null;
  private VASTDocumentProcessor processor;
  private VastAssetRepackagerInfo vastAssetRepackagerInfo = null;
  
  public VASTXMLLoader(int paramInt, ArrayList paramArrayList, VastAssetRepackagerInfo paramVastAssetRepackagerInfo, Boolean paramBoolean)
  {
    maxNumWrapperRedirects = paramInt;
    mimeTypes = paramArrayList;
    vastAssetRepackagerInfo = paramVastAssetRepackagerInfo;
    fallbackOnInvalidCreative = paramBoolean;
  }
  
  private void notifyRequestFailed()
  {
    dispatchEvent("failed", new Event(this));
  }
  
  private void onDocumentProcessComplete(Object paramObject)
  {
    if ((paramObject instanceof VASTDocumentProcessor)) {}
    for (;;)
    {
      paramObject = (VASTDocumentProcessor)paramObject;
      if (paramObject != null)
      {
        ((VASTDocumentProcessor)paramObject).removeEventListener("processComplete", this);
        ((VASTDocumentProcessor)paramObject).removeEventListener("processFailed", this);
        document = ((VASTDocumentProcessor)paramObject).getDocument();
      }
      dispatchEvent("complete", new Event(this));
      return;
      paramObject = null;
    }
  }
  
  private void onDocumentProcessFailed(Object paramObject)
  {
    if ((paramObject instanceof VASTDocumentProcessor)) {}
    for (;;)
    {
      paramObject = (VASTDocumentProcessor)paramObject;
      ((VASTDocumentProcessor)paramObject).removeEventListener("processComplete", this);
      ((VASTDocumentProcessor)paramObject).removeEventListener("processFailed", this);
      dispatchEvent("complete", new Event(this));
      return;
      paramObject = null;
    }
  }
  
  public final VASTDocument getDocument()
  {
    return document;
  }
  
  public final Throwable getError()
  {
    return error;
  }
  
  public final void init(Object paramObject)
  {
    if (((paramObject instanceof String)) && (!StringUtil.isNullOrEmpty((String)paramObject)))
    {
      httpClient = new AsyncHttpConnection(new VASTXMLLoader.1(this, this));
      httpClient.get(AuditudeUtil.substituteCustomPublisherTags(AuditudeUtil.substituteTags((String)paramObject), AuditudeEnv.getInstance().getAdSettings().getPassThroughParams()));
      return;
    }
    if (((paramObject instanceof VASTDocument)) && (paramObject != null))
    {
      if ((State instanceof VASTAd)) {
        parentAd = ((VASTAd)State);
      }
      processor = new VASTDocumentProcessor(maxNumWrapperRedirects, mimeTypes, vastAssetRepackagerInfo, fallbackOnInvalidCreative);
      processor.addEventListener("processComplete", this);
      processor.addEventListener("processFailed", this);
      processor.process((VASTDocument)paramObject);
      return;
    }
    onDocumentProcessComplete(null);
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((paramObject instanceof Event))
    {
      if (paramString.equalsIgnoreCase("processComplete"))
      {
        onDocumentProcessComplete(((Event)paramObject).getOwner());
        return;
      }
      if (paramString.equalsIgnoreCase("processFailed"))
      {
        onDocumentProcessFailed(((Event)paramObject).getOwner());
        return;
      }
      notifyRequestFailed();
      return;
    }
    notifyRequestFailed();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.loader.VASTXMLLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */