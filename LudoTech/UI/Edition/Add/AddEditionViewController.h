//
//  AddEditionViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 18/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

// ===== DECLARATION =====

@interface AddEditionViewController : UIViewController

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *year;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
