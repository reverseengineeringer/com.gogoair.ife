package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.MediaResource.Type;
import com.adobe.mediacore.utils.NumberUtils;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class MetadataResolver$AdvertisingJSONFactory
{
  private MetadataResolver$AdvertisingJSONFactory(MetadataResolver paramMetadataResolver) {}
  
  private AdClick createAdClick(JSONObject paramJSONObject)
    throws JSONException
  {
    if (paramJSONObject.toString().contains("click-info"))
    {
      paramJSONObject = paramJSONObject.getJSONArray("click-info").getJSONObject(0);
      String str1 = paramJSONObject.getString("title");
      String str2 = paramJSONObject.getString("url");
      return new AdClick(paramJSONObject.getString("id"), str1, str2);
    }
    return new AdClick("", "", "");
  }
  
  private AdAsset createPrimaryAdAsset(JSONObject paramJSONObject, long paramLong, int paramInt)
    throws JSONException
  {
    return new AdAsset(paramInt, paramLong, MediaResource.createFromUrl(paramJSONObject.getString("url"), null), createAdClick(paramJSONObject), null, "");
  }
  
  private int getNextTimelineId()
  {
    try
    {
      int i = MetadataResolver.access$108(this$0);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public Ad createAd(JSONObject paramJSONObject)
    throws JSONException
  {
    long l = NumberUtils.parseLong(paramJSONObject.getString("duration"), -1L);
    int i = getNextTimelineId();
    paramJSONObject = createPrimaryAdAsset(paramJSONObject, l, i);
    return Ad.createAd(MediaResource.Type.HLS, l, i, paramJSONObject, new ArrayList(), null, false);
  }
  
  public AdBreakPlacement createAdBreakPlacement(JSONObject paramJSONObject)
    throws JSONException
  {
    String str = paramJSONObject.getString("tag");
    long l1 = NumberUtils.parseNumber(paramJSONObject.getString("time"), -1L);
    long l2 = NumberUtils.parseNumber(paramJSONObject.getString("replace"), 0L);
    List localList = createAds(paramJSONObject.getJSONArray("ad-list"));
    paramJSONObject = PlacementInformation.Type.MID_ROLL;
    if (l1 == 0L) {
      paramJSONObject = PlacementInformation.Type.PRE_ROLL;
    }
    paramJSONObject = new PlacementInformation(paramJSONObject, l1, l2);
    return new AdBreakPlacement(AdBreak.createAdBreak(localList, l1, l2, str), paramJSONObject);
  }
  
  public List createAdBreakPlacements(JSONArray paramJSONArray)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramJSONArray.length();
    if (j > 0)
    {
      int i = 0;
      while (i < j)
      {
        localArrayList.add(createAdBreakPlacement(paramJSONArray.getJSONObject(i)));
        i += 1;
      }
    }
    return localArrayList;
  }
  
  public List createAds(JSONArray paramJSONArray)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramJSONArray.length();
    if (j > 0)
    {
      int i = 0;
      while (i < j)
      {
        localArrayList.add(createAd(paramJSONArray.getJSONObject(i)));
        i += 1;
      }
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.MetadataResolver.AdvertisingJSONFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */