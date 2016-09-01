package com.adobe.mobile;

import java.util.HashMap;

final class MessageMatcher$1
  extends HashMap
{
  MessageMatcher$1()
  {
    put("eq", MessageMatcherEquals.class);
    put("ne", MessageMatcherNotEquals.class);
    put("gt", MessageMatcherGreaterThan.class);
    put("ge", MessageMatcherGreaterThanOrEqual.class);
    put("lt", MessageMatcherLessThan.class);
    put("le", MessageMatcherLessThanOrEqual.class);
    put("co", MessageMatcherContains.class);
    put("nc", MessageMatcherNotContains.class);
    put("sw", MessageMatcherStartsWith.class);
    put("ew", MessageMatcherEndsWith.class);
    put("ex", MessageMatcherExists.class);
    put("nx", MessageMatcherNotExists.class);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcher.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */