//
//  AddAuthorViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 23/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

// ===== DECLARATION =====

@interface AddAuthorViewController : UIViewController

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *nationality;

@property (strong, nonatomic) Edition *edition;

// ===== METHODS =====

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
