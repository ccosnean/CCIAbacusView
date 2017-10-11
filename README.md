# CCIAbacusView

[![CI Status](http://img.shields.io/travis/ccosnean/CCIAbacusView.svg?style=flat)](https://travis-ci.org/ccosnean/CCIAbacusView)
[![Version](https://img.shields.io/cocoapods/v/CCIAbacusView.svg?style=flat)](http://cocoapods.org/pods/CCIAbacusView)
[![License](https://img.shields.io/cocoapods/l/CCIAbacusView.svg?style=flat)](http://cocoapods.org/pods/CCIAbacusView)
[![Platform](https://img.shields.io/cocoapods/p/CCIAbacusView.svg?style=flat)](http://cocoapods.org/pods/CCIAbacusView)

## Example

![Alt text](https://ibb.co/eRyeVb)

The total value is displayed in delegate methods. See below.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

### Header files
    <CCIBead.h>
    <CCIAbacusDelegate.h>
    <CCIAbacusDataSource.h>
    <CCIAbacusView.h>

### Required mehods

```ruby
- (int)numberOfColumnsForAbacusView:(CCIAbacusView *)view ;
- (int)abacusView:(CCIAbacusView *)view numberOfBeadsPerSection: (int)sectionNumber;
- (int)abacusView:(CCIAbacusView *)view valueOfBeadsPerSection: (int)sectionNumber;
- (BOOL)showSeparatorForAbacusView:(CCIAbacusView *)view;
- (UIColor *)separatorColorForAbacusView:(CCIAbacusView *)view;
- (CCIBead *)abacusView:(CCIAbacusView *)view setBeadForColumn: (int) column withIndex: (int)index;
- (void)abacusView:(CCIAbacusView *)view didChangeValue: (int)newValue;
```
## Installation

CCIAbacusView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CCIAbacusView'
```
or

```ruby
pod 'CCIAbacusView', :git => 'https://github.com/ccosnean/CCIAbacusView.git'
```

## Author

ccosnean, cristian.cosneanu@endava.com

## License

CCIAbacusView is available under the MIT license. See the LICENSE file for more info.
