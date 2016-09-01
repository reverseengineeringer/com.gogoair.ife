.class public final enum Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TYPE"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum aa_ad_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum aa_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum bitrate_change:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum buffer:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum chapter_complete:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum chapter_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum complete:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum error:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum pause:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum play:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

.field public static final enum start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 25
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "aa_start"

    invoke-direct {v0, v1, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->aa_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "aa_ad_start"

    invoke-direct {v0, v1, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->aa_ad_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "start"

    invoke-direct {v0, v1, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    .line 26
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "chapter_start"

    invoke-direct {v0, v1, v6}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->chapter_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "chapter_complete"

    invoke-direct {v0, v1, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->chapter_complete:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    .line 27
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "play"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->play:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "pause"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->pause:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "buffer"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->buffer:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "bitrate_change"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->bitrate_change:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "error"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->error:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    const-string v1, "complete"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->complete:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    .line 24
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->aa_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->aa_ad_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->chapter_start:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->chapter_complete:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->play:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->pause:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->buffer:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->bitrate_change:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->error:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->complete:Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->$VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    return-object v0
.end method

.method public static values()[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->$VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    invoke-virtual {v0}, [Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/primetime/va/plugins/ah/engine/model/dao/EventDao$TYPE;

    return-object v0
.end method
