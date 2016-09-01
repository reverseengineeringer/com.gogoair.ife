package com.auditude.ads.util;

import java.security.MessageDigest;

public class MD5
{
  private static MessageDigest md = null;
  
  /* Error */
  public static String GetMd5String(String paramString)
  {
    // Byte code:
    //   0: getstatic 10	com/auditude/ads/util/MD5:md	Ljava/security/MessageDigest;
    //   3: ifnonnull +11 -> 14
    //   6: ldc 22
    //   8: invokestatic 28	java/security/MessageDigest:getInstance	(Ljava/lang/String;)Ljava/security/MessageDigest;
    //   11: putstatic 10	com/auditude/ads/util/MD5:md	Ljava/security/MessageDigest;
    //   14: aload_0
    //   15: invokestatic 34	com/auditude/ads/util/StringUtil:isNullOrEmpty	(Ljava/lang/String;)Z
    //   18: ifeq +5 -> 23
    //   21: aconst_null
    //   22: areturn
    //   23: aload_0
    //   24: ldc 36
    //   26: invokevirtual 42	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   29: astore_0
    //   30: getstatic 10	com/auditude/ads/util/MD5:md	Ljava/security/MessageDigest;
    //   33: invokevirtual 45	java/security/MessageDigest:reset	()V
    //   36: getstatic 10	com/auditude/ads/util/MD5:md	Ljava/security/MessageDigest;
    //   39: aload_0
    //   40: invokevirtual 49	java/security/MessageDigest:update	([B)V
    //   43: getstatic 10	com/auditude/ads/util/MD5:md	Ljava/security/MessageDigest;
    //   46: invokevirtual 53	java/security/MessageDigest:digest	()[B
    //   49: astore_0
    //   50: new 55	java/lang/StringBuffer
    //   53: dup
    //   54: invokespecial 56	java/lang/StringBuffer:<init>	()V
    //   57: astore_2
    //   58: iconst_0
    //   59: istore_1
    //   60: iload_1
    //   61: aload_0
    //   62: arraylength
    //   63: if_icmplt +8 -> 71
    //   66: aload_2
    //   67: invokevirtual 60	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   70: areturn
    //   71: aload_2
    //   72: aload_0
    //   73: iload_1
    //   74: baload
    //   75: sipush 255
    //   78: iand
    //   79: sipush 256
    //   82: ior
    //   83: invokestatic 66	java/lang/Integer:toHexString	(I)Ljava/lang/String;
    //   86: iconst_1
    //   87: iconst_3
    //   88: invokevirtual 70	java/lang/String:substring	(II)Ljava/lang/String;
    //   91: invokevirtual 74	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   94: pop
    //   95: iload_1
    //   96: iconst_1
    //   97: iadd
    //   98: istore_1
    //   99: goto -39 -> 60
    //   102: astore_0
    //   103: ldc 76
    //   105: areturn
    //   106: astore_0
    //   107: aconst_null
    //   108: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	109	0	paramString	String
    //   59	40	1	i	int
    //   57	15	2	localStringBuffer	StringBuffer
    // Exception table:
    //   from	to	target	type
    //   23	58	102	java/io/UnsupportedEncodingException
    //   60	71	102	java/io/UnsupportedEncodingException
    //   71	95	102	java/io/UnsupportedEncodingException
    //   6	14	106	java/security/NoSuchAlgorithmException
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.MD5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */