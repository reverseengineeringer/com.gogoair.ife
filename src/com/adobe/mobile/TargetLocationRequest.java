package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;

public class TargetLocationRequest
{
  public static final String TARGET_PARAMETER_CATEGORY_ID = "categoryId";
  public static final String TARGET_PARAMETER_MBOX_3RDPARTY_ID = "mbox3rdPartyId";
  public static final String TARGET_PARAMETER_MBOX_HOST = "mboxHost";
  public static final String TARGET_PARAMETER_MBOX_PAGE_VALUE = "mboxPageValue";
  public static final String TARGET_PARAMETER_MBOX_PC = "mboxPC";
  public static final String TARGET_PARAMETER_MBOX_SESSION_ID = "mboxSession";
  public static final String TARGET_PARAMETER_ORDER_ID = "orderId";
  public static final String TARGET_PARAMETER_ORDER_TOTAL = "orderTotal";
  public static final String TARGET_PARAMETER_PRODUCT_PURCHASE_ID = "productPurchasedId";
  public String defaultContent;
  public String name;
  public HashMap parameters;
  
  protected TargetLocationRequest(String paramString1, String paramString2, Map paramMap)
  {
    name = paramString1;
    defaultContent = paramString2;
    if (paramMap != null) {}
    for (paramString1 = new HashMap(paramMap);; paramString1 = new HashMap())
    {
      parameters = paramString1;
      return;
    }
  }
  
  protected static TargetLocationRequest createRequestWithOrderConfirm(String paramString1, String paramString2, String paramString3, String paramString4, Map paramMap)
  {
    paramString1 = new TargetLocationRequest(paramString1, "none", paramMap);
    if (paramString2 != null) {
      parameters.put("orderId", paramString2);
    }
    if (paramString3 != null) {
      parameters.put("orderTotal", paramString3);
    }
    if (paramString4 != null) {
      parameters.put("productPurchasedId", paramString4);
    }
    return paramString1;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.TargetLocationRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */