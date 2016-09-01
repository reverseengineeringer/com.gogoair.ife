package com.adobe.mobile;

import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import java.io.File;

abstract class AbstractDatabaseBacking
{
  private File _dbFile = null;
  protected SQLiteDatabase database;
  protected final Object dbMutex = new Object();
  
  private void createDatabase()
  {
    try
    {
      database = SQLiteDatabase.openDatabase(_dbFile.getPath(), null, 268435472);
      return;
    }
    catch (SQLException localSQLException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to open database(%s).", new Object[] { localSQLException.getLocalizedMessage() });
    }
  }
  
  protected void initDatabaseBacking(File arg1)
  {
    _dbFile = ???;
    synchronized (dbMutex)
    {
      preMigrate();
      createDatabase();
      if (database != null)
      {
        postMigrate();
        initializeDatabase();
        prepareStatements();
      }
      return;
    }
  }
  
  protected abstract void initializeDatabase();
  
  protected void postMigrate() {}
  
  protected void postReset() {}
  
  protected void preMigrate() {}
  
  protected abstract void prepareStatements();
  
  protected final void resetDatabase(Exception arg1)
  {
    StaticMethods.logErrorFormat("Analytics - Database in unrecoverable state(%s), resetting.", new Object[] { ???.getLocalizedMessage() });
    synchronized (dbMutex)
    {
      if (!_dbFile.delete())
      {
        StaticMethods.logDebugFormat("Analytics - Database file(%s) was not found.", new Object[] { _dbFile.getAbsolutePath() });
        createDatabase();
        initializeDatabase();
        prepareStatements();
        postReset();
        return;
      }
      StaticMethods.logDebugFormat("Analytics - Database file(%s) was corrupt and had to be deleted.", new Object[] { _dbFile.getAbsolutePath() });
    }
  }
  
  protected static class CorruptedDatabaseException
    extends Exception
  {
    public CorruptedDatabaseException(String paramString)
    {
      super();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AbstractDatabaseBacking
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */