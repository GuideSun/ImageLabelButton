//
//  HomeMenuView.h
//  KuaiYouJia
//
//  Created by 王群朋 on 16/3/22.
//  Copyright © 2016年 KuaiYouJia. All rights reserved.
//
/**
 *  首页的整租、合租、写字楼的视图
 *
 */
#import <UIKit/UIKit.h>
#import "BottomLabelButton.h"
@protocol HomeMenuDelegate <NSObject>
- (void)homeMenuClickAtIndex:(NSInteger)index;
@end
@interface HomeMenuView : UIScrollView
@property (nonatomic ,strong)BottomLabelButton * menuBtn;
@property (nonatomic ,weak) id <HomeMenuDelegate> delegated;
- (instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images;
@end
