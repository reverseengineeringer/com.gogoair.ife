.class public final Lcom/adobe/primetime/va/ErrorInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final _details:Ljava/lang/String;

.field private final _message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/adobe/primetime/va/ErrorInfo;->_message:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/adobe/primetime/va/ErrorInfo;->_details:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public getDetails()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/primetime/va/ErrorInfo;->_details:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/primetime/va/ErrorInfo;->_message:Ljava/lang/String;

    return-object v0
.end method
