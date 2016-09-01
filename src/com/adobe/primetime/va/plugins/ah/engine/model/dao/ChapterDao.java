package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class ChapterDao
  extends Dao
{
  private static final String REALM = "stream";
  private String _id;
  private double _length;
  private String _name;
  private double _offset;
  private long _position;
  private String _sid;
  
  public ChapterDao()
  {
    this(null);
  }
  
  public ChapterDao(ChapterDao paramChapterDao)
  {
    super("stream");
    if (paramChapterDao != null)
    {
      setId(paramChapterDao.getId());
      setSid(paramChapterDao.getSid());
      setName(paramChapterDao.getName());
      setPosition(paramChapterDao.getPosition());
      setLength(paramChapterDao.getLength());
      setOffset(paramChapterDao.getOffset());
      return;
    }
    _id = "";
    _sid = "";
    _name = "";
    _position = 0L;
    _length = 0.0D;
    _offset = 0.0D;
  }
  
  public String getId()
  {
    return _id;
  }
  
  public double getLength()
  {
    return _length;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public double getOffset()
  {
    return _offset;
  }
  
  public long getPosition()
  {
    return _position;
  }
  
  public String getSid()
  {
    return _sid;
  }
  
  public void setId(String paramString)
  {
    _id = paramString;
    setField("chapter_id", paramString, null);
  }
  
  public void setLength(double paramDouble)
  {
    _length = paramDouble;
    setField("chapter_length", Double.valueOf(paramDouble), null);
  }
  
  public void setName(String paramString)
  {
    _name = paramString;
    setField("chapter_name", paramString, null);
  }
  
  public void setOffset(double paramDouble)
  {
    _offset = paramDouble;
    setField("chapter_offset", Double.valueOf(paramDouble), null);
  }
  
  public void setPosition(long paramLong)
  {
    _position = paramLong;
    setField("chapter_pos", Long.valueOf(paramLong), null);
  }
  
  public void setSid(String paramString)
  {
    _sid = paramString;
    setField("chapter_sid", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.ChapterDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */