package com.auditude.ads.util.http;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;

public class PersistentCookieStore
  implements CookieStore
{
  private static final String COOKIE_NAME_PREFIX = "cookie_";
  private static final String COOKIE_NAME_STORE = "names";
  private static final String COOKIE_PREFS = "CookiePrefsFile";
  private static final String LOG_TAG = "PersistentCookieStore";
  private final SharedPreferences cookiePrefs;
  private final ConcurrentHashMap cookies;
  private boolean omitNonPersistentCookies = false;
  
  public PersistentCookieStore(Context paramContext)
  {
    cookiePrefs = paramContext.getSharedPreferences("CookiePrefsFile", 0);
    cookies = new ConcurrentHashMap();
    paramContext = cookiePrefs.getString("names", null);
    int j;
    if (paramContext != null)
    {
      paramContext = TextUtils.split(paramContext, ",");
      j = paramContext.length;
    }
    for (;;)
    {
      if (i >= j)
      {
        clearExpired(new Date());
        return;
      }
      String str = paramContext[i];
      Object localObject = cookiePrefs.getString("cookie_" + str, null);
      if (localObject != null)
      {
        localObject = decodeCookie((String)localObject);
        if (localObject != null) {
          cookies.put(str, localObject);
        }
      }
      i += 1;
    }
  }
  
  public void addCookie(Cookie paramCookie)
  {
    if ((omitNonPersistentCookies) && (!paramCookie.isPersistent())) {
      return;
    }
    String str = paramCookie.getName() + paramCookie.getDomain();
    if (!paramCookie.isExpired(new Date())) {
      cookies.put(str, paramCookie);
    }
    for (;;)
    {
      SharedPreferences.Editor localEditor = cookiePrefs.edit();
      localEditor.putString("names", TextUtils.join(",", cookies.keySet()));
      localEditor.putString("cookie_" + str, encodeCookie(new SerializableCookie(paramCookie)));
      localEditor.commit();
      return;
      cookies.remove(str);
    }
  }
  
  protected String byteArrayToHexString(byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramArrayOfByte.length * 2);
    int j = paramArrayOfByte.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return localStringBuilder.toString().toUpperCase(Locale.US);
      }
      int k = paramArrayOfByte[i] & 0xFF;
      if (k < 16) {
        localStringBuilder.append('0');
      }
      localStringBuilder.append(Integer.toHexString(k));
      i += 1;
    }
  }
  
  public void clear()
  {
    SharedPreferences.Editor localEditor = cookiePrefs.edit();
    Iterator localIterator = cookies.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        localEditor.remove("names");
        localEditor.commit();
        cookies.clear();
        return;
      }
      String str = (String)localIterator.next();
      localEditor.remove("cookie_" + str);
    }
  }
  
  public boolean clearExpired(Date paramDate)
  {
    SharedPreferences.Editor localEditor = cookiePrefs.edit();
    Iterator localIterator = cookies.entrySet().iterator();
    boolean bool = false;
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        if (bool) {
          localEditor.putString("names", TextUtils.join(",", cookies.keySet()));
        }
        localEditor.commit();
        return bool;
      }
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      String str = (String)localEntry.getKey();
      if (((Cookie)localEntry.getValue()).isExpired(paramDate))
      {
        cookies.remove(str);
        localEditor.remove("cookie_" + str);
        bool = true;
      }
    }
  }
  
  protected Cookie decodeCookie(String paramString)
  {
    paramString = new ByteArrayInputStream(hexStringToByteArray(paramString));
    try
    {
      paramString = ((SerializableCookie)new ObjectInputStream(paramString).readObject()).getCookie();
      return paramString;
    }
    catch (Exception paramString)
    {
      Log.d("PersistentCookieStore", "decodeCookie failed", paramString);
    }
    return null;
  }
  
  public void deleteCookie(Cookie paramCookie)
  {
    paramCookie = paramCookie.getName();
    cookies.remove(paramCookie);
    SharedPreferences.Editor localEditor = cookiePrefs.edit();
    localEditor.remove("cookie_" + paramCookie);
    localEditor.commit();
  }
  
  protected String encodeCookie(SerializableCookie paramSerializableCookie)
  {
    if (paramSerializableCookie == null) {
      return null;
    }
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    try
    {
      new ObjectOutputStream(localByteArrayOutputStream).writeObject(paramSerializableCookie);
      return byteArrayToHexString(localByteArrayOutputStream.toByteArray());
    }
    catch (Exception paramSerializableCookie) {}
    return null;
  }
  
  public List getCookies()
  {
    return new ArrayList(cookies.values());
  }
  
  protected byte[] hexStringToByteArray(String paramString)
  {
    int j = paramString.length();
    byte[] arrayOfByte = new byte[j / 2];
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return arrayOfByte;
      }
      arrayOfByte[(i / 2)] = ((byte)((Character.digit(paramString.charAt(i), 16) << 4) + Character.digit(paramString.charAt(i + 1), 16)));
      i += 2;
    }
  }
  
  public void setOmitNonPersistentCookies(boolean paramBoolean)
  {
    omitNonPersistentCookies = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.http.PersistentCookieStore
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */