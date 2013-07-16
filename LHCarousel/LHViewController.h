//
//  LHViewController.h
//  LHCarousel
//
//  Created by James Barrow on 03/04/2013.
//  Copyright (c) 2013 Pig on a Hill Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIView *viewA;
    IBOutlet UIView *viewB;
    IBOutlet UIView *viewC;
    IBOutlet UIView *viewD;
    IBOutlet UIView *viewE;
    
    NSArray *viewsArray;
    
    CGFloat boxWidth;
    
    IBOutlet UIScrollView *carouselScrollView;
    IBOutlet UIPageControl *carouselPageControl;
}

@end
