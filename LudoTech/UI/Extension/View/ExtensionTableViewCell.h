//
//  ExtensionTableViewCell.h
//  LudoTech
//
//  Created by remy on 30/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtensionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameExtension;
@property (weak, nonatomic) IBOutlet UILabel *difficultyExtension;
@property (weak, nonatomic) IBOutlet UILabel *isAlone;

@end
