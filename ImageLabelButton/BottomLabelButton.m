//
//  BottomLabelButton.m
//  KuaiYouJia
//
//  Created by guide_sun on 16/3/22.
//  Copyright © 2016年 KuaiYouJia. All rights reserved.
//

#import "BottomLabelButton.h"

#define kContentEdge 5

@interface BottomLabelButton ()

@end

@implementation BottomLabelButton

- (instancetype)init {
    if (!(self = [super init]))return nil;
    [self setupSubView];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))return nil;
    [self setupSubView];
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self layOut];
}

- (void)setupSubView {
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    if(!self.frame.size.width)return;
    
    CGFloat contentW = self.frame.size.width;
    CGFloat contentH = self.frame.size.height;
    
    CGFloat imageW ;
    CGFloat imageH ;
    CGFloat imageX ;
    CGFloat imageY ;
    
    if(SCREEN_HEIGHT <= 667){
        imageW = self.image.size.width;
        imageH = self.image.size.height;
    }else{
        imageW = self.image.size.width * SCALE_WIDTH;
        imageH = self.image.size.height * SCALE_HEIGHT;
    }

    if(imageW > contentW){
        imageW = contentW - 2 * kContentEdge;
        imageX = kContentEdge;
        imageH = imageH * (imageW / self.image.size.width);
    }else{
        imageX = (contentW - imageW) * 0.5;
    }
    
    _titleLabel.frame = CGRectMake(0, 0, contentW, 15 * SCALE_HEIGHT);
    
    imageY = (contentH - (imageW + kContentEdge + _titleLabel.frame.size.height)) * 0.5;
    
    _imageView.frame = CGRectMake(imageX ,imageY, imageW, imageH);
    
    _titleLabel.center = CGPointMake(_imageView.center.x, CGRectGetMaxY(_imageView.frame)+ kContentEdge + _titleLabel.frame.size.height * 0.5);
    
}

-(void)layOut
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark -Set

- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        self.imageView.image = image;
        [self layOut];
    }
}

- (void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
        self.titleLabel.text = title;
        [self layOut];
    }
}

#pragma mark - getter


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.numberOfLines = 1;
    }
    return _titleLabel;
}


@end
