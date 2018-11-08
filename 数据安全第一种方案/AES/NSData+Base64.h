//
//  NSData+Base64.m
//  Public_不知名开发者

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Base64Additions)

+ (NSData *)base64DataFromString:(NSString *)string;

@end
