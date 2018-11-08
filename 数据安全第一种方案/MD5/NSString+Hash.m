//
//  NSString+Hash.m
//  Public_不知名开发者

#import "NSString+Hash.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Hash)

#pragma mark - 字符串加密

- (NSString *)md5String
{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)sha1String
{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)sha256String
{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)sha512String
{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}




#pragma mark - HMAC 字符串加密
- (NSString *)hmacMD5StringWithKey:(NSString *)key
{
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key
{
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key
{
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA256, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key
{
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA512, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}






#pragma mark - 文件加密

#define FileHashDefaultChunkSizeForReadingData 4096

- (NSString *)fileMD5Hash
{
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_MD5_CTX hashCtx;
    CC_MD5_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_MD5_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)fileSHA1Hash
{
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA1_CTX hashCtx;
    CC_SHA1_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA1_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)fileSHA256Hash
{
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA256_CTX hashCtx;
    CC_SHA256_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA256_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)fileSHA512Hash
{
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:self];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA512_CTX hashCtx;
    CC_SHA512_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA512_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}




#pragma mark - 
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length
{
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}






#pragma mark - base64编码和解码

// 对一个字符串进行base64编码,并且返回
- (NSString *)base64EncodeString
{
    //1.先转换为二进制数据
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码,完成之后返回字符串
    return [data base64EncodedStringWithOptions:0];
}


// 对base64编码之后的字符串解码,并且返回
-(NSString *)base64DecodeString
{
    //注意:该字符串是base64编码后的字符串
    //1.转换为二进制数据(完成了解码的过程)
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    
    //2.把二进制数据在转换为字符串
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
