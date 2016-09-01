package com.adobe.mobile;

import android.net.Uri;
import com.google.android.gms.wearable.DataEvent;
import com.google.android.gms.wearable.DataEventBuffer;
import com.google.android.gms.wearable.DataItem;
import java.util.Iterator;

public final class DataListenerWearable
{
  public static void onDataChanged(DataEventBuffer paramDataEventBuffer)
  {
    if (paramDataEventBuffer == null) {}
    for (;;)
    {
      return;
      paramDataEventBuffer = paramDataEventBuffer.iterator();
      while (paramDataEventBuffer.hasNext())
      {
        Object localObject = (DataEvent)paramDataEventBuffer.next();
        if (((DataEvent)localObject).getType() == 1)
        {
          localObject = ((DataEvent)localObject).getDataItem();
          if (localObject != null)
          {
            Uri localUri = ((DataItem)localObject).getUri();
            if ((localUri != null) && (localUri.getPath() != null) && (localUri.getPath().startsWith("/abdmobile/data/config/"))) {
              ConfigSynchronizer.restoreConfig((DataItem)localObject);
            }
          }
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.DataListenerWearable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */