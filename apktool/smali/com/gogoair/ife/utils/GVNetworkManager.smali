.class public final Lcom/gogoair/ife/utils/GVNetworkManager;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    }
.end annotation


# static fields
.field public static final GVNETWORK_ON_NETWORK_CHANGED:Ljava/lang/String; = "GVNETWORK_ON_NETWORK_CHANGED"

.field public static final GVNETWORK_TYPE_INTENT_EXTRA:Ljava/lang/String; = "GVNETWORK_TYPE_INTENT_EXTRA"

.field private static currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType; = null

.field private static lastNetworkInfo:Landroid/net/NetworkInfo$State; = null

.field private static final myHandler:Landroid/os/Handler;

.field private static final tag:Ljava/lang/String; = "GVNetworkManager"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 34
    const/4 v0, 0x0

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->lastNetworkInfo:Landroid/net/NetworkInfo$State;

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->myHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 37
    return-void
.end method

.method static synthetic access$000()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-object v0
.end method

.method static synthetic access$002(Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    .locals 0

    .prologue
    .line 27
    sput-object p0, Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-object p0
.end method

.method static synthetic access$100(Landroid/content/Context;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)V
    .locals 0

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/gogoair/ife/utils/GVNetworkManager;->notifyNetworkChanged(Landroid/content/Context;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)V

    return-void
.end method

.method public static getCurrentNetwork()Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-object v0
.end method

.method private static notifyNetworkChanged(Landroid/content/Context;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)V
    .locals 2

    .prologue
    .line 127
    new-instance v0, Landroid/content/Intent;

    const-string v1, "GVNETWORK_ON_NETWORK_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 128
    const-string v1, "GVNETWORK_TYPE_INTENT_EXTRA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 129
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 130
    return-void
.end method


# virtual methods
.method public findCurrentNetwork(Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 51
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 52
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 53
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-nez v0, :cond_2

    .line 54
    :cond_0
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    if-eq v0, v1, :cond_1

    .line 55
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    invoke-static {p1, v0}, Lcom/gogoair/ife/utils/GVNetworkManager;->notifyNetworkChanged(Landroid/content/Context;Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;)V

    .line 56
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->currentNetwork:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 124
    :cond_1
    :goto_0
    return-void

    .line 122
    :cond_2
    new-instance v0, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;

    invoke-direct {v0, p0, p1}, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;-><init>(Lcom/gogoair/ife/utils/GVNetworkManager;Landroid/content/Context;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "http://airbornemedia.gogoinflight.com/asp/api/config"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "http://msn.com"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/GVNetworkManager$1GVNetworkChecker;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8

    .prologue
    const-wide/16 v6, 0x3e8

    .line 134
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 135
    new-instance v1, Lcom/gogoair/ife/utils/GVNetworkManager$1;

    invoke-direct {v1, p0, p1}, Lcom/gogoair/ife/utils/GVNetworkManager$1;-><init>(Lcom/gogoair/ife/utils/GVNetworkManager;Landroid/content/Context;)V

    .line 142
    const-string v2, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 143
    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkInfo;

    .line 144
    if-eqz v0, :cond_1

    .line 145
    sget-object v2, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 146
    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->lastNetworkInfo:Landroid/net/NetworkInfo$State;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->lastNetworkInfo:Landroid/net/NetworkInfo$State;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 147
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v2

    const-string v3, "GVNetworkManager"

    const-string v4, "Wifi Connected"

    invoke-virtual {v2, v3, v4}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->myHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 150
    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->myHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 160
    :cond_0
    :goto_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager;->lastNetworkInfo:Landroid/net/NetworkInfo$State;

    .line 163
    :cond_1
    return-void

    .line 153
    :cond_2
    sget-object v2, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 154
    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->lastNetworkInfo:Landroid/net/NetworkInfo$State;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->lastNetworkInfo:Landroid/net/NetworkInfo$State;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 155
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v2

    const-string v3, "GVNetworkManager"

    const-string v4, "Wifi Disconnected"

    invoke-virtual {v2, v3, v4}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->myHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 157
    sget-object v2, Lcom/gogoair/ife/utils/GVNetworkManager;->myHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
