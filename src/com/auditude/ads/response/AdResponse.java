package com.auditude.ads.response;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.PlayerErrorEvent;
import com.auditude.ads.exception.AssetException;
import com.auditude.ads.exception.PlayerException;
import com.auditude.ads.loader.AdRequest;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.model.tracking.Submissions;
import com.auditude.ads.util.event.EventDispatcher;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class AdResponse
  extends EventDispatcher
  implements AudienceManager.AudienceManagerListener, IResponseParser.ResponseParserListener
{
  public static final int VMAP = 0;
  private AdRequest adRequest;
  private AdSettings adSettings;
  private HashMap ads = new HashMap();
  private AudienceManager audienceManager;
  private ArrayList breaks = new ArrayList();
  private ArrayList chapters = new ArrayList();
  private ArrayList errorQueue = new ArrayList();
  private AdResponseListener listener;
  private ArrayList parserExceptions = new ArrayList();
  private int responseIndex = 0;
  private ArrayList responseList = new ArrayList();
  private IResponseParser responseParser;
  private Submissions submissions = new Submissions();
  private int timeout;
  
  public AdResponse(AdSettings paramAdSettings)
  {
    adSettings = paramAdSettings;
    responseList.add(Integer.valueOf(0));
  }
  
  private void clearResponseParser()
  {
    if (responseParser != null)
    {
      responseParser.setResponseParserListener(null);
      responseParser = null;
    }
  }
  
  private void loadNextResponse()
  {
    if (responseIndex < responseList.size())
    {
      responseIndex += 1;
      switch (((Integer)responseList.get(responseIndex - 1)).intValue())
      {
      }
    }
    for (;;)
    {
      return;
      if (VMAPParser.isValidParserForResponse(this).booleanValue())
      {
        responseParser = new VMAPParser();
        responseParser.setResponseParserListener(this);
        responseParser.loadAdRequest(this, adRequest, timeout);
        return;
      }
      loadNextResponse();
      return;
      listener.onRequestComplete(parserExceptions);
      int i = 0;
      while (i < errorQueue.size())
      {
        AuditudeEnv.getInstance().getAPI().dispatchEvent("playerError", new PlayerErrorEvent(this, (PlayerException)errorQueue.get(i)));
        i += 1;
      }
    }
  }
  
  public ArrayList GetBreakData()
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    for (;;)
    {
      if (i >= breaks.size()) {
        return localArrayList;
      }
      localArrayList.add(((Group)breaks.get(i)).getDescription());
      i += 1;
    }
  }
  
  public void cancel()
  {
    if (responseParser != null) {
      responseParser.cancel();
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
        break label133;
      }
      chapters = null;
      localIterator = ads.entrySet().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        ads = null;
        if (audienceManager != null)
        {
          audienceManager.setAudienceManagerListener(null);
          audienceManager = null;
        }
        if (responseParser != null)
        {
          responseParser.setResponseParserListener(null);
          clearResponseParser();
          responseParser = null;
        }
        return;
        ((Group)localIterator.next()).dispose();
        break;
        label133:
        ((Group)localIterator.next()).dispose();
        break label30;
      }
      ((Ad)((Map.Entry)localIterator.next()).getValue()).dispose();
    }
  }
  
  final AdSettings getAdSettings()
  {
    return adSettings;
  }
  
  public HashMap getAds()
  {
    return ads;
  }
  
  public ArrayList getBreaks()
  {
    return breaks;
  }
  
  public ArrayList getChapters()
  {
    return chapters;
  }
  
  public Submissions getSubmissions()
  {
    return submissions;
  }
  
  public void loadAdRequest(AdRequest paramAdRequest, int paramInt)
  {
    adRequest = paramAdRequest;
    timeout = paramInt;
    audienceManager = new AudienceManager(timeout);
    paramAdRequest = null;
    if (AuditudeEnv.getInstance().getAdSettings().hasProperty("audienceManagerURL")) {
      paramAdRequest = (String)AuditudeEnv.getInstance().getAdSettings().getProperty("audienceManagerURL");
    }
    if ((paramAdRequest != null) && (paramAdRequest.length() > 0))
    {
      audienceManager.setAudienceManagerListener(this);
      audienceManager.loadSegmentData((String)AuditudeEnv.getInstance().getAdSettings().getProperty("audienceManagerURL"));
      return;
    }
    onAudienceManagerComplete();
  }
  
  public void onAudienceManagerComplete()
  {
    String[] arrayOfString = audienceManager.getSegmentsValues();
    if ((arrayOfString != null) && (arrayOfString.length > 0))
    {
      adRequest.setAamSegments(audienceManager.getSegmentsValues());
      AuditudeEnv.getInstance().getAdSettings().setAamSegments(audienceManager.getSegmentsValues());
      if (audienceManager.getUuid() == null) {
        break label148;
      }
      adRequest.setAamUuid(audienceManager.getUuid());
      AuditudeEnv.getInstance().getAdSettings().setAamUuid(audienceManager.getUuid());
    }
    for (;;)
    {
      responseParser = new AuditudeResponseParser();
      responseParser.setResponseParserListener(this);
      responseParser.loadAdRequest(this, adRequest, timeout);
      return;
      adRequest.setAamSegments(null);
      AuditudeEnv.getInstance().getAdSettings().setAamSegments(null);
      break;
      label148:
      adRequest.setAamUuid(null);
      AuditudeEnv.getInstance().getAdSettings().setAamUuid(null);
    }
  }
  
  public void onAudienceManagerFailed(Throwable paramThrowable)
  {
    paramThrowable = new AssetException(1111, "Audience Manager Failed");
    errorQueue.add(paramThrowable);
    onAudienceManagerComplete();
  }
  
  public void onRequestComplete(AssetException paramAssetException)
  {
    if (paramAssetException != null) {
      parserExceptions.add(paramAssetException);
    }
    clearResponseParser();
    loadNextResponse();
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    clearResponseParser();
    listener.onRequestFailed(paramThrowable);
  }
  
  public void setAdResponseListener(AdResponseListener paramAdResponseListener)
  {
    listener = paramAdResponseListener;
  }
  
  public void setAds(HashMap paramHashMap)
  {
    ads = paramHashMap;
  }
  
  public void setBreaks(ArrayList paramArrayList)
  {
    breaks = paramArrayList;
  }
  
  public void setChapters(ArrayList paramArrayList)
  {
    chapters = paramArrayList;
  }
  
  public void setSubmissions(Submissions paramSubmissions)
  {
    submissions = paramSubmissions;
  }
  
  public static abstract interface AdResponseListener
  {
    public abstract void onRequestComplete(ArrayList paramArrayList);
    
    public abstract void onRequestFailed(Throwable paramThrowable);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.AdResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */