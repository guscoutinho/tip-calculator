//
//  ViewController.m
//  Teeeps
//
//  Created by Gustavo Coutinho on 6/26/18.
//  Copyright © 2018 Gustavo Coutinho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@property (weak, nonatomic) IBOutlet UILabel *plusLabel;

@property (weak, nonatomic) IBOutlet UILabel *equalLabel;

@property (weak, nonatomic) IBOutlet UILabel *sharingLabel;

@property (weak, nonatomic) IBOutlet UISwitch *switchLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipLabel.alpha = 0;
    self.tipControl.alpha = 0;
    self.totalLabel.alpha = 0;
    self.plusLabel.alpha = 0;
    self.equalLabel.alpha = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    // NSArray of NSNumbers
    NSArray *percentages = @[@(0.07), @(0.15), @(0.2)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}


- (IBAction)onEditingBegin:(id)sender {

    [UIView animateWithDuration:0.2 animations:^{
self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y - 80, self.billField.frame.size.width, self.billField.frame.size.height);

    }];
    
    CGRect tipFrame = self.tipLabel.frame;
    CGRect tipControlFrame = self.tipControl.frame;
    CGRect totalFrame = self.totalLabel.frame;
    CGRect plusFrame = self.plusLabel.frame;
    CGRect equalFrame = self.equalLabel.frame;
//    CGRect sharingLabel = self.sharingLabel.frame;
//    CGRect switchLabel = self.switchLabel.frame;

    tipFrame.origin.y -= 80;
    tipControlFrame.origin.y -= 80;
    totalFrame.origin.y -= 80;
    plusFrame.origin.y -= 80;
    equalFrame.origin.y -= 80;
//    sharingLabel.origin.y -= 80;
//    switchLabel.origin.y -= 80;

    [UIView animateWithDuration: 0.2 animations:^{
        self.tipLabel.frame = tipFrame;
        self.tipControl.frame = tipControlFrame;
        self.totalLabel.frame = totalFrame;
        self.plusLabel.frame = plusFrame;
        self.equalLabel.frame = equalFrame;
//        self.sharingLabel.frame = sharingLabel;
//        self.switchLabell.frame = switchLabel;
        
        self.tipLabel.alpha = 1;
        self.tipControl.alpha = 1;
        self.totalLabel.alpha = 1;
        self.plusLabel.alpha = 1;
        self.equalLabel.alpha = 1;
    }];

}


- (IBAction)onEditingEnd:(id)sender {

    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 1;
        self.tipControl.alpha = 1;
        self.totalLabel.alpha = 1;
        self.plusLabel.alpha = 1;
        self.equalLabel.alpha = 1;
    }];

}

@end
