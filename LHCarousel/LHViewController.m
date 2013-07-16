//
//  LHViewController.m
//  LHCarousel
//
//  Created by James Barrow on 03/04/2013.
//  Copyright (c) 2013 Pig on a Hill Productions. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LHViewController.h"

#define boxHeight   320.0

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation LHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    boxWidth = [[UIScreen mainScreen] bounds].size.width;
    
    viewsArray = @[viewA, viewB, viewC, viewD, viewE];
    
    for (int i=0; i<[viewsArray count]; i++)
    {
        UIView *view = [viewsArray objectAtIndex:i];
        [view setFrame:CGRectMake((i*boxWidth), 0, boxWidth, boxHeight)];
        [carouselScrollView addSubview:view];
    }
    
    [carouselScrollView setContentSize:CGSizeMake([viewsArray count]*boxWidth, boxHeight)];
    [carouselPageControl setNumberOfPages:[viewsArray count]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat xOffset = [carouselScrollView contentOffset].x;
    
    NSInteger pageNum = (xOffset < 0)? 0 : xOffset/boxWidth;
    if (pageNum != [carouselPageControl currentPage] && pageNum >= 0 && [scrollView isDragging])
        [carouselPageControl setCurrentPage:pageNum];
    
    xOffset = xOffset - (pageNum*boxWidth);
    CGFloat percent = xOffset/boxWidth;
    
    UIView *currentView, *nextView = nil;
    
    if (pageNum >= 0 && pageNum < [viewsArray count])
        currentView = [viewsArray objectAtIndex:pageNum];
    
    if (pageNum+1 >= 0 && pageNum+1 < [viewsArray count])
        nextView = [viewsArray objectAtIndex:pageNum+1];
    
    [self shapeView:currentView withPercent:percent*-1 pageNum:pageNum];
    [self shapeView:nextView withPercent:1-percent pageNum:pageNum];
    
    if (percent > 0.5)
        pageNum = pageNum + 1;
    
    if (pageNum != [carouselPageControl currentPage] && pageNum >= 0 && [scrollView isDragging])
        [carouselPageControl setCurrentPage:pageNum];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger pageNum = [carouselScrollView contentOffset].x/boxWidth;
    [carouselPageControl setCurrentPage:pageNum];
}

#pragma mark - UIPageControl Methods

- (IBAction)pageControlDidChange:(id)sender
{
    CGFloat xOffset = [carouselPageControl currentPage] * boxWidth;
    [carouselScrollView scrollRectToVisible:CGRectMake(xOffset, 0, boxWidth, boxHeight)
                                   animated:YES];
}

#pragma mark - Custom Animation Methods

- (void)shapeView:(UIView *)view withPercent:(CGFloat)percent pageNum:(NSUInteger)pageNum
{
    if (view == nil)
        return;
    
    CGFloat scale = (percent < 0)? percent * -1 : percent;
    CGFloat rotateDir = (percent < 0)? -1 : 1;
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = 1.0 / -500;
    
    transform3D = CATransform3DRotate(transform3D, DEGREES_TO_RADIANS(45*percent) * rotateDir, 0, percent, 0);
    transform3D = CATransform3DScale(transform3D, 1-(scale/2), 1-(scale/2), 1);
    
    [[view layer] setTransform:transform3D];
}

    @end
