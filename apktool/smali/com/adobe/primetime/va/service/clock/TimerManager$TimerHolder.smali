.class Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/service/clock/TimerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimerHolder"
.end annotation


# instance fields
.field private _interval:D

.field private _name:Ljava/lang/String;

.field private _tick:I

.field final synthetic this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/service/clock/TimerManager;Ljava/lang/String;DI)V
    .locals 1

    .prologue
    .line 214
    iput-object p1, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->this$0:Lcom/adobe/primetime/va/service/clock/TimerManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    iput-object p2, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->_name:Ljava/lang/String;

    .line 216
    iput-wide p3, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->_interval:D

    .line 217
    iput p5, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->_tick:I

    .line 218
    return-void
.end method


# virtual methods
.method getInterval()D
    .locals 2

    .prologue
    .line 225
    iget-wide v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->_interval:D

    return-wide v0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->_name:Ljava/lang/String;

    return-object v0
.end method

.method getTick()I
    .locals 1

    .prologue
    .line 229
    iget v0, p0, Lcom/adobe/primetime/va/service/clock/TimerManager$TimerHolder;->_tick:I

    return v0
.end method
