//
//  GameTableViewCell.h
//  LudoTech
//
//  Created by remy on 14/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

// ===== DECLARATION =====

@interface GameTableViewCell : UITableViewCell

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UILabel *nameGame;
@property (weak, nonatomic) IBOutlet UILabel *type;

@end
