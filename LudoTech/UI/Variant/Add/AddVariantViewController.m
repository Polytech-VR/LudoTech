//
//  AddVariantViewController.m
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AppDelegate.h"
#import "AddVariantViewController.h"
#import "Variant+DataModel.h"

// ===== DEFINITION =====

@interface AddVariantViewController ()

// ===== PROPERTIES =====

@property (weak, nonatomic) AppDelegate* appDelegate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *selectedFactions; // to handle selected items

@end

@implementation AddVariantViewController

// ===== INSTANCE METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Creation of the pickerViewDifficulty like a keyboard
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    UIView *viewDifficulty = [[UIView alloc] initWithFrame:CGRectMake(0, 200, screenSize.width, 260)];
    UIToolbar *toolBarDifficulty = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
    UIBarButtonItem *doneButtonDifficulty = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerViewDifficulty:)];
    [toolBarDifficulty setItems:[NSArray arrayWithObjects: doneButtonDifficulty, nil]];
    self.pickerViewDifficulty = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, screenSize.width, 216.0f)];
    self.pickerViewDifficulty.showsSelectionIndicator = YES;
    [viewDifficulty addSubview:self.pickerViewDifficulty];
    [viewDifficulty addSubview:toolBarDifficulty];
    self.difficulty.inputView = viewDifficulty;
    self.pickerViewDifficulty.delegate = self;
    self.pickerViewDifficulty.dataSource = self;
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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Difficulty"];
    
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

-(void)closePickerViewDifficulty:(id)sender
{
    self.difficulty.text = self.difficultyToChoose.name;
    [self.difficulty resignFirstResponder];
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
    
    Difficulty *difficulty = [[self.fetchedResultsController fetchedObjects] objectAtIndex:row];
    return difficulty.name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.difficultyToChoose = [[self.fetchedResultsController fetchedObjects] objectAtIndex:row];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (textField == self.name)
    {
        [self.difficulty becomeFirstResponder];
    }
    
    return YES;
}

#pragma mark - Button

- (IBAction)save:(id)sender
{
    // TODO Save in database
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
