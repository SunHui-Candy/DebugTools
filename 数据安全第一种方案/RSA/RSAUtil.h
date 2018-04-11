//
//  RSAUtil.h
//  WechatPublic-Codeidea | github.com/CoderLN

/**
 # MAC上生成公钥、私钥的方法
 @code
 1.打开终端，切换到自己想输出的文件夹下
 2.输入指令:openssl（openssl是生成各种秘钥的工具，mac已经嵌入)
 3.输入指令:genrsa -out rsa_private_key.pem 1024 (生成私钥，java端使用的)
 4.输入指令:rsa -in rsa_private_key.pem -out rsa_public_key.pem -pubout (生成公钥)
 5.输入指令:pkcs8 -topk8 -in rsa_private_key.pem -out pkcs8_rsa_private_key.pem -nocrypt(私钥转格式，在ios端使用私钥解密时用这个私钥)
 
 注意:在MAC上生成三个.pem格式的文件，一个公钥，两个私钥，都可以在终端通过指令vim xxx.pem 打开，里面是字符串，第三步生成的私钥是java端用来解密数据的，第五步转换格式的私钥iOS端可以用来调试公钥、私钥解密（因为私钥不留在客户端）
 iOS端公钥加密私钥解密、java端公钥加密私钥解密，java端私钥加密公钥解密都容易做到，iOS不能私钥加密公钥解密，只能用于验签
 @endcode
 */

#import <UIKit/UIKit.h>

@interface RSAUtil : UIViewController

// 公钥加密时调用类方法：
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

// 私钥解密时调用类方法
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;


//---------------------------<#我是分割线#>------------------------------//
//
/*
// 私钥加密
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;
// 公钥解密
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
 */
 
@end
