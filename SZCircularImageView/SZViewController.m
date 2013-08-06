//
//  SZViewController.m
//  SZCircularImageView
//
//  Created by Steve Zweier on 8/5/13.
//  Copyright (c) 2013 Steven Zweier. All rights reserved.
//

#import "SZViewController.h"
#import "SZCircularImageView.h"

@interface SZViewController ()
{
  SZCircularImageView *circle;
}

@property (weak, nonatomic) IBOutlet SZCircularImageView *circle2;

@end

@implementation SZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  circle = [[SZCircularImageView alloc] initWithImage:[UIImage imageNamed:@"sample.png"]];
  [circle setContentMode:UIViewContentModeScaleAspectFill];
  [circle setFrame:CGRectMake(40, 40, 120, 600)];
  [self.view addSubview:circle];
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  [UIView animateWithDuration:3.0 delay:1.0 options:0 animations:^{
    [_circle2 moveSpotlightBy:CGPointMake(10, 40)];
  } completion:^(BOOL finished) {
    [UIView animateWithDuration:3.0 animations:^{
      [_circle2 moveSpotlightBy:CGPointMake(-30, -20)];
    }];
  }];
}

@end
