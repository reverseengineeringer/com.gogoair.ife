package android.support.v4.media.routing;

import android.media.MediaRouter.RouteInfo;
import android.media.MediaRouter.VolumeCallback;

class MediaRouterJellybean$VolumeCallbackProxy
  extends MediaRouter.VolumeCallback
{
  protected final MediaRouterJellybean.VolumeCallback mCallback;
  
  public MediaRouterJellybean$VolumeCallbackProxy(MediaRouterJellybean.VolumeCallback paramVolumeCallback)
  {
    mCallback = paramVolumeCallback;
  }
  
  public void onVolumeSetRequest(MediaRouter.RouteInfo paramRouteInfo, int paramInt)
  {
    mCallback.onVolumeSetRequest(paramRouteInfo, paramInt);
  }
  
  public void onVolumeUpdateRequest(MediaRouter.RouteInfo paramRouteInfo, int paramInt)
  {
    mCallback.onVolumeUpdateRequest(paramRouteInfo, paramInt);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.routing.MediaRouterJellybean.VolumeCallbackProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */