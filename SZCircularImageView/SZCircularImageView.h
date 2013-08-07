//
//  SZCircularImageView.h
//  SZCircularImageView
//
//  Created by Steve Zweier on 8/5/13.
//  Copyright (c) 2013 Steven Zweier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZCircularImageView : UIImageView
{
  BOOL isMovingSpotlight;
  UIImageView *actualImage;
}

- (void)moveSpotlightBy:(CGPoint)center;
- (void)moveViewPointBy:(CGPoint)center;

@end
