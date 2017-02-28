//
//  AESCrypt.h
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh
// 
/**
 *  终端测试指令
 *
 *  AES(ECB)加密
 *  $ echo -n hello | openssl enc -aes-128-ecb -K 616263 -nosalt | base64
 *
 *  AES(CBC)加密
 *  $ echo -n hello | openssl enc -aes-128-cbc -iv 0102030405060708 -K 616263 -nosalt | base64
 *---------------------------我是分割线------------------------------//
 *  AES(ECB)解密
 *  $ echo -n d1QG4T2tivoi0Kiu3NEmZQ== | base64 -D | openssl enc -aes-128-ecb -K 616263 -nosalt -d
 *
 *  AES(CBC)解密
 *  $ echo -n u3W/N816uzFpcg6pZ+kbdg== | base64 -D | openssl enc -aes-128-cbc -iv 0102030405060708 -K 616263 -nosalt -d
 *
 *  提示：
 *      1) 加密过程是先加密，再base64编码
 *      2) 解密过程是先base64解码，再解密
 *
 *  命令行进行Base64编码和解码
 *  编码：base64 123.png -o 123.txt
 *  解码：base64 123.txt -o test.png -D
 *
 *  @constant   kCCAlgorithmAES     高级加密标准，128位(默认)
 */

#import <Foundation/Foundation.h>

@interface AES : NSObject

/**
 *  AES加密字符串并返回base64编码字符串
 *
 *  @param string    要加密的字符串
 *  @param keyString 加密Key
 *
 *  @return 返回加密后的base64编码字符串
 */
+ (NSString *)encrypt:(NSString *)string keyString:(NSString *)keyString;

/**
 *  AES解密字符串
 *
 *  @param base64EncodedString 加密并base64编码后的字符串
 *  @param keyString 解密key
 *
 *  @return 返回解密后的字符串
 */
+ (NSString *)decrypt:(NSString *)base64EncodedString keyString:(NSString *)keyString;

@end
