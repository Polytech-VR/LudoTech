//
//  AddGamePlayedViewController.m
//  LudoTech
//
//  Created by Valentin Bercot on 20/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AppDelegate.h"
#import "AddGamePlayedViewController.h"
#import "GamePlayed+DataModel.h"

// ===== DEFINITION =====

@interface AddGamePlayedViewController ()

// ===== PROPERTIES =====

@property (weak, nonatomic) AppDelegate *appDelegate;

@end

@implementation AddGamePlayedViewController

// ===== INSTANCES METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // AppDelegate initialization
    self->_appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Creation of the pickerViewDate like a keyboard
    self.pickerViewDate = [[UIDatePicker alloc] init];
    self.pickerViewDate.datePickerMode = UIDatePickerModeDate;
    [self.pickerViewDate addTarget:self action:@selector(updateTextField:)
         forControlEvents:UIControlEventValueChanged];
    [self.date setInputView:self.pickerViewDate];
    
    [self.errorRankNbPlayer setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateTextField:(UIDatePicker *)sender
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy"];
    self.date.text = [formatter stringFromDate:sender.date];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (textField == self.date)
    {
        [self.nbPlayer becomeFirstResponder];
    }
    else if (textField == self.nbPlayer)
    {
        [self.rank becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - Button

- (IBAction)save:(id)sender
{
    //formatter NSString to NSNumber
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    /*     Rank     */
    
    NSNumber *rank = [numberFormatter numberFromString:self.rank.text];
    
    /*     NbPlayer     */
    
    NSNumber *nbPlayer = [numberFormatter numberFromString:self.nbPlayer.text];
    
    /*     Date     */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    NSDate * date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:self.date.text];
    
    if (rank > nbPlayer)
    {
        [self.errorRankNbPlayer setHidden:NO];
        [self.view setNeedsDisplay];
    }
    else
    {
        NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
        
        NSEntityDescription *entityDescriptionGamePlayed = [NSEntityDescription entityForName:@"GamePlayed" inManagedObjectContext:context];
        
        [GamePlayed getObjectWithDate:date withVariant: self.variant withRank:rank withNbPlayer:nbPlayer withEntityDescription:entityDescriptionGamePlayed inManagedObjectContext:context];
        
        [self->_appDelegate saveContext];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
