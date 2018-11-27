//
//  AESCrypt.h
//  Public_不知名开发者 | https://github.com/CoderLN 
//  各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」
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
