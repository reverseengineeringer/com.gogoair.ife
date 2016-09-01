package com.adobe.mediacore.logging;

final class DefaultLogFactory
  implements LogFactory
{
  public Logger getLogger(String paramString)
  {
    return new DefaultLogger();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.logging.DefaultLogFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */