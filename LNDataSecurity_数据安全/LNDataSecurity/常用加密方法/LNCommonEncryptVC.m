//
//  LNCommonEncryptVC.m
//  DataSecurity

#import "LNCommonEncryptVC.h"
#import "NSString+Hash.h"
#import "RSAUtil.h"
#import "DES3Util.h"
#import "AES.h"
#import "EncryptionTool.h"
#import "RSAEncryptionTool.h"

// 随机字符串:足够长+足够咸+足够复杂
#define saltStr @"1342*&%&shlfhs390(*^^6R%@@KFGKF"

#define RSA_Public_key @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDYC/riLbi5BSsOOrOOyrQRjtyIxAoQy479/Woz0cPKpou4BFBKHKedeZN5P8Dfqs5rzclQo865jTQa+b1lMOyQMIMIASsVXOzcJgvFsJoxN3xEt5ksp0Lcb0b+RZ07iON01rmv/YVML/Z215pXAd0EYneMkcGA4sKSUcZbQRYiDwIDAQAB"

#define RSA_Privite_key @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBANgL+uItuLkFKw46s47KtBGO3IjEChDLjv39ajPRw8qmi7gEUEocp515k3k/wN+qzmvNyVCjzrmNNBr5vWUw7JAwgwgBKxVc7NwmC8WwmjE3fES3mSynQtxvRv5FnTuI43TWua/9hUwv9nbXmlcB3QRid4yRwYDiwpJRxltBFiIPAgMBAAECgYA0Gv+RGTHZ/bMapXG02JKBQZFSsuUyk8WS4FGC2e58q5o68V9j4HFUe4Pj1EpyJ0HNoj4RYtBy0+ljMCRLiXckBciU1L16Fs9gg1S5o32CS+NLRaAOC6TxBFSdOitznnj+fqIN5wb0BD/c4Cl0iz92DFEblz5yf/xlzWCBn7N+gQJBAPn2ZEuygr8kzyUSWylKMhmTg3Y6FghfqQHK4JtpfZShyp7kkCIeW32jFO4tiGtsdeNWmzzMMq+xyOf2WUjP5q8CQQDdQ+AZl48lSf03kYRPSWydOCnFnA6PSmS9wpPJ3wnRt0RyMgSpeJPOm0azlTjCfmZVSnjCo7ZVzvfV94sFLlKhAkAoeJdGllGLBzeuxekSp1uzPmoTk1YL5wkjLCjvoMXfcc6vqUwY6hdgIS57Xc3vrrDrrRMXZexy+/MOc5mDK34rAkA40V4xlC6o96fzZgWgyoz+jlaDrQA8IXFfHSEQPJrr5HDKFjgGQLVL36m3IcFyiDzE+Busd5exzzTrF+b2DKAhAkBc0MdKPsV1ZddiZHwxAUY2+WFb5cxB16jfcLRTkPj6lxwgTHwnH31jwonjoCWPgnuYT7am+twezdu9oFCZeg2Q"

@interface LNCommonEncryptVC ()

@end

@implementation LNCommonEncryptVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


#pragma mark - base64编码方案
- (IBAction)base64
{
    NSString * str = @"Public_CoderLN";
    NSString * encryptStr = [str base64EncodeString];
    NSString * decryptStr = [encryptStr base64DecodeString];
    
    NSLog(@"base64编码 - %@\nbase64解码 - %@",encryptStr,decryptStr);
    //base64编码 - UHVibGljX0NvZGVyTE4=
    //base64解码 - Public_CoderLN 
}

#pragma mark - 哈希(散列)函数
#pragma mark -MD5、SHA1、SHA256、SHA512、hmacMD5
- (IBAction)md5
{
    NSString * str = @"Public_CoderLN";
    // MD5加密
    NSLog(@"MD5加密-->%@",[str md5String]); //17f8b4a0fa83db7640a0808f74d98838
    
    // 明文+加盐（字符串也可以用时间戳）,再MD5加密
    // 传统方法是加盐（Salt）：在明文的固定位置插入(足够多、足够复杂)的随机字符串，然后再进行MD5。
    // 缺点：盐是固定不变的，一旦泄露后果不堪设想；使用加盐通过MD5解密之后，很容易发现规律从而破解。
    NSLog(@"(明文+加盐) 再MD5加密-->\n%@",[[str stringByAppendingString:saltStr] md5String]); //07ef8b7ea1c9838a529402163a7317c3
    
    // hmacMD5: 先加密+再乱序: 先对明文进行MD5，然后对加密得到的MD5串的字符进行乱序
    NSLog(@"先加密 + 再乱序-->\n%@",[str hmacMD5StringWithKey:@"hangzhou"]); //fa0225a86036cf2ae92a4f7750ced30c
    
    // sha1对字符串加密
    NSLog(@"sha1对字符串加密-->\n%@",[str sha1String]); //bbeeea28d921be2c080034803507bcf2f00d1db2
    
    // sha256对字符串加密
    NSLog(@"sha256对字符串加密-->\n%@",[str sha256String]); //67b8d40c3ea8af2a51ab883f9b53d8e43e84d16690ebd139ffcee1734ed669de
    
    // sha512对字符串加密
    NSLog(@"sha512对字符串加密-->\n%@",[str sha512String]); //037a7b22730c96e755bcb28faf757e5a09f51f0189669e5f2742edaee935b938d6a21b674971e146cdc7df79d6cf00e3e8e073bab838ee8c10e91e952ed1e33b
}

