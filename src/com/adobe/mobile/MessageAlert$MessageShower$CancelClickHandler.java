package com.adobe.mobile;

import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;

final class MessageAlert$MessageShower$CancelClickHandler
  implements DialogInterface.OnCancelListener
{
  private final MessageAlert message;
  
  public MessageAlert$MessageShower$CancelClickHandler(MessageAlert paramMessageAlert)
  {
    message = paramMessageAlert;
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    message.viewed();
    message.isVisible = false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageAlert.MessageShower.CancelClickHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */