//
//  SZCircularImageView.m
//  SZCircularImageView
//
//  Created by Steve Zweier on 8/5/13.
//  Copyright (c) 2013 Steven Zweier. All rights reserved.
//

#import "SZCircularImageView.h"

@implementation SZCircularImageView

- (void)layoutSubviews{
  /**
   In the case where this image view is used in a storyboard, xib etc.
   We must remove the image set there and place it into the subview image view.
   This allows us to move the "Spotlight"
   */
  UIImage *tmp = self.image;
  if(tmp){
    [super setImage:nil];
    [actualImage setImage:tmp];
  }
  
  /**
   Set clips to bounds to be true otherwise the rounded edges will not be seen.
   */
  [self setClipsToBounds:YES];
  
  [self resizeCircle];
}

- (void)setFrame:(CGRect)frame{
  [super setFrame:frame];
  [self checkAndCreateImage];
  
  /**
   If the user changed the frame of the view, it's subview should change as well.
   */
  [actualImage setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
  
  [self resizeCircle];
}

- (void)setImage:(UIImage *)image{
  [self checkAndCreateImage];
  
  /**
   When setting the new image via code we do not call super because
   we do not want the containing image view to have the image.
   Instead we set the image on its subview.
   */
  [actualImage setImage:image];
}

- (void)checkAndCreateImage{
  if(!actualImage){
    /**
     If the subview imageview isn't yet created create it.
     */
    actualImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:actualImage];
  }
}

- (void)setContentMode:(UIViewContentMode)contentMode{
  [self checkAndCreateImage];
  /**
   Set the content mode on the child imageview.
   */
  [actualImage setContentMode:contentMode];
}

- (void)resizeCircle{
  float diameter = [self getDiameter];
  
  /**
   If the imageview is not a square, make it a square.
   */
  if(self.frame.size.width != self.frame.size.height)
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, diameter, diameter)];
  
  /**
   Set the corner radius to be the radius of the new square image.
   */
  [self.layer setCornerRadius:diameter/2];
}

- (float)getDiameter{
  /**
   This returns the diameter of the image view by taking the smaller
   of the edges
   */
  return (self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width);
}

/**
 This allows you to move the "Spotlight" meaning
 you can have the image slide around within the circle.
 */
- (void)moveSpotlightBy:(CGPoint)center{
  [actualImage setFrame:CGRectMake(actualImage.frame.origin.x-center.x, actualImage.frame.origin.y-center.y, actualImage.frame.size.width, actualImage.frame.size.height)];
}

/**
 Deallocates the project and removes the current observers.
 
 We also release necessary objects if this is being used without arc.
 */
- (void)dealloc
{
#if !__has_feature(objc_arc)
  [actualImage release]; actualImage = nil;
  [super dealloc];
#endif
}

@end