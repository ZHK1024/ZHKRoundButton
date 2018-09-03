//
//  ZHKRoundButton.m
//  WTBHome
//
//  Created by ZHK on 2018/9/3.
//

#import "ZHKRoundButton.h"

//RGB创建颜色
#define B_COLOR(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]

@interface ZHKRoundButton ()


@end

@implementation ZHKRoundButton

#pragma mark - Init

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    ZHKRoundButton *button = [super buttonWithType:buttonType];
    [button createUI];
    return button;
}

#pragma mark - UI

- (void)createUI {
    [self.layer insertSublayer:self.backLayer atIndex:0];
    self.layer.shadowColor = B_COLOR(252, 117, 102, 1).CGColor;
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset  = CGSizeMake(0.0f, 3.0f);
}

#pragma mark -

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backLayer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
    self.backLayer.frame = self.bounds;
}

#pragma mark - Getter

- (CAGradientLayer *)backLayer {
    if (_backLayer == nil) {
        self.backLayer = [[CAGradientLayer alloc] init];
        _backLayer.colors = @[(__bridge id)B_COLOR(255, 145, 41, 1).CGColor,
                              (__bridge id)B_COLOR(251, 114, 48, 1).CGColor
                              ];
        _backLayer.locations  = @[@0.0, @1.0];
        _backLayer.startPoint = CGPointMake(0, 0);
        _backLayer.endPoint   = CGPointMake(1.0, 0.0);
    }
    return _backLayer;
}

@end
