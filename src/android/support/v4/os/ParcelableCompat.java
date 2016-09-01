package android.support.v4.os;

import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable.Creator;

public class ParcelableCompat
{
  public static Parcelable.Creator newCreator(ParcelableCompatCreatorCallbacks paramParcelableCompatCreatorCallbacks)
  {
    if (Build.VERSION.SDK_INT >= 13) {
      return ParcelableCompatCreatorHoneycombMR2Stub.instantiate(paramParcelableCompatCreatorCallbacks);
    }
    return new CompatCreator(paramParcelableCompatCreatorCallbacks);
  }
  
  static class CompatCreator
    implements Parcelable.Creator
  {
    final ParcelableCompatCreatorCallbacks mCallbacks;
    
    public CompatCreator(ParcelableCompatCreatorCallbacks paramParcelableCompatCreatorCallbacks)
    {
      mCallbacks = paramParcelableCompatCreatorCallbacks;
    }
    
    public Object createFromParcel(Parcel paramParcel)
    {
      return mCallbacks.createFromParcel(paramParcel, null);
    }
    
    public Object[] newArray(int paramInt)
    {
      return mCallbacks.newArray(paramInt);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.os.ParcelableCompat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */