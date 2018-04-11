//
//  NSString+Base64.h
//  WechatPublic-Codeidea | github.com/CoderLN

#import <Foundation/NSString.h>
#import <Foundation/Foundation.h>

@interface NSString (Base64Additions)

+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length;

@end
