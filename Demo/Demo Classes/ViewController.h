//
//  ViewController.h
//  LHCarousel
//
//  Created by James Barrow on 03/04/2013.
//  Copyright (c) 2013 Pig on a Hill Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHCarousel.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    __weak IBOutlet UIView *viewA;
    __weak IBOutlet UIView *viewB;
    __weak IBOutlet UIView *viewC;
    __weak IBOutlet UIView *viewD;
    __weak IBOutlet UIView *viewE;
    
    __weak IBOutlet UIScrollView *carouselScrollView;
    __weak IBOutlet UIPageControl *carouselPageControl;
    
    LHCarousel *carousel;
}

@end
