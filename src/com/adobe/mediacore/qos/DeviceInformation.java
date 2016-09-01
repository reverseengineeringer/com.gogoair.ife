package com.adobe.mediacore.qos;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.Build;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import java.lang.reflect.Method;

public final class DeviceInformation
{
  private final int _densityDPI;
  private final int _heightPixels;
  private final String _id = Build.ID;
  private final String _manufacturer = Build.MANUFACTURER;
  private final String _model = Build.MODEL;
  private final String _os = Build.VERSION.RELEASE;
  private final int _sdk = Build.VERSION.SDK_INT;
  private final int _widthPixels;
  
  public DeviceInformation(Context paramContext)
  {
    WindowManager localWindowManager = (WindowManager)paramContext.getSystemService("window");
    Display localDisplay = localWindowManager.getDefaultDisplay();
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    localDisplay.getMetrics(localDisplayMetrics);
    _densityDPI = densityDpi;
    paramContext = getScreenSize(localWindowManager, paramContext.getResources());
    _heightPixels = y;
    _widthPixels = x;
  }
  
  private Point getScreenSize(WindowManager paramWindowManager, Resources paramResources)
  {
    for (;;)
    {
      try
      {
        Display localDisplay = paramWindowManager.getDefaultDisplay();
        Method localMethod1 = Display.class.getMethod("getRawWidth", new Class[0]);
        Method localMethod2 = Display.class.getMethod("getRawHeight", new Class[0]);
        k = ((Integer)localMethod1.invoke(localDisplay, new Object[0])).intValue();
        m = ((Integer)localMethod2.invoke(localDisplay, new Object[0])).intValue();
        n = getConfigurationorientation;
        if (n != 1) {
          continue;
        }
        i = m;
        j = k;
        if (k > m)
        {
          j = m;
          i = k;
        }
      }
      catch (Exception paramResources)
      {
        int k;
        int m;
        int n;
        paramWindowManager = paramWindowManager.getDefaultDisplay();
        paramResources = new DisplayMetrics();
        paramWindowManager.getMetrics(paramResources);
        int j = widthPixels;
        int i = heightPixels;
        continue;
      }
      return new Point(j, i);
      i = m;
      j = k;
      if (n == 2)
      {
        i = m;
        j = k;
        if (k < m)
        {
          j = m;
          i = k;
        }
      }
    }
  }
  
  public int getDensityDPI()
  {
    return _densityDPI;
  }
  
  public int getHeightPixels()
  {
    return _heightPixels;
  }
  
  public String getId()
  {
    return _id;
  }
  
  public String getManufacturer()
  {
    return _manufacturer;
  }
  
  public String getModel()
  {
    return _model;
  }
  
  public String getOS()
  {
    return _os;
  }
  
  public int getSDK()
  {
    return _sdk;
  }
  
  public int getWidthPixels()
  {
    return _widthPixels;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.DeviceInformation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */