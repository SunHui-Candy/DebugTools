//
//  ViewController.m
//  LNDataSecurity
//
//  Public_不知名开发者 | https://github.com/CoderLN
//  各位厂友, 由于「时间 & 知识」有限, 总结的文章难免有「未全、不足」, 该模块将系统化学习, 后续「坚持新增文章, 替换、补充文章内容」
//

#import "ViewController.h"
#import "LNCommonEncryptVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 常用加密方法
- (IBAction)commonEncryptMethodBtnClick:(UIButton *)sender
{
    [self.navigationController pushViewController:[[LNCommonEncryptVC alloc] init] animated:YES];
}


@end
