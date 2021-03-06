//
//  AddThemeViewController.m
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AppDelegate.h"
#import "AddThemeViewController.h"
#import "Theme+DataModel.h"

// ===== DEFINITION =====
@interface AddThemeViewController ()

// ===== PROPERTIES =====

@property (weak, nonatomic) AppDelegate* appDelegate;

@end

@implementation AddThemeViewController

// ===== INSTANCE METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // appDelegate initialization
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
    NSString *nameTheme = self.name.text;
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Theme" inManagedObjectContext:context];
    
    [Theme getObjectWithName:nameTheme withEntityDescription:entityDescription inManagedObjectContext:context];
    
    [self->_appDelegate saveContext];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
