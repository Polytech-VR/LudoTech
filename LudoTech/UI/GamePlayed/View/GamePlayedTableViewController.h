//
//  GamePlayedTableViewController.h
//  LudoTech
//
//  Created by Valentin Bercot on 20/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Variant+DataModel.h"

@interface GamePlayedTableViewController : UITableViewController

@property (strong, nonatomic) Variant *variant;

@end
