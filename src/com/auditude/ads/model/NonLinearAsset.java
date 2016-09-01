package com.auditude.ads.model;

public class NonLinearAsset
  extends Asset
  implements INonLinearAsset
{
  public NonLinearAsset(BaseElement paramBaseElement)
  {
    super(paramBaseElement);
  }
  
  public void CopyTo(Asset paramAsset)
  {
    super.CopyTo(paramAsset);
    if (paramAsset != null)
    {
      paramAsset.setDurationInMillis(getDurationInMillis());
      paramAsset.setLeadTimeInMillis(getLeadTimeInMillis());
    }
  }
  
  public String getType()
  {
    return "nonlinear";
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.NonLinearAsset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */