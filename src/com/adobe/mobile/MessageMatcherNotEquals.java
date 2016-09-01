package com.adobe.mobile;

final class MessageMatcherNotEquals
  extends MessageMatcherEquals
{
  protected boolean matches(Object paramObject)
  {
    return !super.matches(paramObject);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcherNotEquals
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */