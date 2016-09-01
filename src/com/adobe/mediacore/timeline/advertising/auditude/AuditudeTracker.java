package com.adobe.mediacore.timeline.advertising.auditude;

import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AuditudeSettings;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.ContentTracker;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.smil.Par;
import com.auditude.ads.model.smil.Ref;
import com.auditude.ads.model.smil.Sequence;
import com.auditude.ads.reporting.ReportingHelper;

public class AuditudeTracker
  implements ContentTracker
{
  private final String LOG_TAG = "[PSDK]::[AuditudeAd]::" + AuditudeTracker.class.getSimpleName();
  private Logger _logger = Log.getLogger(LOG_TAG);
  private final ReportingHelper auditudeAdReporter;
  private Sequence currentSequence;
  
  public AuditudeTracker(ReportingHelper paramReportingHelper)
  {
    auditudeAdReporter = paramReportingHelper;
  }
  
  private Ref retrieveReference(Ad paramAd)
  {
    paramAd = paramAd.getPrimaryAsset();
    if (paramAd != null)
    {
      paramAd = paramAd.getMediaResource();
      if (paramAd != null)
      {
        paramAd = paramAd.getMetadata();
        if ((paramAd instanceof AuditudeSettings))
        {
          paramAd = ((AuditudeSettings)paramAd).getData();
          if ((paramAd instanceof Ref)) {
            return (Ref)paramAd;
          }
        }
      }
    }
    return null;
  }
  
  public void onAdBreakComplete(AdBreak paramAdBreak)
  {
    if (currentSequence != null)
    {
      auditudeAdReporter.onSequenceEnd(currentSequence);
      currentSequence = null;
    }
  }
  
  public void onAdBreakStart(AdBreak paramAdBreak)
  {
    currentSequence = null;
  }
  
  public void onAdClick(Ad paramAd)
  {
    paramAd = retrieveReference(paramAd);
    if (paramAd != null)
    {
      _logger.i(LOG_TAG + "#onAdClick()", "Reporting AD-CLICK.");
      auditudeAdReporter.onAdClick(paramAd);
    }
  }
  
  public void onAdComplete(Ad paramAd)
  {
    paramAd = retrieveReference(paramAd);
    if (paramAd != null)
    {
      _logger.i(LOG_TAG + "#onAdComplete()", "Reporting AD-COMPLETE.");
      auditudeAdReporter.onAdComplete(paramAd);
      if (paramAd.getPrimaryAsset() != null) {
        paramAd.getPrimaryAsset().Reset();
      }
    }
  }
  
  public void onAdError(Ad paramAd)
  {
    paramAd = retrieveReference(paramAd);
    if (paramAd != null)
    {
      _logger.i(LOG_TAG + "#onAdError()", "Reporting AD-ERROR.");
      auditudeAdReporter.onAdError(paramAd);
    }
  }
  
  public void onAdProgress(Ad paramAd, int paramInt)
  {
    paramAd = retrieveReference(paramAd);
    if (paramAd != null)
    {
      _logger.i(LOG_TAG + "#onAdProgress()", "Reporting AD-PROGRESS: " + paramInt + "%");
      auditudeAdReporter.onAdProgress(paramAd, 100, paramInt);
    }
  }
  
  public void onAdStart(Ad paramAd)
  {
    paramAd = retrieveReference(paramAd);
    Sequence localSequence;
    if ((paramAd != null) && (paramAd.getPar() != null) && (paramAd.getPar().getSequence() != null))
    {
      localSequence = paramAd.getPar().getSequence();
      if (currentSequence == null) {
        break label120;
      }
      if (localSequence != currentSequence)
      {
        auditudeAdReporter.onSequenceEnd(currentSequence);
        auditudeAdReporter.onSequenceBegin(localSequence);
      }
    }
    for (;;)
    {
      currentSequence = localSequence;
      if (paramAd != null)
      {
        _logger.i(LOG_TAG + "#onAdStart()", "Reporting AD-START.");
        auditudeAdReporter.onAdStart(paramAd);
      }
      return;
      label120:
      auditudeAdReporter.onSequenceBegin(localSequence);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.auditude.AuditudeTracker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */