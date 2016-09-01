.class final Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    .locals 2

    .prologue
    .line 224
    new-instance v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;-><init>(Landroid/os/Parcel;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 222
    invoke-virtual {p0, p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;->createFromParcel(Landroid/os/Parcel;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    .locals 1

    .prologue
    .line 228
    new-array v0, p1, [Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 222
    invoke-virtual {p0, p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;->newArray(I)[Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v0

    return-object v0
.end method
