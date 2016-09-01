package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.utils.NumberUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

final class SpliceOutPlacementOpportunityDetector
  implements PlacementOpportunityDetector
{
  private static final String LOG_TAG = "[PSDK]::" + SpliceOutPlacementOpportunityDetector.class.getSimpleName();
  private static final String OPPORTUNITY_DURATION_KEY = "DURATION";
  private static final String[] OPPORTUNITY_ELAPSED_TIME_KEY = { "ELAPSEDTIME", "ELAPSED" };
  private static final String OPPORTUNITY_ID_KEY = "ID";
  private static final String OPPORTUNITY_TYPE_KEY = "TYPE";
  private static final String OPPORTUNITY_TYPE_VALUE = "SpliceOut";
  private Logger _logger = Log.getLogger(LOG_TAG);
  private MediaPlayerItem _mediaPlayerItem;
  
  public SpliceOutPlacementOpportunityDetector(MediaPlayerItem paramMediaPlayerItem)
  {
    _mediaPlayerItem = paramMediaPlayerItem;
  }
  
  private PlacementOpportunity createOpportunity(TimedMetadata paramTimedMetadata, Metadata paramMetadata)
  {
    long l2 = paramTimedMetadata.getTime();
    paramTimedMetadata = paramTimedMetadata.getMetadata();
    String[] arrayOfString = OPPORTUNITY_ELAPSED_TIME_KEY;
    int j = arrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = arrayOfString[i];
      if ((paramTimedMetadata.containsKey(str)) && (NumberUtils.parseNumber(paramTimedMetadata.getValue(str), 1L) != 0L)) {
        return null;
      }
      i += 1;
    }
    if (paramTimedMetadata.containsKey("DURATION")) {}
    for (long l1 = NumberUtils.parseNumber(paramTimedMetadata.getValue("DURATION"), 0L) * 1000L;; l1 = 0L)
    {
      if (paramTimedMetadata.containsKey("ID")) {}
      for (paramTimedMetadata = paramTimedMetadata.getValue("ID");; paramTimedMetadata = null)
      {
        if ((paramTimedMetadata == null) || (l1 <= 0L)) {
          return null;
        }
        return new PlacementOpportunity(paramTimedMetadata, new PlacementInformation(PlacementInformation.Type.MID_ROLL, l2, l1), paramMetadata);
      }
    }
  }
  
  private boolean isCueTagSupported(TimedMetadata paramTimedMetadata, MediaPlayerItem paramMediaPlayerItem)
  {
    return (paramMediaPlayerItem == null) || (paramMediaPlayerItem.getAdTags() == null) || (paramMediaPlayerItem.getAdTags().contains(paramTimedMetadata.getName()));
  }
  
  private boolean isOpportunity(TimedMetadata paramTimedMetadata)
  {
    paramTimedMetadata = paramTimedMetadata.getMetadata();
    return (paramTimedMetadata != null) && (paramTimedMetadata.containsKey("TYPE")) && (paramTimedMetadata.getValue("TYPE").equalsIgnoreCase("SpliceOut"));
  }
  
  public List process(List paramList, Metadata paramMetadata)
  {
    _logger.i(LOG_TAG + "#process", "Processing [" + paramList.size() + "] timed metadata, in order to provide placement opportunities.");
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      TimedMetadata localTimedMetadata = (TimedMetadata)paramList.next();
      if ((isCueTagSupported(localTimedMetadata, _mediaPlayerItem)) && (isOpportunity(localTimedMetadata)))
      {
        _logger.i(LOG_TAG + "#process", "Processing " + localTimedMetadata.toString());
        PlacementOpportunity localPlacementOpportunity = createOpportunity(localTimedMetadata, paramMetadata);
        if (localPlacementOpportunity != null)
        {
          _logger.i(LOG_TAG + "#process", "Ad placement placementOpportunity created for timed metadata ID [" + localTimedMetadata.getId() + "] .[" + "  placementOpportunity time=" + String.valueOf(localPlacementOpportunity.getPlacementInformation().getTime()) + ", placementOpportunity duration=" + String.valueOf(localPlacementOpportunity.getPlacementInformation().getDuration()) + "].");
          localArrayList.add(localPlacementOpportunity);
        }
        else
        {
          _logger.w(LOG_TAG + "#process", "Ad placement placementOpportunity creation has failed. Probably has invalid metadata. placementOpportunity time = " + String.valueOf(localTimedMetadata.getTime()) + ", metadata: " + localTimedMetadata.getMetadata() + "].");
        }
      }
      else
      {
        _logger.w(LOG_TAG + "#process", "Ad placement placementOpportunity creation has failed. Probably has invalid metadata. placementOpportunity time = " + String.valueOf(localTimedMetadata.getTime()) + ", metadata: " + localTimedMetadata.getMetadata() + "].");
      }
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.SpliceOutPlacementOpportunityDetector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */