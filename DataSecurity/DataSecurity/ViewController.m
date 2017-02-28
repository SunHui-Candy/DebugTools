//
//  ViewController.m
//  DataSecurity
//
//  Created by LN on 16/5/28.
//  Copyright © 2016年 Learning point. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
#import "RSAUtil.h"
#import "DES3Util.h"
#import "AES.h"

// 足够长+足够咸+足够复杂
#define salt @"1342*&%&shlfhs390(*^^6R%@@KFGKF"

#define RSA_Public_key @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDYC/riLbi5BSsOOrOOyrQRjtyIxAoQy479/Woz0cPKpou4BFBKHKedeZN5P8Dfqs5rzclQo865jTQa+b1lMOyQMIMIASsVXOzcJgvFsJoxN3xEt5ksp0Lcb0b+RZ07iON01rmv/YVML/Z215pXAd0EYneMkcGA4sKSUcZbQRYiDwIDAQAB"

#define RSA_Privite_key @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBANgL+uItuLkFKw46s47KtBGO3IjEChDLjv39ajPRw8qmi7gEUEocp515k3k/wN+qzmvNyVCjzrmNNBr5vWUw7JAwgwgBKxVc7NwmC8WwmjE3fES3mSynQtxvRv5FnTuI43TWua/9hUwv9nbXmlcB3QRid4yRwYDiwpJRxltBFiIPAgMBAAECgYA0Gv+RGTHZ/bMapXG02JKBQZFSsuUyk8WS4FGC2e58q5o68V9j4HFUe4Pj1EpyJ0HNoj4RYtBy0+ljMCRLiXckBciU1L16Fs9gg1S5o32CS+NLRaAOC6TxBFSdOitznnj+fqIN5wb0BD/c4Cl0iz92DFEblz5yf/xlzWCBn7N+gQJBAPn2ZEuygr8kzyUSWylKMhmTg3Y6FghfqQHK4JtpfZShyp7kkCIeW32jFO4tiGtsdeNWmzzMMq+xyOf2WUjP5q8CQQDdQ+AZl48lSf03kYRPSWydOCnFnA6PSmS9wpPJ3wnRt0RyMgSpeJPOm0azlTjCfmZVSnjCo7ZVzvfV94sFLlKhAkAoeJdGllGLBzeuxekSp1uzPmoTk1YL5wkjLCjvoMXfcc6vqUwY6hdgIS57Xc3vrrDrrRMXZexy+/MOc5mDK34rAkA40V4xlC6o96fzZgWgyoz+jlaDrQA8IXFfHSEQPJrr5HDKFjgGQLVL36m3IcFyiDzE+Busd5exzzTrF+b2DKAhAkBc0MdKPsV1ZddiZHwxAUY2+WFb5cxB16jfcLRTkPj6lxwgTHwnH31jwonjoCWPgnuYT7am+twezdu9oFCZeg2Q"
@interface ViewController ()

@end

@implementation ViewController
// iOS数据安全--base64、md5、AES、DES、RSA
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self base64];
    [self md5];
    [self AES];
    [self DES];
    [self RSA];
}

- (void)base64 {
    NSLog(@"base64编码-->\n%@",[@"A" base64EncodeString]);
    NSLog(@"base64解码-->\n%@",[@"QQ==" base64DecodeString]);
}

#pragma mark - 哈希(散列)函数
- (void)md5 {
    // MD5
    NSLog(@"MD5加密-->%@",[@"123LN34*" md5String]);
    // MD5-->598eb1a985449913bfb54ed6e0a58510
    
    // (明文+加盐)MD5
    NSLog(@"(明文+加盐)MD5-->\n%@",[[@"123LN" stringByAppendingString:salt] md5String]);
    
    // 先加密+乱序
    NSLog(@"先加密+乱序-->\n%@",[@"123LN" hmacMD5StringWithKey:@"iOShangzhou"]);
    
    // sha1对字符串加密
    NSLog(@"sha1对字符串加密-->\n%@",[@"123LN" sha1String]);
    
    // sha256对字符串加密
    NSLog(@"sha256对字符串加密-->\n%@",[@"123LN" sha256String]);
    
    // sha512对字符串加密
    NSLog(@"sha512对字符串加密-->\n%@",[@"123LN" sha1String]);
}

-(void)AES
{
    // encryWithPublicKey
    NSString *str = [AES encrypt:@"LN123" keyString:@"SDTUJZLI"];
    NSLog(@"AES公钥加密数据-->\n%@",str);
    
    // decryWithPriviteKey
    NSString *str1 = [AES decrypt:str keyString:@"SDTUJZLI"];
    NSLog(@"AES私钥解密数据-->\n%@",str1);
}


-(void)DES
{    
    NSString *str = [DES3Util encryptUseDES:@"LN123" keyString:@"syh"];
    NSLog(@"DES公钥加密数据-->\n%@",str);
    
    NSString *str1 = [DES3Util decryptUseDES:str keyString:@"syh"];
    NSLog(@"DES私钥解密数据-->\n%@",str1);
}

//---------------------------我是分割线------------------------------//
//
-(void)RSA
{
    NSString *str = [RSAUtil encryptString: @"LN" publicKey:RSA_Public_key];
    NSLog(@"RSA公钥加密数据-->\n%@",str);
    
    NSString *str1 = [RSAUtil decryptString:str privateKey:RSA_Privite_key];
    NSLog(@"RSA私钥解密数据-->\n%@",str1);
}

/**
 注意：
 RSA 这里用模拟器的话需要配置一下
 选 TARGETS-->Capabilities-->Keychain Sharing 打开就OK
 */
@end





