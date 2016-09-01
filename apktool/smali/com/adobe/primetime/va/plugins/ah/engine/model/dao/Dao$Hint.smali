.class public final enum Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Hint"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

.field public static final enum SHORT:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    const-string v1, "SHORT"

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->SHORT:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->SHORT:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    aput-object v1, v0, v2

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->$VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    return-object v0
.end method

.method public static values()[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->$VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    invoke-virtual {v0}, [Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/Dao$Hint;

    return-object v0
.end method
