//
//  AddGameViewController.h
//  LudoTech
//
//  Created by remy on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

// ===== DECLARATION =====

@interface AddGameViewController : UIViewController

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *name;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
