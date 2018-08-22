//
//  BaseWebViewController.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseWebViewController.h"
#import <SDImageCache.h>

@interface BaseWebViewController ()

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    
    if (![FLJUtil isBlankString:self.loadUrlString]) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadUrlString]]];
    }
}

#pragma mark  WKUIDelegate

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [self canGoPrevious];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    //    DLOG(@"msg = %@ frmae = %@",message,frame);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark  system

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.webView.frame = CGRectMake(0, 0, kScreenWidth, kFrameHeight);
}

#pragma mark private

//清除缓存
-(void)clearnMemory
{
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        [[SDImageCache sharedImageCache]clearMemory];
        kShowMessage(@"清除成功")
    }];
    
    //uiwebview用下面的方式：
    //清除缓存
    [[NSURLCache sharedURLCache]removeAllCachedResponses];
    
    NSURLCache* cache = [NSURLCache sharedURLCache];
    
    [cache removeAllCachedResponses];
    
    [cache setDiskCapacity:0];
    
    [cache setMemoryCapacity:0];
    
    //清除cookie
    
    NSHTTPCookie*cookie;
    
    NSHTTPCookieStorage*storage =[NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for(cookie in[storage cookies])
    {
        [storage deleteCookie:cookie];
    }
    
    //wkwebview用下面的方式 iOS 9
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
    }];
    
}


-(void)canGoPrevious
{
    if (self.webView.canGoBack) {
        [self creatBackBtn];
    }else
    {
        [self creatLeftBarButtonItemWithText:@""];
    }
}

-(void)onClickedLeftBarButtonItem
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }else
    {
        [self creatLeftBarButtonItemWithText:@""];
    }
}

#pragma mark  setter & getter

-(WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kFrameHeight)];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

-(void)setLoadUrlString:(NSString *)loadUrlString
{
    _loadUrlString = loadUrlString;
    if (loadUrlString) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_loadUrlString]]];
    }
}

@end
