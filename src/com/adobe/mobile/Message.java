package com.adobe.mobile;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

abstract class Message
{
  protected static final String JSON_CONFIG_ASSETS = "assets";
  private static final String JSON_CONFIG_AUDIENCES = "audiences";
  private static final String JSON_CONFIG_END_DATE = "endDate";
  private static final String JSON_CONFIG_MESSAGE_ID = "messageId";
  private static final String JSON_CONFIG_SHOW_OFFLINE = "showOffline";
  private static final String JSON_CONFIG_SHOW_RULE = "showRule";
  private static final String JSON_CONFIG_START_DATE = "startDate";
  private static final String JSON_CONFIG_TEMPLATE = "template";
  private static final String JSON_CONFIG_TRIGGERS = "triggers";
  private static final boolean JSON_DEFAULT_SHOW_OFFLINE = false;
  private static final Long JSON_DEFAULT_START_DATE = Long.valueOf(0L);
  private static final String MESSAGE_ENUM_STRING_UNKNOWN = "unknown";
  protected static final String MESSAGE_IMAGE_CACHE_DIR = "messageImages";
  protected static final String MESSAGE_JSON_PAYLOAD = "payload";
  private static final String MESSAGE_SHOW_RULE_STRING_ALWAYS = "always";
  private static final String MESSAGE_SHOW_RULE_STRING_ONCE = "once";
  private static final String MESSAGE_SHOW_RULE_STRING_UNTIL_CLICK = "untilClick";
  private static final String MESSAGE_TEMPLATE_STRING_ALERT = "alert";
  private static final String MESSAGE_TEMPLATE_STRING_FULLSCREEN = "fullscreen";
  private static final String MESSAGE_TEMPLATE_STRING_LOCAL_NOTIFICATION = "local";
  private static final String SHARED_PREFERENCES_BLACK_LIST = "messagesBlackList";
  private static HashMap _blacklist;
  private static final Object _blacklistMutex = new Object();
  private static final Map _messageTypeDictionary = new Message.1();
  private static final Map _showRuleEnumDictionary = new Message.2();
  protected ArrayList assets;
  protected ArrayList audiences;
  protected Date endDate;
  protected boolean isVisible;
  protected String messageId;
  protected int orientationWhenShown;
  protected boolean showOffline;
  protected Messages.MessageShowRule showRule;
  protected Date startDate;
  protected ArrayList triggers;
  
