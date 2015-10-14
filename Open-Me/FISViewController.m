//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) CGFloat operandA;
@property (strong, nonatomic) NSString *operator;

@end


@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)digitTapped:(id)sender {
    UIButton *digitButton = sender;
    self.textField.text = [self.textField.text stringByAppendingString:digitButton.titleLabel.text];
}

- (IBAction)decimalTapped:(id)sender {
    self.textField.text = [self.textField.text stringByAppendingString:@"."];
}

- (IBAction)operatorTapped:(id)sender {
    self.operandA = [self.textField.text doubleValue];
    self.textField.text = @"";
    
    UIButton *operatorButton = sender;
    self.operator = operatorButton.titleLabel.text;
}

- (IBAction)equalsTapped:(id)sender {
    CGFloat operandB = [self.textField.text doubleValue];
    
    CGFloat result = 0.0;
    
    NSString *display = @"";
    
    if ([self.operator isEqualToString:@"+"]) {
        result = self.operandA + operandB;
    } else if ([self.operator isEqualToString:@"-"]) {
        result = self.operandA - operandB;
    } else if ([self.operator isEqualToString:@"x"]) {
        result = self.operandA * operandB;
    } else if ([self.operator isEqualToString:@"/"]) {
        result = self.operandA / operandB;
    } else {
        display = @"ERROR";
    }
    
    display = [NSString stringWithFormat:@"%.6f", result];
    
    while ([display hasSuffix:@"0"]) {
        display = [display substringToIndex:(display.length - 1)];
    }
    if ([display hasSuffix:@"."]) {
        display = [display substringToIndex:(display.length - 1)];
    }
    
    self.textField.text = display;
}








@end
