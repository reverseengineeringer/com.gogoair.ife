.class public final enum Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/auditude/ads/view/AdPlaybackSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PlaybackConstants"
.end annotation


# static fields
.field public static final enum CLICK:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum COMPLETE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field private static final synthetic ENUM$VALUES:[Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum ERROR:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum NOTIFY:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum PAUSE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum PROGRESS:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum RESUME:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum SKIP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum START:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

.field public static final enum STOP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 12
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "START"

    invoke-direct {v0, v1, v3}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->START:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 13
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "PAUSE"

    invoke-direct {v0, v1, v4}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PAUSE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 14
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "RESUME"

    invoke-direct {v0, v1, v5}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->RESUME:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 15
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "STOP"

    invoke-direct {v0, v1, v6}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->STOP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 16
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "COMPLETE"

    invoke-direct {v0, v1, v7}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->COMPLETE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 17
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "ERROR"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ERROR:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 18
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "CLICK"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->CLICK:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 19
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "SKIP"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->SKIP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 20
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "PROGRESS"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PROGRESS:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 21
    new-instance v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    const-string v1, "NOTIFY"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->NOTIFY:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    .line 10
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->START:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v1, v0, v3

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PAUSE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v1, v0, v4

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->RESUME:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v1, v0, v5

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->STOP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v1, v0, v6

    sget-object v1, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->COMPLETE:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ERROR:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->CLICK:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->SKIP:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->PROGRESS:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->NOTIFY:Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    aput-object v2, v0, v1

    sput-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ENUM$VALUES:[Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    return-object v0
.end method

.method public static values()[Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;->ENUM$VALUES:[Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    array-length v1, v0

    new-array v2, v1, [Lcom/auditude/ads/view/AdPlaybackSession$PlaybackConstants;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
