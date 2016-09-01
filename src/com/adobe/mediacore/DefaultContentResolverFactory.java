package com.adobe.mediacore;

import android.content.Context;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import com.adobe.mediacore.timeline.advertising.MetadataResolver;
import com.adobe.mediacore.timeline.advertising.auditude.AuditudeResolver;
import com.adobe.mediacore.timeline.advertising.customadmarkers.CustomAdMarkersContentResolver;
import com.adobe.mediacore.timeline.advertising.customadmarkers.DeleteContentResolver;
import java.util.ArrayList;
import java.util.List;

class DefaultContentResolverFactory
{
  public static ContentResolver createContentResolver(MediaResource paramMediaResource, Context paramContext)
  {
    paramMediaResource = (MetadataNode)paramMediaResource.getMetadata();
    if (paramMediaResource != null)
    {
      if (paramMediaResource.containsKey(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue())) {
        return new AuditudeResolver(paramContext);
      }
      if (paramMediaResource.containsKey(DefaultMetadataKeys.JSON_METADATA_KEY.getValue())) {
        return new MetadataResolver();
      }
      if (paramMediaResource.containsKey(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())) {
        return new CustomAdMarkersContentResolver();
      }
    }
    return null;
  }
  
  public static List createContentResolvers(MediaResource paramMediaResource, Context paramContext)
  {
    ArrayList localArrayList = new ArrayList();
    paramMediaResource = (MetadataNode)paramMediaResource.getMetadata();
    String str;
    if (paramMediaResource != null)
    {
      if (paramMediaResource.containsKey(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())) {
        localArrayList.add(new CustomAdMarkersContentResolver());
      }
      if (paramMediaResource.containsKey(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue()))
      {
        str = paramMediaResource.getValue(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue());
        if (!str.equals("delete")) {
          break label124;
        }
        localArrayList.add(new DeleteContentResolver());
      }
      if (!paramMediaResource.containsKey(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue())) {
        break label176;
      }
      localArrayList.add(new AuditudeResolver(paramContext));
    }
    label124:
    label176:
    while (!paramMediaResource.containsKey(DefaultMetadataKeys.JSON_METADATA_KEY.getValue()))
    {
      return localArrayList;
      if (str.equals("replace"))
      {
        localArrayList.add(new DeleteContentResolver());
        break;
      }
      if (!str.equals("mark")) {
        break;
      }
      localArrayList.add(new CustomAdMarkersContentResolver());
      break;
    }
    localArrayList.add(new MetadataResolver());
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultContentResolverFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */