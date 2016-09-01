.class Lcom/adobe/ave/VideoEngine$customMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/ave/VideoEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "customMessage"
.end annotation


# instance fields
.field m_l1:J

.field m_l2:J

.field m_n1:I

.field m_n2:I

.field m_obj:Ljava/lang/Object;


# direct methods
.method private constructor <init>(IIJJLjava/lang/Object;)V
    .locals 1

    .prologue
    .line 1133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1134
    iput p1, p0, Lcom/adobe/ave/VideoEngine$customMessage;->m_n1:I

    .line 1135
    iput p2, p0, Lcom/adobe/ave/VideoEngine$customMessage;->m_n2:I

    .line 1136
    iput-wide p3, p0, Lcom/adobe/ave/VideoEngine$customMessage;->m_l1:J

    .line 1137
    iput-wide p5, p0, Lcom/adobe/ave/VideoEngine$customMessage;->m_l2:J

    .line 1138
    iput-object p7, p0, Lcom/adobe/ave/VideoEngine$customMessage;->m_obj:Ljava/lang/Object;

    .line 1139
    return-void
.end method

.method synthetic constructor <init>(IIJJLjava/lang/Object;Lcom/adobe/ave/VideoEngine$1;)V
    .locals 1

    .prologue
    .line 1130
    invoke-direct/range {p0 .. p7}, Lcom/adobe/ave/VideoEngine$customMessage;-><init>(IIJJLjava/lang/Object;)V

    return-void
.end method
