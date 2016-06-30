//
//  BottomLabelButton.h
//  KuaiYouJia
//
//  Created by guide_sun on 16/3/22.
//  Copyright © 2016年 KuaiYouJia. All rights reserved.
//
/**
 *  上面是图片下面是文字的button
 */
#import <UIKit/UIKit.h>
//当前设备的屏幕宽度
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
//当前设备的屏幕高度
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
//当前系统的高度比例
#define SCALE_HEIGHT   SCREEN_HEIGHT / 568
//当前系统的宽度比例
#define SCALE_WIDTH    SCREEN_WIDTH / 320
@interface BottomLabelButton : UIControl

@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)UIImage *image;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *imageView;

@end
