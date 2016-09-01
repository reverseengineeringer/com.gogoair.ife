package com.auditude.creativerepackaging;

import android.util.Log;
import com.auditude.ads.loader.DataLoader;
import com.auditude.ads.loader.DataLoader.DataLoaderListener;
import java.io.IOException;
import java.io.StringReader;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class UrlNormalizingRules
  implements DataLoader.DataLoaderListener
{
  private static final int DEFAULT_TIMEOUT = 5;
  public static final String NORMALIZE_RULES_URL = "http://cdn2.auditude.com/crs/rules.xml";
  private static UrlNormalizingRules instance;
  private Boolean _loaded = Boolean.valueOf(false);
  private Boolean _loading = Boolean.valueOf(false);
  private DataLoader dataLoader;
  private CopyOnWriteArrayList listeners = new CopyOnWriteArrayList();
  private XmlPullParser parser;
  private ArrayList rules;
  
  private void dispatchLoaded(Boolean paramBoolean)
  {
    Iterator localIterator = listeners.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      ((UrlNormalizingRulesListener)localIterator.next()).onRulesLoaded(paramBoolean);
    }
  }
  
  public static UrlNormalizingRules getInstance()
  {
    if (instance == null) {
      instance = new UrlNormalizingRules();
    }
    return instance;
  }
  
  private ArrayList parseCraterias()
    throws XmlPullParserException, IOException
  {
    ArrayList localArrayList = new ArrayList();
    int i = 2;
    String str = parser.getName();
    if (i == 2) {
      if ("Domain".equalsIgnoreCase(str)) {
        localArrayList.add(parser.nextText().replaceAll("\t", ""));
      }
    }
    while ((i != 3) || (!"Criteria".equalsIgnoreCase(str)))
    {
      i = parser.next();
      break;
    }
    return localArrayList;
  }
  
  private Rule parseRule()
    throws XmlPullParserException, IOException
  {
    Object localObject3 = null;
    int i = 2;
    Object localObject2 = null;
    Object localObject1 = null;
    String str = parser.getName();
    Object localObject6;
    Object localObject5;
    Object localObject4;
    if (i == 2) {
      if ("Find".equalsIgnoreCase(str))
      {
        localObject6 = parser.nextText().replaceAll("\t", "");
        localObject5 = localObject2;
        localObject4 = localObject3;
      }
    }
    do
    {
      do
      {
        for (;;)
        {
          i = parser.next();
          localObject3 = localObject4;
          localObject2 = localObject5;
          localObject1 = localObject6;
          break;
          if ("Replace".equalsIgnoreCase(str))
          {
            localObject5 = parser.nextText().replaceAll("\t", "");
            localObject4 = localObject3;
            localObject6 = localObject1;
          }
          else
          {
            localObject4 = localObject3;
            localObject5 = localObject2;
            localObject6 = localObject1;
            if ("Criteria".equalsIgnoreCase(str))
            {
              localObject4 = parseCraterias();
              localObject5 = localObject2;
              localObject6 = localObject1;
            }
          }
        }
        localObject4 = localObject3;
        localObject5 = localObject2;
        localObject6 = localObject1;
      } while (i != 3);
      localObject4 = localObject3;
      localObject5 = localObject2;
      localObject6 = localObject1;
    } while (!"Rule".equalsIgnoreCase(str));
    return new Rule((String)localObject1, (String)localObject2, (ArrayList)localObject3);
  }
  
  public void addEventListener(UrlNormalizingRulesListener paramUrlNormalizingRulesListener)
  {
    listeners.add(paramUrlNormalizingRulesListener);
  }
  
  public Boolean getIsRulesLoaded()
  {
    return _loaded;
  }
  
  public void loadRules()
  {
    if ((rules == null) && (!_loaded.booleanValue()) && (!_loading.booleanValue()))
    {
      _loading = Boolean.valueOf(true);
      dataLoader = new DataLoader();
      dataLoader.setDataLoaderListener(this);
      dataLoader.load("http://cdn2.auditude.com/crs/rules.xml", null, 5);
    }
    while (_loading.booleanValue()) {
      return;
    }
    dispatchLoaded(Boolean.valueOf(true));
  }
  
  public String normalize(String paramString)
  {
    try
    {
      URI localURI = new URI(paramString);
      Object localObject = paramString;
      Iterator localIterator1;
      if (rules != null)
      {
        localObject = paramString;
        if (rules.size() > 0) {
          localIterator1 = rules.iterator();
        }
      }
      label115:
      label188:
      for (;;)
      {
        if (!localIterator1.hasNext())
        {
          localObject = paramString;
          return (String)localObject;
        }
        Rule localRule = (Rule)localIterator1.next();
        if ((replace != null) && (find != null))
        {
          Iterator localIterator2;
          if ((domains != null) && (domains.size() > 0))
          {
            localIterator2 = domains.iterator();
            localObject = Boolean.valueOf(false);
            if (localIterator2.hasNext()) {}
          }
          for (;;)
          {
            if (!((Boolean)localObject).booleanValue()) {
              break label188;
            }
            paramString = paramString.replaceAll(find, replace);
            break;
            String str = (String)localIterator2.next();
            if (!localURI.getHost().endsWith(str)) {
              break label115;
            }
            localObject = Boolean.valueOf(true);
            break label115;
            localObject = Boolean.valueOf(true);
          }
        }
      }
      return paramString;
    }
    catch (Exception localException) {}
  }
  
  public void onRequestComplete(String paramString)
  {
    dataLoader = null;
    rules = new ArrayList();
    try
    {
      parser = XmlPullParserFactory.newInstance().newPullParser();
      parser.setInput(new StringReader(paramString));
      i = parser.getEventType();
      if (i != 1) {
        break label83;
      }
    }
    catch (Exception paramString)
    {
      for (;;)
      {
        int i;
        Log.v("UrlNormalizingRules", "Error Parsing : " + paramString.getMessage());
      }
    }
    _loaded = Boolean.valueOf(true);
    _loading = Boolean.valueOf(false);
    dispatchLoaded(Boolean.valueOf(true));
    return;
    label83:
    switch (i)
    {
    }
    for (;;)
    {
      i = parser.next();
      break;
      if ("Rule".equalsIgnoreCase(parser.getName())) {
        rules.add(parseRule());
      }
    }
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    _loaded = Boolean.valueOf(true);
    _loading = Boolean.valueOf(false);
    dispatchLoaded(Boolean.valueOf(false));
  }
  
  public void removeEventListener(UrlNormalizingRulesListener paramUrlNormalizingRulesListener)
  {
    if (listeners.contains(paramUrlNormalizingRulesListener)) {
      listeners.remove(paramUrlNormalizingRulesListener);
    }
  }
  
  public static abstract interface UrlNormalizingRulesListener
  {
    public abstract void onRulesLoaded(Boolean paramBoolean);
  }
}

/* Location:
 * Qualified Name:     com.auditude.creativerepackaging.UrlNormalizingRules
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */