//
//  AddGameViewController.m
//  LudoTech
//
//  Created by remy on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "AddGameViewController.h"

// ===== DEFINITION =====

@implementation AddGameViewController

// ===== INSTANCE METHODS =====

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *pickerBackViewEdition = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, 260)];
    UIToolbar *toolBarEdition = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *doneButtonEdition = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(closePickerEdition:)];
    [toolBarEdition setItems:[NSArray arrayWithObjects: doneButtonEdition, nil]];
    self.listEdition = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 216.0f)];
    self.listEdition.showsSelectionIndicator = YES;
    [pickerBackViewEdition addSubview:self.listEdition];
    [pickerBackViewEdition addSubview:toolBarEdition];
    self.type.inputView = pickerBackViewEdition;
    self.listEdition.delegate = self;
    self.listEdition.dataSource = self;
    
    /*NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    int i2  = [[formatter stringFromDate:[NSDate date]] intValue];
    
    self.yearList = [[NSMutableArray alloc] init];
    for (int i=i2; i>=1900; i--)
    {
        [self.yearList addObject:[NSString stringWithFormat:@"%d",i]];
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closePickerEdition:(id)sender
{
    self.type.text = self.edition;
    [self.type resignFirstResponder];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


/*-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.yearList count];
}

#pragma mark - Picker view delegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.yearList objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.edition = [self.yearList objectAtIndex:row];
}*/

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
    // TODO Save in database
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
