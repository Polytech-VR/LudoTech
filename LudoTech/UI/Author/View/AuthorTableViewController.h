//
//  AuthorTableViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 23/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Edition+DataModel.h"

// ===== DECLARATION =====

@interface AuthorTableViewController : UITableViewController

@property (strong, nonatomic) Edition *edition;

@end
