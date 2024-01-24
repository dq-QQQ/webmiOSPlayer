//
//  VC1.m
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import "VC1.h"
#import <ffmpegkit/FFmpegKit.h>
#import <Foundation/Foundation.h>

@interface VC1 ()

@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
    

    UIView *rect = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 500, 500)];
    rect.layer.borderWidth = 2.0;
    rect.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:rect];
                    
    UIButton *filePickerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [filePickerButton setTitle:@"Local Webm" forState:UIControlStateNormal];
    [filePickerButton addTarget:self action:@selector(presentDocumentPicker) forControlEvents:UIControlEventTouchUpInside];
    filePickerButton.frame = CGRectMake(100, 10, 200, 100);
    filePickerButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:filePickerButton];
    
    
    UIButton *urlButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [urlButton setTitle:@"URL Webm" forState:UIControlStateNormal];
    [urlButton addTarget:self action:@selector(connect) forControlEvents:UIControlEventTouchUpInside];
    urlButton.frame = CGRectMake(400, 10, 200, 100);
    urlButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:urlButton];

}

- (void)approach:(NSString *)url {
    NSString *mp4FilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"output.mp4"];

    [self convertWebMToMP4:url outputMP4FilePath:mp4FilePath completion:^(BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                [self playMP4Video:mp4FilePath];
                
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"변환 실패" message:@"webm to mp4" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
            }
        });
    }];
}

- (void)convertWebMToMP4:(NSString *)webmFilePath outputMP4FilePath:(NSString *)mp4FilePath completion:(void (^)(BOOL success))completion {
    
    NSArray *command = @[
        @"-i", webmFilePath,
        @"-c:v", @"h264",
        @"-c:a", @"aac",
        mp4FilePath
    ];

    
    [FFmpegKit executeWithArgumentsAsync:command  withCompleteCallback:^(id<Session> session){
        if ([session getState] == SessionStateCompleted) {
            NSLog(@"Conversion completed successfully");
            completion(YES);
        } else {
            NSLog(@"Conversion failed with output: %@", [session getOutput]);
            completion(NO);
        }
    }];
    
}

- (void)presentDocumentPicker {
    
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.item"] inMode:UIDocumentPickerModeImport];
    
    
    documentPicker.delegate = self;

    
    [self presentViewController:documentPicker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    
    for (NSURL *url in urls) {
        NSLog(@"Selected File URL: %@", url);
        
        [self approach:url.path];
    }
    
}


- (void)connect {
    [self approach:webmURL];
}

- (void)playMP4Video:(NSString *)mp4FilePath {
    NSURL *mp4URL = [NSURL fileURLWithPath:mp4FilePath];
    self.avPlayer = [AVPlayer playerWithURL:mp4URL];

        self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
        self.avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.avPlayerLayer.frame = CGRectMake(100, 100, 500, 500);

        [self.view.layer insertSublayer:self.avPlayerLayer atIndex:0];

        [self.avPlayer play];
    
    
//    player = [AVPlayer playerWithURL:mp4URL];
//    AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
//    
//    self.playerViewController = [[AVPlayerViewController alloc] init];
//    self.playerViewController.player = self.player;
//
//    [self presentViewController:self.playerViewController animated:YES completion:^{
//        [self.player play];
//    }];
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
