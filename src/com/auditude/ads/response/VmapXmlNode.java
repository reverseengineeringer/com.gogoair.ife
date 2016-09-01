package com.auditude.ads.response;

import com.auditude.ads.network.vast.model.VASTDocument;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class VmapXmlNode
{
  private HashMap attributes = new HashMap();
  private HashMap childNodes = new HashMap();
  public int index = 0;
  private String name;
  private String value;
  private ArrayList vastDocuments = new ArrayList();
  
  public void addChild(VmapXmlNode paramVmapXmlNode)
  {
    if (!childNodes.containsKey(paramVmapXmlNode.getName())) {
      childNodes.put(name, new ArrayList());
    }
    index = childNodes.size();
    ((ArrayList)childNodes.get(paramVmapXmlNode.getName())).add(paramVmapXmlNode);
  }
  
  public void addVastDocument(VASTDocument paramVASTDocument)
  {
    vastDocuments.add(paramVASTDocument);
  }
  
  public String getAttributeByName(String paramString)
  {
    return (String)attributes.get(paramString);
  }
  
  public ArrayList getChildNodes()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = childNodes.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        Collections.sort(localArrayList, new VmapXmlNodeComparator());
        return localArrayList;
      }
      String str = (String)localIterator.next();
      localArrayList.addAll((ArrayList)childNodes.get(str));
    }
  }
  
  public ArrayList getChildeNodesByName(String paramString)
  {
    return (ArrayList)childNodes.get(paramString);
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getValue()
  {
    return value;
  }
  
  public ArrayList getVastDocuments()
  {
    return vastDocuments;
  }
  
  public void setAttribute(String paramString1, String paramString2)
  {
    attributes.put(paramString1, paramString2);
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
  
  public void setValue(String paramString)
  {
    value = paramString;
  }
  
  public static class VmapXmlNodeComparator
    implements Comparator
  {
    public int compare(VmapXmlNode paramVmapXmlNode1, VmapXmlNode paramVmapXmlNode2)
    {
      return index - index;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.VmapXmlNode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */