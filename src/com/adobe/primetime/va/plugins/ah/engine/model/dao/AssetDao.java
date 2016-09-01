package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class AssetDao
  extends Dao
{
  private static final String REALM = "asset";
  public static final String TYPE_AD = "ad";
  public static final String TYPE_MAIN_CONTENT = "main";
  private AdDao _adData;
  private ChapterDao _chapterData;
  private double _duration;
  private String _name;
  private String _publisher;
  private String _type;
  private String _videoId;
  
  public AssetDao()
  {
    this(null);
  }
  
  public AssetDao(AssetDao paramAssetDao)
  {
    super("asset");
    if (paramAssetDao != null)
    {
      setType(paramAssetDao.getType());
      setName(paramAssetDao.getName());
      setVideoId(paramAssetDao.getVideoId());
      setPublisher(paramAssetDao.getPublisher());
      setDuration(paramAssetDao.getDuration());
      if (paramAssetDao.getAdData() != null) {
        setAdData(paramAssetDao.getAdData());
      }
      if (paramAssetDao.getChapterData() != null) {
        setChapterData(paramAssetDao.getChapterData());
      }
      return;
    }
    _type = "";
    _name = "";
    _videoId = "";
    _publisher = "";
    _duration = 0.0D;
    _adData = null;
    _chapterData = null;
  }
  
  public AdDao getAdData()
  {
    return _adData;
  }
  
  public ChapterDao getChapterData()
  {
    return _chapterData;
  }
  
  public double getDuration()
  {
    return _duration;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public String getPublisher()
  {
    return _publisher;
  }
  
  public String getType()
  {
    return _type;
  }
  
  public String getVideoId()
  {
    return _videoId;
  }
  
  public void setAdData(AdDao paramAdDao)
  {
    _adData = paramAdDao;
    setField("ad_data", paramAdDao, null);
  }
  
  public void setChapterData(ChapterDao paramChapterDao)
  {
    _chapterData = paramChapterDao;
    setField("chapter_data", paramChapterDao, null);
  }
  
  public void setDuration(double paramDouble)
  {
    _duration = paramDouble;
    setField("length", Double.valueOf(paramDouble), null);
  }
  
  public void setName(String paramString)
  {
    _name = paramString;
    setField("name", paramString, null);
  }
  
  public void setPublisher(String paramString)
  {
    _publisher = paramString;
    setField("publisher", paramString, null);
  }
  
  public void setType(String paramString)
  {
    _type = paramString;
    setField("type", paramString, null);
  }
  
  public void setVideoId(String paramString)
  {
    _videoId = paramString;
    setField("video_id", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */