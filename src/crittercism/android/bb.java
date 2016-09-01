package crittercism.android;

import com.crittercism.app.CrittercismConfig;
import java.util.List;

public final class bb
  extends CrittercismConfig
{
  private String b = "https://api.crittercism.com";
  private String c = "https://apm.crittercism.com";
  private String d = "https://txn.ingest.crittercism.com/api/v1/transactions";
  private String e = "https://appload.ingest.crittercism.com";
  private String f = "524c99a04002057fcd000001";
  
  public bb(String paramString, CrittercismConfig paramCrittercismConfig)
  {
    super(paramCrittercismConfig);
    paramString = bn.a.a(paramString).a();
    b = ("https://api." + paramString);
    c = ("https://apm." + paramString);
    e = ("https://appload.ingest." + paramString);
    d = ("https://txn.ingest." + paramString + "/api/v1/transactions");
  }
  
  public final List a()
  {
    List localList = super.a();
    localList.add(c);
    return localList;
  }
  
  public final String b()
  {
    return b;
  }
  
  public final String c()
  {
    return c;
  }
  
  public final String d()
  {
    return d;
  }
  
  public final String e()
  {
    return e;
  }
  
  public final boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof bb)) {
      return false;
    }
    bb localbb = (bb)paramObject;
    return (super.equals(paramObject)) && (a(b, b)) && (a(c, c)) && (a(d, d)) && (a(e, e)) && (a(f, f));
  }
  
  public final String f()
  {
    return f;
  }
  
  public final String g()
  {
    return a;
  }
  
  public final int hashCode()
  {
    return ((((super.hashCode() * 31 + b.hashCode()) * 31 + c.hashCode()) * 31 + d.hashCode()) * 31 + e.hashCode()) * 31 + f.hashCode();
  }
}

/* Location:
 * Qualified Name:     crittercism.android.bb
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */