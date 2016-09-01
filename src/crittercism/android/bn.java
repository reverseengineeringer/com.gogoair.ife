package crittercism.android;

public final class bn
{
  public static enum a
  {
    private final String e;
    private final String f;
    
    private a(String paramString2, String paramString3)
    {
      e = paramString2;
      f = paramString3;
    }
    
    public static a a(String paramString)
    {
      if (!paramString.matches("[0-9a-fA-F]+")) {}
      for (;;)
      {
        return null;
        if (paramString.length() == 24) {
          return a;
        }
        if (paramString.length() == 40)
        {
          paramString = paramString.substring(paramString.length() - 8);
          a[] arrayOfa = values();
          int j = arrayOfa.length;
          int i = 0;
          while (i < j)
          {
            a locala = arrayOfa[i];
            if (paramString.equals(e)) {
              return locala;
            }
            i += 1;
          }
        }
      }
    }
    
    public final String a()
    {
      return f;
    }
  }
}

/* Location:
 * Qualified Name:     crittercism.android.bn
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */