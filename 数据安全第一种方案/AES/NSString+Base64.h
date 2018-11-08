//
//  NSString+Base64.h
//  Public_不知名开发者

#import <Foundation/NSString.h>
#import <Foundation/Foundation.h>

@interface NSString (Base64Additions)

+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length;

@end
