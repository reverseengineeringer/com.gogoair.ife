package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.ILogger;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

class SettingsParser
{
  private static final String KEY_CHECK_STATUS_INTERVAL = "check_status_interval";
  private static final String KEY_REPORTING_INTERVAL = "reporting_interval";
  private static final String KEY_TRACK_EXTERNAL_ERRORS = "track_external_errors";
  private final String _data;
  private String _logTag;
  private ILogger _logger;
  
  public SettingsParser(String paramString, ILogger paramILogger)
  {
    if (paramString == null) {
      throw new Error("Reference to the data object cannot be NULL.");
    }
    _data = paramString;
    if (paramILogger == null) {
      throw new Error("Reference to logger object cannot be NULL.");
    }
    _logger = paramILogger;
    _logTag = SettingsParser.class.getSimpleName();
  }
  
  public Map parse()
  {
    boolean bool = false;
    for (;;)
    {
      try
      {
        Object localObject1 = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        localObject3 = new InputSource();
        ((InputSource)localObject3).setCharacterStream(new StringReader(_data));
        localObject4 = ((DocumentBuilder)localObject1).parse((InputSource)localObject3);
        ((Document)localObject4).getDocumentElement().normalize();
        localObject1 = ((Document)localObject4).getElementsByTagName("trackingInterval").item(0);
        if (localObject1 == null) {
          break label288;
        }
        localObject1 = Double.valueOf(Double.parseDouble(((Node)localObject1).getFirstChild().getNodeValue()));
        localObject3 = ((Document)localObject4).getElementsByTagName("setupCheckInterval").item(0);
        if (localObject3 == null) {
          break label283;
        }
        localObject3 = Double.valueOf(Double.parseDouble(((Node)localObject3).getFirstChild().getNodeValue()));
        localObject4 = ((Document)localObject4).getElementsByTagName("trackExternalErrors").item(0);
        if (localObject4 == null) {
          break label277;
        }
        if (Double.parseDouble(((Node)localObject4).getFirstChild().getNodeValue()) == 1.0D) {
          bool = true;
        }
        localObject4 = Boolean.valueOf(bool);
        if ((localObject1 != null) && (localObject3 != null) && (localObject4 != null))
        {
          HashMap localHashMap = new HashMap();
          localHashMap.put("reporting_interval", localObject1);
          localHashMap.put("check_status_interval", localObject3);
          localHashMap.put("track_external_errors", localObject4);
          return localHashMap;
        }
      }
      catch (RuntimeException localRuntimeException)
      {
        throw localRuntimeException;
      }
      catch (Exception localException)
      {
        _logger.warn(_logTag, "#parse() - Failed to parse configuration settings: " + localException.getMessage());
      }
      return null;
      label277:
      Object localObject4 = null;
      continue;
      label283:
      Object localObject3 = null;
      continue;
      label288:
      Object localObject2 = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.SettingsParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */