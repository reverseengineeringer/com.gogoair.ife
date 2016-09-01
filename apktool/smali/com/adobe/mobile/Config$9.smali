.class final Lcom/adobe/mobile/Config$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$contextData:Ljava/util/Map;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/adobe/mobile/Config$9;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/adobe/mobile/Config$9;->val$contextData:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/adobe/mobile/Config$9;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/adobe/mobile/Config$9;->val$contextData:Ljava/util/Map;

    invoke-static {v0, v1}, Lcom/adobe/mobile/Lifecycle;->start(Landroid/app/Activity;Ljava/util/Map;)V

    .line 202
    return-void
.end method
