.class public Lcom/gogoair/ife/gogo_vision/GVApplication;
.super Landroid/app/Application;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "GVApplication"

.field private static macAddress:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getMacAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/gogoair/ife/gogo_vision/GVApplication;->macAddress:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    .prologue
    .line 25
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 29
    invoke-virtual {p0}, Lcom/gogoair/ife/gogo_vision/GVApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "55ad359363235a0f00ad8f72"

    invoke-static {v0, v1}, Lcom/crittercism/app/Crittercism;->initialize(Landroid/content/Context;Ljava/lang/String;)V

    .line 31
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 32
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 33
    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 34
    new-instance v1, Lcom/gogoair/ife/utils/GVNetworkManager;

    invoke-direct {v1}, Lcom/gogoair/ife/utils/GVNetworkManager;-><init>()V

    .line 35
    invoke-virtual {p0, v1, v0}, Lcom/gogoair/ife/gogo_vision/GVApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 37
    const-string v0, "wifi"

    invoke-virtual {p0, v0}, Lcom/gogoair/ife/gogo_vision/GVApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 38
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/gogo_vision/GVApplication;->macAddress:Ljava/lang/String;

    .line 40
    sget-object v0, Lcom/gogoair/ife/gogo_vision/GVApplication;->macAddress:Ljava/lang/String;

    invoke-static {v0}, Lcom/crittercism/app/Crittercism;->setUsername(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public onLowMemory()V
    .locals 3

    .prologue
    .line 44
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 45
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "GVApplication"

    const-string v2, "GVAPP got a low memory warning"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    return-void
.end method
