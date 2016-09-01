package com.adobe.mediacore.timeline.advertising.customadmarkers;

import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.MediaResource.Type;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdClick;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import com.adobe.mediacore.timeline.advertising.ContentTracker;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Mode;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.utils.TimeRange;
import com.adobe.mediacore.utils.TimeRangeCollection.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

public final class CustomAdMarkersContentResolver
  extends ContentResolver
{
  public static final int DEFAULT_TIME_PREROLL = 0;
  private static final String LOG_TAG = "[PSDK]::[CustomAdMarkers]::" + CustomAdMarkersContentResolver.class.getSimpleName();
  private static int _nextAvailableAdId = 10000;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  
  private List extractAdBreakPlacements(List paramList, Metadata paramMetadata)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramList.isEmpty()) {
      return localArrayList;
    }
    Object localObject4 = (TimeRange)paramList.get(0);
    long l = ((TimeRange)localObject4).getBegin();
    Object localObject2 = new ArrayList();
    ((List)localObject2).add(timeRangeToAd((TimeRange)localObject4, paramMetadata));
    int i = 1;
    Object localObject1 = Long.valueOf(l);
    while (i < paramList.size())
    {
      Object localObject5 = (TimeRange)paramList.get(i);
      Long localLong = Long.valueOf(((TimeRange)localObject5).getBegin() - ((TimeRange)localObject4).getEnd());
      Object localObject3 = localObject5;
      if (localLong.longValue() < 0L)
      {
        localObject3 = Long.valueOf(Math.abs(localLong.longValue()));
        if (((TimeRange)localObject5).getBegin() + ((Long)localObject3).longValue() >= ((TimeRange)localObject5).getEnd())
        {
          _logger.w(LOG_TAG + "#extractAdBreakPlacements", "Failed to place custome ad-marker for timerange: " + localObject5 + ". Prev. time-range: " + localObject4);
          localObject3 = localObject1;
          localObject1 = localObject4;
          i += 1;
          localObject4 = localObject1;
          localObject1 = localObject3;
        }
        else
        {
          _logger.w(LOG_TAG + "#extractAdBreakPlacements", "Adjusting timerange: " + localObject5 + "with offset: " + localObject3 + ". Prev. time-range: " + localObject4);
          localObject3 = Long.valueOf(((TimeRange)localObject5).getBegin() + ((Long)localObject3).longValue());
          localObject3 = TimeRange.createRange(((Long)localObject3).longValue(), ((TimeRange)localObject5).getEnd() - ((Long)localObject3).longValue());
        }
      }
      else
      {
        localObject5 = Long.valueOf(((TimeRange)localObject3).getBegin() - ((TimeRange)localObject4).getEnd());
        if (((Long)localObject5).longValue() > 0L)
        {
          localObject2 = AdBreak.createAdBreak((List)localObject2, ((Long)localObject1).longValue(), 0L, "custom_ad_break");
          localArrayList.add(new AdBreakPlacement((AdBreak)localObject2, getPlacementInformation(((Long)localObject1).longValue(), ((AdBreak)localObject2).getDuration())));
          localObject2 = new ArrayList();
          ((List)localObject2).add(timeRangeToAd((TimeRange)localObject3, paramMetadata));
          localObject1 = Long.valueOf(((TimeRange)localObject3).getBegin());
        }
        for (;;)
        {
          localObject4 = localObject3;
          localObject3 = localObject1;
          localObject1 = localObject4;
          break;
          if (((Long)localObject5).longValue() != 0L) {
            break label497;
          }
          ((List)localObject2).add(timeRangeToAd((TimeRange)localObject3, paramMetadata));
        }
        label497:
        throw new IllegalStateException("Time-ranges should not overlap at this point. Current time-range: " + localObject3 + ". Prev. time-range: " + localObject4);
      }
    }
    if (!((List)localObject2).isEmpty())
    {
      paramList = AdBreak.createAdBreak((List)localObject2, ((Long)localObject1).longValue(), 0L, "custom_ad_break");
      localArrayList.add(new AdBreakPlacement(paramList, getPlacementInformation(((Long)localObject1).longValue(), paramList.getDuration())));
    }
    return localArrayList;
  }
  
  private MetadataNode extractCustomAdMarkersMetadata(Metadata paramMetadata)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    if ((paramMetadata instanceof MetadataNode))
    {
      paramMetadata = (MetadataNode)paramMetadata;
      localObject1 = localObject2;
      if (paramMetadata.containsNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())) {
        localObject1 = paramMetadata.getNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue());
      }
      if (paramMetadata.containsKey(DefaultMetadataKeys.ADVERTISING_METADATA.getValue()))
      {
        paramMetadata = paramMetadata.getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
        localObject1 = paramMetadata;
        if (paramMetadata != null)
        {
          if (!paramMetadata.containsNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())) {
            break label98;
          }
          localObject1 = paramMetadata.getNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue());
        }
      }
    }
    label98:
    do
    {
      return (MetadataNode)localObject1;
      localObject1 = paramMetadata;
    } while (!paramMetadata.containsNode(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue()));
    return paramMetadata.getNode(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue());
  }
  
  private List extractTimeRanges(Metadata paramMetadata)
  {
    ArrayList localArrayList = new ArrayList();
    paramMetadata = ((MetadataNode)paramMetadata).getNode("time_range_list");
    Iterator localIterator = new TreeSet(paramMetadata.keySet()).iterator();
    while (localIterator.hasNext())
    {
      Object localObject = paramMetadata.getNode((String)localIterator.next());
      Long localLong = Long.valueOf(Long.parseLong(((MetadataNode)localObject).getValue("time_range_begin")));
      localObject = Long.valueOf(Long.parseLong(((MetadataNode)localObject).getValue("time_range_end")));
      if (localLong.longValue() >= ((Long)localObject).longValue()) {
        throw new IllegalArgumentException("'begin' value must not be greater or equal than the 'end' value.");
      }
      localArrayList.add(TimeRange.createRange(localLong.longValue(), ((Long)localObject).longValue() - localLong.longValue()));
    }
    return localArrayList;
  }
  
  public static int getNextTimelineId()
  {
    try
    {
      int i = _nextAvailableAdId;
      _nextAvailableAdId = i + 1;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private PlacementInformation getPlacementInformation(long paramLong1, long paramLong2)
  {
    PlacementInformation.Type localType = PlacementInformation.Type.MID_ROLL;
    if (paramLong1 == 0L) {
      localType = PlacementInformation.Type.PRE_ROLL;
    }
    return new PlacementInformation(localType, PlacementInformation.Mode.MARK, paramLong1, paramLong2);
  }
  
  private AdAsset getPrimaryAdAssetForCustomAdMarker(Metadata paramMetadata, int paramInt, long paramLong)
  {
    AdClick localAdClick = new AdClick("", "", "");
    return new AdAsset(paramInt, paramLong, MediaResource.createFromMetadata(paramMetadata, MediaResource.Type.HLS), localAdClick, paramMetadata, "");
  }
  
  private void handleInvalidMetadata(Exception paramException)
  {
    _logger.w(LOG_TAG + "#handleInvalidMetadata", String.valueOf(paramException.getMessage()));
    MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.AD_RESOLVER_METADATA_INVALID, "Invalid JSON metadata.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("DESCRIPTION", paramException.getMessage());
    localError.setMetadata(localMetadataNode);
    notifyResolveError(localError);
  }
  
  private void processMetadata(Metadata paramMetadata, CustomRangeHelper paramCustomRangeHelper)
  {
    try
    {
      String str = DefaultMetadataKeys.METADATA_KEY_TYPE.getValue();
      if ((!paramMetadata.containsKey(str)) || (!paramMetadata.getValue(str).equals(TimeRangeCollection.Type.MARK_RANGES.getValue()))) {
        throw new IllegalArgumentException("Metadata type must be: " + str);
      }
    }
    catch (Exception paramMetadata)
    {
      handleInvalidMetadata(paramMetadata);
      return;
    }
    notifyResolveComplete(extractAdBreakPlacements(paramCustomRangeHelper.mergeRanges(paramCustomRangeHelper.extractCustomTimeRanges(paramCustomRangeHelper.extractCustomTimeRangeMetadata())), paramMetadata));
  }
  
  private Ad timeRangeToAd(TimeRange paramTimeRange, Metadata paramMetadata)
  {
    int i = getNextTimelineId();
    long l = paramTimeRange.getDuration();
    return Ad.createCustomAdMarker(MediaResource.Type.HLS, l, i, getPrimaryAdAssetForCustomAdMarker(paramMetadata, i, l));
  }
  
  protected boolean doCanResolve(PlacementOpportunity paramPlacementOpportunity)
  {
    return paramPlacementOpportunity.getPlacementInformation().getMode() == PlacementInformation.Mode.MARK;
  }
  
  protected ContentTracker doProvideAdTracker()
  {
    return null;
  }
  
  protected void doResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    processMetadata(extractCustomAdMarkersMetadata(paramMetadata), new CustomRangeHelper(paramMetadata));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.customadmarkers.CustomAdMarkersContentResolver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */