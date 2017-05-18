//
//  ViewController.m
//  Currency Converter
//
//  Created by Kevin on 4/23/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *InputField;
@property (weak, nonatomic) IBOutlet UIButton *Button;
@property (weak, nonatomic) IBOutlet UILabel *Currency1;
@property (weak, nonatomic) IBOutlet UILabel *Currency2;
@property (weak, nonatomic) IBOutlet UILabel *Currency3;


@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.Button.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.Button.enabled = YES;
    
    double inputValue = [self.InputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    double yenValue = inputValue * currencies.JPY;
    double poundValue = inputValue * currencies.GBP;
    
    NSString *temp1 = [NSString stringWithFormat:@"%.2f", euroValue];
    NSString *temp2 = [NSString stringWithFormat:@"%.2f", yenValue];
    NSString *temp3 = [NSString stringWithFormat:@"%.2f", poundValue];
    
    self.Currency1.text = temp1;
    self.Currency2.text = temp2;
    self.Currency3.text = temp3;
    
    

}

@end
