package com.auditude.ads.session;

import android.view.ViewGroup;
import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.response.AdResponse;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.ObjectUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;
import com.auditude.ads.view.ViewManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class AdExperienceController
  implements IEventListener
{
  private static final int BREAK_TOLERANCE = 500;
  private AdSettings adSettings;
  private APIBridge apiBridge;
  private BreakManager breakManager;
  private ChapterManager chapterManager;
  private int currentChapterIndex = -1;
  private boolean isManagingBreak = false;
  private int lastPosition = 0;
  private int mediaResumeTime = 0;
  private AdResponse response;
  private boolean skipAllBreaks = false;
  private boolean skipBreaksBeforeResumeTime = false;
  private ViewManager viewManager;
  
  public AdExperienceController(AdResponse paramAdResponse, APIBridge paramAPIBridge, AdSettings paramAdSettings, ViewGroup paramViewGroup)
  {
    response = paramAdResponse;
    apiBridge = paramAPIBridge;
    adSettings = paramAdSettings;
    viewManager = new ViewManager(paramViewGroup, paramAPIBridge, paramAdSettings);
    chapterManager = new ChapterManager(paramAPIBridge, viewManager, paramAdSettings);
    breakManager = new BreakManager(paramAPIBridge, viewManager, paramAdSettings);
    apiBridge.addEventListener("apiEvent", this, 100);
  }
  
  private Group getBreakAtIndex(int paramInt)
  {
    if ((response == null) || (response.getBreaks() == null) || (response.getBreaks().size() <= paramInt)) {
      return null;
    }
    return (Group)response.getBreaks().get(paramInt);
  }
  
  private Group getBreakBeforePosition(int paramInt, boolean paramBoolean)
  {
    int i;
    do
    {
      try
      {
        if ((skipAllBreaks) || (paramInt <= 0) || (response.getBreaks() == null) || (response.getBreaks().size() <= 0)) {
          break;
        }
        i = response.getBreaks().size() - 1;
      }
      catch (RuntimeException localRuntimeException)
      {
        Group localGroup3;
        Group localGroup1;
        break;
      }
      localGroup3 = (Group)response.getBreaks().get(i);
      if (isGroupQualifiedForPosition(localGroup3, paramInt, paramBoolean))
      {
        if (!localGroup3.isWatched())
        {
          localGroup1 = localGroup3;
          if (!skipBreaksBeforeResumeTime) {
            break label151;
          }
          localGroup1 = localGroup3;
          if (mediaResumeTime <= 0) {
            break label151;
          }
          paramInt = localGroup3.getStartTime();
          i = mediaResumeTime;
          localGroup1 = localGroup3;
          if (paramInt > i) {
            break label151;
          }
          return null;
        }
        return null;
      }
      i -= 1;
    } while (i >= 1);
    Group localGroup2 = null;
    label151:
    return localGroup2;
  }
  
  private Group getChapterAtIndex(int paramInt)
  {
    if ((response == null) || (response.getChapters() == null) || (response.getChapters().size() <= paramInt)) {
      return null;
    }
    return (Group)response.getChapters().get(paramInt);
  }
  
  private Group getNextBreak()
  {
    return getBreakAtIndex(currentChapterIndex + 1);
  }
  
  private boolean inSameChapter(int paramInt1, int paramInt2)
  {
    if (paramInt1 == paramInt2) {}
    for (;;)
    {
      return true;
      if ((response.getBreaks() != null) && (response.getBreaks().size() > 1))
      {
        int i = 1;
        while (i < response.getBreaks().size())
        {
          Group localGroup = (Group)response.getBreaks().get(i);
          if (paramInt1 < paramInt2)
          {
            if ((localGroup.getStartTime() >= paramInt1) && (localGroup.getStartTime() <= paramInt2)) {
              return false;
            }
          }
          else if ((localGroup.getStartTime() >= paramInt2) && (localGroup.getStartTime() <= paramInt1)) {
            return false;
          }
          i += 1;
        }
      }
    }
  }
  
  private boolean isGroupQualifiedForPosition(Group paramGroup, int paramInt, boolean paramBoolean)
  {
    if (paramGroup == null) {}
    do
    {
      do
      {
        return false;
        if (paramBoolean) {
          break;
        }
      } while (paramGroup.getStartTime() > paramInt);
      return true;
    } while (((paramGroup.getStartTime() < paramInt) || (paramGroup.getStartTime() - paramInt > 500)) && ((paramGroup.getStartTime() >= paramInt) || (paramInt - paramGroup.getStartTime() > 500)));
    return true;
  }
  
  private void onBreakBeginNotification(HashMap paramHashMap)
  {
    if (breakManager.isHandlingBreak()) {
      return;
    }
    onMediaPlaybackCompleteNotification(paramHashMap);
    if (getInstanceshouldIgnoreNextBreak.booleanValue())
    {
      apiBridge.breakEnd(null);
      return;
    }
    if ((paramHashMap != null) && (paramHashMap.containsKey("breakIndex")))
    {
      int i = ((Integer)paramHashMap.get("breakIndex")).intValue();
      if (i >= 0) {
        currentChapterIndex = (i - 1);
      }
    }
    breakManager.begin(getNextBreak());
  }
  
  private void onBreakEndNotification(HashMap paramHashMap)
  {
    if ((AdExceptions.hasException("skipNextBreak").booleanValue()) && (breakManager.isHandlingBreak()))
    {
      getInstanceshouldPauseAdPatterns = Boolean.valueOf(true);
      getInstanceshouldIgnoreNextBreak = Boolean.valueOf(true);
    }
    isManagingBreak = false;
    breakManager.end();
  }
  
  private void onMediaPlaybackCompleteNotification(HashMap paramHashMap)
  {
    if (chapterManager.isHandlingChapter()) {
      chapterManager.end();
    }
  }
  
  private void onMediaPlaybackPausedNotification(HashMap paramHashMap)
  {
    if (chapterManager.isHandlingChapter()) {
      chapterManager.pause();
    }
  }
  
  private void onMediaPlaybackResumedNotification(HashMap paramHashMap)
  {
    if (chapterManager.isHandlingChapter())
    {
      chapterManager.resume();
      return;
    }
    onMediaPlaybackStartedNotification(paramHashMap);
  }
  
  private void onMediaPlaybackStartedNotification(HashMap paramHashMap)
  {
    if (chapterManager.isHandlingChapter())
    {
      onMediaPlaybackResumedNotification(paramHashMap);
      return;
    }
    currentChapterIndex += 1;
    if (paramHashMap != null)
    {
      if (paramHashMap.containsKey("auditudeSkipBreaksBeforeResumeTime")) {
        skipBreaksBeforeResumeTime = ObjectUtil.convertToBoolean(paramHashMap.get("auditudeSkipBreaksBeforeResumeTime"));
      }
      if (paramHashMap.containsKey("auditudeResumeTimeInMilliSeconds")) {
        mediaResumeTime = ObjectUtil.convertToInt(paramHashMap.get("auditudeResumeTimeInMilliSeconds"), 0);
      }
    }
    if (breakManager.isHandlingBreak()) {
      breakManager.end();
    }
    chapterManager.begin(getChapterAtIndex(currentChapterIndex));
    getInstanceshouldPauseAdPatterns = Boolean.valueOf(false);
    getInstanceshouldIgnoreNextBreak = Boolean.valueOf(false);
  }
  
  private void onMediaPlayheadUpdateNotification(HashMap paramHashMap, boolean paramBoolean)
  {
    if ((breakManager.isHandlingBreak()) || (paramHashMap == null)) {}
    for (;;)
    {
      return;
      if (((Boolean)adSettings.getProperty("auditudeHandlesChapterBreaks")).booleanValue())
      {
        paramHashMap = paramHashMap.entrySet().iterator();
        while (paramHashMap.hasNext())
        {
          Object localObject = (Map.Entry)paramHashMap.next();
          if (((String)((Map.Entry)localObject).getKey()).toLowerCase().equals("position".toLowerCase()))
          {
            int i = ObjectUtil.convertToInt(((Map.Entry)localObject).getValue(), -1);
            if (i > 0)
            {
              chapterManager.setPosition(i);
              lastPosition = i;
              AuditudeUtil.setContentPlayhead(i);
              Log.getLogger("Auditude").info("position: " + i);
              localObject = getBreakBeforePosition(i, paramBoolean);
              if (localObject != null)
              {
                if (((Group)localObject).getIndex() > 0) {}
                for (i = ((Group)localObject).getIndex() - 1;; i = 0)
                {
                  currentChapterIndex = i;
                  if (((Group)localObject).isEmpty()) {
                    break label220;
                  }
                  isManagingBreak = true;
                  apiBridge.pauseMainMedia(null);
                  notify("breakBegin", null);
                  break;
                }
                label220:
                ((Group)localObject).end();
                notify("mediaPlaybackComplete", null);
                notify("mediaPlaybackStarted", null);
              }
            }
          }
        }
      }
    }
  }
  
  private void onMediaSeekCompleteNotification(HashMap paramHashMap)
  {
    if ((skipAllBreaks) || (paramHashMap == null)) {
      return;
    }
    int i;
    do
    {
      Iterator localIterator;
      do
      {
        localIterator = paramHashMap.entrySet().iterator();
      } while (!localIterator.hasNext());
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (!((String)localEntry.getKey()).toLowerCase().equals("position".toLowerCase())) {
        break;
      }
      i = ObjectUtil.convertToInt(localEntry.getValue(), -1);
    } while (inSameChapter(lastPosition, i));
    onMediaPlayheadUpdateNotification(paramHashMap, false);
  }
  
  private boolean shouldPlayBreaksAtMarkers()
  {
    return adSettings.getPropertyAsBoolean("auditudePlayBreaksAtMarkers");
  }
  
  public final boolean HasBreak(int paramInt)
  {
    Group localGroup;
    if (paramInt < 0)
    {
      localGroup = getNextBreak();
      if (localGroup != null) {
        break label24;
      }
    }
    label24:
    while ((localGroup.isWatched()) || (localGroup.isEmpty()))
    {
      return false;
      localGroup = getBreakAtIndex(paramInt);
      break;
    }
    return true;
  }
  
  public final void dispose()
  {
    apiBridge.removeEventListener("apiEvent", this);
    breakManager.dispose();
    breakManager = null;
    chapterManager.dispose();
    chapterManager = null;
    viewManager.dispose();
    viewManager = null;
    if (response != null)
    {
      response.dispose();
      response = null;
    }
  }
  
  public final void notify(String paramString, HashMap paramHashMap)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {}
    do
    {
      return;
      if ("breakBegin".equalsIgnoreCase(paramString))
      {
        onBreakBeginNotification(paramHashMap);
        return;
      }
      if ("breakEnd".equalsIgnoreCase(paramString))
      {
        onBreakEndNotification(paramHashMap);
        return;
      }
      if ("mediaPlaybackStarted".equalsIgnoreCase(paramString))
      {
        onMediaPlaybackStartedNotification(paramHashMap);
        return;
      }
      if ("mediaPlaybackComplete".equalsIgnoreCase(paramString))
      {
        onMediaPlaybackCompleteNotification(paramHashMap);
        return;
      }
      if ("mediaPlaybackPaused".equalsIgnoreCase(paramString))
      {
        onMediaPlaybackPausedNotification(paramHashMap);
        return;
      }
      if ("mediaPlaybackResumed".equalsIgnoreCase(paramString))
      {
        onMediaPlaybackResumedNotification(paramHashMap);
        return;
      }
      if ("mediaSeekComplete".equalsIgnoreCase(paramString))
      {
        onMediaSeekCompleteNotification(paramHashMap);
        return;
      }
    } while (!"mediaProgress".equalsIgnoreCase(paramString));
    onMediaPlayheadUpdateNotification(paramHashMap, shouldPlayBreaksAtMarkers());
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if (((paramObject instanceof AdPluginEvent)) && (((AdPluginEvent)paramObject).getType().equalsIgnoreCase("breakEnd")) && (isManagingBreak))
    {
      isManagingBreak = false;
      apiBridge.resumeMainMedia(null);
      if (currentChapterIndex >= 0) {
        notify("mediaPlaybackStarted", null);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.session.AdExperienceController
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */