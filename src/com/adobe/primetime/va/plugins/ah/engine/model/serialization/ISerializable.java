package com.adobe.primetime.va.plugins.ah.engine.model.serialization;

import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import java.util.Map;

public abstract interface ISerializable
{
  public abstract Map serializeReport(Report paramReport);
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.serialization.ISerializable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */