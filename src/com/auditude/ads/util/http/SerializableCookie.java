package com.auditude.ads.util.http;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.cookie.BasicClientCookie;

public class SerializableCookie
  implements Serializable
{
  private static final long serialVersionUID = 6374381828722046732L;
  private transient BasicClientCookie clientCookie;
  private final transient Cookie cookie;
  
  public SerializableCookie(Cookie paramCookie)
  {
    cookie = paramCookie;
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    clientCookie = new BasicClientCookie((String)paramObjectInputStream.readObject(), (String)paramObjectInputStream.readObject());
    clientCookie.setComment((String)paramObjectInputStream.readObject());
    clientCookie.setDomain((String)paramObjectInputStream.readObject());
    clientCookie.setExpiryDate((Date)paramObjectInputStream.readObject());
    clientCookie.setPath((String)paramObjectInputStream.readObject());
    clientCookie.setVersion(paramObjectInputStream.readInt());
    clientCookie.setSecure(paramObjectInputStream.readBoolean());
  }
  
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeObject(cookie.getName());
    paramObjectOutputStream.writeObject(cookie.getValue());
    paramObjectOutputStream.writeObject(cookie.getComment());
    paramObjectOutputStream.writeObject(cookie.getDomain());
    paramObjectOutputStream.writeObject(cookie.getExpiryDate());
    paramObjectOutputStream.writeObject(cookie.getPath());
    paramObjectOutputStream.writeInt(cookie.getVersion());
    paramObjectOutputStream.writeBoolean(cookie.isSecure());
  }
  
  public Cookie getCookie()
  {
    Object localObject = cookie;
    if (clientCookie != null) {
      localObject = clientCookie;
    }
    return (Cookie)localObject;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.http.SerializableCookie
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */