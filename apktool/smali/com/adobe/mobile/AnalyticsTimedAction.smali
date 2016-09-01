.class final Lcom/adobe/mobile/AnalyticsTimedAction;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected adjustedStartTime:J

.field protected contextData:Ljava/util/Map;

.field protected databaseID:I

.field protected startTime:J


# direct methods
.method protected constructor <init>(Ljava/util/Map;JJI)V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/adobe/mobile/AnalyticsTimedAction;->contextData:Ljava/util/Map;

    .line 31
    iput p6, p0, Lcom/adobe/mobile/AnalyticsTimedAction;->databaseID:I

    .line 32
    iput-wide p2, p0, Lcom/adobe/mobile/AnalyticsTimedAction;->startTime:J

    .line 33
    iput-wide p4, p0, Lcom/adobe/mobile/AnalyticsTimedAction;->adjustedStartTime:J

    .line 34
    return-void
.end method
