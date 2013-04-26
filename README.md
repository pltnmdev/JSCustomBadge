# JSCustomBadge

A simple, iOS badge UIView drawn with CoreGraphics.

![Badge Screenshot 1][img1]

## About


* Simple, easy-to-use sublcass of `UIView`
* iOS 5.0+, ARC, Universal, Retina, Storyboards

## Installation

* Drag the `JSFlatButton/` folder to your project
* Initialize buttons
	* To create buttons programmatically:
		* Call `initWithFrame: backgroundColor: foregroundColor:`
		* Or, use the [UIButton][ref1] methods `buttonWithType:` with `UIButtonTypeCustom`, or `initWithFrame:`
	* To create buttons with Storyboards:
		* Drag a `UIButton` to your view
		* Set its class to `JSFlatButton` and button type to `Custom` in Interface Builder
		* Set your `IBOutlet` and `IBAction` accordingly
* Set button properties `buttonBackgroundColor` and `buttonForegroundColor`
* **Colors must be set in HSB or RGB color space**
	* Use the [UIColor][ref2] methods: `colorWithHue: saturation: brightness: alpha:` or `colorWithRed: green: blue: alpha:`
	* iOS built-in colors **will not** work (e.g., `[UIColor whiteColor]`, `[UIColor darkGrayColor]`, etc.)
* Call `setFlatTitle:` and `setFlatImage:` to set the button title and image, respectively
* You may set your button title font and other attributes as you normally would with `UIButton`
* *Special Options*
	* Set `shouldHighlightImage` to `YES` to optionally highlight the button image when pressed (default value is `NO`)
	* Set `shouldHighlightText` to `YES`to optionally highlight the button title text when pressed (default value is `NO`)
	* To make a flat button with an *image-only* and **no** background color:
		* Set `buttonBackgroundColor` to `nil`
		* Set `shouldHighlightImage` to `YES`
		* Set your `buttonForegroundColor` to whatever you want
		* Call `setFlatTitle:` with `nil`
	* Similarly, you can make a flat button with *text-only* and **no** background color
* See included demo project: `FlatButtonDemo.xcodeproj` 

## [MIT License](http://opensource.org/licenses/MIT)

Copyright &copy; 2013 Jesse Squires

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[img1]:https://raw.github.com/jessesquires/FlatButton/master/Screenshots/screenshot-iphone4-1.png




*** License & Copyright ***
Created by Sascha Marc Paulus www.spaulus.com on 04/2011. Version 2.0
This tiny class can be used for free in private and commercial applications.
Please feel free to modify, extend or distribution this class. 
If you modify it: Please send me your modified version of the class.
A commercial distribution of this class is not allowed.

I would appreciate if you could refer to my website www.spaulus.com if you use this class.

If you have any questions please feel free to contact me (open@spaulus.com).
