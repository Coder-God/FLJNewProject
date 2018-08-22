//
//  MacrosHeader.h
//  NewProject
//
//  Created by 贾林飞 on 2018/8/17.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#ifndef MacrosHeader_h
#define MacrosHeader_h

//0 开发环境   1正式环境
#define kisReleasesEnvironment 1

#if kisReleasesEnvironment == 0

//测试http://finance.2tb.cn
//正式http://feiyong.dachagui.com/
#define kBaseUrl @"http://finance.2tb.cn"

#else
//正式环境
#define kBaseUrl @"http://feiyong.dachagui.com/"

#endif

//log
#ifdef DEBUG //开发阶段
#define NSLog(FORMAT, ...) fprintf(stderr, "%s:%d\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String])
#else //发布阶段
#define NSLog(...)

#endif

//版本号
#define kBundleVersion [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

#define KNavgationHight (kDevice_Is_iPhoneX?88:64)

#define kTabBarHeight (kDevice_Is_iPhoneX?83:49)

#define kFrameWidth  self.view.frame.size.width

#define kFrameHeight self.view.frame.size.height

//相对i6比例高度
#define kRatioHieght(height) height/1334.f*kScreenHeight

#define kRatioWidth(width) width/750.f*kScreenWidth

#define kRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kRGB(r,g,b) kRGBA(r,g,b,1.0)

//随机色
#define kRandomColor kRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define kRGBACOLOR_HEX(hexColor,alph) [UIColor colorWithRed: (((hexColor >> 16) & 0xFF))/255.0f         \
green: (((hexColor >> 8) & 0xFF))/255.0f          \
blue: ((hexColor & 0xFF))/255.0f                 \
alpha: alph]

#define kRGBCOLOR_HEX(hexColor) kRGBACOLOR_HEX(hexColor,1.0)

#define kFont(fontSize) [UIFont systemFontOfSize:fontSize]

#define KBoldFont(fontSize)[UIFont boldSystemFontOfSize:fontSize]

#define kImageNamed(imageName) [UIImage imageNamed:imageName]

//弹框  提示框
#define kShowMessage(msg) if(![FLJUtil isBlankString:msg]) [SVProgressHUD showImage:nil status:msg];
#define kShowLoading [SVProgressHUD show];
#define kHideLoading [SVProgressHUD dismiss];

//单利

#if __has_feature(objc_instancetype)

#undef    AS_SINGLETON
#define AS_SINGLETON

#undef    AS_SINGLETON
#define AS_SINGLETON( ... ) \
- (instancetype)sharedInstance; \
+ (instancetype)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON \
- (instancetype)sharedInstance \
{ \
return [[self class] sharedInstance]; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}

#undef    DEF_SINGLETON
#define DEF_SINGLETON( ... ) \
- (instancetype)sharedInstance \
{ \
return [[self class] sharedInstance]; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}

#else    // #if __has_feature(objc_instancetype)

#undef    AS_SINGLETON
#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}

#endif    // #if __has_feature(objc_instancetype)

#undef    DEF_SINGLETON_AUTOLOAD
#define DEF_SINGLETON_AUTOLOAD( __class ) \
DEF_SINGLETON( __class ) \
+ (void)load \
{ \
[self sharedInstance]; \
}

#endif /* MacrosHeader_h */
