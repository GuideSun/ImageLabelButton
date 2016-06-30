//
//  HomeMenuView.m
//  KuaiYouJia
//
//  Created by 王群朋 on 16/3/22.
//  Copyright © 2016年 KuaiYouJia. All rights reserved.
//

#import "HomeMenuView.h"
#import "Masonry.h"
@implementation HomeMenuView
- (instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images{
    if (! (self = [super init]))
        return nil;
    BottomLabelButton * lastBtn;
    NSInteger count = titles.count;
    for (int i = 0; i<count; i++) {
        BottomLabelButton * button = [[BottomLabelButton alloc]init];
        button.tag = i;
        button.image = [UIImage imageNamed:images[i]];
        button.title = titles[i];
        button.titleLabel.textColor = [UIColor blackColor];
        [button addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastBtn ? lastBtn.mas_right :self);
            make.centerY.equalTo(self);
            //            make.width.mas_equalTo(65*SCALE_WIDTH);
            make.width.equalTo(self).dividedBy(4);
            make.height.mas_equalTo(75*SCALE_HEIGHT);
        }];
        lastBtn = button;
    }
    return self;
}
- (void)createMenu:(NSArray *)titles images:(NSArray *)images {
    
}
- (void)menuButtonClick:(UIButton *)sender {
    if ([self.delegated respondsToSelector:@selector(homeMenuClickAtIndex:)]) {
        [self.delegated homeMenuClickAtIndex:sender.tag];
    }
}
@end
