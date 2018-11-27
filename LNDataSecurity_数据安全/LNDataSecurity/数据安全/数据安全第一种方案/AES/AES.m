//
//  AESCrypt.m
//  Public_不知名开发者 | https://github.com/CoderLN 
//  各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」
//  

#import "AES.h"

#import "NSData+Base64Additions.h"
#import "NSString+Base64Additions.h"
#import "NSData+CommonCrypto.h"

@implementation AES

// AES加密字符串并返回base64编码字符串
+ (NSString *)encrypt:(NSString *)string keyString:(NSString *)keyString {
    NSData *encryptedData = [[string dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[keyString dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
    NSString *base64EncodedString = [NSString base64StringFromData:encryptedData length:[encryptedData length]];
 
    return base64EncodedString;
}

// AES解密字符串
+ (NSString *)decrypt:(NSString *)base64EncodedString keyString:(NSString *)keyString {
    NSData *encryptedData = [NSData base64DataFromString:base64EncodedString];
    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:[[keyString dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}

@end
