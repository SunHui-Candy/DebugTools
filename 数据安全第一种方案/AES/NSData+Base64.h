//
//  NSData+Base64.m
//  WechatPublic-Codeidea | github.com/CoderLN

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Base64Additions)

+ (NSData *)base64DataFromString:(NSString *)string;

@end
