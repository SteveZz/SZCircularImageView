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
  UIImageView *actualImage;
}

- (void)moveSpotlightBy:(CGPoint)center;

@end
