.class public Lcom/auditude/ads/util/Base64Coder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final map1:[C

.field private static final map2:[B


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v5, 0x40

    const/4 v1, 0x0

    .line 33
    new-array v0, v5, [C

    sput-object v0, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    .line 36
    const/16 v0, 0x41

    move v2, v1

    :goto_0
    const/16 v3, 0x5a

    if-le v0, v3, :cond_0

    .line 37
    const/16 v0, 0x61

    :goto_1
    const/16 v3, 0x7a

    if-le v0, v3, :cond_1

    .line 38
    const/16 v0, 0x30

    :goto_2
    const/16 v3, 0x39

    if-le v0, v3, :cond_2

    .line 39
    sget-object v0, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    add-int/lit8 v3, v2, 0x1

    const/16 v4, 0x2b

    aput-char v4, v0, v2

    sget-object v0, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    add-int/lit8 v2, v3, 0x1

    const/16 v2, 0x2f

    aput-char v2, v0, v3

    .line 43
    const/16 v0, 0x80

    new-array v0, v0, [B

    sput-object v0, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    move v0, v1

    .line 45
    :goto_3
    sget-object v2, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    array-length v2, v2

    if-lt v0, v2, :cond_3

    .line 46
    :goto_4
    if-lt v1, v5, :cond_4

    .line 47
    return-void

    .line 36
    :cond_0
    sget-object v4, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    add-int/lit8 v3, v2, 0x1

    aput-char v0, v4, v2

    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    move v2, v3

    goto :goto_0

    .line 37
    :cond_1
    sget-object v4, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    add-int/lit8 v3, v2, 0x1

    aput-char v0, v4, v2

    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    move v2, v3

    goto :goto_1

    .line 38
    :cond_2
    sget-object v4, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    add-int/lit8 v3, v2, 0x1

    aput-char v0, v4, v2

    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    move v2, v3

    goto :goto_2

    .line 45
    :cond_3
    sget-object v2, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    const/4 v3, -0x1

    aput-byte v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 46
    :cond_4
    sget-object v0, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    sget-object v2, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    aget-char v2, v2, v1

    int-to-byte v3, v1

    aput-byte v3, v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 1

    .prologue
    .line 137
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/Base64Coder;->decode([C)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode([C)[B
    .locals 2

    .prologue
    .line 149
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/auditude/ads/util/Base64Coder;->decode([CII)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode([CII)[B
    .locals 12

    .prologue
    const/16 v2, 0x41

    const/16 v11, 0x7f

    .line 163
    rem-int/lit8 v0, p2, 0x4

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Length of Base64 encoded input string is not a multiple of 4."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_0
    add-int/lit8 p2, p2, -0x1

    :cond_1
    if-lez p2, :cond_2

    add-int v0, p1, p2

    add-int/lit8 v0, v0, -0x1

    aget-char v0, p0, v0

    const/16 v1, 0x3d

    if-eq v0, v1, :cond_0

    .line 165
    :cond_2
    mul-int/lit8 v0, p2, 0x3

    div-int/lit8 v6, v0, 0x4

    .line 166
    new-array v7, v6, [B

    .line 168
    add-int v8, p1, p2

    .line 169
    const/4 v0, 0x0

    move v5, v0

    move v3, p1

    .line 170
    :goto_0
    if-lt v3, v8, :cond_3

    .line 191
    return-object v7

    .line 172
    :cond_3
    add-int/lit8 v1, v3, 0x1

    aget-char v9, p0, v3

    .line 173
    add-int/lit8 v0, v1, 0x1

    aget-char v10, p0, v1

    .line 174
    if-ge v0, v8, :cond_5

    add-int/lit8 v1, v0, 0x1

    aget-char v0, p0, v0

    move v4, v0

    move v0, v1

    .line 175
    :goto_1
    if-ge v0, v8, :cond_6

    add-int/lit8 v1, v0, 0x1

    aget-char v0, p0, v0

    move v3, v1

    .line 176
    :goto_2
    if-gt v9, v11, :cond_4

    if-gt v10, v11, :cond_4

    if-gt v4, v11, :cond_4

    if-le v0, v11, :cond_7

    .line 177
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal character in Base64 encoded data."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    move v4, v2

    .line 174
    goto :goto_1

    :cond_6
    move v3, v0

    move v0, v2

    .line 175
    goto :goto_2

    .line 178
    :cond_7
    sget-object v1, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    aget-byte v1, v1, v9

    .line 179
    sget-object v9, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    aget-byte v9, v9, v10

    .line 180
    sget-object v10, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    aget-byte v4, v10, v4

    .line 181
    sget-object v10, Lcom/auditude/ads/util/Base64Coder;->map2:[B

    aget-byte v0, v10, v0

    .line 182
    if-ltz v1, :cond_8

    if-ltz v9, :cond_8

    if-ltz v4, :cond_8

    if-gez v0, :cond_9

    .line 183
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal character in Base64 encoded data."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_9
    shl-int/lit8 v1, v1, 0x2

    ushr-int/lit8 v10, v9, 0x4

    or-int/2addr v10, v1

    .line 185
    and-int/lit8 v1, v9, 0xf

    shl-int/lit8 v1, v1, 0x4

    ushr-int/lit8 v9, v4, 0x2

    or-int/2addr v9, v1

    .line 186
    and-int/lit8 v1, v4, 0x3

    shl-int/lit8 v1, v1, 0x6

    or-int v4, v1, v0

    .line 187
    add-int/lit8 v1, v5, 0x1

    int-to-byte v0, v10

    aput-byte v0, v7, v5

    .line 188
    if-ge v1, v6, :cond_b

    add-int/lit8 v0, v1, 0x1

    int-to-byte v5, v9

    aput-byte v5, v7, v1

    .line 189
    :goto_3
    if-ge v0, v6, :cond_a

    add-int/lit8 v1, v0, 0x1

    int-to-byte v4, v4

    aput-byte v4, v7, v0

    move v5, v1

    goto :goto_0

    :cond_a
    move v5, v0

    goto :goto_0

    :cond_b
    move v0, v1

    goto :goto_3
.end method

.method public static decodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 125
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/auditude/ads/util/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static encode([B)[C
    .locals 2

    .prologue
    .line 68
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/auditude/ads/util/Base64Coder;->encode([BII)[C

    move-result-object v0

    return-object v0
.end method

.method public static encode([BI)[C
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/auditude/ads/util/Base64Coder;->encode([BII)[C

    move-result-object v0

    return-object v0
.end method

.method public static encode([BII)[C
    .locals 13

    .prologue
    const/16 v3, 0x3d

    const/4 v1, 0x0

    .line 93
    mul-int/lit8 v0, p2, 0x4

    add-int/lit8 v0, v0, 0x2

    div-int/lit8 v6, v0, 0x3

    .line 94
    add-int/lit8 v0, p2, 0x2

    div-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x4

    .line 95
    new-array v7, v0, [C

    .line 97
    add-int v8, p1, p2

    move v5, v1

    .line 99
    :goto_0
    if-lt p1, v8, :cond_0

    .line 113
    return-object v7

    .line 101
    :cond_0
    add-int/lit8 v0, p1, 0x1

    aget-byte v2, p0, p1

    and-int/lit16 v9, v2, 0xff

    .line 102
    if-ge v0, v8, :cond_1

    add-int/lit8 v2, v0, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    move v4, v0

    move v0, v2

    .line 103
    :goto_1
    if-ge v0, v8, :cond_2

    add-int/lit8 v2, v0, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    .line 104
    :goto_2
    ushr-int/lit8 v10, v9, 0x2

    .line 105
    and-int/lit8 v9, v9, 0x3

    shl-int/lit8 v9, v9, 0x4

    ushr-int/lit8 v11, v4, 0x4

    or-int/2addr v9, v11

    .line 106
    and-int/lit8 v4, v4, 0xf

    shl-int/lit8 v4, v4, 0x2

    ushr-int/lit8 v11, v0, 0x6

    or-int/2addr v4, v11

    .line 107
    and-int/lit8 v11, v0, 0x3f

    .line 108
    add-int/lit8 v0, v5, 0x1

    sget-object v12, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    aget-char v10, v12, v10

    aput-char v10, v7, v5

    .line 109
    add-int/lit8 v5, v0, 0x1

    sget-object v10, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    aget-char v9, v10, v9

    aput-char v9, v7, v0

    .line 110
    if-ge v5, v6, :cond_3

    sget-object v0, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    aget-char v0, v0, v4

    :goto_3
    aput-char v0, v7, v5

    add-int/lit8 v4, v5, 0x1

    .line 111
    if-ge v4, v6, :cond_4

    sget-object v0, Lcom/auditude/ads/util/Base64Coder;->map1:[C

    aget-char v0, v0, v11

    :goto_4
    aput-char v0, v7, v4

    add-int/lit8 v0, v4, 0x1

    move v5, v0

    move p1, v2

    goto :goto_0

    :cond_1
    move v4, v1

    .line 102
    goto :goto_1

    :cond_2
    move v2, v0

    move v0, v1

    .line 103
    goto :goto_2

    :cond_3
    move v0, v3

    .line 110
    goto :goto_3

    :cond_4
    move v0, v3

    .line 111
    goto :goto_4
.end method

.method public static encodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 57
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/auditude/ads/util/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method
