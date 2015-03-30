//
//  AddGamePlayedViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 20/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

// ===== DECLARATION =====

@interface AddGamePlayedViewController : UIViewController

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextField *nbPlayer;
@property (weak, nonatomic) IBOutlet UITextField *rank;

@property (strong, nonatomic) IBOutlet UIDatePicker *pickerViewDate;
@property (strong, nonatomic) NSDate *dateToChoose;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
