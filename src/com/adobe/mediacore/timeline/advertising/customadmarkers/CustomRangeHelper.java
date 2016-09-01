package com.adobe.mediacore.timeline.advertising.customadmarkers;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.utils.ReplacementTimeRange;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

public class CustomRangeHelper
{
  public static final String DELETE_RANGE = "delete";
  private static final String LOG_TAG = "[PSDK]::[CustomRangeHelper]::" + CustomRangeHelper.class.getSimpleName();
  public static final String MARK_RANGE = "mark";
  public static final String REPLACE_RANGE = "replace";
  private String _key;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private Metadata _metadata;
  
  public CustomRangeHelper(Metadata paramMetadata)
  {
    _metadata = paramMetadata;
  }
  
  public MetadataNode extractCustomTimeRangeMetadata()
  {
    Object localObject = null;
    MetadataNode localMetadataNode1 = null;
    if ((_metadata instanceof MetadataNode))
    {
      MetadataNode localMetadataNode2 = (MetadataNode)_metadata;
      localObject = localMetadataNode1;
      if (localMetadataNode2.containsNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())) {
        localObject = localMetadataNode2.getNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue());
      }
      if (localMetadataNode2.containsKey(DefaultMetadataKeys.ADVERTISING_METADATA.getValue()))
      {
        localMetadataNode1 = localMetadataNode2.getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
        localObject = localMetadataNode1;
        if (localMetadataNode1 != null)
        {
          if (!localMetadataNode1.containsNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())) {
            break label104;
          }
          localObject = localMetadataNode1.getNode(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue());
        }
      }
    }
    label104:
    do
    {
      return (MetadataNode)localObject;
      localObject = localMetadataNode1;
    } while (!localMetadataNode1.containsNode(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue()));
    return localMetadataNode1.getNode(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue());
  }
  
  public List extractCustomTimeRanges(Metadata paramMetadata)
  {
    ArrayList localArrayList = new ArrayList();
    MetadataNode localMetadataNode = ((MetadataNode)paramMetadata).getNode("time_range_list");
    Iterator localIterator = new TreeSet(localMetadataNode.keySet()).iterator();
    Long localLong1;
    Long localLong2;
    if (localIterator.hasNext())
    {
      paramMetadata = localMetadataNode.getNode((String)localIterator.next());
      localLong1 = Long.valueOf(Long.parseLong(paramMetadata.getValue("time_range_begin")));
      localLong2 = Long.valueOf(Long.parseLong(paramMetadata.getValue("time_range_end")));
      if (!paramMetadata.containsKey("replacement_duration")) {
        break label388;
      }
    }
    label388:
    for (paramMetadata = Long.valueOf(Long.parseLong(paramMetadata.getValue("replacement_duration")));; paramMetadata = Long.valueOf(0L))
    {
      if (localLong2.longValue() < 0L)
      {
        _logger.w(LOG_TAG + "#extractCustomTimeRanges", "Invalid TimeRange [" + localLong1 + ", " + localLong2 + "], 'end' value is less than 0, time range ignored");
        break;
      }
      if (localLong1.longValue() < 0L)
      {
        _logger.w(LOG_TAG + "#extractCustomTimeRanges", "Invalid TimeRange [" + localLong1 + ", " + localLong2 + "], modified 'begin' to 0");
        localLong1 = Long.valueOf(0L);
      }
      for (;;)
      {
        if (localLong1.longValue() >= localLong2.longValue())
        {
          _logger.w(LOG_TAG + "#extractCustomTimeRanges", "Invalid TimeRange [" + localLong1 + ", " + localLong2 + "], 'begin' value must not be greater then or equal to 'end', time range ignored.");
          break;
        }
        localArrayList.add(ReplacementTimeRange.createRange(localLong1.longValue(), localLong2.longValue() - localLong1.longValue(), paramMetadata.longValue()));
        break;
        Collections.sort(localArrayList);
        return localArrayList;
      }
    }
  }
  
  public String hasRanges()
  {
    _key = null;
    String str;
    if ((_metadata != null) && (_metadata.containsKey(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue())))
    {
      str = _metadata.getValue(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue());
      if (!str.equals("delete")) {
        break label97;
      }
      _key = "delete";
    }
    for (;;)
    {
      if ((_metadata != null) && (_metadata.containsKey(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue()))) {
        _key = "mark";
      }
      return _key;
      label97:
      if (str.equals("replace")) {
        _key = "replace";
      } else if (str.equals("mark")) {
        _key = "mark";
      }
    }
  }
  
  public List mergeRanges(List paramList)
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject = (ReplacementTimeRange)paramList.get(0);
    localArrayList.add(localObject);
    int i = 1;
    if (i < paramList.size())
    {
      ReplacementTimeRange localReplacementTimeRange = (ReplacementTimeRange)paramList.get(i);
      if (localReplacementTimeRange.getBegin() > ((ReplacementTimeRange)localObject).getBegin()) {
        if (localReplacementTimeRange.getBegin() > ((ReplacementTimeRange)localObject).getEnd()) {
          localArrayList.add(localReplacementTimeRange);
        }
      }
      for (;;)
      {
        i += 1;
        localObject = localReplacementTimeRange;
        break;
        if (localReplacementTimeRange.getEnd() > ((ReplacementTimeRange)localObject).getEnd())
        {
          localReplacementTimeRange = ReplacementTimeRange.createRange(((ReplacementTimeRange)localObject).getBegin(), localReplacementTimeRange.getEnd() - ((ReplacementTimeRange)localObject).getBegin(), ((ReplacementTimeRange)localObject).getReplacementDuration());
          localArrayList.remove(localObject);
          localArrayList.add(localReplacementTimeRange);
          _logger.w(LOG_TAG + "#mergeRanges", "Adjusting timerange due to overlap between prev and current timerange: New Timerange " + localReplacementTimeRange);
        }
        else if (localReplacementTimeRange.getEnd() < ((ReplacementTimeRange)localObject).getEnd())
        {
          _logger.w(LOG_TAG + "#mergeRanges", "TimeRange " + localReplacementTimeRange + " was not added because it is a subset " + "of the previous timerange");
          continue;
          if (localReplacementTimeRange.getBegin() == ((ReplacementTimeRange)localObject).getBegin()) {
            if (localReplacementTimeRange.getEnd() > ((ReplacementTimeRange)localObject).getEnd())
            {
              localReplacementTimeRange = ReplacementTimeRange.createRange(((ReplacementTimeRange)localObject).getBegin(), localReplacementTimeRange.getEnd() - ((ReplacementTimeRange)localObject).getBegin(), ((ReplacementTimeRange)localObject).getReplacementDuration());
              localArrayList.remove(localObject);
              localArrayList.add(localReplacementTimeRange);
              _logger.w(LOG_TAG + "#mergeRanges", "Adjusting timerange due to overlap between prev and current timerange: New Timerange " + localReplacementTimeRange);
            }
            else if (localReplacementTimeRange.getEnd() < ((ReplacementTimeRange)localObject).getEnd())
            {
              _logger.w(LOG_TAG + "#mergeRanges", "TimeRange " + localReplacementTimeRange + " was not added because it is a subset " + "of the previous timerange");
            }
          }
        }
      }
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.customadmarkers.CustomRangeHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */