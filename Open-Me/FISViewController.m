//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
    
    [self.view removeConstraints:[self.view constraints]];
    for (UIView *view in self.view.subviews)
    {
        [view removeConstraints:[view constraints]];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    NSDictionary *views = @{@"topContainerView" : self.topContainerView,
                            @"bottomContainerView" : self.bottomContainerView,
                            @"displayTextField" : self.displayTextField,
                            @"oneButton" : self.oneButton,
                            @"twoButton" : self.twoButton,
                            @"threeButton" : self.threeButton,
                            @"fourButton" : self.fourButton,
                            @"fiveButton" : self.fiveButton,
                            @"sixButton" : self.sixButton,
                            @"sevenButton" : self.sevenButton,
                            @"eightButton" : self.eightButton,
                            @"nineButton" : self.nineButton,
                            @"zeroButton" : self.zeroButton,
                            @"decimalButton" : self.decimalButton,
                            @"equalsButton" : self.equalsButton,
                            @"divideButton" : self.divideButton,
                            @"multiplyButton" : self.multiplyButton,
                            @"minusButton" : self.minusButton,
                            @"additionButton" : self.additionButton};
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[displayTextField]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(30)-[displayTextField]" options:0 metrics:nil views:views]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topContainerView]|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomContainerView]|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topContainerView(==bottomContainerView)][bottomContainerView(==topContainerView)]|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[oneButton(==twoButton)][twoButton(==oneButton)][threeButton(==oneButton)][divideButton(==oneButton)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[fourButton(==oneButton)][fiveButton(==oneButton)][sixButton(==oneButton)][multiplyButton(==oneButton)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[sevenButton(==oneButton)][eightButton(==oneButton)][nineButton(==oneButton)][minusButton(==oneButton)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[zeroButton(==oneButton)][decimalButton(==oneButton)][equalsButton(==oneButton)][additionButton(==oneButton)]|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[oneButton(==twoButton)][fourButton(==oneButton)][sevenButton(==oneButton)][zeroButton(==oneButton)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[twoButton(==oneButton)][fiveButton(==oneButton)][eightButton(==oneButton)][decimalButton(==oneButton)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[threeButton(==twoButton)][sixButton(==oneButton)][nineButton(==oneButton)][equalsButton(==oneButton)]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[divideButton(==twoButton)][multiplyButton(==oneButton)][minusButton(==oneButton)][additionButton(==oneButton)]|" options:0 metrics:nil views:views]];
}

@end
