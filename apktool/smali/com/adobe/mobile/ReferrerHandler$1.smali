.class final Lcom/adobe/mobile/ReferrerHandler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic val$referrerFields:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/adobe/mobile/ReferrerHandler$1;->val$referrerFields:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/mobile/ReferrerHandler$1;->val$referrerFields:Ljava/util/HashMap;

    invoke-static {v0}, Lcom/adobe/mobile/Lifecycle;->addReferralDataToSavedLifecycle(Ljava/util/Map;)V

    .line 98
    return-void
.end method