#pragma mark - 对称加密 DES、3DES、AES
// 3种得到的结果都不一样❓
-(IBAction)AES
{
    // 1.
    // encryWithPublicKey
    NSString * encryptStr = [AES encrypt:@"Public_CoderLN" keyString:@"616263"];
    NSString * decryptStr = [AES decrypt:encryptStr keyString:@"616263"];
    
    NSLog(@"AES公钥加密数据 - %@\nAES私钥解密数据 - %@",encryptStr,decryptStr);
    //AES公钥加密数据 - 4KG56e2vDFIlJ4u51X9C+A==
    //AES私钥解密数据 - Public_CoderLN

 
    // 2.
    EncryptionTool *encrypt = [EncryptionTool sharedEncryptionTool];
    NSString * encryptStr1 = [encrypt encryptString:@"Public_CoderLN" keyString:@"616263" iv:[@"0102030405060708" dataUsingEncoding:NSUTF8StringEncoding]];
    NSString * decryptStr1 = [encrypt decryptString:encryptStr1 keyString:@"616263" iv:[@"0102030405060708" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"AES公钥加密数据 %@,  AES私钥解密数据 %@",encryptStr1,decryptStr1);
    //AES公钥加密数据 6rauL9cSSnNPsmsj3jp5oA==,  AES私钥解密数据 Public_CoderLN
    
    
    // 3.
    //echo -n Public_CoderLN | openssl enc -aes-128-cbc -iv 0102030405060708 -K 616263 -nosalt | base64   -> 0adoq3PhUTpxQUVAnfyf/A==
    //echo -n Public_CoderLN | openssl enc -aes-128-ecb -K 616263 -nosalt | base64 -> YeOFJVYGhuoxsmIZWVeyDQ==
}


-(IBAction)DES
{
    // 生成一个随机的8位字符串，作为des加密数据的key,对数据进行des加密，对加密后的数据用公钥再进行一次rsa加密
    NSString * encryptStr = [DES3Util encryptUseDES:@"Public_CoderLN" keyString:@"616263"];
    NSString * decryptStr = [DES3Util decryptUseDES:encryptStr keyString:@"616263"];

    NSLog(@"DES公钥加密数据 - %@\nDES私钥解密数据 - %@",encryptStr,decryptStr);
    //DES公钥加密数据 - FsPvCCNys/vPOOo5Iq7WHw==
    //DES私钥解密数据 - Public_CoderLN

  
    //echo -n Public_CoderLN | openssl enc -des-ecb -K 616263 -nosalt | base64   -> dOk86VysuOvjkmbU9wwtMQ==
    //echo -n Public_CoderLN | openssl enc -des-cbc -iv 0102030405060708 -K 616263 -nosalt | base64   ->
    //
    //
    
}


#pragma mark - 非对称加密 RSA
/**
 注解:
 1.在终端生成 公钥、私钥 指令在 RSAUtil.h文件中
 2.RSA 这里用模拟器的话需要配置一下 (选 TARGETS-->Capabilities-->Keychain Sharing 打开就OK)
 */
-(IBAction)RSA
{
    NSString * encryptStr = [RSAUtil encryptString: @"Public_CoderLN" publicKey:RSA_Public_key];
    NSString * decryptStr = [RSAUtil decryptString:encryptStr privateKey:RSA_Privite_key];

    NSLog(@"RSA公钥加密数据-->\n%@",encryptStr);
    // JefKzhln6WbRN0p8uTwE+PbmPQZaOWgPOFfaBwhD4/bK1jop0yq3d2o8Kl8CQ+jpjOLVD5oWMkQKRqOimdGn2t8iVotztjKU9vaGeqBrwjP3LX6N1Wi6wiCzqVPLZwV5/mToKPcf/ODnChH9rQvk8MtqNC5YEtNfq8KKIeTAArI=
    
    NSLog(@"RSA私钥解密数据-->\n%@",decryptStr);
    // Public_CoderLN 
}


#pragma mark - 数字签名
- (void)digitallySigned
{
    /**
     摘录：以当前使用的比较多的RSA为例举例
     **假设客户端A、服务器B双方均拥有一对公私钥(PUB_A、PRI_A、PUB_B、PRI_B)**
     
     - iOS客户端A：A对Message用HASH生成信息摘要Message_hash_A，用A私钥签名，用B公钥加密，传输给B。
     - 服务器B：接收到传输，用B私钥解密，用A公钥验签，B对Message用同A的HASH生成Message_hash_B，比较两者是否相同来验证内容是否篡改。
     */
}

@end





