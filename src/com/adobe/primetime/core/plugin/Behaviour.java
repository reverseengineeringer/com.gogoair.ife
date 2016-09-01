package com.adobe.primetime.core.plugin;

import com.adobe.primetime.core.Trigger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Behaviour
{
  private String _action;
  private Map _paramMappings;
  private IPlugin _plugin;
  private Trigger _trigger;
  
  public Behaviour(Trigger paramTrigger, IPlugin paramIPlugin, String paramString, ArrayList paramArrayList)
  {
    _trigger = paramTrigger;
    _action = paramString;
    _paramMappings = new HashMap();
    _plugin = paramIPlugin;
    mergeParams(paramArrayList);
  }
  
  public void addParam(ParamMapping paramParamMapping)
  {
    if (paramParamMapping != null) {
      _paramMappings.put(paramParamMapping.getKeyName(), paramParamMapping);
    }
  }
  
  public String getAction()
  {
    return _action;
  }
  
  public ArrayList getParams()
  {
    ArrayList localArrayList = new ArrayList(_paramMappings.values());
    Iterator localIterator = _paramMappings.values().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((ParamMapping)localIterator.next());
    }
    return localArrayList;
  }
  
  public IPlugin getPlugin()
  {
    return _plugin;
  }
  
  public Trigger getTrigger()
  {
    return _trigger;
  }
  
  public void mergeParams(ArrayList paramArrayList)
  {
    if (paramArrayList == null) {}
    for (;;)
    {
      return;
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        ParamMapping localParamMapping = (ParamMapping)paramArrayList.next();
        _paramMappings.put(localParamMapping.getKeyName(), localParamMapping);
      }
    }
  }
  
  public void removeParam(String paramString1, String paramString2)
  {
    paramString1 = new ParamMapping(paramString1, paramString2, null);
    if (_paramMappings.containsKey(paramString1.getKeyName())) {
      _paramMappings.remove(paramString1.getKeyName());
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.plugin.Behaviour
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */