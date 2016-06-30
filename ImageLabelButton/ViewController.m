//
//  ViewController.m
//  ImageLabelButton
//
//  Created by guide_sun on 16/6/30.
//  Copyright © 2016年 Guide_sun. All rights reserved.
//

#import "ViewController.h"
#import "HomeMenuView.h"
#import "Masonry.h"
@interface ViewController () <HomeMenuDelegate>
@property (nonatomic, strong) HomeMenuView    * menuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.menuView];
    _menuView.contentSize = CGSizeMake(SCREEN_WIDTH, 0);
    self.view.backgroundColor = [UIColor cyanColor];
    [_menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
- (void)homeMenuClickAtIndex:(NSInteger)index{
    NSLog(@"index == %ld" , index);
}
- (HomeMenuView *)menuView{
    if (!_menuView) {
        NSArray *titles = @[@"短租",@"住宅",@"公寓",@"别墅"];
        NSArray *images = @[@"SHORT",@"WHOLE_RENT", @"TOGETHER_RENT",@"COTTAGE"];
        _menuView  = [[HomeMenuView alloc]initWithTitles:titles images:images];
        _menuView.delegated = self;
        _menuView.showsHorizontalScrollIndicator = NO;
        _menuView.pagingEnabled = YES;
    }
    return _menuView;
}
@end
