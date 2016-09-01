.class Lcom/gogoair/ife/views/PlayerActivity$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/mediacore/logging/LogFactory;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 631
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$9;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;
    .locals 1

    .prologue
    .line 634
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getAdobeLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    return-object v0
.end method
