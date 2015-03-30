//
//  AddAuthorViewController.m
//  LudoTech
//
//  Created by Valentin Bercot on 23/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AppDelegate.h"
#import "AddAuthorViewController.h"
#import "Person+DataModel.h"

// ===== DEFINITION =====

@interface AddAuthorViewController ()

@property (weak, nonatomic) AppDelegate* appDelegate;

@end

@implementation AddAuthorViewController

// ===== INSTANCE METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // AppDelegate initialization
    self->_appDelegate = [[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Button

- (IBAction)save:(id)sender
{
    NSString *firstname = self.firstName.text;
    NSString *lastname = self.lastName.text;
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    
    [Person getObjectWithFirstName:firstname withLastName:lastname withEntityDescription:entityDescription inManagedObjectContext:context];
    
    [self->_appDelegate saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
