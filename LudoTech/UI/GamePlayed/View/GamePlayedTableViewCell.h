//
//  GamePlayedTableViewCell.h
//  LudoTech
//
//  Created by remy on 30/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamePlayedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property (weak, nonatomic) IBOutlet UILabel *date;
@end
