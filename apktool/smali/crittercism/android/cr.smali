.class public final enum Lcrittercism/android/cr;
.super Ljava/lang/Enum;


# static fields
.field public static final enum a:Lcrittercism/android/cr;

.field public static final enum b:Lcrittercism/android/cr;

.field public static final enum c:Lcrittercism/android/cr;

.field public static final enum d:Lcrittercism/android/cr;

.field public static final enum e:Lcrittercism/android/cr;

.field public static final enum f:Lcrittercism/android/cr;

.field public static final enum g:Lcrittercism/android/cr;

.field public static final enum h:Lcrittercism/android/cr;

.field public static final enum i:Lcrittercism/android/cr;

.field public static final enum j:Lcrittercism/android/cr;

.field public static final enum k:Lcrittercism/android/cr;

.field public static final enum l:Lcrittercism/android/cr;

.field private static final synthetic o:[Lcrittercism/android/cr;


# instance fields
.field private m:Ljava/lang/String;

.field private n:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 4
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "APP_LOADS_FILES"

    const-string v2, "com.crittercism.apploads"

    const-string v3, "appLoadFiles"

    invoke-direct {v0, v1, v5, v2, v3}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->a:Lcrittercism/android/cr;

    .line 5
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "HANDLED_EXCEPTION_FILES"

    const-string v2, "com.crittercism.exceptions"

    const-string v3, "handledExceptionFiles"

    invoke-direct {v0, v1, v6, v2, v3}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->b:Lcrittercism/android/cr;

    .line 6
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "SDK_CRASHES_FILES"

    const-string v2, "com.crittercism.sdkcrashes"

    const-string v3, "sdkCrashFiles"

    invoke-direct {v0, v1, v7, v2, v3}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->c:Lcrittercism/android/cr;

    .line 7
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "NDK_CRASHES_FILES"

    const-string v2, "com.crittercism.ndkcrashes"

    const-string v3, "ndkCrashFiles"

    invoke-direct {v0, v1, v8, v2, v3}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->d:Lcrittercism/android/cr;

    .line 8
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "CURRENT_BREADCRUMBS_FILES"

    const-string v2, "com.crittercism.breadcrumbs"

    const-string v3, "currentBreadcrumbFiles"

    invoke-direct {v0, v1, v9, v2, v3}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->e:Lcrittercism/android/cr;

    .line 9
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "PREVIOUS_BREADCRUMBS_FILES"

    const/4 v2, 0x5

    const-string v3, "com.crittercism.breadcrumbs"

    const-string v4, "previousBreadcrumbFiles"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->f:Lcrittercism/android/cr;

    .line 10
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "NETWORK_BREADCRUMBS_FILES"

    const/4 v2, 0x6

    const-string v3, "com.crittercism.breadcrumbs"

    const-string v4, "networkBreadcrumbFiles"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->g:Lcrittercism/android/cr;

    .line 11
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "CRASHED_ON_LAST_LOAD_SETTING"

    const/4 v2, 0x7

    const-string v3, "com.crittercism.usersettings"

    const-string v4, "crashedOnLastLoad"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->h:Lcrittercism/android/cr;

    .line 12
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "OPT_OUT_STATUS_SETTING"

    const/16 v2, 0x8

    const-string v3, "com.crittercism.usersettings"

    const-string v4, "optOutStatusSettings"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->i:Lcrittercism/android/cr;

    .line 13
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "SESSION_ID_SETTING"

    const/16 v2, 0x9

    const-string v3, "com.crittercism.usersettings"

    const-string v4, "sessionIDSetting"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->j:Lcrittercism/android/cr;

    .line 14
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "OLD_SESSION_ID_SETTING"

    const/16 v2, 0xa

    const-string v3, "com.crittercism.prefs"

    const-string v4, "com.crittercism.prefs.sessid"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->k:Lcrittercism/android/cr;

    .line 15
    new-instance v0, Lcrittercism/android/cr;

    const-string v1, "OLD_OPT_OUT_STATUS_SETTING"

    const/16 v2, 0xb

    const-string v3, "com.crittercism.prefs"

    const-string v4, "optOutStatus"

    invoke-direct {v0, v1, v2, v3, v4}, Lcrittercism/android/cr;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/cr;->l:Lcrittercism/android/cr;

    .line 3
    const/16 v0, 0xc

    new-array v0, v0, [Lcrittercism/android/cr;

    sget-object v1, Lcrittercism/android/cr;->a:Lcrittercism/android/cr;

    aput-object v1, v0, v5

    sget-object v1, Lcrittercism/android/cr;->b:Lcrittercism/android/cr;

    aput-object v1, v0, v6

    sget-object v1, Lcrittercism/android/cr;->c:Lcrittercism/android/cr;

    aput-object v1, v0, v7

    sget-object v1, Lcrittercism/android/cr;->d:Lcrittercism/android/cr;

    aput-object v1, v0, v8

    sget-object v1, Lcrittercism/android/cr;->e:Lcrittercism/android/cr;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcrittercism/android/cr;->f:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcrittercism/android/cr;->g:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcrittercism/android/cr;->h:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcrittercism/android/cr;->i:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcrittercism/android/cr;->j:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcrittercism/android/cr;->k:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcrittercism/android/cr;->l:Lcrittercism/android/cr;

    aput-object v2, v0, v1

    sput-object v0, Lcrittercism/android/cr;->o:[Lcrittercism/android/cr;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 21
    iput-object p3, p0, Lcrittercism/android/cr;->m:Ljava/lang/String;

    .line 22
    iput-object p4, p0, Lcrittercism/android/cr;->n:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcrittercism/android/cr;
    .locals 1

    .prologue
    .line 3
    const-class v0, Lcrittercism/android/cr;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcrittercism/android/cr;

    return-object v0
.end method

.method public static values()[Lcrittercism/android/cr;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcrittercism/android/cr;->o:[Lcrittercism/android/cr;

    invoke-virtual {v0}, [Lcrittercism/android/cr;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcrittercism/android/cr;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcrittercism/android/cr;->m:Ljava/lang/String;

    return-object v0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcrittercism/android/cr;->n:Ljava/lang/String;

    return-object v0
.end method
