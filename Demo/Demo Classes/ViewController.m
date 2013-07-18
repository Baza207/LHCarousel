//
//  ViewController.m
//  LHCarousel
//
//  Created by James Barrow on 03/04/2013.
//  Copyright (c) 2013 Pig on a Hill Productions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *viewsArray = @[viewA, viewB, viewC, viewD, viewE];
    
    carousel = [[LHCarousel alloc] initWithScrollView:carouselScrollView pageControl:carouselPageControl];
    [carousel setViewsArray:viewsArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Pressed/Changed Methods

- (IBAction)pageControlDidChange:(id)sender
{
    [carousel pageControlDidChange:sender];
}

@end
