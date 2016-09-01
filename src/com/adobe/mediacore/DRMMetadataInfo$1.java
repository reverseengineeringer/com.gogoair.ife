package com.adobe.mediacore;

import com.adobe.ave.drm.DRMOperationErrorCallback;
import com.adobe.mediacore.logging.Logger;

final class DRMMetadataInfo$1
  implements DRMOperationErrorCallback
{
  public void OperationError(long paramLong1, long paramLong2, Exception paramException)
  {
    DRMMetadataInfo.access$100().e(DRMMetadataInfo.access$000() + "#createDRMMetadataInfo", "Error loading DRM metadata: " + paramLong1 + " 0x" + Long.toHexString(paramLong2));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DRMMetadataInfo.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */