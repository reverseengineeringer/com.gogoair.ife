package com.adobe.mobile;

import java.util.ArrayList;
import java.util.Iterator;

class MessageMatcherEquals
  extends MessageMatcher
{
  protected boolean matches(Object paramObject)
  {
    Iterator localIterator = values.iterator();
    while (localIterator.hasNext())
    {
      Object localObject = localIterator.next();
      if (((localObject instanceof String)) && ((paramObject instanceof String)))
      {
        if (localObject.toString().compareToIgnoreCase(paramObject.toString()) == 0) {
          return true;
        }
      }
      else if (((localObject instanceof Number)) && ((paramObject instanceof Number)))
      {
        if (((Number)localObject).doubleValue() == ((Number)paramObject).doubleValue()) {
          return true;
        }
      }
      else if (((localObject instanceof Number)) && ((paramObject instanceof String)))
      {
        if ((tryParseDouble(paramObject) != null) && (((Number)localObject).doubleValue() == tryParseDouble(paramObject).doubleValue())) {
          return true;
        }
      }
      else if (((localObject instanceof String)) && ((paramObject instanceof Number)) && (localObject.toString().compareToIgnoreCase(paramObject.toString()) == 0)) {
        return true;
      }
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcherEquals
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */