![PandaKitLogo](https://user-images.githubusercontent.com/64893914/153651028-6d27069e-8c86-4dc6-b528-3dc122f1adac.png)

## Welcome to PandaKit

**PandaKit** is a swift package that is designed to eliminate commonly written UI code and make your projects easier to read. 


## Features

- Easy to read code
- Based on the UIKit framework
- Easy customization of your views

## installation

You can install this package using Xcode's package manager.

## Usage 

Once added, you only have to import PandaKit in the file you want to use it.
PandaKit is fully compatible with UIkit and other standard Apple frameworks.

## Extensions

PandaKit provides a bunch of extension methods to the UIView class. These extension 
make it easy to set layout constraints for all your views. 

### Autolayout

With the new methods it is easier to make use of the autolayout system without all those long methods
from UIKit. There are one line methods to center your view and to specify the anchors to which the
view need to set the constraints.

``` swift

// This method will center your view to the superview.
view.centerViewInSuperview() 
view.centerViewToXAxisOfSuperview()
view.centerViewToYAxisOfSuperview()

// These methods will center the view compared to the anchors specified 
// in the parameter
view.centerViewXAnchorTo(* Specify your X anchor here *)
view.centerViewYAnchorTo(* Specify your Y anchor here *)

// These methods will set constriants to the width and height 
// of your views.
view.constraintHeight(with: *your value*)
view.constraintWidth(with: *your value*) 

// These methods will fill your superview with your view accordingly
view.viewFillSuperview()
view.viewFillSuperviewInSafeAreaLayoutGuide()

```

### Stack Views

PandaKit also provides extensions to make the use and creation of stack views
easier. Just call one of the follwong mehtods and provide it with the views
that need to be arranged within the stack view.

``` swift

/// Creates a UIStackView with the provided views in a vertical configuration.
/// - Parameters:
///   - views: The sub views for the UIStackView
///   - spacing: The amount of spacing between the arranged views in the UIStackView
///   - alignment: The layout of arranged views perpendicular to the UIStackView axis
///   - distribution: The size and position of the arranged views along the UIStackView axis
/// - Returns: Returns the configured UIStackView

VStackView(* Fill in the parameters *)
HStackView(* Fill in the parameters *)

```

### Color

PandaKit makes it easier to use RGB values in UIColor. With UIColor you 
had to calculate the value by dividing it by 255 to get a number between 
0 and 1. Now you can just call the RGB method that you see below and provide 
the raw RGB values to get the color you want.

``` swift

let myColor = UIColor.withRGBValue(231, 41, 156, 1)

```

PandaKit also provides additional colors that you can see below

/Users/maartenwubs/Documents/Grand Color Card.png


