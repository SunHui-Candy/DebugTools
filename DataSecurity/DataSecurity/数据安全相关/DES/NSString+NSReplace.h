//
//  NSString+NSReplace.h
//  白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import <Foundation/Foundation.h>

@interface NSString (NSReplace)
+ (NSString *)sourceStr:(NSString *)destStr replaceStr:(NSString *)sStr fromSrcStr:(NSString *)srcStr;
+ (NSString *)trim:(NSString *)textStr;
@end
