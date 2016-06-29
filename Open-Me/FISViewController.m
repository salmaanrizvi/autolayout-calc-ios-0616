//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textInputField;

@property (nonatomic) BOOL operatorSelected;
@property (nonatomic) BOOL isEnteringNumber;
@property (strong, nonatomic) IBOutlet UILabel *answer;

@end


@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.operatorSelected = NO;
    self.isEnteringNumber = YES;
    self.answer.hidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)numberButtonTapped:(UIButton *)sender {
    
    NSLog(@"%@", sender.titleLabel.text);
    
    if(self.isEnteringNumber) {
        self.textInputField.text = [NSString stringWithFormat:@"%@%@", self.textInputField.text, sender.titleLabel.text];
    }
    else {
        self.textInputField.text = [NSString stringWithFormat:@"%@ %@", self.textInputField.text, sender.titleLabel.text];
    }

}

- (IBAction)operatorButtonTapped:(UIButton *)sender {
    self.isEnteringNumber = YES;
    self.textInputField.text = [NSString stringWithFormat:@"%@ %@ ", self.textInputField.text, sender.titleLabel.text];
}

- (IBAction)equalsTapped:(UIButton *)sender {
    NSString *inputText = self.textInputField.text;
    
    if(![inputText containsString:@" "] || [inputText characterAtIndex:0] == ' ' || [inputText characterAtIndex:inputText.length-1] == ' ') { // incorrect input TBU add popup alert
        UIAlertController *newAlert = [UIAlertController alertControllerWithTitle:@"Incorrect input." message:@"Please enter a valid equation." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [newAlert addAction:defaultAction];
        [self presentViewController:newAlert animated:YES completion:nil];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect input." message:@"Please enter a valid equation." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
//        // optional - add more buttons:
//        //[alert addButtonWithTitle:@"Yes"];
//        [alert show];
        self.textInputField.text = @"";
        return;
    }
    
    NSMutableArray *parsedInput = [[NSMutableArray alloc] init];
    NSMutableString *parsedText = [@"" mutableCopy];
    
    for(NSUInteger i = 0; i < inputText.length; i++) {
        
        NSString *currentChar = [NSString stringWithFormat:@"%C",[inputText characterAtIndex:i] ];
        
        if ([currentChar isEqualToString:@" "]) {
            [parsedInput addObject:parsedText];
            parsedText = [@"" mutableCopy];
        }
//        else if ([currentChar isEqualToString:@"x"]) {
//            [parsedInput addObject:@"*"];
//            parsedText = [@"" mutableCopy];
//        }
        else {
            [parsedText appendString:currentChar];
        }
    }
    [parsedInput addObject:parsedText];
    [self calculate:parsedInput];
}

-(void) calculate:(NSMutableArray *)inputToCalculate {
    NSNumber *firstNumber;
    NSNumber *secondNumber;
    
    NSString *firstNumberString = inputToCalculate[0];
    firstNumber = @(firstNumberString.floatValue);
    
    
    for (NSUInteger i = 0; i < inputToCalculate.count - 2; i=i+2) {
        
        NSString *secondNumberString = inputToCalculate[i+2];
        secondNumber = @(secondNumberString.floatValue);
        
        if ([inputToCalculate[i+1] isEqualToString:@"+"]) {
            firstNumber = @(firstNumber.floatValue + secondNumber.floatValue);
            NSLog(@"Sum: %@", firstNumber);
        }
        else if([inputToCalculate[i+1] isEqualToString:@"-"]) {
            firstNumber = @(firstNumber.floatValue - secondNumber.floatValue);
            NSLog(@"Subtraction: %@", firstNumber);
        }
        else if([inputToCalculate[i+1] isEqualToString:@"/"]) {
            firstNumber = @(firstNumber.floatValue / secondNumber.floatValue);
            NSLog(@"Division: %@", firstNumber);
        }
        else if([inputToCalculate[i+1] isEqualToString:@"x"]) {
            firstNumber = @(firstNumber.floatValue * secondNumber.floatValue);
            NSLog(@"Multiplication: %@", firstNumber);
        }
    }
    self.answer.text = [NSString stringWithFormat:@"%@ = %@", self.textInputField.text, firstNumber];
    self.answer.adjustsFontSizeToFitWidth = YES;
    self.textInputField.text = @"";
    self.answer.hidden = NO;
}

@end
