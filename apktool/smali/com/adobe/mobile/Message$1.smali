.class final Lcom/adobe/mobile/Message$1;
.super Ljava/util/HashMap;
.source "SourceFile"


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 90
    const-string v0, "local"

    const-class v1, Lcom/adobe/mobile/MessageLocalNotification;

    invoke-virtual {p0, v0, v1}, Lcom/adobe/mobile/Message$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v0, "alert"

    const-class v1, Lcom/adobe/mobile/MessageAlert;

    invoke-virtual {p0, v0, v1}, Lcom/adobe/mobile/Message$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v0, "fullscreen"

    const-class v1, Lcom/adobe/mobile/MessageFullScreen;

    invoke-virtual {p0, v0, v1}, Lcom/adobe/mobile/Message$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    return-void
.end method
