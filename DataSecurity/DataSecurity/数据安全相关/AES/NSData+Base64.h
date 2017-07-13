//
//  NSData+Base64.m
//  白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Base64Additions)

+ (NSData *)base64DataFromString:(NSString *)string;

@end