  private HashMap mapFromString(String paramString)
  {
    localHashMap = new HashMap();
    try
    {
      paramString = new JSONObject(paramString);
      Iterator localIterator = paramString.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localHashMap.put(str, Integer.valueOf(paramString.getInt(str)));
      }
      return localHashMap;
    }
    catch (JSONException paramString)
    {
      StaticMethods.logErrorFormat("Messages- Unable to deserialize blacklist(%s)", new Object[] { paramString.getMessage() });
    }
  }
  
  private static Messages.MessageShowRule messageShowRuleFromString(String paramString)
  {
    return (Messages.MessageShowRule)_showRuleEnumDictionary.get(paramString);
  }
  
  protected static Message messageWithJsonObject(JSONObject paramJSONObject)
  {
    Object localObject = "";
    label111:
    for (;;)
    {
      try
      {
        str = paramJSONObject.getString("template");
        boolean bool;
        paramJSONObject = null;
      }
      catch (JSONException paramJSONObject)
      {
        try
        {
          localObject = (Message)((Class)_messageTypeDictionary.get(str)).newInstance();
          bool = ((Message)localObject).initWithPayloadObject(paramJSONObject);
          if (!bool) {
            break label111;
          }
          paramJSONObject = (JSONObject)localObject;
          return paramJSONObject;
        }
        catch (NullPointerException paramJSONObject)
        {
          String str;
          paramJSONObject = str;
          continue;
        }
        paramJSONObject = paramJSONObject;
        StaticMethods.logWarningFormat("Messages - template is required for in-app message", new Object[0]);
        return null;
      }
      catch (NullPointerException paramJSONObject)
      {
        paramJSONObject = (JSONObject)localObject;
        StaticMethods.logWarningFormat("Messages - invalid template specified for message (%s)", new Object[] { paramJSONObject });
        return null;
      }
      catch (IllegalAccessException paramJSONObject)
      {
        StaticMethods.logWarningFormat("Messages - unable to create instance of message (%s)", new Object[] { paramJSONObject.getMessage() });
        return null;
      }
      catch (InstantiationException paramJSONObject)
      {
        StaticMethods.logWarningFormat("Messages - unable to create instance of message (%s)", new Object[] { paramJSONObject.getMessage() });
        return null;
      }
    }
  }
  
  private String stringFromMap(Map paramMap)
  {
    return new JSONObject(paramMap).toString();
  }
  
  protected void blacklist()
  {
    synchronized (_blacklistMutex)
    {
      if (_blacklist == null) {
        _blacklist = loadBlacklist();
      }
      _blacklist.put(messageId, Integer.valueOf(showRule.getValue()));
      StaticMethods.logDebugFormat("Messages - adding message \"%s\" to blacklist", new Object[] { messageId });
      try
      {
        SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
        localEditor.putString("messagesBlackList", stringFromMap(_blacklist));
        localEditor.commit();
        return;
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Messages - Error persisting blacklist map (%s).", new Object[] { localNullContextException.getMessage() });
        }
      }
    }
  }
  
  protected void clickedThrough()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("a.message.id", messageId);
    localHashMap.put("a.message.clicked", Integer.valueOf(1));
    AnalyticsTrackInternal.trackInternal("In-App Message", localHashMap, StaticMethods.getTimeSince1970());
    if ((showRule == Messages.MessageShowRule.MESSAGE_SHOW_RULE_ONCE) || (showRule == Messages.MessageShowRule.MESSAGE_SHOW_RULE_UNTIL_CLICK)) {
      blacklist();
    }
    Messages.setCurrentMessage(null);
  }
  
  protected String description()
  {
    return "Message ID: " + messageId + "; Show Rule: " + showRule.toString() + "; Blacklisted: " + isBlacklisted();
  }
  
  protected boolean initWithPayloadObject(JSONObject paramJSONObject)
  {
    if ((paramJSONObject == null) || (paramJSONObject.length() == 0)) {
      return false;
    }
    try
    {
      messageId = paramJSONObject.getString("messageId");
      if (messageId.length() <= 0)
      {
        StaticMethods.logWarningFormat("Messages - Unable to create message, messageId is empty", new Object[0]);
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create message, messageId is required", new Object[0]);
      return false;
    }
    Object localObject;
    try
    {
      localObject = paramJSONObject.getString("showRule");
      showRule = messageShowRuleFromString((String)localObject);
      if ((showRule == null) || (showRule == Messages.MessageShowRule.MESSAGE_SHOW_RULE_UNKNOWN))
      {
        StaticMethods.logWarningFormat("Messages - Unable to create message \"%s\", showRule not valid (%s)", new Object[] { messageId, localObject });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create message \"%s\", showRule is required", new Object[] { messageId });
      return false;
    }
    try
    {
      startDate = new Date(paramJSONObject.getLong("startDate") * 1000L);
    }
    catch (JSONException localJSONException2)
    {
      try
      {
        endDate = new Date(paramJSONObject.getLong("endDate") * 1000L);
      }
      catch (JSONException localJSONException2)
      {
        try
        {
          for (;;)
          {
            showOffline = paramJSONObject.getBoolean("showOffline");
            audiences = new ArrayList();
            try
            {
              localObject = paramJSONObject.getJSONArray("audiences");
              j = ((JSONArray)localObject).length();
              i = 0;
              while (i < j)
              {
                JSONObject localJSONObject2 = ((JSONArray)localObject).getJSONObject(i);
                audiences.add(MessageMatcher.messageMatcherWithJsonObject(localJSONObject2));
                i += 1;
              }
              localJSONException1 = localJSONException1;
              StaticMethods.logDebugFormat("Messages - Tried to read startDate from message \"%s\" but none found. Using default value", new Object[] { messageId });
              startDate = new Date(JSON_DEFAULT_START_DATE.longValue() * 1000L);
            }
            catch (JSONException localJSONException4)
            {
              int j;
              int i;
              StaticMethods.logDebugFormat("Messages - failed to read audience for message \"%s\", error: %s", new Object[] { messageId, localJSONException4.getMessage() });
              triggers = new ArrayList();
              try
              {
                paramJSONObject = paramJSONObject.getJSONArray("triggers");
                j = paramJSONObject.length();
                i = 0;
                while (i < j)
                {
                  JSONObject localJSONObject1 = paramJSONObject.getJSONObject(i);
                  triggers.add(MessageMatcher.messageMatcherWithJsonObject(localJSONObject1));
                  i += 1;
                }
                return true;
              }
              catch (JSONException paramJSONObject)
              {
                StaticMethods.logDebugFormat("Messages - failed to read trigger for message \"%s\", error: %s", new Object[] { messageId, paramJSONObject.getMessage() });
                if (triggers.size() > 0) {
                  break label478;
                }
                StaticMethods.logWarningFormat("Messages - Unable to load message \"%s\" - at least one valid trigger is required for a message", new Object[] { messageId });
                return false;
                isVisible = false;
              }
            }
            localJSONException2 = localJSONException2;
            StaticMethods.logDebugFormat("Messages - Tried to read endDate from message \"%s\" but none found. Using default value", new Object[] { messageId });
          }
        }
        catch (JSONException localJSONException3)
        {
          for (;;)
          {
            StaticMethods.logDebugFormat("Messages - Tried to read showOffline from message \"%s\" but none found. Using default value", new Object[] { messageId });
            showOffline = false;
          }
        }
      }
    }
  }
  
  protected boolean isBlacklisted()
  {
    for (;;)
    {
      synchronized (_blacklistMutex)
      {
        if (_blacklist == null) {
          _blacklist = loadBlacklist();
        }
        if (_blacklist.get(messageId) != null)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  protected HashMap loadBlacklist()
  {
    try
    {
      Object localObject = StaticMethods.getSharedPreferences().getString("messagesBlackList", null);
      if (localObject == null) {
        return new HashMap();
      }
      localObject = mapFromString((String)localObject);
      return (HashMap)localObject;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logDebugFormat("Messaging - Unable to get shared preferences while loading blacklist. (%s)", new Object[] { localNullContextException.getMessage() });
    }
    return new HashMap();
  }
  
  protected void removeFromBlacklist()
  {
    if (isBlacklisted()) {
      synchronized (_blacklistMutex)
      {
        _blacklist.remove(messageId);
        StaticMethods.logDebugFormat("Messages - removing message \"%s\" from blacklist", new Object[] { messageId });
        try
        {
          SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
          localEditor.putString("messagesBlackList", stringFromMap(_blacklist));
          localEditor.commit();
          return;
        }
        catch (StaticMethods.NullContextException localNullContextException)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Messages - Error persisting blacklist map (%s).", new Object[] { localNullContextException.getMessage() });
          }
        }
      }
    }
  }
  
  protected boolean shouldShowForVariables(Map paramMap1, Map paramMap2, Map paramMap3)
  {
    if ((isVisible) && (orientationWhenShown != StaticMethods.getCurrentOrientation()) && ((this instanceof MessageAlert))) {
      return true;
    }
    if ((Messages.getCurrentMessage() != null) && (!(this instanceof MessageLocalNotification))) {
      return false;
    }
    if (((paramMap1 == null) || (paramMap1.size() <= 0)) && ((paramMap2 == null) || (paramMap2.size() <= 0))) {
      return false;
    }
    if (isBlacklisted()) {
      return false;
    }
    try
    {
      if (!AnalyticsWorker.networkConnectivity(StaticMethods.getSharedContext()))
      {
        boolean bool = showOffline;
        if (!bool) {
          return false;
        }
      }
    }
    catch (StaticMethods.NullContextException paramMap1)
    {
      return false;
    }
    Object localObject = new Date(StaticMethods.getTimeSince1970() * 1000L);
    if (((Date)localObject).before(startDate)) {
      return false;
    }
    if ((endDate != null) && (((Date)localObject).after(endDate))) {
      return false;
    }
    localObject = audiences.iterator();
    while (((Iterator)localObject).hasNext()) {
      if (!((MessageMatcher)((Iterator)localObject).next()).matchesInMaps(new Map[] { paramMap3 })) {
        return false;
      }
    }
    paramMap2 = StaticMethods.cleanContextDataDictionary(paramMap2);
    paramMap3 = triggers.iterator();
    while (paramMap3.hasNext()) {
      if (!((MessageMatcher)paramMap3.next()).matchesInMaps(new Map[] { paramMap1, paramMap2 })) {
        return false;
      }
    }
    return true;
  }
  
  protected void show()
  {
    orientationWhenShown = StaticMethods.getCurrentOrientation();
    Messages.setCurrentMessage(this);
  }
  
  protected void viewed()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("a.message.id", messageId);
    localHashMap.put("a.message.viewed", Integer.valueOf(1));
    AnalyticsTrackInternal.trackInternal("In-App Message", localHashMap, StaticMethods.getTimeSince1970());
    if (showRule == Messages.MessageShowRule.MESSAGE_SHOW_RULE_ONCE) {
      blacklist();
    }
    Messages.setCurrentMessage(null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Message
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */