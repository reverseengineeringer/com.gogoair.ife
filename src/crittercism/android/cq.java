package crittercism.android;

public final class cq
  extends Throwable
{
  private static final long serialVersionUID = -1947260712494608235L;
  private String a;
  
  public final String a()
  {
    return a;
  }
  
  public final String toString()
  {
    String str1 = getLocalizedMessage();
    String str2 = a;
    if (str1 == null) {
      return str2;
    }
    return str2 + ": " + str1;
  }
}

/* Location:
 * Qualified Name:     crittercism.android.cq
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */