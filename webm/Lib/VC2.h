//
//  VC2.h
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <EMMobileVLCKit/EMMobileVLCKit.h>
#import "../custom/custom.h"

#import "MobileVLCKit/MobileVLCKit.h"

@interface VC2 : UIViewController<VLCMediaPlayerDelegate, UIDocumentPickerDelegate>
//
//@property (nonatomic, strong) UIView *moviewView;
//@property (nonatomic, strong) VLCMediaPlayer *mediaPlayer;

@property (nonatomic, strong) UIView *movieView;
@property (nonatomic, strong) VLCMediaPlayer *mediaplayer;


@end


