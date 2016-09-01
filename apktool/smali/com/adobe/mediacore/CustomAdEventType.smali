.class public final enum Lcom/adobe/mediacore/CustomAdEventType;
.super Ljava/lang/Enum;


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_CLICK_THROUGH:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_DURATION_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_ERROR:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_EXPANDED_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_FIRST_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_IMPRESSION:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_INTERACTION:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_LINEAR_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_LOADED:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_PAUSED:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_PLAYING:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_PROGRESS:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_SIZE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_SKIPPABLE_STATE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_SKIPPED:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_STARTED:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_STOPPED:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_THIRD_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_USER_ACCEPT_INVITATION:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_USER_CLOSE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_USER_MINIMIZE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_VIDEO_COMPLETE:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_VIDEO_MIDPOINT:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_VIDEO_START:Lcom/adobe/mediacore/CustomAdEventType;

.field public static final enum AD_VOLUME_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_LOADED"

    invoke-direct {v0, v1, v3}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_LOADED:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_STARTED"

    invoke-direct {v0, v1, v4}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_STARTED:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_STOPPED"

    invoke-direct {v0, v1, v5}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_STOPPED:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_SKIPPED"

    invoke-direct {v0, v1, v6}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_SKIPPED:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_SKIPPABLE_STATE_CHANGE"

    invoke-direct {v0, v1, v7}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_SKIPPABLE_STATE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_SIZE_CHANGE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_SIZE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_LINEAR_CHANGE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_LINEAR_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_EXPANDED_CHANGE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_EXPANDED_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_VOLUME_CHANGE"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_VOLUME_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_IMPRESSION"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_IMPRESSION:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_VIDEO_START"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_START:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_FIRST_QUARTILE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_FIRST_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_VIDEO_MIDPOINT"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_MIDPOINT:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_THIRD_QUARTILE"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_THIRD_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_VIDEO_COMPLETE"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_COMPLETE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_INTERACTION"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_INTERACTION:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_USER_ACCEPT_INVITATION"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_ACCEPT_INVITATION:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_USER_MINIMIZE"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_MINIMIZE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_USER_CLOSE"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_CLOSE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_DURATION_CHANGE"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_DURATION_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_CLICK_THROUGH"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_CLICK_THROUGH:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_ERROR"

    const/16 v2, 0x15

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_ERROR:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_PAUSED"

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_PAUSED:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_PLAYING"

    const/16 v2, 0x17

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_PLAYING:Lcom/adobe/mediacore/CustomAdEventType;

    new-instance v0, Lcom/adobe/mediacore/CustomAdEventType;

    const-string v1, "AD_PROGRESS"

    const/16 v2, 0x18

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/CustomAdEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->AD_PROGRESS:Lcom/adobe/mediacore/CustomAdEventType;

    const/16 v0, 0x19

    new-array v0, v0, [Lcom/adobe/mediacore/CustomAdEventType;

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_LOADED:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_STARTED:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_STOPPED:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_SKIPPED:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/mediacore/CustomAdEventType;->AD_SKIPPABLE_STATE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_SIZE_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_LINEAR_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_EXPANDED_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_VOLUME_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_IMPRESSION:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_START:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_FIRST_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_MIDPOINT:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_THIRD_QUARTILE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_VIDEO_COMPLETE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_INTERACTION:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_ACCEPT_INVITATION:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_MINIMIZE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_USER_CLOSE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_DURATION_CHANGE:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_CLICK_THROUGH:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_ERROR:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_PAUSED:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_PLAYING:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lcom/adobe/mediacore/CustomAdEventType;->AD_PROGRESS:Lcom/adobe/mediacore/CustomAdEventType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/mediacore/CustomAdEventType;->$VALUES:[Lcom/adobe/mediacore/CustomAdEventType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/mediacore/CustomAdEventType;
    .locals 1

    const-class v0, Lcom/adobe/mediacore/CustomAdEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/CustomAdEventType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/mediacore/CustomAdEventType;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/CustomAdEventType;->$VALUES:[Lcom/adobe/mediacore/CustomAdEventType;

    invoke-virtual {v0}, [Lcom/adobe/mediacore/CustomAdEventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/mediacore/CustomAdEventType;

    return-object v0
.end method
