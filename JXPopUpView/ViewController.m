//
//  ViewController.m
//  JXPopUpView
//
//  Created by 徐沈俊杰 on 2018/12/25.
//  Copyright © 2018 JX. All rights reserved.
//

#import "ViewController.h"
#import "JXPopUpView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *popUpButton;

@property (nonatomic, strong) JXPopUpView *popUpView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popUpView = [[JXPopUpView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    
    
}

- (IBAction)popUpButtonPressed:(id)sender {
    [self.popUpView showPopUpViewOnSuperView:self.view];
}


@end
