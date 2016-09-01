package com.adobe.mobile;

import java.util.Map;

class MessageMatcherExists
  extends MessageMatcher
{
  protected boolean matchesInMaps(Map... paramVarArgs)
  {
    Object localObject2 = null;
    if ((paramVarArgs == null) || (paramVarArgs.length <= 0)) {}
    Object localObject1;
    do
    {
      return false;
      int j = paramVarArgs.length;
      int i = 0;
      localObject1 = localObject2;
      if (i < j)
      {
        localObject1 = paramVarArgs[i];
        if (localObject1 == null) {}
        while (!((Map)localObject1).containsKey(key))
        {
          i += 1;
          break;
        }
        localObject1 = ((Map)localObject1).get(key);
      }
    } while (localObject1 == null);
    return true;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcherExists
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */