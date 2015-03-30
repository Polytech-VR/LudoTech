//
//  AddEditionViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Language+DataModel.h"
#import "Editor+DataModel.h"
#import "Theme+DataModel.h"

// ===== DECLARATION =====

@interface AddEditionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate>

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *language;
@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UITextField *editor;
@property (weak, nonatomic) IBOutlet UITextField *theme;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewLanguage;
@property (strong, nonatomic) Language *languageToChoose;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewEditor;
@property (strong, nonatomic) Editor *editorToChoose;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewTheme;
@property (strong, nonatomic) Theme *themeToChoose;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewYear;
@property (strong, nonatomic) NSMutableArray *yearList;
@property (strong, nonatomic) NSString *yearToChoose;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
