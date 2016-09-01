package com.adobe.mediacore.timeline.advertising.customadmarkers;

import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.advertising.ContentRemoval;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import com.adobe.mediacore.timeline.advertising.ContentTracker;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Mode;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.utils.ReplacementTimeRange;
import com.adobe.mediacore.utils.TimeRange;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class DeleteContentResolver
  extends ContentResolver
{
  private static final String LOG_TAG = "[PSDK]::[DeleteContentResolver]::" + DeleteContentResolver.class.getSimpleName();
  private final Logger _logger = Log.getLogger(LOG_TAG);
  
  private PlacementInformation createPlacementInformation(TimeRange paramTimeRange)
  {
    return new PlacementInformation(PlacementInformation.Type.CUSTOM_TIME_RANGES, PlacementInformation.Mode.DELETE, paramTimeRange.getBegin(), paramTimeRange.getDuration());
  }
  
  private List createTimelineOperations(List paramList)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramList.isEmpty()) {
      return localArrayList;
    }
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      localArrayList.add(new ContentRemoval(createPlacementInformation((ReplacementTimeRange)paramList.next())));
    }
    return localArrayList;
  }
  
  private void handleInvalidMetadata(Exception paramException)
  {
    _logger.w(LOG_TAG + "#handleInvalidMetadata", String.valueOf(paramException.getMessage()));
    MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.AD_RESOLVER_METADATA_INVALID, "Invalid custom time range metadata.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("DESCRIPTION", paramException.getMessage());
    localError.setMetadata(localMetadataNode);
    notifyResolveError(localError);
  }
  
  private void processDeleteRanges(PlacementOpportunity paramPlacementOpportunity, CustomRangeHelper paramCustomRangeHelper)
  {
    try
    {
      notifyResolveComplete(createTimelineOperations(paramCustomRangeHelper.mergeRanges(paramCustomRangeHelper.extractCustomTimeRanges(paramCustomRangeHelper.extractCustomTimeRangeMetadata()))));
      return;
    }
    catch (Exception paramPlacementOpportunity)
    {
      handleInvalidMetadata(paramPlacementOpportunity);
    }
  }
  
  protected boolean doCanResolve(PlacementOpportunity paramPlacementOpportunity)
  {
    return paramPlacementOpportunity.getPlacementInformation().getMode() == PlacementInformation.Mode.DELETE;
  }
  
  protected ContentTracker doProvideAdTracker()
  {
    return null;
  }
  
  protected void doResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    processDeleteRanges(paramPlacementOpportunity, new CustomRangeHelper(paramMetadata));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.customadmarkers.DeleteContentResolver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */