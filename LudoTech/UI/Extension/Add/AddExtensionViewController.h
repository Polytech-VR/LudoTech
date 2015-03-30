//
//  AddExtensionViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Difficulty+DataModel.h"
#import "Variant.h"

// ===== DECLARATION =====

@interface AddExtensionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate>


// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *difficulty;
@property (weak, nonatomic) IBOutlet UISwitch *isAlone;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewDifficulty;
@property (strong, nonatomic) Difficulty *difficultyToChoose;

@property (strong, nonatomic) Variant *variant;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
