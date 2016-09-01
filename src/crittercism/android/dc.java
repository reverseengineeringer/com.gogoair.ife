package crittercism.android;

import java.net.MalformedURLException;
import java.net.URL;

public final class dc
{
  private String a;
  private String b;
  
  public dc(String paramString1, String paramString2)
  {
    paramString1.endsWith("/");
    paramString2.startsWith("/");
    a = paramString1;
    b = paramString2;
  }
  
  public final URL a()
  {
    try
    {
      URL localURL = new URL(a + b);
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      new StringBuilder("Invalid url: ").append(a).append(b);
      dy.b();
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     crittercism.android.dc
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */