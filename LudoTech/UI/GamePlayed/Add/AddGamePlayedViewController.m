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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    /*     Date     */
    NSString * date = self.date.text;
    
    NSString *rank = self.rank.text;
  
    NSString *nbPlayer = self.nbPlayer.text;
    
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
