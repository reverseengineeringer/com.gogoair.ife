package com.gogoair.ife.utils.image;

import android.support.annotation.NonNull;
import com.gogoair.ife.utils.GVLogger;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class DiskLruCache
  implements Closeable
{
  private static final long ANY_SEQUENCE_NUMBER = -1L;
  private static final String CLEAN = "CLEAN";
  private static final String DIRTY = "DIRTY";
  private static final String JOURNAL_FILE = "journal";
  private static final String JOURNAL_FILE_TMP = "journal.tmp";
  private static final Pattern LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_]{1,64}");
  private static final String MAGIC = "libcore.io.DiskLruCache";
  private static final OutputStream NULL_OUTPUT_STREAM = new DiskLruCache.2();
  private static final String READ = "READ";
  private static final String REMOVE = "REMOVE";
  private static final String VERSION_1 = "1";
  private final int appVersion;
  private final Callable cleanupCallable = new DiskLruCache.1(this);
  private final File directory;
  private final ThreadPoolExecutor executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue());
  private final File journalFile;
  private final File journalFileTmp;
  private Writer journalWriter;
  private final LinkedHashMap lruEntries = new LinkedHashMap(0, 0.75F, true);
  private long maxSize;
  private long nextSequenceNumber = 0L;
  private int redundantOpCount;
  private long size = 0L;
  private final int valueCount;
  
  private DiskLruCache(File paramFile, int paramInt1, int paramInt2, long paramLong)
  {
    directory = paramFile;
    appVersion = paramInt1;
    journalFile = new File(paramFile, "journal");
    journalFileTmp = new File(paramFile, "journal.tmp");
    valueCount = paramInt2;
    maxSize = paramLong;
  }
  
  private void checkNotClosed()
  {
    if (journalWriter == null) {
      throw new IllegalStateException("cache is closed");
    }
  }
  
  private void completeEdit(Editor paramEditor, boolean paramBoolean)
    throws IOException
  {
    int k = 0;
    Entry localEntry;
    try
    {
      localEntry = entry;
      if (currentEditor != paramEditor) {
        throw new IllegalStateException();
      }
    }
    finally {}
    int j = k;
    if (paramBoolean)
    {
      j = k;
      if (!readable)
      {
        int i = 0;
        for (;;)
        {
          j = k;
          if (i >= valueCount) {
            break;
          }
          if (written[i] == 0)
          {
            paramEditor.abort();
            throw new IllegalStateException("Newly created entry didn't create value for index " + i);
          }
          if (!localEntry.getDirtyFile(i).exists())
          {
            paramEditor.abort();
            return;
          }
          i += 1;
        }
      }
    }
    for (;;)
    {
      long l1;
      if (j < valueCount)
      {
        paramEditor = localEntry.getDirtyFile(j);
        if (paramBoolean)
        {
          if (paramEditor.exists())
          {
            File localFile = localEntry.getCleanFile(j);
            paramEditor.renameTo(localFile);
            l1 = lengths[j];
            long l2 = localFile.length();
            lengths[j] = l2;
            size = (size - l1 + l2);
          }
        }
        else {
          deleteIfExists(paramEditor);
        }
      }
      else
      {
        redundantOpCount += 1;
        Entry.access$702(localEntry, null);
        if ((readable | paramBoolean))
        {
          Entry.access$602(localEntry, true);
          journalWriter.write("CLEAN " + key + localEntry.getLengths() + '\n');
          if (paramBoolean)
          {
            l1 = nextSequenceNumber;
            nextSequenceNumber = (1L + l1);
            Entry.access$1202(localEntry, l1);
          }
        }
        for (;;)
        {
          if ((size <= maxSize) && (!journalRebuildRequired())) {
            break label416;
          }
          executorService.submit(cleanupCallable);
          break;
          lruEntries.remove(key);
          journalWriter.write("REMOVE " + key + '\n');
        }
        label416:
        break;
      }
      j += 1;
    }
  }
  
  private static void deleteIfExists(File paramFile)
    throws IOException
  {
    if ((paramFile.exists()) && (!paramFile.delete())) {
      throw new IOException();
    }
  }
  
  private Editor edit(String paramString, long paramLong)
    throws IOException
  {
    for (;;)
    {
      Editor localEditor;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        Entry localEntry = (Entry)lruEntries.get(paramString);
        if (paramLong != -1L) {
          if (localEntry != null)
          {
            long l = sequenceNumber;
            if (l == paramLong) {}
          }
          else
          {
            paramString = null;
            return paramString;
          }
        }
        if (localEntry == null)
        {
          localEntry = new Entry(paramString, null);
          lruEntries.put(paramString, localEntry);
          localEditor = new Editor(localEntry, null);
          Entry.access$702(localEntry, localEditor);
          journalWriter.write("DIRTY " + paramString + '\n');
          journalWriter.flush();
          paramString = localEditor;
          continue;
        }
        localEditor = currentEditor;
      }
      finally {}
      if (localEditor != null) {
        paramString = null;
      }
    }
  }
  
  private static String inputStreamToString(InputStream paramInputStream)
    throws IOException
  {
    return Streams.readFully(new InputStreamReader(paramInputStream, Charsets.UTF_8));
  }
  
  private boolean journalRebuildRequired()
  {
    return (redundantOpCount >= 2000) && (redundantOpCount >= lruEntries.size());
  }
  
  public static DiskLruCache open(File paramFile, int paramInt1, int paramInt2, long paramLong)
    throws IOException
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (paramInt2 <= 0) {
      throw new IllegalArgumentException("valueCount <= 0");
    }
    DiskLruCache localDiskLruCache = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
    if (journalFile.exists()) {
      try
      {
        localDiskLruCache.readJournal();
        localDiskLruCache.processJournal();
        journalWriter = new BufferedWriter(new FileWriter(journalFile, true));
        return localDiskLruCache;
      }
      catch (IOException localIOException)
      {
        System.out.println("DiskLruCache " + paramFile + " is corrupt: " + localIOException.getMessage() + ", removing");
        localDiskLruCache.delete();
      }
    }
    paramFile.mkdirs();
    paramFile = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
    paramFile.rebuildJournal();
    return paramFile;
  }
  
  private void processJournal()
    throws IOException
  {
    deleteIfExists(journalFileTmp);
    Iterator localIterator = lruEntries.values().iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      int i;
      if (currentEditor == null)
      {
        i = 0;
        while (i < valueCount)
        {
          size += lengths[i];
          i += 1;
        }
      }
      else
      {
        Entry.access$702(localEntry, null);
        i = 0;
        while (i < valueCount)
        {
          deleteIfExists(localEntry.getCleanFile(i));
          deleteIfExists(localEntry.getDirtyFile(i));
          i += 1;
        }
        localIterator.remove();
      }
    }
  }
  
  private void readJournal()
    throws IOException
  {
    StrictLineReader localStrictLineReader = new StrictLineReader(new FileInputStream(journalFile), Charsets.US_ASCII);
    try
    {
      String str1 = localStrictLineReader.readLine();
      String str2 = localStrictLineReader.readLine();
      String str3 = localStrictLineReader.readLine();
      String str4 = localStrictLineReader.readLine();
      String str5 = localStrictLineReader.readLine();
      if ((!"libcore.io.DiskLruCache".equals(str1)) || (!"1".equals(str2)) || (!Integer.toString(appVersion).equals(str3)) || (!Integer.toString(valueCount).equals(str4)) || (!"".equals(str5))) {
        throw new IOException("unexpected journal header: [" + str1 + ", " + str2 + ", " + str4 + ", " + str5 + "]");
      }
    }
    finally
    {
      IoUtils.closeQuietly(localStrictLineReader);
    }
  }
  
  private void readJournalLine(String paramString)
    throws IOException
  {
    String[] arrayOfString = paramString.split(" ");
    if (arrayOfString.length < 2) {
      throw new IOException("unexpected journal line: " + paramString);
    }
    String str = arrayOfString[1];
    if ((arrayOfString[0].equals("REMOVE")) && (arrayOfString.length == 2))
    {
      lruEntries.remove(str);
      return;
    }
    Entry localEntry = (Entry)lruEntries.get(str);
    if (localEntry == null)
    {
      localEntry = new Entry(str, null);
      lruEntries.put(str, localEntry);
    }
    for (;;)
    {
      if ((arrayOfString[0].equals("CLEAN")) && (arrayOfString.length == valueCount + 2))
      {
        Entry.access$602(localEntry, true);
        Entry.access$702(localEntry, null);
        localEntry.setLengths((String[])Arrays.copyOfRange(arrayOfString, 2, arrayOfString.length));
        return;
      }
      if ((arrayOfString[0].equals("DIRTY")) && (arrayOfString.length == 2))
      {
        Entry.access$702(localEntry, new Editor(localEntry, null));
        return;
      }
      if ((arrayOfString[0].equals("READ")) && (arrayOfString.length == 2)) {
        break;
      }
      throw new IOException("unexpected journal line: " + paramString);
    }
  }
  
  private void rebuildJournal()
    throws IOException
  {
    for (;;)
    {
      try
      {
        if (journalWriter != null) {
          journalWriter.close();
        }
        BufferedWriter localBufferedWriter = new BufferedWriter(new FileWriter(journalFileTmp));
        localBufferedWriter.write("libcore.io.DiskLruCache");
        localBufferedWriter.write("\n");
        localBufferedWriter.write("1");
        localBufferedWriter.write("\n");
        localBufferedWriter.write(Integer.toString(appVersion));
        localBufferedWriter.write("\n");
        localBufferedWriter.write(Integer.toString(valueCount));
        localBufferedWriter.write("\n");
        localBufferedWriter.write("\n");
        Iterator localIterator = lruEntries.values().iterator();
        if (!localIterator.hasNext()) {
          break;
        }
        Entry localEntry = (Entry)localIterator.next();
        if (currentEditor != null) {
          localBufferedWriter.write("DIRTY " + key + '\n');
        } else {
          ((Writer)localObject).write("CLEAN " + key + localEntry.getLengths() + '\n');
        }
      }
      finally {}
    }
    ((Writer)localObject).close();
    journalFileTmp.renameTo(journalFile);
    journalWriter = new BufferedWriter(new FileWriter(journalFile, true));
  }
  
  private boolean remove(String paramString)
    throws IOException
  {
    int i = 0;
    for (;;)
    {
      try
      {
        checkNotClosed();
        validateKey(paramString);
        Entry localEntry = (Entry)lruEntries.get(paramString);
        Object localObject;
        if (localEntry != null)
        {
          localObject = currentEditor;
          if (localObject == null) {}
        }
        else
        {
          bool = false;
          return bool;
          size -= lengths[i];
          lengths[i] = 0L;
          i += 1;
        }
        if (i < valueCount)
        {
          localObject = localEntry.getCleanFile(i);
          if (((File)localObject).delete()) {
            continue;
          }
          throw new IOException("failed to delete " + localObject);
        }
      }
      finally {}
      redundantOpCount += 1;
      journalWriter.append("REMOVE " + paramString + '\n');
      GVLogger.getDefaultLogger().e("DISKCACHE", "REMOVE 2! LRUEntries is " + lruEntries);
      lruEntries.remove(paramString);
      if (journalRebuildRequired()) {
        executorService.submit(cleanupCallable);
      }
      boolean bool = true;
    }
  }
  
  private void trimToSize()
    throws IOException
  {
    while (size > maxSize) {
      remove((String)((Map.Entry)lruEntries.entrySet().iterator().next()).getKey());
    }
  }
  
  private void validateKey(String paramString)
  {
    if (!LEGAL_KEY_PATTERN.matcher(paramString).matches()) {
      throw new IllegalArgumentException("keys must match regex [a-z0-9_]{1,64}: \"" + paramString + "\"");
    }
  }
  
  public void close()
    throws IOException
  {
    for (;;)
    {
      try
      {
        Object localObject1 = journalWriter;
        if (localObject1 == null) {
          return;
        }
        localObject1 = new ArrayList(lruEntries.values()).iterator();
        if (((Iterator)localObject1).hasNext())
        {
          Entry localEntry = (Entry)((Iterator)localObject1).next();
          if (currentEditor == null) {
            continue;
          }
          currentEditor.abort();
          continue;
        }
        trimToSize();
      }
      finally {}
      journalWriter.close();
      journalWriter = null;
    }
  }
  
  public void delete()
    throws IOException
  {
    close();
    IoUtils.deleteContents(directory);
  }
  
  public Editor edit(String paramString)
    throws IOException
  {
    return edit(paramString, -1L);
  }
  
  public void flush()
    throws IOException
  {
    try
    {
      checkNotClosed();
      trimToSize();
      journalWriter.flush();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public Snapshot get(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: monitorenter
    //   5: aload_0
    //   6: invokespecial 310	com/gogoair/ife/utils/image/DiskLruCache:checkNotClosed	()V
    //   9: aload_0
    //   10: aload_1
    //   11: invokespecial 313	com/gogoair/ife/utils/image/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: getfield 98	com/gogoair/ife/utils/image/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   18: aload_1
    //   19: invokevirtual 316	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   22: checkcast 14	com/gogoair/ife/utils/image/DiskLruCache$Entry
    //   25: astore 5
    //   27: aload 5
    //   29: ifnonnull +10 -> 39
    //   32: aload 4
    //   34: astore_3
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_3
    //   38: areturn
    //   39: aload 4
    //   41: astore_3
    //   42: aload 5
    //   44: invokestatic 217	com/gogoair/ife/utils/image/DiskLruCache$Entry:access$600	(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z
    //   47: ifeq -12 -> 35
    //   50: aload_0
    //   51: getfield 140	com/gogoair/ife/utils/image/DiskLruCache:valueCount	I
    //   54: anewarray 561	java/io/InputStream
    //   57: astore_3
    //   58: iconst_0
    //   59: istore_2
    //   60: iload_2
    //   61: aload_0
    //   62: getfield 140	com/gogoair/ife/utils/image/DiskLruCache:valueCount	I
    //   65: if_icmpge +26 -> 91
    //   68: aload_3
    //   69: iload_2
    //   70: new 437	java/io/FileInputStream
    //   73: dup
    //   74: aload 5
    //   76: iload_2
    //   77: invokevirtual 250	com/gogoair/ife/utils/image/DiskLruCache$Entry:getCleanFile	(I)Ljava/io/File;
    //   80: invokespecial 439	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   83: aastore
    //   84: iload_2
    //   85: iconst_1
    //   86: iadd
    //   87: istore_2
    //   88: goto -28 -> 60
    //   91: aload_0
    //   92: aload_0
    //   93: getfield 196	com/gogoair/ife/utils/image/DiskLruCache:redundantOpCount	I
    //   96: iconst_1
    //   97: iadd
    //   98: putfield 196	com/gogoair/ife/utils/image/DiskLruCache:redundantOpCount	I
    //   101: aload_0
    //   102: getfield 146	com/gogoair/ife/utils/image/DiskLruCache:journalWriter	Ljava/io/Writer;
    //   105: new 226	java/lang/StringBuilder
    //   108: dup
    //   109: invokespecial 227	java/lang/StringBuilder:<init>	()V
    //   112: ldc_w 563
    //   115: invokevirtual 233	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   118: aload_1
    //   119: invokevirtual 233	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   122: bipush 10
    //   124: invokevirtual 286	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   127: invokevirtual 240	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   130: invokevirtual 506	java/io/Writer:append	(Ljava/lang/CharSequence;)Ljava/io/Writer;
    //   133: pop
    //   134: aload_0
    //   135: invokespecial 174	com/gogoair/ife/utils/image/DiskLruCache:journalRebuildRequired	()Z
    //   138: ifeq +15 -> 153
    //   141: aload_0
    //   142: getfield 118	com/gogoair/ife/utils/image/DiskLruCache:executorService	Ljava/util/concurrent/ThreadPoolExecutor;
    //   145: aload_0
    //   146: getfield 125	com/gogoair/ife/utils/image/DiskLruCache:cleanupCallable	Ljava/util/concurrent/Callable;
    //   149: invokevirtual 299	java/util/concurrent/ThreadPoolExecutor:submit	(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    //   152: pop
    //   153: new 17	com/gogoair/ife/utils/image/DiskLruCache$Snapshot
    //   156: dup
    //   157: aload_0
    //   158: aload_1
    //   159: aload 5
    //   161: invokestatic 320	com/gogoair/ife/utils/image/DiskLruCache$Entry:access$1200	(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)J
    //   164: aload_3
    //   165: aload 5
    //   167: invokestatic 258	com/gogoair/ife/utils/image/DiskLruCache$Entry:access$1000	(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J
    //   170: aconst_null
    //   171: invokespecial 566	com/gogoair/ife/utils/image/DiskLruCache$Snapshot:<init>	(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[JLcom/gogoair/ife/utils/image/DiskLruCache$1;)V
    //   174: astore_3
    //   175: goto -140 -> 35
    //   178: astore_1
    //   179: aload_0
    //   180: monitorexit
    //   181: aload_1
    //   182: athrow
    //   183: astore_1
    //   184: aload 4
    //   186: astore_3
    //   187: goto -152 -> 35
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	190	0	this	DiskLruCache
    //   0	190	1	paramString	String
    //   59	29	2	i	int
    //   34	153	3	localObject1	Object
    //   1	184	4	localObject2	Object
    //   25	141	5	localEntry	Entry
    // Exception table:
    //   from	to	target	type
    //   5	27	178	finally
    //   42	58	178	finally
    //   60	84	178	finally
    //   91	153	178	finally
    //   153	175	178	finally
    //   60	84	183	java/io/FileNotFoundException
  }
  
  public File getDirectory()
  {
    return directory;
  }
  
  public long getMaxSize()
  {
    return maxSize;
  }
  
  public boolean isClosed()
  {
    return journalWriter == null;
  }
  
  public void setMaxSize(long paramLong)
  {
    try
    {
      maxSize = paramLong;
      executorService.submit(cleanupCallable);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public long size()
  {
    try
    {
      long l = size;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public final class Editor
  {
    private boolean committed;
    private final DiskLruCache.Entry entry;
    private boolean hasErrors;
    private final boolean[] written;
    
    private Editor(DiskLruCache.Entry paramEntry)
    {
      entry = paramEntry;
      if (DiskLruCache.Entry.access$600(paramEntry)) {}
      for (this$1 = null;; this$1 = new boolean[valueCount])
      {
        written = DiskLruCache.this;
        return;
      }
    }
    
    public void abort()
      throws IOException
    {
      DiskLruCache.this.completeEdit(this, false);
    }
    
    public void abortUnlessCommitted()
    {
      if (!committed) {}
      try
      {
        abort();
        return;
      }
      catch (IOException localIOException) {}
    }
    
    public void commit()
      throws IOException
    {
      if (hasErrors)
      {
        DiskLruCache.this.completeEdit(this, false);
        DiskLruCache.this.remove(DiskLruCache.Entry.access$1100(entry));
      }
      for (;;)
      {
        committed = true;
        return;
        DiskLruCache.this.completeEdit(this, true);
      }
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      InputStream localInputStream = newInputStream(paramInt);
      if (localInputStream != null) {
        return DiskLruCache.inputStreamToString(localInputStream);
      }
      return null;
    }
    
    public InputStream newInputStream(int paramInt)
    {
      synchronized (DiskLruCache.this)
      {
        if (DiskLruCache.Entry.access$700(entry) != this) {
          throw new IllegalStateException();
        }
      }
      if (!DiskLruCache.Entry.access$600(entry)) {
        return null;
      }
      try
      {
        FileInputStream localFileInputStream = new FileInputStream(entry.getCleanFile(paramInt));
        return localFileInputStream;
      }
      catch (FileNotFoundException localFileNotFoundException) {}
      return null;
    }
    
    public OutputStream newOutputStream(int paramInt)
    {
      synchronized (DiskLruCache.this)
      {
        if (DiskLruCache.Entry.access$700(entry) != this) {
          throw new IllegalStateException();
        }
      }
      if (!DiskLruCache.Entry.access$600(entry)) {
        written[paramInt] = true;
      }
      File localFile = entry.getDirtyFile(paramInt);
      try
      {
        Object localObject2 = new FileOutputStream(localFile);
        localObject2 = new FaultHidingOutputStream((OutputStream)localObject2, null);
        return (OutputStream)localObject2;
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        for (;;)
        {
          directory.mkdirs();
          try
          {
            FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
          }
          catch (FileNotFoundException localFileNotFoundException2)
          {
            OutputStream localOutputStream = DiskLruCache.NULL_OUTPUT_STREAM;
            return localOutputStream;
          }
        }
      }
    }
    
    public void set(int paramInt, String paramString)
      throws IOException
    {
      try
      {
        OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(newOutputStream(paramInt), Charsets.UTF_8);
        IoUtils.closeQuietly(localOutputStreamWriter);
      }
      finally
      {
        try
        {
          localOutputStreamWriter.write(paramString);
          IoUtils.closeQuietly(localOutputStreamWriter);
          return;
        }
        finally {}
        paramString = finally;
        localOutputStreamWriter = null;
      }
      throw paramString;
    }
    
    private class FaultHidingOutputStream
      extends FilterOutputStream
    {
      private FaultHidingOutputStream(OutputStream paramOutputStream)
      {
        super();
      }
      
      public void close()
      {
        try
        {
          out.close();
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
      
      public void flush()
      {
        try
        {
          out.flush();
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
      
      public void write(int paramInt)
      {
        try
        {
          out.write(paramInt);
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
      
      public void write(@NonNull byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      {
        try
        {
          out.write(paramArrayOfByte, paramInt1, paramInt2);
          return;
        }
        catch (IOException paramArrayOfByte)
        {
          DiskLruCache.Editor.access$2402(DiskLruCache.Editor.this, true);
        }
      }
    }
  }
  
  private final class Entry
  {
    private DiskLruCache.Editor currentEditor;
    private final String key;
    private final long[] lengths;
    private boolean readable;
    private long sequenceNumber;
    
    private Entry(String paramString)
    {
      key = paramString;
      lengths = new long[valueCount];
    }
    
    private IOException invalidLengths(String[] paramArrayOfString)
      throws IOException
    {
      throw new IOException("unexpected journal line: " + Arrays.toString(paramArrayOfString));
    }
    
    private void setLengths(String[] paramArrayOfString)
      throws IOException
    {
      if (paramArrayOfString.length != valueCount) {
        throw invalidLengths(paramArrayOfString);
      }
      int i = 0;
      try
      {
        while (i < paramArrayOfString.length)
        {
          lengths[i] = Long.parseLong(paramArrayOfString[i]);
          i += 1;
        }
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw invalidLengths(paramArrayOfString);
      }
    }
    
    public File getCleanFile(int paramInt)
    {
      return new File(directory, key + "." + paramInt);
    }
    
    public File getDirtyFile(int paramInt)
    {
      return new File(directory, key + "." + paramInt + ".tmp");
    }
    
    public String getLengths()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      long[] arrayOfLong = lengths;
      int j = arrayOfLong.length;
      int i = 0;
      while (i < j)
      {
        long l = arrayOfLong[i];
        localStringBuilder.append(' ').append(l);
        i += 1;
      }
      return localStringBuilder.toString();
    }
  }
  
  public final class Snapshot
    implements Closeable
  {
    private final InputStream[] ins;
    private final String key;
    private final long[] lengths;
    private final long sequenceNumber;
    
    private Snapshot(String paramString, long paramLong, InputStream[] paramArrayOfInputStream, long[] paramArrayOfLong)
    {
      key = paramString;
      sequenceNumber = paramLong;
      ins = paramArrayOfInputStream;
      lengths = paramArrayOfLong;
    }
    
    public void close()
    {
      InputStream[] arrayOfInputStream = ins;
      int j = arrayOfInputStream.length;
      int i = 0;
      while (i < j)
      {
        IoUtils.closeQuietly(arrayOfInputStream[i]);
        i += 1;
      }
    }
    
    public DiskLruCache.Editor edit()
      throws IOException
    {
      return DiskLruCache.this.edit(key, sequenceNumber);
    }
    
    public InputStream getInputStream(int paramInt)
    {
      return ins[paramInt];
    }
    
    public long getLength(int paramInt)
    {
      return lengths[paramInt];
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      return DiskLruCache.inputStreamToString(getInputStream(paramInt));
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.DiskLruCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */