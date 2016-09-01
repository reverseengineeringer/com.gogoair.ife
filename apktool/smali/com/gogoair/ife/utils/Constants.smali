.class public final Lcom/gogoair/ife/utils/Constants;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/Constants$GVInfoCode;,
        Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    }
.end annotation


# static fields
.field public static final AIRBORNEMEDIA_URL:Ljava/lang/String; = "http://airbornemedia.gogoinflight.com/app"

.field public static final ASP_LOG_URL:Ljava/lang/String; = "http://airbornemedia.gogoinflight.com/asp/api/log"

.field public static final DIN_OFFC_PRO_BOLD:Ljava/lang/String; = "DINOffcPro-Bold.otf"

.field public static final DIN_OFFC_PRO_LIGHT:Ljava/lang/String; = "DINOffcPro-Light.otf"

.field public static final EXPIRY_LENGTH_IN_MILLISECONDS:I = 0x5265c00

.field public static final FONT_AWESOME:Ljava/lang/String; = "FontAwesome.otf"

.field public static final GVAUTH_TOKEN_FORMAT:Ljava/lang/String; = "mediaId=%s&productId=%s&productPrice=%f&currencyCode=%s&localeInfo=%s&physicalMediaId=%s&logicalMediaId=%s&cacheId=%s"

.field public static final GVERROR_FORMAT:Ljava/lang/String; = "41%02d%04d"

.field public static final META_DATA_URL:Ljava/lang/String; = "http://cs.video.gogoinflight.com/media/static/players/ReferencePlayer/onprem.metadata"

.field public static final REACHABILITY_GROUND:Ljava/lang/String; = "http://msn.com"

.field public static final REACHABILITY_VIDEO_AIR:Ljava/lang/String; = "http://airbornemedia.gogoinflight.com/asp/api/config"

.field public static final SHARED_PREF_FIRST_TIME_IN_AIR_KEY:Ljava/lang/String; = "com.gogoair.ife.firstTimeInAir"

.field public static final SHARED_PREF_PLAYED_CONTENT_KEY:Ljava/lang/String; = "com.gogoair.ife.playedContent"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method
