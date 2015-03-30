//
//  AddEditionViewController.m
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AppDelegate.h"
#import "AddEditionViewController.h"
#import "Edition+DataModel.h"

// ===== DEFINITION =====

@interface AddEditionViewController ()

// ===== PROPERTIES =====

@property (weak, nonatomic) AppDelegate* appDelegate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsControllerLanguage;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsControllerEditor;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsControllerTheme;
@property (strong, nonatomic) NSIndexPath *selectedFactions; // to handle selected items

@end

@implementation AddEditionViewController

// ===== INSTANCE METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Creation of the pickerViewLanguage like a keyboard
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    UIView *viewLanguage = [[UIView alloc] initWithFrame:CGRectMake(0, 200, screenSize.width, 260)];
    UIToolbar *toolBarLanguage = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
    UIBarButtonItem *doneButtonLanguage = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerViewLanguage:)];
    [toolBarLanguage setItems:[NSArray arrayWithObjects: doneButtonLanguage, nil]];
    self.pickerViewLanguage = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, screenSize.width, 216.0f)];
    self.pickerViewLanguage.showsSelectionIndicator = YES;
    [viewLanguage addSubview:self.pickerViewLanguage];
    [viewLanguage addSubview:toolBarLanguage];
    self.language.inputView = viewLanguage;
    self.pickerViewLanguage.delegate = self;
    self.pickerViewLanguage.dataSource = self;
    
    // Creation of the pickerViewEditor like a keyboard
    UIView *viewEditor = [[UIView alloc] initWithFrame:CGRectMake(0, 200, screenSize.width, 260)];
    UIToolbar *toolBarEditor = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
    UIBarButtonItem *doneButtonEditor = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerViewEditor:)];
    [toolBarEditor setItems:[NSArray arrayWithObjects: doneButtonEditor, nil]];
    self.pickerViewEditor = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, screenSize.width, 216.0f)];
    self.pickerViewEditor.showsSelectionIndicator = YES;
    [viewEditor addSubview:self.pickerViewEditor];
    [viewEditor addSubview:toolBarEditor];
    self.editor.inputView = viewEditor;
    self.pickerViewEditor.delegate = self;
    self.pickerViewEditor.dataSource = self;
    
    // Creation of the pickerViewTheme like a keyboard
    UIView *viewTheme = [[UIView alloc] initWithFrame:CGRectMake(0, 200, screenSize.width, 260)];
    UIToolbar *toolBarTheme = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
    UIBarButtonItem *doneButtonTheme = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerViewTheme:)];
    [toolBarTheme setItems:[NSArray arrayWithObjects: doneButtonTheme, nil]];
    self.pickerViewTheme = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, screenSize.width, 216.0f)];
    self.pickerViewTheme.showsSelectionIndicator = YES;
    [viewTheme addSubview:self.pickerViewTheme];
    [viewTheme addSubview:toolBarTheme];
    self.theme.inputView = viewTheme;
    self.pickerViewTheme.delegate = self;
    self.pickerViewTheme.dataSource = self;
    
    // Creation of the pickerViewYear like a keyboard
    UIView *viewYear = [[UIView alloc] initWithFrame:CGRectMake(0, 200, screenSize.width, 260)];
    UIToolbar *toolBarYear = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
    UIBarButtonItem *doneButtonYear = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerViewYear:)];
    [toolBarYear setItems:[NSArray arrayWithObjects: doneButtonYear, nil]];
    self.pickerViewYear = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, screenSize.width, 216.0f)];
    self.pickerViewYear.showsSelectionIndicator = YES;
    [viewYear addSubview:self.pickerViewYear];
    [viewYear addSubview:toolBarYear];
    self.year.inputView = viewYear;
    self.pickerViewYear.delegate = self;
    self.pickerViewYear.dataSource = self;
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    int today = [[formatter stringFromDate:[NSDate date]] intValue];
    
    self.yearList = [[NSMutableArray alloc] init];
    for (int ind = today; ind >= 1800; ind--)
    {
        [self.yearList addObject:[NSString stringWithFormat:@"%d", ind]];
    }
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
    
    // fetchedResultControllerLanguage initialization
    NSFetchRequest *fetchRequestLanguage = [[NSFetchRequest alloc] initWithEntityName:@"Language"];
    
    // Configure the request's entity, and optionally its predicate.
    [fetchRequestLanguage setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    
    self.fetchedResultsControllerLanguage = [[NSFetchedResultsController alloc]
                                     initWithFetchRequest:fetchRequestLanguage
                                     managedObjectContext:self.appDelegate.managedObjectContext
                                     sectionNameKeyPath:nil
                                     cacheName:nil];
    
    // Configure Fetched Results Controller
    [self.fetchedResultsControllerLanguage setDelegate:self];
    NSError *errorLanguage;
    [self.fetchedResultsControllerLanguage performFetch:&errorLanguage];
    if (errorLanguage)
    {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", errorLanguage, errorLanguage.localizedDescription);
    }
    
    // fetchedResultControllerEditor initialization
    NSFetchRequest *fetchRequestEditor = [[NSFetchRequest alloc] initWithEntityName:@"Editor"];
    
    // Configure the request's entity, and optionally its predicate.
    [fetchRequestEditor setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    
    self.fetchedResultsControllerEditor = [[NSFetchedResultsController alloc]
                                             initWithFetchRequest:fetchRequestEditor
                                             managedObjectContext:self.appDelegate.managedObjectContext
                                             sectionNameKeyPath:nil
                                             cacheName:nil];
    
    // Configure Fetched Results Controller
    [self.fetchedResultsControllerEditor setDelegate:self];
    NSError *errorEditor;
    [self.fetchedResultsControllerEditor performFetch:&errorEditor];
    if (errorEditor)
    {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", errorEditor, errorEditor.localizedDescription);
    }
    
    // fetchedResultControllerTheme initialization
    NSFetchRequest *fetchRequestTheme = [[NSFetchRequest alloc] initWithEntityName:@"Theme"];
    
    // Configure the request's entity, and optionally its predicate.
    [fetchRequestTheme setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    
    self.fetchedResultsControllerTheme = [[NSFetchedResultsController alloc]
                                           initWithFetchRequest:fetchRequestTheme
                                           managedObjectContext:self.appDelegate.managedObjectContext
                                           sectionNameKeyPath:nil
                                           cacheName:nil];
    
    // Configure Fetched Results Controller
    [self.fetchedResultsControllerTheme setDelegate:self];
    NSError *errorTheme;
    [self.fetchedResultsControllerTheme performFetch:&errorTheme];
    if (errorTheme)
    {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", errorTheme, errorTheme.localizedDescription);
    }
}

-(void)closePickerViewLanguage:(id)sender
{
    self.language.text = self.languageToChoose.name;
    [self.language resignFirstResponder];
}

-(void)closePickerViewEditor:(id)sender
{
    self.editor.text = self.editorToChoose.name;
    [self.editor resignFirstResponder];
}

-(void)closePickerViewTheme:(id)sender
{
    self.theme.text = self.themeToChoose.name;
    [self.theme resignFirstResponder];
}

-(void)closePickerViewYear:(id)sender
{
    self.year.text = self.yearToChoose;
    [self.year resignFirstResponder];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger integerToReturn;
    
    if (pickerView == self.pickerViewLanguage)
    {
        integerToReturn = [[self.fetchedResultsControllerLanguage fetchedObjects] count];
    }
    else if (pickerView == self.pickerViewYear)
    {
        integerToReturn = [self.yearList count];
    }
    else if (pickerView == self.pickerViewEditor)
    {
        integerToReturn = [[self.fetchedResultsControllerEditor fetchedObjects] count];
    }
    else if (pickerView == self.pickerViewTheme)
    {
        integerToReturn = [[self.fetchedResultsControllerTheme fetchedObjects] count];
    }
    
    return integerToReturn;
}

#pragma mark - Picker view delegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *stringToReturn;
    
    if (pickerView == self.pickerViewLanguage)
    {
        Language *language = [[self.fetchedResultsControllerLanguage fetchedObjects] objectAtIndex:row];
        stringToReturn = language.name;
    }
    else if (pickerView == self.pickerViewYear)
    {
        stringToReturn = [self.yearList objectAtIndex:row];
    }
    else if (pickerView == self.pickerViewEditor)
    {
        Editor *editor = [[self.fetchedResultsControllerEditor fetchedObjects] objectAtIndex:row];
        stringToReturn = editor.name;
    }
    else if (pickerView == self.pickerViewTheme)
    {
        Theme *theme = [[self.fetchedResultsControllerTheme fetchedObjects] objectAtIndex:row];
        stringToReturn = theme.name;
    }
    
    return stringToReturn;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == self.pickerViewLanguage)
    {
        self.languageToChoose = [[self.fetchedResultsControllerLanguage fetchedObjects] objectAtIndex:row];
    }
    else if (pickerView == self.pickerViewYear)
    {
        self.yearToChoose = [self.yearList objectAtIndex:row];
    }
    else if (pickerView == self.pickerViewEditor)
    {
        self.editorToChoose = [[self.fetchedResultsControllerEditor fetchedObjects] objectAtIndex:row];
    }
    else if (pickerView == self.pickerViewTheme)
    {
        self.themeToChoose = [[self.fetchedResultsControllerTheme fetchedObjects] objectAtIndex:row];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (textField == self.name)
    {
        [self.language becomeFirstResponder];
    }
    else if (textField == self.language)
    {
        [self.year becomeFirstResponder];
    }
    else if (textField == self.year)
    {
        [self.editor becomeFirstResponder];
    }
    else if (textField == self.editor)
    {
        [self.theme becomeFirstResponder];
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
