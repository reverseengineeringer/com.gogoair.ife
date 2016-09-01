package com.adobe.mediacore.utils;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public final class ByteArraySerializer
{
  private static final String LOG_TAG = "[PSDK]::" + ByteArraySerializer.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  
  /* Error */
  public static Object fromByteArray(byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: new 52	java/io/ByteArrayInputStream
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 55	java/io/ByteArrayInputStream:<init>	([B)V
    //   8: astore_0
    //   9: new 57	java/io/ObjectInputStream
    //   12: dup
    //   13: aload_0
    //   14: invokespecial 60	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   17: astore_1
    //   18: aload_1
    //   19: astore_0
    //   20: aload_1
    //   21: invokeinterface 66 1 0
    //   26: astore_2
    //   27: aload_1
    //   28: invokestatic 70	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseInput	(Ljava/io/ObjectInput;)V
    //   31: aload_2
    //   32: areturn
    //   33: astore_2
    //   34: aconst_null
    //   35: astore_1
    //   36: aload_1
    //   37: astore_0
    //   38: getstatic 40	com/adobe/mediacore/utils/ByteArraySerializer:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   41: new 12	java/lang/StringBuilder
    //   44: dup
    //   45: invokespecial 15	java/lang/StringBuilder:<init>	()V
    //   48: getstatic 32	com/adobe/mediacore/utils/ByteArraySerializer:LOG_TAG	Ljava/lang/String;
    //   51: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: ldc 72
    //   56: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: invokevirtual 30	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   62: ldc 74
    //   64: aload_2
    //   65: invokeinterface 80 4 0
    //   70: aload_1
    //   71: invokestatic 70	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseInput	(Ljava/io/ObjectInput;)V
    //   74: aconst_null
    //   75: areturn
    //   76: astore_2
    //   77: aconst_null
    //   78: astore_1
    //   79: aload_1
    //   80: astore_0
    //   81: getstatic 40	com/adobe/mediacore/utils/ByteArraySerializer:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   84: new 12	java/lang/StringBuilder
    //   87: dup
    //   88: invokespecial 15	java/lang/StringBuilder:<init>	()V
    //   91: getstatic 32	com/adobe/mediacore/utils/ByteArraySerializer:LOG_TAG	Ljava/lang/String;
    //   94: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: ldc 72
    //   99: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   102: invokevirtual 30	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   105: ldc 74
    //   107: aload_2
    //   108: invokeinterface 80 4 0
    //   113: aload_1
    //   114: invokestatic 70	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseInput	(Ljava/io/ObjectInput;)V
    //   117: aconst_null
    //   118: areturn
    //   119: astore_2
    //   120: aconst_null
    //   121: astore_1
    //   122: aload_1
    //   123: astore_0
    //   124: getstatic 40	com/adobe/mediacore/utils/ByteArraySerializer:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   127: new 12	java/lang/StringBuilder
    //   130: dup
    //   131: invokespecial 15	java/lang/StringBuilder:<init>	()V
    //   134: getstatic 32	com/adobe/mediacore/utils/ByteArraySerializer:LOG_TAG	Ljava/lang/String;
    //   137: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: ldc 72
    //   142: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   145: invokevirtual 30	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   148: ldc 74
    //   150: aload_2
    //   151: invokeinterface 80 4 0
    //   156: aload_1
    //   157: invokestatic 70	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseInput	(Ljava/io/ObjectInput;)V
    //   160: aconst_null
    //   161: areturn
    //   162: astore_0
    //   163: aconst_null
    //   164: astore_2
    //   165: aload_0
    //   166: astore_1
    //   167: aload_2
    //   168: invokestatic 70	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseInput	(Ljava/io/ObjectInput;)V
    //   171: aload_1
    //   172: athrow
    //   173: astore_1
    //   174: aload_0
    //   175: astore_2
    //   176: goto -9 -> 167
    //   179: astore_2
    //   180: goto -58 -> 122
    //   183: astore_2
    //   184: goto -105 -> 79
    //   187: astore_2
    //   188: goto -152 -> 36
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	191	0	paramArrayOfByte	byte[]
    //   17	155	1	localObject1	Object
    //   173	1	1	localObject2	Object
    //   26	6	2	localObject3	Object
    //   33	32	2	localStreamCorruptedException1	java.io.StreamCorruptedException
    //   76	32	2	localIOException1	IOException
    //   119	32	2	localClassNotFoundException1	ClassNotFoundException
    //   164	12	2	localObject4	Object
    //   179	1	2	localClassNotFoundException2	ClassNotFoundException
    //   183	1	2	localIOException2	IOException
    //   187	1	2	localStreamCorruptedException2	java.io.StreamCorruptedException
    // Exception table:
    //   from	to	target	type
    //   9	18	33	java/io/StreamCorruptedException
    //   9	18	76	java/io/IOException
    //   9	18	119	java/lang/ClassNotFoundException
    //   9	18	162	finally
    //   20	27	173	finally
    //   38	70	173	finally
    //   81	113	173	finally
    //   124	156	173	finally
    //   20	27	179	java/lang/ClassNotFoundException
    //   20	27	183	java/io/IOException
    //   20	27	187	java/io/StreamCorruptedException
  }
  
  private static void quietCloseInput(ObjectInput paramObjectInput)
  {
    if (paramObjectInput != null) {}
    try
    {
      paramObjectInput.close();
      return;
    }
    catch (IOException paramObjectInput)
    {
      _logger.e(LOG_TAG + "#quietClose", "Unable to close input stream.", paramObjectInput);
    }
  }
  
  private static void quietCloseOutput(ObjectOutput paramObjectOutput)
  {
    if (paramObjectOutput != null) {}
    try
    {
      paramObjectOutput.close();
      return;
    }
    catch (IOException paramObjectOutput)
    {
      _logger.e(LOG_TAG + "#quietClose", "Unable to close output stream.", paramObjectOutput);
    }
  }
  
  /* Error */
  public static byte[] toByteArray(Object paramObject)
  {
    // Byte code:
    //   0: new 98	java/io/ByteArrayOutputStream
    //   3: dup
    //   4: invokespecial 99	java/io/ByteArrayOutputStream:<init>	()V
    //   7: astore_3
    //   8: new 101	java/io/ObjectOutputStream
    //   11: dup
    //   12: aload_3
    //   13: invokespecial 104	java/io/ObjectOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   16: astore_2
    //   17: aload_2
    //   18: astore_1
    //   19: aload_2
    //   20: aload_0
    //   21: invokeinterface 108 2 0
    //   26: aload_2
    //   27: astore_1
    //   28: aload_3
    //   29: invokevirtual 111	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   32: astore_0
    //   33: aload_2
    //   34: invokestatic 113	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseOutput	(Ljava/io/ObjectOutput;)V
    //   37: aload_0
    //   38: areturn
    //   39: astore_3
    //   40: aconst_null
    //   41: astore_0
    //   42: aload_0
    //   43: astore_1
    //   44: getstatic 40	com/adobe/mediacore/utils/ByteArraySerializer:_logger	Lcom/adobe/mediacore/logging/Logger;
    //   47: new 12	java/lang/StringBuilder
    //   50: dup
    //   51: invokespecial 15	java/lang/StringBuilder:<init>	()V
    //   54: getstatic 32	com/adobe/mediacore/utils/ByteArraySerializer:LOG_TAG	Ljava/lang/String;
    //   57: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: ldc 115
    //   62: invokevirtual 21	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: invokevirtual 30	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   68: ldc 74
    //   70: aload_3
    //   71: invokeinterface 80 4 0
    //   76: aload_0
    //   77: invokestatic 113	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseOutput	(Ljava/io/ObjectOutput;)V
    //   80: aconst_null
    //   81: areturn
    //   82: astore_0
    //   83: aconst_null
    //   84: astore_1
    //   85: aload_1
    //   86: invokestatic 113	com/adobe/mediacore/utils/ByteArraySerializer:quietCloseOutput	(Ljava/io/ObjectOutput;)V
    //   89: aload_0
    //   90: athrow
    //   91: astore_0
    //   92: goto -7 -> 85
    //   95: astore_3
    //   96: aload_2
    //   97: astore_0
    //   98: goto -56 -> 42
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	101	0	paramObject	Object
    //   18	68	1	localObject	Object
    //   16	81	2	localObjectOutputStream	java.io.ObjectOutputStream
    //   7	22	3	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    //   39	32	3	localIOException1	IOException
    //   95	1	3	localIOException2	IOException
    // Exception table:
    //   from	to	target	type
    //   8	17	39	java/io/IOException
    //   8	17	82	finally
    //   19	26	91	finally
    //   28	33	91	finally
    //   44	76	91	finally
    //   19	26	95	java/io/IOException
    //   28	33	95	java/io/IOException
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.utils.ByteArraySerializer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */