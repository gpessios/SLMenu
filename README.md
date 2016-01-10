## Synopsis

A simple sliding lef menu that you could use on your projects. Works either by clicking on a button drawn by code (classic three lines button layout) or with sliding right(open) left(close) gestures.

## Code Example

Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.


## Installation

* Embed in Navigation Controller the View Controller on your Storyboard.
* Modify ViewController.h and '#import BaseViewController.h' and also make the ViewController inherit from BaseViewController.
* Copy BaseViewController.h, BaseViewController.m, SLMenuViewController.h and SLMenuViewController.m on your project.
* Create a new View Controller on your Storyboard and set its Class and Storyboard ID in Identity Inspector to SLMenuViewController.
* Drag a UIView inside SLMenuViewController on your Storyboard. 
* Finally on ViewController.m and on viewDidLoad() call the methods "addSlideMenuButton" and "addSlideMenuSwipeGesture". 


## Author

* [Georgios Pessios](http://gpessios.com/)

## License

This code is distributed under the terms and conditions of the MIT license.
