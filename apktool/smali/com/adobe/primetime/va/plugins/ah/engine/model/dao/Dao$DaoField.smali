.class public Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DaoField"
.end annotation


# instance fields
.field public final hint:Ljava/lang/Object;

.field public final value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;->value:Ljava/lang/Object;

    .line 32
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$DaoField;->hint:Ljava/lang/Object;

    .line 33
    return-void
.end method
