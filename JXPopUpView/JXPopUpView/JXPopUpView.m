//
//  JXPopUpView.m
//  JXPopUpView
//
//  Created by 徐沈俊杰 on 2018/12/25.
//  Copyright © 2018 JX. All rights reserved.
//

#import "JXPopUpView.h"

#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

#define kContentViewHeight 200

@interface JXPopUpView()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;

@end

@implementation JXPopUpView

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubviews];
        
        UITapGestureRecognizer *removeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeTapPressed:)];
        removeTap.delegate = self;
        [self addGestureRecognizer:removeTap];
    }
    
    return self;
}

#pragma mark - Events Response
- (void)removeTapPressed:(UITapGestureRecognizer *)sender {
    
    [self removePopUpView];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    
    return YES;
}


#pragma mark - Method
- (void)showPopUpViewOnSuperView:(UIView *)superView {
    [superView addSubview:self];
    __weak typeof(self) _weakSelf = self;
    self.contentView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 0);;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _weakSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _weakSelf.contentView.frame = CGRectMake(0, kScreenHeight - kContentViewHeight, kScreenWidth, kContentViewHeight);
    }];
}

- (void)removePopUpView {
    
    __weak typeof(self) _weakSelf = self;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _weakSelf.contentView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 0);
        _weakSelf.backgroundColor = [UIColor clearColor];
        
    } completion:^(BOOL finished) {
        [_weakSelf removeFromSuperview];
    }];
}


- (void)addSubviews {
    [self addSubview:self.contentView];
}

#pragma mark - Setting And Getting
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView = [[UIView alloc] initWithFrame:(CGRect){0, kScreenHeight, kScreenWidth, 0}];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return _contentView;
}
@end
