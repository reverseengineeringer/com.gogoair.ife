package com.adobe.mobile;

import java.util.ArrayList;
import java.util.Iterator;

final class Messages$2
  implements Runnable
{
  public void run()
  {
    Object localObject = MobileConfig.getInstance().getInAppMessages();
    if ((localObject == null) || (((ArrayList)localObject).size() <= 0)) {}
    for (;;)
    {
      return;
      localObject = ((ArrayList)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        nextisVisible = false;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Messages.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */