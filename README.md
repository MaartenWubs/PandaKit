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

You can use the PandaKit.doccarchive to import the PandaKit Documentation to your
Xcode documentation.

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

![Grand Color Card](https://user-images.githubusercontent.com/64893914/154495051-4fb0533e-1ba9-4c44-b5e4-5d1583dfa880.png)

You can also access PNDAColor to get default colors that automaticly adjust to the devices
dark mode or light mode

## Panda Objects

PandaKit provides a limited amount of custom View Objects that you can use.

### View

The most simple view in PandaKit is the PNDAView. This inherits all the functionality that
comes with UIView. It is easy to setup a PNDAView by overriding the setupView method.

``` swift

class YourView: PNDAView {

    override func setupView() {
        // Your view code...
    }

} 

```
Every time you call your view, the ```setupView()``` method will automatically be called
and will setup the view for you.

### Collection views

PandaKit comes with an easy to use CollectionView. With the PNDADatasourceController
it is easier to setup a collection view without all the boiler plate code that comes with
a UICOllectionViewController. You just have to provide it with a PNDADatasource and PandaKit
will do the setup automatically for you.

PandaKit also makes it easier to use headers and footers for your collection view.
