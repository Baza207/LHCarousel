//
//  LHCarousel.m
//  Little Hedgehog Engine
//
//  Created by James Barrow on 05/04/2013.
//  Copyright (c) 2013 Pig on a Hill Productions. All rights reserved.
//

#import "LHCarousel.h"
#import <QuartzCore/QuartzCore.h>

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation LHCarousel

- (id)initWithScrollView:(UIScrollView *)scrollView
{
    self = [super init];
    if (self)
    {
        [self setScrollView:scrollView];
    }
    return self;
}

- (id)initWithScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageControl
{
    self = [super init];
    if (self)
    {
        [self setScrollView:scrollView];
        [self setPageControl:pageControl];
    }
    return self;
}

#pragma mark - Custom Getter and Setter Methods

- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    [_scrollView setDelegate:self];
}

- (void)setScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageControl
{
    _scrollView = scrollView;
    _pageControl = pageControl;
    [_scrollView setDelegate:self];
}

- (void)setViewsArray:(NSArray *)viewsArray
{
    [self setBoxSize:[_scrollView bounds].size viewsArray:viewsArray];
}

- (void)setBoxSize:(CGSize)boxSize viewsArray:(NSArray *)viewsArray
{
    _boxSize = boxSize;
    _viewsArray = viewsArray;
    
    for (int i=0; i<[_viewsArray count]; i++)
    {
        __weak UIView *view = [_viewsArray objectAtIndex:i];
        [view setFrame:CGRectMake((i*_boxSize.width), 0, _boxSize.width, _boxSize.height)];
        [_scrollView addSubview:view];
    }
    
    [_scrollView setContentSize:CGSizeMake([_viewsArray count]*_boxSize.width, _boxSize.height)];
    [_pageControl setNumberOfPages:[_viewsArray count]];
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat xOffset = [_scrollView contentOffset].x;
    
    NSInteger pageNum = (xOffset < 0)? 0 : xOffset/_boxSize.width;
    if (pageNum != [_pageControl currentPage] && pageNum >= 0 && [scrollView isDragging])
        [_pageControl setCurrentPage:pageNum];
    
    xOffset = xOffset - (pageNum*_boxSize.width);
    CGFloat percent = xOffset/_boxSize.width;
    
    UIView *currentView, *nextView = nil;
    
    if (pageNum >= 0 && pageNum < [_viewsArray count])
        currentView = [_viewsArray objectAtIndex:pageNum];
    
    if (pageNum+1 >= 0 && pageNum+1 < [_viewsArray count])
        nextView = [_viewsArray objectAtIndex:pageNum+1];
    
    [self shapeView:currentView withPercent:percent*-1 pageNum:pageNum];
    [self shapeView:nextView withPercent:1-percent pageNum:pageNum];
    
    if (percent > 0.5)
        pageNum = pageNum + 1;
    
    if (pageNum != [_pageControl currentPage] && pageNum >= 0 && [scrollView isDragging])
        [_pageControl setCurrentPage:pageNum];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger pageNum = [_scrollView contentOffset].x/_boxSize.width;
    [_pageControl setCurrentPage:pageNum];
}

#pragma mark - UIPageControl Methods

- (void)pageControlDidChange:(id)sender
{
    CGFloat xOffset = [_pageControl currentPage] * _boxSize.width;
    [_scrollView scrollRectToVisible:CGRectMake(xOffset, 0, _boxSize.width, _boxSize.height)
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
