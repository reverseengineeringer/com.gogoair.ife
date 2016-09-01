package com.adobe.mediacore;

import com.adobe.ave.Timeline;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.utils.TimeRange;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

final class DRMMetadataCache
{
  private static final String LOG_TAG = "[PSDK]::" + DRMMetadataCache.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private List _drmMetadataInfos = Collections.emptyList();
  private List _internalDrmMetadataInfos = Collections.synchronizedList(new ArrayList());
  
  /* Error */
  boolean addDRMMetadata(DRMMetadataInfo paramDRMMetadataInfo)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 4
    //   3: aload_0
    //   4: monitorenter
    //   5: aload_0
    //   6: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   9: aload_1
    //   10: invokeinterface 70 2 0
    //   15: istore_2
    //   16: iload_2
    //   17: iconst_m1
    //   18: if_icmpeq +60 -> 78
    //   21: aload_0
    //   22: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   25: iload_2
    //   26: invokeinterface 74 2 0
    //   31: checkcast 76	com/adobe/mediacore/DRMMetadataInfo
    //   34: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   37: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   40: lstore 5
    //   42: aload_1
    //   43: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   46: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   49: lstore 7
    //   51: lload 5
    //   53: lload 7
    //   55: lcmp
    //   56: ifne +11 -> 67
    //   59: iconst_0
    //   60: istore 9
    //   62: aload_0
    //   63: monitorexit
    //   64: iload 9
    //   66: ireturn
    //   67: aload_0
    //   68: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   71: iload_2
    //   72: invokeinterface 89 2 0
    //   77: pop
    //   78: aload_1
    //   79: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   82: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   85: ldc2_w 90
    //   88: lcmp
    //   89: ifne +20 -> 109
    //   92: aload_0
    //   93: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   96: iconst_0
    //   97: aload_1
    //   98: invokeinterface 95 3 0
    //   103: iconst_1
    //   104: istore 9
    //   106: goto -44 -> 62
    //   109: aload_0
    //   110: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   113: invokeinterface 99 1 0
    //   118: iconst_1
    //   119: isub
    //   120: istore_2
    //   121: iload 4
    //   123: istore_3
    //   124: iload_2
    //   125: iflt +41 -> 166
    //   128: aload_0
    //   129: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   132: iload_2
    //   133: invokeinterface 74 2 0
    //   138: checkcast 76	com/adobe/mediacore/DRMMetadataInfo
    //   141: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   144: astore 10
    //   146: aload_1
    //   147: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   150: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   153: aload 10
    //   155: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   158: lcmp
    //   159: ifle +95 -> 254
    //   162: iload_2
    //   163: iconst_1
    //   164: iadd
    //   165: istore_3
    //   166: iload_3
    //   167: ifle +65 -> 232
    //   170: aload_0
    //   171: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   174: iload_3
    //   175: iconst_1
    //   176: isub
    //   177: invokeinterface 74 2 0
    //   182: checkcast 76	com/adobe/mediacore/DRMMetadataInfo
    //   185: astore 10
    //   187: aload 10
    //   189: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   192: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   195: ldc2_w 90
    //   198: lcmp
    //   199: ifeq +33 -> 232
    //   202: aload 10
    //   204: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   207: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   210: lstore 5
    //   212: aload 10
    //   214: lload 5
    //   216: aload_1
    //   217: invokevirtual 80	com/adobe/mediacore/DRMMetadataInfo:getTimeRange	()Lcom/adobe/mediacore/utils/TimeRange;
    //   220: invokevirtual 86	com/adobe/mediacore/utils/TimeRange:getBegin	()J
    //   223: lload 5
    //   225: lsub
    //   226: invokestatic 103	com/adobe/mediacore/utils/TimeRange:createRange	(JJ)Lcom/adobe/mediacore/utils/TimeRange;
    //   229: invokevirtual 107	com/adobe/mediacore/DRMMetadataInfo:setTimeRange	(Lcom/adobe/mediacore/utils/TimeRange;)V
    //   232: aload_0
    //   233: getfield 56	com/adobe/mediacore/DRMMetadataCache:_internalDrmMetadataInfos	Ljava/util/List;
    //   236: iload_3
    //   237: aload_1
    //   238: invokeinterface 95 3 0
    //   243: aload_0
    //   244: aconst_null
    //   245: putfield 62	com/adobe/mediacore/DRMMetadataCache:_drmMetadataInfos	Ljava/util/List;
    //   248: iconst_1
    //   249: istore 9
    //   251: goto -189 -> 62
    //   254: iload_2
    //   255: iconst_1
    //   256: isub
    //   257: istore_2
    //   258: goto -137 -> 121
    //   261: astore_1
    //   262: aload_0
    //   263: monitorexit
    //   264: aload_1
    //   265: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	266	0	this	DRMMetadataCache
    //   0	266	1	paramDRMMetadataInfo	DRMMetadataInfo
    //   15	243	2	i	int
    //   123	114	3	j	int
    //   1	121	4	k	int
    //   40	184	5	l1	long
    //   49	5	7	l2	long
    //   60	190	9	bool	boolean
    //   144	69	10	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   5	16	261	finally
    //   21	51	261	finally
    //   67	78	261	finally
    //   78	103	261	finally
    //   109	121	261	finally
    //   128	162	261	finally
    //   170	232	261	finally
    //   232	248	261	finally
  }
  
  public List getDRMMetadataInfos()
  {
    try
    {
      if (_drmMetadataInfos == null) {
        _drmMetadataInfos = Collections.unmodifiableList(_internalDrmMetadataInfos);
      }
      List localList = _drmMetadataInfos;
      return localList;
    }
    finally {}
  }
  
  public void reset()
  {
    try
    {
      _internalDrmMetadataInfos.clear();
      _drmMetadataInfos = Collections.emptyList();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  void update(Timeline paramTimeline, long paramLong)
  {
    if (paramTimeline == null) {}
    for (;;)
    {
      return;
      try
      {
        paramTimeline = new ArrayList();
        Iterator localIterator = _internalDrmMetadataInfos.iterator();
        while (localIterator.hasNext())
        {
          DRMMetadataInfo localDRMMetadataInfo = (DRMMetadataInfo)localIterator.next();
          if ((localDRMMetadataInfo.getTimeRange().getBegin() != -1L) && (localDRMMetadataInfo.getTimeRange().getEnd() < paramLong)) {
            paramTimeline.add(localDRMMetadataInfo);
          }
        }
        if (paramTimeline.size() <= 0) {
          break label173;
        }
      }
      finally {}
      _internalDrmMetadataInfos.removeAll(paramTimeline);
      _logger.i(LOG_TAG + "#update", "Removed " + paramTimeline.size() + " old DRMMetadataInfo.");
      label173:
      _drmMetadataInfos = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DRMMetadataCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */