.class public final enum Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/auditude/ads/view/ViewManagerEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ViewManagerEventType"
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

.field public static final enum LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

.field public static final enum LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

.field public static final enum LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

.field public static final enum NON_LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

.field public static final enum NON_LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

.field public static final enum NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 11
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    const-string v1, "LINEAR_AD_ABOUT_TO_BEGIN"

    invoke-direct {v0, v1, v3}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 12
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    const-string v1, "LINEAR_AD_BEGIN"

    invoke-direct {v0, v1, v4}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 13
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    const-string v1, "LINEAR_AD_END"

    invoke-direct {v0, v1, v5}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 14
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    const-string v1, "NON_LINEAR_AD_ABOUT_TO_BEGIN"

    invoke-direct {v0, v1, v6}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 15
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    const-string v1, "NON_LINEAR_AD_BEGIN"

    invoke-direct {v0, v1, v7}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 16
    new-instance v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    const-string v1, "NON_LINEAR_AD_END"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 9
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_ABOUT_TO_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_BEGIN:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->NON_LINEAR_AD_END:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ENUM$VALUES:[Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    return-object v0
.end method

.method public static values()[Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->ENUM$VALUES:[Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    array-length v1, v0

    new-array v2, v1, [Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
