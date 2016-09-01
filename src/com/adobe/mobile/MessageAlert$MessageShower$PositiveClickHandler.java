package com.adobe.mobile;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

final class MessageAlert$MessageShower$PositiveClickHandler
  implements DialogInterface.OnClickListener
{
  private final MessageAlert message;
  
  public MessageAlert$MessageShower$PositiveClickHandler(MessageAlert paramMessageAlert)
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

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageAlert.MessageShower.PositiveClickHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */