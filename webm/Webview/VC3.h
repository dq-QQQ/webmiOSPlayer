//
//  VC3.h
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "../custom/custom.h"

@interface VC3 : UIViewController<WKNavigationDelegate>


@property (nonatomic, strong) WKWebView *webview;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSTimer *timer;


@end

