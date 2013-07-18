LHCarousel
==========

LHCarousel is a controller for `UIScrollView` and `UIPageControl` to add a 3D rotation effects when a view is scrolling off or on the view. It is not a view itself (as it is a subclass of `NSObject`) but it takes instances of `UIScrollView` and `UIPageControl`.

To use LHCarousel add the following files into your project:

- LHCarousel/
- LHCarousel.h
- LHCarousel.m

**Note:** You also must include the "QuartzCore" framework into your project.

LHSlideBar requires **iOS 5**+ to work and uses ARC.

### Demo

<table>
  <tr align="center">
		<td width="260">
			<img src="http://blog.pigonahill.com/wp-content/uploads/2013/07/LHCarousel_1.png" width="240px">
		</td>
		<td width="260">
			<img src="http://blog.pigonahill.com/wp-content/uploads/2013/07/LHCarousel_2.png" width="240px">
		</td>
		<td width="260">
			<img src="http://blog.pigonahill.com/wp-content/uploads/2013/07/LHCarousel_3.png" width="240px">
		</td>
	</tr>
</table>

## [Demo Video Avaliable Here!](http://youtu.be/2nxQCaKhPmw)

### Implementing LHCarousel

After adding the relevant files into your project (listed above) you create a new instance of LHCarousel using one of the custom init methods below:  
```
- (id)initWithScrollView:(UIScrollView *)scrollView
- (id)initWithScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageControl
```

If you  just use `- (id)init` you can use the following methods to set the `scrollView` and `pageControl`:
```
- (void)setScrollView:(UIScrollView *)scrollView
- (void)setScrollView:(UIScrollView *)scrollView pageControl:(UIPageControl *)pageControl
```

You don't have to set a `pageControl`, so if no page control is set then LHCarousel will still work.

### Adding views in LHCarousel

LHCarousel has an array called `viewsArray` that holds UIViews as objects. When setting this you must also set the `boxSize` of the views. If you don't set the boxSize then it will take the size of the `scrollView`. The `boxSize` variable will be the same for all views. Use the following method to set both of these variables:

```
- (void)setViewsArray:(NSArray *)viewsArray
- (void)setBoxSize:(CGSize)boxSize viewsArray:(NSArray *)viewsArray
```

**NOTE:** You must always set the `scrollView` before adding views. If you do this later you will have to refresh the views in the scroll view by using the following method:
```
- (void)refreshViews
```

## License

LHSPNservice is available under the MIT license. See the [LICENSE](https://github.com/Baza207/LHCarousel/blob/master/LICENSE) file for more info.

### Creator

[James Barrow - Pig on a Hill](http://pigonahill.com)  
[@PigonaHill](https://twitter.com/PigonaHill)
