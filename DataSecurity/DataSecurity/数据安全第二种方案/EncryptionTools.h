//
//  EncryptionTools.h
//  白开水ln（https://github.com/CustomPBWaters）
//
//  Created by 【Plain Boiled Water ln】 on Elegant programming16.
//  Copyright © Unauthorized shall（https://custompbwaters.github.io）not be reproduced reprinted.
//
//  @PBWLN_LICENSE_HEADER_END@
//
/**
 对称加密算法 
 DES、AES
 */

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

/**
 *  终端测试指令
 *
 *  DES(ECB)加密
 *  $ echo -n hello | openssl enc -des-ecb -K 616263 -nosalt | base64
 *
  * DES(CBC)加密
 *  $ echo -n hello | openssl enc -des-cbc -iv 0102030405060708 -K 616263 -nosalt | base64
 *
 *  AES(ECB)加密
 *  $ echo -n hello | openssl enc -aes-128-ecb -K 616263 -nosalt | base64
 *
 *  AES(CBC)加密
 *  $ echo -n hello | openssl enc -aes-128-cbc -iv 0102030405060708 -K 616263 -nosalt | base64
 *---------------------------我是分割线------------------------------//
 *  DES(ECB)解密
 *  $ echo -n HQr0Oij2kbo= | base64 -D | openssl enc -des-ecb -K 616263 -nosalt -d
 *
 *  DES(CBC)解密
 *  $ echo -n alvrvb3Gz88= | base64 -D | openssl enc -des-cbc -iv 0102030405060708 -K 616263 -nosalt -d
 *
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
 */
@interface EncryptionTools : NSObject

+ (instancetype)sharedEncryptionTools;

/**
 @constant   kCCAlgorithmAES     高级加密标准，128位(默认)
 @constant   kCCAlgorithmDES     数据加密标准
 */
@property (nonatomic, assign) uint32_t algorithm;

/**
 *  加密字符串并返回base64编码字符串
 *
 *  @param string    要加密的字符串
 *  @param keyString 加密密钥
 *  @param iv        初始化向量(8个字节)
 *
 *  @return 返回加密后的base64编码字符串
 */
- (NSString *)encryptString:(NSString *)string keyString:(NSString *)keyString iv:(NSData *)iv;

/**
 *  解密字符串
 *
 *  @param string    加密并base64编码后的字符串
 *  @param keyString 解密密钥
 *  @param iv        初始化向量(8个字节)
 *
 *  @return 返回解密后的字符串
 */
- (NSString *)decryptString:(NSString *)string keyString:(NSString *)keyString iv:(NSData *)iv;

@end
