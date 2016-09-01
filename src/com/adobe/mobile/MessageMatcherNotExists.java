package com.adobe.mobile;

import java.util.Map;

class MessageMatcherNotExists
  extends MessageMatcherExists
{
  protected boolean matchesInMaps(Map... paramVarArgs)
  {
    return !super.matchesInMaps(paramVarArgs);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcherNotExists
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */