.class final Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 947
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;
    .locals 1

    .prologue
    .line 950
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    invoke-direct {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 947
    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper$1;->createFromParcel(Landroid/os/Parcel;)Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;
    .locals 1

    .prologue
    .line 955
    new-array v0, p1, [Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 947
    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper$1;->newArray(I)[Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    move-result-object v0

    return-object v0
.end method
