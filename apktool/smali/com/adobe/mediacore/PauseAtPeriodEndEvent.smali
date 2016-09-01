.class Lcom/adobe/mediacore/PauseAtPeriodEndEvent;
.super Lcom/adobe/mediacore/MediaPlayerEvent;


# instance fields
.field private final _adId:I


# direct methods
.method public constructor <init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/adobe/mediacore/MediaPlayerEvent;-><init>(Lcom/adobe/mediacore/MediaPlayerEvent$Type;)V

    iput p2, p0, Lcom/adobe/mediacore/PauseAtPeriodEndEvent;->_adId:I

    return-void
.end method


# virtual methods
.method public getAdId()I
    .locals 1

    iget v0, p0, Lcom/adobe/mediacore/PauseAtPeriodEndEvent;->_adId:I

    return v0
.end method
