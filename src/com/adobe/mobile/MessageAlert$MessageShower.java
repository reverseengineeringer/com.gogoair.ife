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
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

final class MessageAlert$MessageShower
  implements Runnable
{
  private final MessageAlert message;
  
  public MessageAlert$MessageShower(MessageAlert paramMessageAlert)
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

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageAlert.MessageShower
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */