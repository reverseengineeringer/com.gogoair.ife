.class final Lcom/adobe/mobile/Config$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic val$identifier:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/adobe/mobile/Config$5;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/adobe/mobile/Config$5;->val$identifier:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mobile/StaticMethods;->setVisitorID(Ljava/lang/String;)V

    .line 123
    return-void
.end method
