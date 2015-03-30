//
//  AddGameViewController.h
//  LudoTech
//
//  Created by remy on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Type+DataModel.h"

// ===== DECLARATION =====

@interface AddGameViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate>

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *type;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewType;
@property (strong, nonatomic) Type *typeToChoose;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
