//
//  VC3.m
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import "VC3.h"


@interface VC3 ()

@end

@implementation VC3


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
    
    self.webview = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webview.navigationDelegate = self;
    self.webview.layer.borderWidth = 2.0;
    self.webview.layer.borderColor = [UIColor blackColor].CGColor;
    self.webview.frame = CGRectMake(100, 100, 500, 500);
    [self.view addSubview:self.webview];
    
    
    
    UIButton *naver = [UIButton buttonWithType:UIButtonTypeSystem];
    [naver setTitle:@"naver" forState:UIControlStateNormal];
    [naver addTarget:self action:@selector(naverAction) forControlEvents:UIControlEventTouchUpInside];
    naver.frame = CGRectMake(100, 10, 100, 100);
    [self.view addSubview:naver];
    naver.titleLabel.font = [UIFont systemFontOfSize:30];
    
    UIButton *webm = [UIButton buttonWithType:UIButtonTypeSystem];
    [webm setTitle:@"webm" forState:UIControlStateNormal];
    [webm addTarget:self action:@selector(webmAction) forControlEvents:UIControlEventTouchUpInside];
    webm.frame = CGRectMake(300, 10, 100, 100);
    [self.view addSubview:webm];
    webm.titleLabel.font = [UIFont systemFontOfSize:30];
    
    UIButton *mp4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [mp4 setTitle:@"mp4" forState:UIControlStateNormal];
    [mp4 addTarget:self action:@selector(mp4Action) forControlEvents:UIControlEventTouchUpInside];
    mp4.frame = CGRectMake(500, 10, 100, 100);
    [self.view addSubview:mp4];
    mp4.titleLabel.font = [UIFont systemFontOfSize:30];
}

- (void)naverAction {
    NSURL *url = [NSURL URLWithString:@"https://www.naver.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

- (void)webmAction {
    NSURL *url = [NSURL URLWithString:webmURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}


- (void)mp4Action {
    NSURL *url = [NSURL URLWithString:mp4URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {

    NSString *errorMessage = [NSString stringWithFormat:@"Error: %@", error.localizedDescription];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Page Load Error" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
