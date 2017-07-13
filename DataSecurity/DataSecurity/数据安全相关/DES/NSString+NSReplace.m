//
//  NSString+NSReplace.m
//  白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//

#import "NSString+NSReplace.h"

@implementation NSString (NSReplace)
+ (NSString *)sourceStr:(NSString *)destStr replaceStr:(NSString *)sStr fromSrcStr:(NSString *)srcStr{
	NSRange range;
	
	NSMutableString *str = [NSMutableString stringWithString:srcStr];
	
	while (1) {
		range = [str rangeOfString:sStr];
		if (range.length) {
			[str replaceCharactersInRange:range withString:destStr];
		}else{
			break;
		}
		
	}
	return str;
}
+ (NSString *)trim:(NSString *)textStr{
	if (textStr == nil ) {
        return nil;
    }
    
	NSMutableString *str = [NSMutableString stringWithString:textStr];
	NSRange range;
	while (1) {
		range = [str rangeOfString:@" "];
		if (!range.location) {
			[str deleteCharactersInRange:range];
		}else{
			break;
		}
	}
	
	return (NSString *)str;
}
@end
