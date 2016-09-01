package com.auditude.ads.util.http;

import android.util.Log;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.impl.cookie.RFC2109Spec;

public class AudCookieSpec
  extends RFC2109Spec
{
  private String TAG = "AudCookieSpec";
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    if (paramCookie == null) {
      throw new IllegalArgumentException("Cookie cannot be null");
    }
    if (paramCookieOrigin == null) {
      throw new IllegalArgumentException("Cookie origin cannot be null");
    }
    if (Log.isLoggable(TAG, 3)) {
      Log.d(TAG, "Matching cookie " + paramCookie + " with origin " + paramCookieOrigin);
    }
    return true;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.http.AudCookieSpec
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */