package com.adobe.mobile;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

final class MessageAlert$MessageShower$NegativeClickHandler
  implements DialogInterface.OnClickListener
{
  private final MessageAlert message;
  
  public MessageAlert$MessageShower$NegativeClickHandler(MessageAlert paramMessageAlert)
  {
    message = paramMessageAlert;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    message.viewed();
    message.isVisible = false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageAlert.MessageShower.NegativeClickHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */