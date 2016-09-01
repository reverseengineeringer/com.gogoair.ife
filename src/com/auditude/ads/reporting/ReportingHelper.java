package com.auditude.ads.reporting;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.PlayerErrorEvent;
import com.auditude.ads.event.SMILEvent;
import com.auditude.ads.exception.AssetException;
import com.auditude.ads.exception.PlayerException;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.BaseElement;
import com.auditude.ads.model.Click;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.IOnPageAsset;
import com.auditude.ads.model.NonLinearAsset;
import com.auditude.ads.model.smil.Par;
import com.auditude.ads.model.smil.Ref;
import com.auditude.ads.model.smil.Sequence;
import com.auditude.ads.model.smil.SmilElementType;
import com.auditude.ads.model.tracking.Submission;
import com.auditude.ads.model.tracking.Submissions;
import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.ObjectUtil;
import com.auditude.ads.util.TimeoutUtil;
import com.auditude.ads.util.TimeoutUtil.TimeoutCompleteListener;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.view.AdViewEvent;
import com.auditude.ads.view.IAdView;
import com.auditude.ads.view.model.IAdViewSource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ReportingHelper
  implements TimeoutUtil.TimeoutCompleteListener, IEventListener
{
  private static final String EVENT_COMPLETE = "complete";
  private static final String EVENT_START = "start";
  private static final String STATE_PARAM_ADVANCE_PATTERN = "advancepattern";
  private static final String STATE_PARAM_EVENT = "event";
  private static final String STATE_PARAM_PROGRESS = "progress";
  private static final String STATE_PARAM_UNIT = "unit";
  private static final String UNIT_PERCENT = "percent";
  private APIBridge api;
  private boolean isInitialized = false;
  private Par par;
  private ArrayList pendingTimeouts = new ArrayList();
  private Sequence sequence;
  private Submissions submissions;
  
  public ReportingHelper(APIBridge paramAPIBridge)
  {
    api = paramAPIBridge;
    paramAPIBridge.addEventListener("adViewEvent", this, 100);
    paramAPIBridge.addEventListener("smilEvent", this, 100);
    paramAPIBridge.addEventListener("playerError", this, 100);
  }
  
  private String getErrorSubmissionUrl(String paramString)
  {
    if ((paramString.indexOf("http://") == 0) || (paramString.indexOf("https://") == 0)) {
      return "http://ad.auditude.com/adserver/e?type=playererror";
    }
    return "http://ad." + paramString + "/adserver/e?type=playererror";
  }
  
  private HashMap getProgressState(int paramInt, String paramString)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("progress", String.valueOf(paramInt));
    localHashMap.put("unit", paramString);
    return localHashMap;
  }
  
  private HashMap getSubmissionState()
  {
    if (submissions != null) {
      return submissions.getState();
    }
    return null;
  }
  
  private void logAdTrackingUrl(BaseElement paramBaseElement, Sequence paramSequence, Par paramPar, String paramString, HashMap paramHashMap)
  {
    logAdTrackingUrl(paramBaseElement, paramSequence, paramPar, paramString, paramHashMap, false);
  }
  
  private void logAdTrackingUrl(BaseElement paramBaseElement, Sequence paramSequence, Par paramPar, String paramString, HashMap paramHashMap, boolean paramBoolean)
  {
    if (paramBaseElement == null) {}
    label61:
    label127:
    label140:
    for (;;)
    {
      return;
      paramString = paramBaseElement.getTrackingEventByType(paramString);
      if ((paramString != null) && (paramString.getTrackingUrls() != null) && (paramString.getTrackingUrls().size() > 0))
      {
        HashMap localHashMap = getSubmissionState();
        if (paramSequence != null)
        {
          paramBaseElement = paramSequence.getState();
          if (paramPar == null) {
            break label127;
          }
          paramSequence = paramPar.getState();
          paramBaseElement = ObjectUtil.merge(ObjectUtil.merge(localHashMap, ObjectUtil.merge(paramBaseElement, paramSequence)), paramHashMap);
          paramSequence = paramString.getTrackingUrls().iterator();
        }
        for (;;)
        {
          if (!paramSequence.hasNext()) {
            break label140;
          }
          paramPar = (TrackingUrl)paramSequence.next();
          if ((paramPar instanceof Submission))
          {
            paramPar.log(paramBoolean, paramBaseElement);
            continue;
            paramBaseElement = null;
            break;
            paramSequence = null;
            break label61;
          }
          paramPar.log(paramBoolean, null);
        }
      }
    }
  }
  
  private void logAdTrackingUrl(BaseElement paramBaseElement, String paramString, HashMap paramHashMap)
  {
    logAdTrackingUrl(paramBaseElement, paramString, paramHashMap, false);
  }
  
  private void logAdTrackingUrl(BaseElement paramBaseElement, String paramString, HashMap paramHashMap, boolean paramBoolean)
  {
    if (paramBaseElement == null) {}
    for (;;)
    {
      return;
      paramString = paramBaseElement.getTrackingEventByType(paramString);
      if ((paramString != null) && (paramString.getTrackingUrls() != null) && (paramString.getTrackingUrls().size() > 0))
      {
        paramBaseElement = ObjectUtil.merge(currentPodState(), paramHashMap);
        paramString = paramString.getTrackingUrls().iterator();
        while (paramString.hasNext())
        {
          paramHashMap = (TrackingUrl)paramString.next();
          if ((paramHashMap instanceof Submission)) {
            paramHashMap.log(paramBoolean, paramBaseElement);
          } else {
            paramHashMap.log(paramBoolean, null);
          }
        }
      }
    }
  }
  
  private void logSequenceProgress(Sequence paramSequence, String paramString, boolean paramBoolean)
  {
    Object localObject3 = null;
    if ((submissions == null) || (paramSequence == null)) {}
    Object localObject1;
    label81:
    do
    {
      return;
      if (submissions == null) {
        break;
      }
      localObject2 = submissions.getTrackingEventByType(paramSequence.getSubmissionId());
      localObject1 = localObject3;
      if (localObject2 != null)
      {
        localObject1 = localObject3;
        if (((TrackingEvent)localObject2).getTrackingUrls().size() > 0)
        {
          localObject1 = (TrackingUrl)((TrackingEvent)localObject2).getTrackingUrls().get(0);
          if (!(localObject1 instanceof Submission)) {
            break label147;
          }
          localObject1 = (Submission)localObject1;
        }
      }
    } while (localObject1 == null);
    Object localObject2 = ObjectUtil.merge(getSubmissionState(), paramSequence.getState());
    ((HashMap)localObject2).put("event", paramString);
    if (paramBoolean) {}
    for (paramSequence = "1";; paramSequence = "0")
    {
      ((HashMap)localObject2).put("advancepattern", paramSequence);
      ((Submission)localObject1).log(true, (HashMap)localObject2);
      return;
      localObject2 = null;
      break;
      label147:
      localObject1 = null;
      break label81;
    }
  }
  
  private void onAdClick(AdViewEvent paramAdViewEvent)
  {
    if ((paramAdViewEvent.getSource() != null) && (paramAdViewEvent.getSource().getAsset() != null) && (paramAdViewEvent.getSource().getAsset().getClick() != null)) {
      if (!(paramAdViewEvent.getSource().getAsset().getClick() instanceof Click)) {
        break label85;
      }
    }
    label85:
    for (paramAdViewEvent = paramAdViewEvent.getSource().getAsset().getClick();; paramAdViewEvent = null)
    {
      logAdTrackingUrl((Click)paramAdViewEvent, "click", null, true);
      return;
    }
  }
  
  private void onAdComplete(AdViewEvent paramAdViewEvent)
  {
    if ((paramAdViewEvent.getSource() != null) && (paramAdViewEvent.getSource().getAsset() != null)) {
      if (!(paramAdViewEvent.getSource().getAsset() instanceof Asset)) {
        break label67;
      }
    }
    label67:
    for (paramAdViewEvent = paramAdViewEvent.getSource().getAsset();; paramAdViewEvent = null)
    {
      logAdTrackingUrl((Asset)paramAdViewEvent, "complete", getProgressState(100, "percent"));
      AuditudeUtil.setAssetURI(null);
      return;
    }
  }
  
  private void onAdError(AdViewEvent paramAdViewEvent)
  {
    if ((paramAdViewEvent.getSource() != null) && (paramAdViewEvent.getSource().getAsset() != null)) {
      if (!(paramAdViewEvent.getSource().getAsset() instanceof NonLinearAsset)) {
        break label121;
      }
    }
    label121:
    for (int i = 500;; i = 400)
    {
      paramAdViewEvent = (Asset)paramAdViewEvent.getSource().getAsset();
      if (paramAdViewEvent != null)
      {
        TrackingEvent localTrackingEvent = paramAdViewEvent.getTrackingEventByType("vasterror");
        if ((localTrackingEvent != null) && (localTrackingEvent.getTrackingUrls() != null))
        {
          AuditudeUtil.setAssetURI(paramAdViewEvent.getUrl());
          paramAdViewEvent = localTrackingEvent.getTrackingUrls().iterator();
        }
      }
      for (;;)
      {
        if (!paramAdViewEvent.hasNext())
        {
          AuditudeUtil.setAssetURI(null);
          return;
        }
        ((TrackingUrl)paramAdViewEvent.next()).log(false, null, i);
      }
    }
  }
  
  private void onAdProgress(AdViewEvent paramAdViewEvent)
  {
    Object localObject = null;
    if (paramAdViewEvent.getSource() != null) {
      if ((paramAdViewEvent.getSource().getAsset() instanceof Asset)) {
        localObject = paramAdViewEvent.getSource().getAsset();
      }
    }
    for (localObject = (Asset)localObject; (localObject == null) || (paramAdViewEvent.getView() == null); localObject = null) {
      return;
    }
    int i = paramAdViewEvent.getView().getDuration();
    int j = paramAdViewEvent.getView().getPosition();
    float f;
    if (i <= 0)
    {
      f = 0.0F;
      label89:
      if (f >= 25.0F) {
        break label241;
      }
      logAdTrackingUrl((BaseElement)localObject, "start", getProgressState(0, "percent"));
    }
    for (;;)
    {
      paramAdViewEvent = ((Asset)localObject).getTrackingEventByType("progress");
      if (paramAdViewEvent == null) {
        break;
      }
      paramAdViewEvent = paramAdViewEvent.getTrackingUrls().iterator();
      while (paramAdViewEvent.hasNext())
      {
        localObject = (TrackingUrl)paramAdViewEvent.next();
        if ((!((TrackingUrl)localObject).isLogged()) && (((((TrackingUrl)localObject).getOffsetIsPercent().booleanValue()) && (f >= ((TrackingUrl)localObject).getOffset())) || ((!((TrackingUrl)localObject).getOffsetIsPercent().booleanValue()) && (j >= ((TrackingUrl)localObject).getOffset())))) {
          ((TrackingUrl)localObject).log(true, ObjectUtil.merge(currentPodState(), getProgressState(Math.round(f), "percent")));
        }
      }
      break;
      f = j * 100 / i;
      break label89;
      label241:
      if ((f >= 25.0F) && (f < 50.0F)) {
        logAdTrackingUrl((BaseElement)localObject, "firstquartile", getProgressState(25, "percent"));
      } else if ((f >= 50.0F) && (f < 75.0F)) {
        logAdTrackingUrl((BaseElement)localObject, "midpoint", getProgressState(50, "percent"));
      } else if ((f >= 75.0F) && (f < 100.0F)) {
        logAdTrackingUrl((BaseElement)localObject, "thirdquartile", getProgressState(75, "percent"));
      } else if (f >= 100.0F) {
        logAdTrackingUrl((BaseElement)localObject, "complete", getProgressState(100, "percent"));
      }
    }
  }
  
  private void onAdSkip(AdViewEvent paramAdViewEvent)
  {
    if ((paramAdViewEvent.getSource() != null) && (paramAdViewEvent.getSource().getAsset() != null)) {
      logAdTrackingUrl((Asset)paramAdViewEvent.getSource().getAsset(), "skip", null);
    }
  }
  
  private void onAdStart(AdViewEvent paramAdViewEvent)
  {
    if (paramAdViewEvent.getSource() != null) {
      if ((paramAdViewEvent.getSource().getAsset() instanceof Asset)) {
        paramAdViewEvent = paramAdViewEvent.getSource().getAsset();
      }
    }
    for (paramAdViewEvent = (Asset)paramAdViewEvent;; paramAdViewEvent = null)
    {
      if ((!(paramAdViewEvent instanceof IOnPageAsset)) || (!paramAdViewEvent.getFormat().equals("onpage"))) {
        break label68;
      }
      return;
      paramAdViewEvent = null;
      break;
    }
    label68:
    AuditudeUtil.setAssetURI(paramAdViewEvent.getUrl());
    logAdTrackingUrl(paramAdViewEvent, "creativeview", null);
    logAdTrackingUrl(paramAdViewEvent, "start", getProgressState(0, "percent"));
  }
  
  private void onAdViewEvent(AdViewEvent paramAdViewEvent)
  {
    if (paramAdViewEvent == null) {
      return;
    }
    switch (paramAdViewEvent.getType())
    {
    case AD_COMPLETE: 
    case AD_ERROR: 
    case AD_LOG: 
    case AD_PROGRESS: 
    case AD_REPLAY: 
    case AD_RESUME: 
    case AD_STOP: 
    case AD_USER_CLOSE: 
    default: 
      return;
    case AD_CLICK: 
      onAdStart(paramAdViewEvent);
      return;
    case AD_PAUSE: 
      onAdProgress(paramAdViewEvent);
      return;
    case AD_LOAD: 
      onAdComplete(paramAdViewEvent);
      return;
    case AD_START: 
      onAdClick(paramAdViewEvent);
      return;
    case AD_SKIP: 
      onAdError(paramAdViewEvent);
      return;
    }
    onAdSkip(paramAdViewEvent);
  }
  
  private void onErrorEvent(PlayerErrorEvent paramPlayerErrorEvent)
  {
    if ((exception == null) || (submissions == null)) {}
    Submission localSubmission1;
    do
    {
      return;
      Submission localSubmission2 = submissions.getSubmissionById("playererror");
      localSubmission1 = localSubmission2;
      if (localSubmission2 == null) {
        localSubmission1 = Submission.newSubmission(getErrorSubmissionUrl(AuditudeEnv.getInstance().getAdSettings().getDomain()), "playererror");
      }
    } while (localSubmission1 == null);
    localSubmission1.log(true, exception.toParams());
  }
  
  private void onParBegin(SMILEvent paramSMILEvent)
  {
    par = paramSMILEvent.getPar();
  }
  
  private void onParEnd(SMILEvent paramSMILEvent)
  {
    par = null;
  }
  
  private void onSMILEvent(SMILEvent paramSMILEvent)
  {
    switch (paramSMILEvent.getType())
    {
    default: 
      return;
    case PAR_BEGIN: 
      onSequenceBegin(paramSMILEvent);
      return;
    case PAR_END: 
      onSequenceEnd(paramSMILEvent);
      return;
    case SEQUENCE_BEGIN: 
      onParBegin(paramSMILEvent);
      return;
    }
    onParEnd(paramSMILEvent);
  }
  
  private void onSequenceBegin(SMILEvent paramSMILEvent)
  {
    sequence = paramSMILEvent.getSequence();
    if (sequence != null)
    {
      if (sequence.getType() != SmilElementType.LINEAR)
      {
        paramSMILEvent = new TimeoutUtil(paramSMILEvent);
        paramSMILEvent.addTimeoutCompleteListener(this);
        pendingTimeouts.add(paramSMILEvent);
        paramSMILEvent.Begin(3000L);
      }
    }
    else {
      return;
    }
    logSequenceProgress(sequence, "start", paramSMILEvent.getAdvancePattern());
    logAdTrackingUrl(sequence, "start", getProgressState(0, "percent"));
  }
  
  private void onSequenceEnd(SMILEvent paramSMILEvent)
  {
    if (paramSMILEvent.getSequence() != null)
    {
      logSequenceProgress(paramSMILEvent.getSequence(), "complete", paramSMILEvent.getAdvancePattern());
      logAdTrackingUrl(sequence, "complete", getProgressState(100, "percent"));
    }
    if (paramSMILEvent.getSequence() == sequence) {
      sequence = null;
    }
  }
  
  public final HashMap currentAdState()
  {
    HashMap localHashMap2 = null;
    if (sequence != null) {}
    for (HashMap localHashMap1 = sequence.getState();; localHashMap1 = null)
    {
      if (par != null) {
        localHashMap2 = par.getState();
      }
      return ObjectUtil.merge(localHashMap1, localHashMap2);
    }
  }
  
  public final HashMap currentPodState()
  {
    HashMap localHashMap2 = null;
    HashMap localHashMap3 = getSubmissionState();
    if (sequence != null) {}
    for (HashMap localHashMap1 = sequence.getState();; localHashMap1 = null)
    {
      if (par != null) {
        localHashMap2 = par.getState();
      }
      return ObjectUtil.merge(localHashMap3, ObjectUtil.merge(localHashMap1, localHashMap2));
    }
  }
  
  public final void dispose()
  {
    api.removeEventListener("adViewEvent", this);
    api.removeEventListener("smilEvent", this);
    api.removeEventListener("playerError", this);
    reset();
  }
  
  public final Submissions getSubmissions()
  {
    return submissions;
  }
  
  public final void init()
  {
    if (!isInitialized) {
      isInitialized = true;
    }
    reset();
  }
  
  public void onAdClick(Ref paramRef)
  {
    Object localObject = paramRef.getPrimaryAsset();
    if ((localObject != null) && (((Asset)localObject).getClick() != null)) {
      if (!(((Asset)localObject).getClick() instanceof Click)) {
        break label56;
      }
    }
    label56:
    for (localObject = ((Asset)localObject).getClick();; localObject = null)
    {
      logAdTrackingUrl((Click)localObject, paramRef.getPar().getSequence(), paramRef.getPar(), "click", null, true);
      return;
    }
  }
  
  public void onAdComplete(Ref paramRef)
  {
    logAdTrackingUrl(paramRef.getPrimaryAsset(), paramRef.getPar().getSequence(), paramRef.getPar(), "complete", getProgressState(100, "percent"));
  }
  
  public void onAdError(Ref paramRef)
  {
    Object localObject1;
    Object localObject2;
    if (paramRef != null)
    {
      localObject1 = paramRef.getPrimaryAsset();
      if (localObject1 != null)
      {
        localObject2 = ((Asset)localObject1).getTrackingEventByType("vasterror");
        if ((localObject2 != null) && (((TrackingEvent)localObject2).getTrackingUrls() != null))
        {
          AuditudeUtil.setAssetURI(((Asset)localObject1).getUrl());
          localObject1 = ((TrackingEvent)localObject2).getTrackingUrls().iterator();
        }
      }
    }
    for (;;)
    {
      if (!((Iterator)localObject1).hasNext())
      {
        AuditudeUtil.setAssetURI(null);
        if (submissions != null)
        {
          localObject2 = submissions.getSubmissionById("playererror");
          localObject1 = localObject2;
          if (localObject2 == null) {
            localObject1 = Submission.newSubmission(getErrorSubmissionUrl(AuditudeEnv.getInstance().getAdSettings().getDomain()), "playererror");
          }
          if (localObject1 != null)
          {
            localObject2 = new AssetException(1131, "asset failed to load");
            if (paramRef.getAd() != null) {
              adId = paramRef.getAd().getID();
            }
            ((Submission)localObject1).log(true, ((AssetException)localObject2).toParams());
          }
        }
        return;
      }
      ((TrackingUrl)((Iterator)localObject1).next()).log(false, null, 400);
    }
  }
  
  public void onAdProgress(Ref paramRef, int paramInt1, int paramInt2)
  {
    Asset localAsset = paramRef.getPrimaryAsset();
    if (localAsset == null) {}
    float f;
    do
    {
      return;
      if (paramInt1 <= 0) {}
      for (f = 0.0F; f < 25.0F; f = paramInt2 * 100 / paramInt1)
      {
        logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "start", getProgressState(0, "percent"));
        return;
      }
      if ((f >= 25.0F) && (f < 50.0F))
      {
        logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "firstquartile", getProgressState(25, "percent"));
        return;
      }
      if ((f >= 50.0F) && (f < 75.0F))
      {
        logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "midpoint", getProgressState(50, "percent"));
        return;
      }
      if ((f >= 75.0F) && (f < 100.0F))
      {
        logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "thirdquartile", getProgressState(75, "percent"));
        return;
      }
    } while (f < 100.0F);
    logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "complete", getProgressState(100, "percent"));
  }
  
  public void onAdStart(Ref paramRef)
  {
    Asset localAsset = paramRef.getPrimaryAsset();
    if (((localAsset instanceof IOnPageAsset)) && (localAsset.getFormat().equals("onpage"))) {
      return;
    }
    logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "creativeview", null);
    logAdTrackingUrl(localAsset, paramRef.getPar().getSequence(), paramRef.getPar(), "start", getProgressState(0, "percent"));
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((paramString.equalsIgnoreCase("adViewEvent")) && ((paramObject instanceof AdViewEvent))) {
      onAdViewEvent((AdViewEvent)paramObject);
    }
    do
    {
      return;
      if ((paramString.equalsIgnoreCase("smilEvent")) && ((paramObject instanceof SMILEvent)))
      {
        onSMILEvent((SMILEvent)paramObject);
        return;
      }
    } while ((!paramString.equalsIgnoreCase("playerError")) || (!(paramObject instanceof PlayerErrorEvent)));
    onErrorEvent((PlayerErrorEvent)paramObject);
  }
  
  public void onSequenceBegin(Ref paramRef)
  {
    if ((paramRef != null) && (paramRef.getPar() != null) && (paramRef.getPar().getSequence() != null)) {
      onSequenceBegin(paramRef.getPar().getSequence());
    }
  }
  
  public void onSequenceBegin(Sequence paramSequence)
  {
    if (paramSequence != null)
    {
      if (paramSequence.getType() != SmilElementType.LINEAR) {
        logSequenceProgress(paramSequence, "start", true);
      }
    }
    else {
      return;
    }
    logSequenceProgress(paramSequence, "start", false);
    logAdTrackingUrl(paramSequence, "start", getProgressState(0, "percent"));
  }
  
  public void onSequenceEnd(Ref paramRef)
  {
    if ((paramRef != null) && (paramRef.getPar() != null) && (paramRef.getPar().getSequence() != null)) {
      onSequenceEnd(paramRef.getPar().getSequence());
    }
  }
  
  public void onSequenceEnd(Sequence paramSequence)
  {
    if (paramSequence != null) {
      if (paramSequence.getType() != SmilElementType.LINEAR) {
        break label44;
      }
    }
    label44:
    for (boolean bool = true;; bool = false)
    {
      logSequenceProgress(paramSequence, "complete", bool);
      logAdTrackingUrl(paramSequence, "complete", getProgressState(100, "percent"));
      paramSequence.resetTrackingEvents();
      return;
    }
  }
  
  public void onTimeoutComplete(TimeoutUtil paramTimeoutUtil)
  {
    Object localObject;
    if (paramTimeoutUtil != null)
    {
      paramTimeoutUtil.addTimeoutCompleteListener(null);
      pendingTimeouts.remove(paramTimeoutUtil);
      if ((!paramTimeoutUtil.getIsCanceled()) && ((paramTimeoutUtil.getData() instanceof SMILEvent)))
      {
        localObject = paramTimeoutUtil.getData();
        if (!(localObject instanceof SMILEvent)) {
          break label71;
        }
      }
    }
    for (;;)
    {
      localObject = (SMILEvent)localObject;
      logSequenceProgress(((SMILEvent)localObject).getSequence(), "start", ((SMILEvent)localObject).getAdvancePattern());
      paramTimeoutUtil.dispose();
      return;
      label71:
      localObject = null;
    }
  }
  
  public final void reset()
  {
    submissions = null;
    sequence = null;
    par = null;
    Iterator localIterator = pendingTimeouts.iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        pendingTimeouts.clear();
        return;
      }
      TimeoutUtil localTimeoutUtil = (TimeoutUtil)localIterator.next();
      if (localTimeoutUtil != null) {
        localTimeoutUtil.dispose();
      }
    }
  }
  
  public final void setSubmissions(Submissions paramSubmissions)
  {
    submissions = paramSubmissions;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.reporting.ReportingHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */