package com.auditude.ads.util;

public class Base64Coder
{
  private static final char[] map1;
  private static final byte[] map2;
  
  static
  {
    int k = 0;
    map1 = new char[64];
    int i = 65;
    int j = 0;
    if (i > 90)
    {
      i = 97;
      label23:
      if (i <= 122) {
        break label105;
      }
      i = 48;
      label32:
      if (i <= 57) {
        break label123;
      }
      char[] arrayOfChar = map1;
      int m = j + 1;
      arrayOfChar[j] = '+';
      map1[m] = '/';
      map2 = new byte[''];
      j = 0;
      label70:
      if (j < map2.length) {
        break label141;
      }
      j = k;
    }
    for (;;)
    {
      if (j >= 64)
      {
        return;
        map1[j] = i;
        i = (char)(i + 1);
        j += 1;
        break;
        label105:
        map1[j] = i;
        i = (char)(i + 1);
        j += 1;
        break label23;
        label123:
        map1[j] = i;
        i = (char)(i + 1);
        j += 1;
        break label32;
        label141:
        map2[j] = -1;
        j += 1;
        break label70;
      }
      map2[map1[j]] = ((byte)j);
      j += 1;
    }
  }
  
  public static byte[] decode(String paramString)
  {
    return decode(paramString.toCharArray());
  }
  
  public static byte[] decode(char[] paramArrayOfChar)
  {
    return decode(paramArrayOfChar, 0, paramArrayOfChar.length);
  }
  
  public static byte[] decode(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = paramInt2;
    if (paramInt2 % 4 != 0) {
      throw new IllegalArgumentException("Length of Base64 encoded input string is not a multiple of 4.");
    }
    while ((i > 0) && (paramArrayOfChar[(paramInt1 + i - 1)] == '=')) {
      i -= 1;
    }
    int k = i * 3 / 4;
    byte[] arrayOfByte = new byte[k];
    int m = paramInt1 + i;
    i = 0;
    paramInt2 = paramInt1;
    paramInt1 = i;
    if (paramInt2 >= m) {
      return arrayOfByte;
    }
    i = paramInt2 + 1;
    int n = paramArrayOfChar[paramInt2];
    paramInt2 = i + 1;
    int i1 = paramArrayOfChar[i];
    if (paramInt2 < m)
    {
      i = paramArrayOfChar[paramInt2];
      paramInt2 += 1;
      if (paramInt2 >= m) {
        break label161;
      }
      j = paramArrayOfChar[paramInt2];
      paramInt2 += 1;
    }
    for (;;)
    {
      if ((n <= 127) && (i1 <= 127) && (i <= 127) && (j <= 127)) {
        break label168;
      }
      throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
      i = 65;
      break;
      label161:
      j = 65;
    }
    label168:
    int i2 = map2[n];
    i1 = map2[i1];
    n = map2[i];
    int j = map2[j];
    if ((i2 < 0) || (i1 < 0) || (n < 0) || (j < 0)) {
      throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
    }
    i = paramInt1 + 1;
    arrayOfByte[paramInt1] = ((byte)(i1 >>> 4 | i2 << 2));
    if (i < k)
    {
      paramInt1 = i + 1;
      arrayOfByte[i] = ((byte)(n >>> 2 | (i1 & 0xF) << 4));
    }
    for (;;)
    {
      if (paramInt1 < k)
      {
        arrayOfByte[paramInt1] = ((byte)((n & 0x3) << 6 | j));
        paramInt1 += 1;
        break;
      }
      break;
      paramInt1 = i;
    }
  }
  
  public static String decodeString(String paramString)
  {
    return new String(decode(paramString));
  }
  
  public static char[] encode(byte[] paramArrayOfByte)
  {
    return encode(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static char[] encode(byte[] paramArrayOfByte, int paramInt)
  {
    return encode(paramArrayOfByte, 0, paramInt);
  }
  
  public static char[] encode(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int n = (paramInt2 * 4 + 2) / 3;
    char[] arrayOfChar = new char[(paramInt2 + 2) / 3 * 4];
    int i1 = paramInt1 + paramInt2;
    paramInt2 = 0;
    if (paramInt1 >= i1) {
      return arrayOfChar;
    }
    int j = paramInt1 + 1;
    int i2 = paramArrayOfByte[paramInt1] & 0xFF;
    int k;
    if (j < i1)
    {
      paramInt1 = paramArrayOfByte[j] & 0xFF;
      k = j + 1;
      j = paramInt1;
      paramInt1 = k;
      label78:
      if (paramInt1 >= i1) {
        break label221;
      }
      k = paramInt1 + 1;
      int m = paramArrayOfByte[paramInt1] & 0xFF;
      paramInt1 = k;
      k = m;
      label105:
      m = paramInt2 + 1;
      arrayOfChar[paramInt2] = map1[(i2 >>> 2)];
      paramInt2 = m + 1;
      arrayOfChar[m] = map1[((i2 & 0x3) << 4 | j >>> 4)];
      if (paramInt2 >= n) {
        break label227;
      }
      i = map1[((j & 0xF) << 2 | k >>> 6)];
      label171:
      arrayOfChar[paramInt2] = i;
      paramInt2 += 1;
      if (paramInt2 >= n) {
        break label233;
      }
    }
    label221:
    label227:
    label233:
    for (int i = map1[(k & 0x3F)];; i = 61)
    {
      arrayOfChar[paramInt2] = i;
      paramInt2 += 1;
      break;
      k = 0;
      paramInt1 = j;
      j = k;
      break label78;
      k = 0;
      break label105;
      i = 61;
      break label171;
    }
  }
  
  public static String encodeString(String paramString)
  {
    return new String(encode(paramString.getBytes()));
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.Base64Coder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */