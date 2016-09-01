package com.adobe.mobile;

import java.util.ArrayList;
import java.util.Iterator;

class MobileConfig$6
  implements Runnable
{
  MobileConfig$6(MobileConfig paramMobileConfig) {}
  
  public void run()
  {
    if ((MobileConfig.access$300(this$0) == null) || (MobileConfig.access$300(this$0).size() <= 0))
    {
      RemoteDownload.deleteFilesInDirectory("messageImages");
      return;
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = MobileConfig.access$300(this$0).iterator();
    break label92;
    label48:
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
      localObject1 = (Message)localIterator.next();
    } while ((assets == null) || (assets.size() <= 0));
    Object localObject1 = assets.iterator();
    for (;;)
    {
      label92:
      if (!((Iterator)localObject1).hasNext()) {
        break label48;
      }
      Object localObject2 = (ArrayList)((Iterator)localObject1).next();
      if (((ArrayList)localObject2).size() <= 0) {
        break;
      }
      localObject2 = ((ArrayList)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        String str = (String)((Iterator)localObject2).next();
        localArrayList.add(str);
        RemoteDownload.remoteDownloadSync(str, 10000, 10000, null, "messageImages");
      }
    }
    if (localArrayList.size() > 0)
    {
      RemoteDownload.deleteFilesForDirectoryNotInList("messageImages", localArrayList);
      return;
    }
    RemoteDownload.deleteFilesInDirectory("messageImages");
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */