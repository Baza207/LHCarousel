//
//  LHCarousel.h
//  Little Hedgehog Engine
//
//  Created by James Barrow on 05/04/2013.
//  Copyright (c) 2013 Pig on a Hill Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHCarousel : NSObject <UIScrollViewDelegate>

@property (strong, readonly, nonatomic) NSArray *viewsArray;
@property (assign, readonly, nonatomic) CGSize boxSize;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (id)initWithScrollView:(UIScrollView *)scrollView;
- (id)initWithScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageControl;

- (void)setScrollView:(UIScrollView *)scrollView;
- (void)setScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageControl;

- (void)setBoxSize:(CGSize)boxSize viewsArray:(NSArray *)viewsArray;

- (IBAction)pageControlDidChange:(id)sender;

@end
