package android.support.v4.media.routing;

import android.media.MediaRouter;
import android.media.MediaRouter.RouteInfo;

class MediaRouterJellybeanMr1$CallbackProxy
  extends MediaRouterJellybean.CallbackProxy
{
  public MediaRouterJellybeanMr1$CallbackProxy(MediaRouterJellybeanMr1.Callback paramCallback)
  {
    super(paramCallback);
  }
  
  public void onRoutePresentationDisplayChanged(MediaRouter paramMediaRouter, MediaRouter.RouteInfo paramRouteInfo)
  {
    ((MediaRouterJellybeanMr1.Callback)mCallback).onRoutePresentationDisplayChanged(paramRouteInfo);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.routing.MediaRouterJellybeanMr1.CallbackProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */