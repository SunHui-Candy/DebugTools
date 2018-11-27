//
//  DES3Util.h
//  Public_不知名开发者 | https://github.com/CoderLN 
//  各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」
//  

/**
 *  终端测试指令
 *
 *  DES(ECB)加密
 *  $ echo -n hello | openssl enc -des-ecb -K 616263 -nosalt | base64
 *
 *  DES(CBC)加密
 *  $ echo -n hello | openssl enc -des-cbc -iv 0102030405060708 -K 616263 -nosalt | base64
 *---------------------------我是分割线------------------------------
 *  DES(ECB)解密
 *  $ echo -n HQr0Oij2kbo= | base64 -D | openssl enc -des-ecb -K 616263 -nosalt -d
 *
 *  DES(CBC)解密
 *  $ echo -n alvrvb3Gz88= | base64 -D | openssl enc -des-cbc -iv 0102030405060708 -K 616263 -nosalt -d
 *
 *  @constant   kCCAlgorithmDES     数据加密标准
 */

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#import <CommonCrypto/CommonCryptor.h>
//#import "NSString+NSReplace.h"
@interface DES3Util : NSObject

/**
 *  DES加密字符串并返回base64编码字符串
 *
 *  @param string    要加密的字符串
 *  @param keyString 加密Key
 *
 *  @return 返回加密后的base64编码字符串
 */
+(NSString *) encryptUseDES:(NSString *)string keyString:(NSString *)keyString;


/**
 *  DES解密字符串
 *
 *  @param base64EncodedString 加密并base64编码后的字符串
 *  @param keyString 解密Key
 *
 *  @return 返回解密后的字符串
 */
+(NSString *)decryptUseDES:(NSString *)base64EncodedString keyString:(NSString *)keyString;
@end
