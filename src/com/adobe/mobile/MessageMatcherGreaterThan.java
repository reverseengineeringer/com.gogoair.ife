package com.adobe.mobile;

import java.util.ArrayList;
import java.util.Iterator;

final class MessageMatcherGreaterThan
  extends MessageMatcher
{
  protected boolean matches(Object paramObject)
  {
    paramObject = tryParseDouble(paramObject);
    if (paramObject == null) {
      return false;
    }
    Iterator localIterator = values.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = localIterator.next();
      if (((localObject instanceof Number)) && (((Double)paramObject).doubleValue() > ((Number)localObject).doubleValue())) {
        return true;
      }
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcherGreaterThan
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */