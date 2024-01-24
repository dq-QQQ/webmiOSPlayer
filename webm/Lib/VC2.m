//
//  VC2.m
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import "VC2.h"



@implementation VC2


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
//    
//    self.mediaPlayer = [[VLCMediaPlayer alloc] init];
//    self.mediaPlayer.delegate = self;
//    self.mediaPlayer.drawable = self.moviewView;
//    NSURL *webmURL2 = [NSURL URLWithString:webmStr2];
//    VLCMedia *media = [VLCMedia mediaWithURL:webmURL2];
//    [self.mediaPlayer setMedia:media];
//    
//    
//    [self.view addSubview:_moviewView];
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
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 500, 500)];
    customView.layer.borderWidth = 2.0;
    customView.layer.borderColor = [UIColor blackColor].CGColor;
        
        [self.view addSubview:customView];
    self.movieView = customView;
    
    _mediaplayer = [[VLCMediaPlayer alloc] init];
    _mediaplayer.delegate = self;
    _mediaplayer.drawable = self.movieView;
//    _movieView.frame = CGRectMake(100, 100, 500, 500);
//    _movieView.layer.borderWidth = 2.0;
//    _movieView.layer.borderColor = [UIColor blackColor].CGColor;
    
//    [self.view addSubview:self.movieView];
    /* create a media object and give it to the player */

}

- (void)connect {
    _mediaplayer.media = [VLCMedia mediaWithURL:[NSURL URLWithString:webmURL]];
    [_mediaplayer play];
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
        _mediaplayer.media = [VLCMedia mediaWithPath:url.path];
        [_mediaplayer play];
    }
    
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
