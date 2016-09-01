.class public Lcom/adobe/primetime/core/URLLoader$URLRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/core/URLLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "URLRequest"
.end annotation


# instance fields
.field private final _data:Ljava/util/Map;

.field private final _method:Lcom/adobe/primetime/core/URLLoader$HttpMethod;

.field private final _url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/adobe/primetime/core/URLLoader$HttpMethod;)V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/primetime/core/URLLoader$URLRequest;-><init>(Ljava/lang/String;Lcom/adobe/primetime/core/URLLoader$HttpMethod;Ljava/util/Map;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/adobe/primetime/core/URLLoader$HttpMethod;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_url:Ljava/lang/String;

    .line 70
    iput-object p2, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_method:Lcom/adobe/primetime/core/URLLoader$HttpMethod;

    .line 71
    iput-object p3, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_data:Ljava/util/Map;

    .line 72
    return-void
.end method


# virtual methods
.method public getMethod()Lcom/adobe/primetime/core/URLLoader$HttpMethod;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_method:Lcom/adobe/primetime/core/URLLoader$HttpMethod;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_url:Ljava/lang/String;

    return-object v0
.end method

.method public getUrlEncodedData()Ljava/lang/String;
    .locals 5

    .prologue
    .line 84
    const-string v0, ""

    .line 85
    iget-object v1, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_data:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 98
    :goto_0
    return-object v0

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/adobe/primetime/core/URLLoader$URLRequest;->_data:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v2, v0

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 88
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 89
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 91
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    .line 92
    goto :goto_1

    .line 94
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 95
    const/4 v0, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :cond_2
    move-object v0, v2

    .line 98
    goto :goto_0
.end method
