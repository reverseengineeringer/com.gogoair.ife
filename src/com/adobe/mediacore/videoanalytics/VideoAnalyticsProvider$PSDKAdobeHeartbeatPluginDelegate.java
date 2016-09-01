package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.primetime.va.ErrorInfo;
import com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPluginDelegate;

class VideoAnalyticsProvider$PSDKAdobeHeartbeatPluginDelegate
  extends AdobeHeartbeatPluginDelegate
{
  private final String LOG_TAG = "[PSDK-VA]::" + PSDKAdobeHeartbeatPluginDelegate.class.getSimpleName();
  private final Logger _logger = Log.getLogger(LOG_TAG);
  
  VideoAnalyticsProvider$PSDKAdobeHeartbeatPluginDelegate(VideoAnalyticsProvider paramVideoAnalyticsProvider) {}
  
  public void onError(ErrorInfo paramErrorInfo)
  {
    _logger.e(LOG_TAG + "#onError", "VideoHeartbeat error: " + paramErrorInfo.getMessage() + " (" + paramErrorInfo.getDetails() + ")");
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsProvider.PSDKAdobeHeartbeatPluginDelegate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */