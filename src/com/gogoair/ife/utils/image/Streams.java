package com.gogoair.ife.utils.image;

import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;

class Streams
{
  static String readFully(Reader paramReader)
    throws IOException
  {
    try
    {
      StringWriter localStringWriter = new StringWriter();
      char[] arrayOfChar = new char['Ѐ'];
      for (;;)
      {
        int i = paramReader.read(arrayOfChar);
        if (i == -1) {
          break;
        }
        localStringWriter.write(arrayOfChar, 0, i);
      }
      str = ((StringWriter)localObject).toString();
    }
    finally
    {
      paramReader.close();
    }
    String str;
    paramReader.close();
    return str;
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.Streams
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */