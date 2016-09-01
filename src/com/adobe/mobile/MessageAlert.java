package com.adobe.mobile;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

final class MessageAlert
  extends Message
{
  private static final String JSON_CONFIG_CANCEL = "cancel";
  private static final String JSON_CONFIG_CONFIRM = "confirm";
  private static final String JSON_CONFIG_CONTENT = "content";
  private static final String JSON_CONFIG_TITLE = "title";
  private static final String JSON_CONFIG_URL = "url";
  protected AlertDialog alertDialog;
  protected String cancelButtonText;
  protected String confirmButtonText;
  protected String content;
  protected String title;
  protected String url;
  
  protected static void clearCurrentDialog()
  {
    Message localMessage = Messages.getCurrentMessage();
    if ((localMessage == null) || (!(localMessage instanceof MessageAlert))) {}
    while (orientationWhenShown == StaticMethods.getCurrentOrientation()) {
      return;
    }
    if ((alertDialog != null) && (alertDialog.isShowing())) {
      alertDialog.dismiss();
    }
    alertDialog = null;
  }
  
  protected boolean initWithPayloadObject(JSONObject paramJSONObject)
  {
    if ((paramJSONObject == null) || (paramJSONObject.length() <= 0)) {}
    while (!super.initWithPayloadObject(paramJSONObject)) {
      return false;
    }
    try
    {
      paramJSONObject = paramJSONObject.getJSONObject("payload");
      if (paramJSONObject.length() <= 0)
      {
        StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", payload is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", payload is required", new Object[] { messageId });
      return false;
    }
    try
    {
      title = paramJSONObject.getString("title");
      if (title.length() <= 0)
      {
        StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", title is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", title is required", new Object[] { messageId });
      return false;
    }
    try
    {
      content = paramJSONObject.getString("content");
      if (content.length() <= 0)
      {
        StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", content is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", content is required", new Object[] { messageId });
      return false;
    }
    try
    {
      confirmButtonText = paramJSONObject.getString("confirm");
      if (confirmButtonText.length() <= 0)
      {
        StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", confirm is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", confirm is required", new Object[] { messageId });
      return false;
    }
    try
    {
      cancelButtonText = paramJSONObject.getString("cancel");
      if (cancelButtonText.length() <= 0)
      {
        StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", cancel is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logWarningFormat("Messages - Unable to create alert message \"%s\", cancel is required", new Object[] { messageId });
      return false;
    }
    try
    {
      url = paramJSONObject.getString("url");
      return true;
    }
    catch (JSONException paramJSONObject)
    {
      for (;;)
      {
        StaticMethods.logDebugFormat("Messages - Tried to read url for alert message but found none.  This is not a required field", new Object[0]);
      }
    }
  }
  
  protected void show()
  {
    if (((cancelButtonText == null) || (cancelButtonText.length() < 1)) && ((confirmButtonText == null) || (confirmButtonText.length() < 1))) {
      return;
    }
    super.show();
    new Handler(Looper.getMainLooper()).post(new MessageShower(this));
  }
  
  private static final class MessageShower
    implements Runnable
  {
    private final MessageAlert message;
    
    public MessageShower(MessageAlert paramMessageAlert)
    {
      message = paramMessageAlert;
    }
    
    public void run()
    {
      try
      {
        Object localObject = StaticMethods.getCurrentActivity();
        return;
      }
      catch (StaticMethods.NullActivityException localNullActivityException)
      {
        try
        {
          localObject = new AlertDialog.Builder((Context)localObject);
          ((AlertDialog.Builder)localObject).setTitle(message.title);
          ((AlertDialog.Builder)localObject).setMessage(message.content);
          ((AlertDialog.Builder)localObject).setPositiveButton(message.confirmButtonText, new PositiveClickHandler(message));
          ((AlertDialog.Builder)localObject).setNegativeButton(message.cancelButtonText, new NegativeClickHandler(message));
          ((AlertDialog.Builder)localObject).setOnCancelListener(new CancelClickHandler(message));
          message.alertDialog = ((AlertDialog.Builder)localObject).create();
          message.alertDialog.setCanceledOnTouchOutside(false);
          message.alertDialog.show();
          message.isVisible = true;
          return;
        }
        catch (Exception localException)
        {
          StaticMethods.logDebugFormat("Messages - Could not show alert message (%s)", new Object[] { localException.toString() });
        }
        localNullActivityException = localNullActivityException;
        StaticMethods.logErrorFormat(localNullActivityException.getMessage(), new Object[0]);
        return;
      }
    }
    
    private static final class CancelClickHandler
      implements DialogInterface.OnCancelListener
    {
      private final MessageAlert message;
      
      public CancelClickHandler(MessageAlert paramMessageAlert)
      {
        message = paramMessageAlert;
      }
      
      public void onCancel(DialogInterface paramDialogInterface)
      {
        message.viewed();
        message.isVisible = false;
      }
    }
    
    private static final class NegativeClickHandler
      implements DialogInterface.OnClickListener
    {
      private final MessageAlert message;
      
      public NegativeClickHandler(MessageAlert paramMessageAlert)
      {
        message = paramMessageAlert;
      }
      
      public void onClick(DialogInterface paramDialogInterface, int paramInt)
      {
        message.viewed();
        message.isVisible = false;
      }
    }
    
    private static final class PositiveClickHandler
      implements DialogInterface.OnClickListener
    {
      private final MessageAlert message;
      
      public PositiveClickHandler(MessageAlert paramMessageAlert)
      {
        message = paramMessageAlert;
      }
      
      public void onClick(DialogInterface paramDialogInterface, int paramInt)
      {
        message.clickedThrough();
        message.isVisible = false;
        Object localObject;
        if ((message.url != null) && (message.url.length() > 0))
        {
          localObject = new HashMap();
          if (StaticMethods.getVisitorID() != null) {
            break label160;
          }
          paramDialogInterface = "";
          ((HashMap)localObject).put("{userId}", paramDialogInterface);
          if (StaticMethods.getAID() != null) {
            break label167;
          }
        }
        label160:
        label167:
        for (paramDialogInterface = "";; paramDialogInterface = StaticMethods.getAID())
        {
          ((HashMap)localObject).put("{trackingId}", paramDialogInterface);
          ((HashMap)localObject).put("{messageId}", message.messageId);
          ((HashMap)localObject).put("{lifetimeValue}", AnalyticsTrackLifetimeValueIncrease.getLifetimeValue().toString());
          message.url = StaticMethods.expandTokens(message.url, (Map)localObject);
          try
          {
            paramDialogInterface = StaticMethods.getCurrentActivity();
          }
          catch (StaticMethods.NullActivityException paramDialogInterface)
          {
            StaticMethods.logErrorFormat(paramDialogInterface.getMessage(), new Object[0]);
            return;
          }
          try
          {
            localObject = new Intent("android.intent.action.VIEW");
            ((Intent)localObject).setData(Uri.parse(message.url));
            paramDialogInterface.startActivity((Intent)localObject);
            return;
          }
          catch (Exception paramDialogInterface)
          {
            StaticMethods.logDebugFormat("Messages - Could not load click-through intent for message (%s)", new Object[] { paramDialogInterface.toString() });
          }
          paramDialogInterface = StaticMethods.getVisitorID();
          break;
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageAlert
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */