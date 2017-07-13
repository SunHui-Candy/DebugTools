//
//  AESCrypt.m
//  白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import "AES.h"

#import "NSData+Base64.h"
#import "NSString+Base64.h"
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
