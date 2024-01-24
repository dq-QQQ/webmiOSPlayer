//
//  VC1.h
//  webm
//
//	Created by dq/kjsl4tw@forcs.com on 1/22/24
//
//  Copyright (c) 2024 FORCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../custom/custom.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface VC1 : UIViewController<UIDocumentPickerDelegate>
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerLayer *avPlayerLayer;
@end

