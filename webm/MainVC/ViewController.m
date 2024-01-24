//
//  ViewController.m
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import "ViewController.h"
#import "../FFMPeg/VC1.h"
#import "../Lib/VC2.h"
#import "../Webview/VC3.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *fst = [self makeBtn:@"FFMpeg" action:@selector(showVideo1)];
    UIButton *sec = [self makeBtn:@"VLC Player" action:@selector(showVideo2)];
    UIButton *thd = [self makeBtn:@"WebView" action:@selector(showVideo3)];
    
    NSArray *buttons = @[fst, sec, thd];

    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:buttons];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.distribution = UIStackViewDistributionEqualSpacing;

    fst.contentEdgeInsets = UIEdgeInsetsMake(0, 200, 0, 0);
    thd.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 200);
    
    fst.titleLabel.font = [UIFont systemFontOfSize:40];
    sec.titleLabel.font = [UIFont systemFontOfSize:40];
    thd.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:stackView];

    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;

    
    [NSLayoutConstraint activateConstraints:@[
        [stackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [stackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [stackView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [stackView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
    ]];
}


- (UIButton *)makeBtn:(NSString *)title action:(SEL)action {
    UIButton *ret = [UIButton buttonWithType:UIButtonTypeSystem];
    [ret setTitle:title forState:UIControlStateNormal];
    [ret addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return ret;
}

- (void)showVideo1 {
    NSLog(@"ho1");
    VC1 *vc = [[VC1 alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showVideo2 {
    NSLog(@"ho2");
    VC2 *vc = [[VC2 alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showVideo3 {
    NSLog(@"ho3");
    VC3 *vc = [[VC3 alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
