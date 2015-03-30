//
//  AddGameViewController.m
//  LudoTech
//
//  Created by remy on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AppDelegate.h"
#import "AddGameViewController.h"
#import "Game+DataModel.h"

// ===== DEFINITION =====

@interface AddGameViewController () 

// ===== PROPERTIES =====

@property (weak, nonatomic) AppDelegate* appDelegate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *selectedFactions; // to handle selected items

@end

@implementation AddGameViewController

// ===== INSTANCE METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Creation of the pickerViewType like a keyboard
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    UIView *viewType = [[UIView alloc] initWithFrame:CGRectMake(0, 200, screenSize.width, 260)];
    UIToolbar *toolBarType = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
    UIBarButtonItem *doneButtonType = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerViewType:)];
    [toolBarType setItems:[NSArray arrayWithObjects: doneButtonType, nil]];
    self.pickerViewType = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, screenSize.width, 216.0f)];
    self.pickerViewType.showsSelectionIndicator = YES;
    [viewType addSubview:self.pickerViewType];
    [viewType addSubview:toolBarType];
    self.type.inputView = viewType;
    self.pickerViewType.delegate = self;
    self.pickerViewType.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    // AppDelegate initialization
    self->_appDelegate = [[UIApplication sharedApplication] delegate];
    
    // fetchedResultController initialization
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Type"];
    
    // Configure the request's entity, and optionally its predicate.
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]
                                     initWithFetchRequest:fetchRequest
                                     managedObjectContext:self.appDelegate.managedObjectContext
                                     sectionNameKeyPath:nil
                                     cacheName:nil];
    
    // Configure Fetched Results Controller
    [self.fetchedResultsController setDelegate:self];
    NSError *error;
    [self.fetchedResultsController performFetch:&error];
    if (error)
    {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
}

-(void)closePickerViewType:(id)sender
{
    self.type.text = self.typeToChoose.name;
    [self.type resignFirstResponder];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self.fetchedResultsController fetchedObjects] count];
}

#pragma mark - Picker view delegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    Type *type = [[self.fetchedResultsController fetchedObjects] objectAtIndex:row];
    return type.name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.typeToChoose = [[self.fetchedResultsController fetchedObjects] objectAtIndex:row];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (textField == self.name)
    {
        [self.type becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - Button

- (IBAction)save:(id)sender
{
    
    NSString *nameType = self.type.text;
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Type" inManagedObjectContext:context];
    
    Type *typeGame = [Type getObjectWithName:nameType withEntityDescription:entityDescription inManagedObjectContext:context];
    
    NSString *nameGame = self.name.text;
    
    NSEntityDescription *entityDescriptionGame = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:context];
    
    [Game getObjectWithName:nameGame withType:typeGame withEntityDescription:entityDescriptionGame inManagedObjectContext:context];

    [self->_appDelegate saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
