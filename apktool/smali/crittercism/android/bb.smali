.class public final Lcrittercism/android/bb;
.super Lcom/crittercism/app/CrittercismConfig;


# instance fields
.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/crittercism/app/CrittercismConfig;)V
    .locals 3

    .prologue
    .line 52
    invoke-direct {p0, p2}, Lcom/crittercism/app/CrittercismConfig;-><init>(Lcom/crittercism/app/CrittercismConfig;)V

    .line 37
    const-string v0, "https://api.crittercism.com"

    iput-object v0, p0, Lcrittercism/android/bb;->b:Ljava/lang/String;

    .line 38
    const-string v0, "https://apm.crittercism.com"

    iput-object v0, p0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    .line 39
    const-string v0, "https://txn.ingest.crittercism.com/api/v1/transactions"

    iput-object v0, p0, Lcrittercism/android/bb;->d:Ljava/lang/String;

    .line 42
    const-string v0, "https://appload.ingest.crittercism.com"

    iput-object v0, p0, Lcrittercism/android/bb;->e:Ljava/lang/String;

    .line 44
    const-string v0, "524c99a04002057fcd000001"

    iput-object v0, p0, Lcrittercism/android/bb;->f:Ljava/lang/String;

    .line 60
    invoke-static {p1}, Lcrittercism/android/bn$a;->a(Ljava/lang/String;)Lcrittercism/android/bn$a;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/bn$a;->a()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://api."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcrittercism/android/bb;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://apm."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://appload.ingest."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcrittercism/android/bb;->e:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://txn.ingest."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/api/v1/transactions"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcrittercism/android/bb;->d:Ljava/lang/String;

    .line 62
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 2

    .prologue
    .line 74
    invoke-super {p0}, Lcom/crittercism/app/CrittercismConfig;->a()Ljava/util/List;

    move-result-object v0

    .line 75
    iget-object v1, p0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    return-object v0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcrittercism/android/bb;->b:Ljava/lang/String;

    return-object v0
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcrittercism/android/bb;->d:Ljava/lang/String;

    return-object v0
.end method

.method public final e()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcrittercism/android/bb;->e:Ljava/lang/String;

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 133
    instance-of v0, p1, Lcrittercism/android/bb;

    if-nez v0, :cond_0

    move v0, v1

    .line 145
    :goto_0
    return v0

    :cond_0
    move-object v0, p1

    .line 137
    check-cast v0, Lcrittercism/android/bb;

    .line 140
    invoke-super {p0, p1}, Lcom/crittercism/app/CrittercismConfig;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcrittercism/android/bb;->b:Ljava/lang/String;

    iget-object v3, v0, Lcrittercism/android/bb;->b:Ljava/lang/String;

    .line 141
    invoke-static {v2, v3}, Lcrittercism/android/bb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    iget-object v3, v0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    .line 142
    invoke-static {v2, v3}, Lcrittercism/android/bb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcrittercism/android/bb;->d:Ljava/lang/String;

    iget-object v3, v0, Lcrittercism/android/bb;->d:Ljava/lang/String;

    .line 143
    invoke-static {v2, v3}, Lcrittercism/android/bb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcrittercism/android/bb;->e:Ljava/lang/String;

    iget-object v3, v0, Lcrittercism/android/bb;->e:Ljava/lang/String;

    .line 144
    invoke-static {v2, v3}, Lcrittercism/android/bb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcrittercism/android/bb;->f:Ljava/lang/String;

    iget-object v0, v0, Lcrittercism/android/bb;->f:Ljava/lang/String;

    .line 145
    invoke-static {v2, v0}, Lcrittercism/android/bb;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcrittercism/android/bb;->f:Ljava/lang/String;

    return-object v0
.end method

.method public final g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcrittercism/android/bb;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final hashCode()I
    .locals 2

    .prologue
    .line 155
    invoke-super {p0}, Lcom/crittercism/app/CrittercismConfig;->hashCode()I

    move-result v0

    .line 157
    mul-int/lit8 v0, v0, 0x1f

    .line 158
    iget-object v1, p0, Lcrittercism/android/bb;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 159
    mul-int/lit8 v0, v0, 0x1f

    .line 160
    iget-object v1, p0, Lcrittercism/android/bb;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 161
    mul-int/lit8 v0, v0, 0x1f

    .line 162
    iget-object v1, p0, Lcrittercism/android/bb;->d:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x1f

    .line 164
    iget-object v1, p0, Lcrittercism/android/bb;->e:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 165
    mul-int/lit8 v0, v0, 0x1f

    .line 166
    iget-object v1, p0, Lcrittercism/android/bb;->f:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 168
    return v0
.end method
