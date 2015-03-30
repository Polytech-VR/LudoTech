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
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *selectedFactions; // to handle selected items

@end

@implementation AddGamePlayedViewController

// ===== INSTANCES METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Creation of the pickerViewDate like a keyboard
    self.pickerViewDate = [[UIDatePicker alloc] init];
    self.pickerViewDate.datePickerMode = UIDatePickerModeDate;
    [self.pickerViewDate addTarget:self action:@selector(updateTextField:)
         forControlEvents:UIControlEventValueChanged];
    [self.date setInputView:self.pickerViewDate];
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
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    /*     Rank     */
    
    NSNumber *rank = [formatter numberFromString:self.rank.text];
    
    /*     NbPlayer     */
    
    NSNumber *nbPlayer = [formatter numberFromString:self.nbPlayer.text];
    
    /*     Date     */
    NSDateFormatter *formatterDate = [[NSDateFormatter alloc] init];
    [formatterDate setDateFormat:@"MM-dd-yyyy"];
    NSDate * date = [[NSDate alloc] init];
    date = [formatterDate dateFromString:self.date.text];
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription *entityDescriptionGamedPlayed = [NSEntityDescription entityForName:@"GamePlayed" inManagedObjectContext:context];
    
    [GamePlayed getObjectWithDate:date withRank:rank withNbPlayer: nbPlayer withEntityDescription:entityDescriptionGamedPlayed inManagedObjectContext:context];
    
    [self->_appDelegate saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
