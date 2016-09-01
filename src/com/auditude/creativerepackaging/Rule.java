package com.auditude.creativerepackaging;

import java.util.ArrayList;

class Rule
{
  public ArrayList domains = new ArrayList();
  public String find;
  public String replace;
  
  public Rule(String paramString1, String paramString2, ArrayList paramArrayList)
  {
    find = paramString1;
    replace = paramString2;
    domains = paramArrayList;
  }
}

/* Location:
 * Qualified Name:     com.auditude.creativerepackaging.Rule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */