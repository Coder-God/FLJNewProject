//
//  BaseWebViewController.h
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

@interface BaseWebViewController : BaseViewController<WKUIDelegate,WKNavigationDelegate>

@property(nonatomic,copy)NSString* loadUrlString;

@property(nonatomic,strong)WKWebView* webView;

@end
