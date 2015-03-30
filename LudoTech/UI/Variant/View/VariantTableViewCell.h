//
//  VariantTableViewCell.h
//  LudoTech
//
//  Created by remy on 25/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

// ===== DEFINITION =====

@interface VariantTableViewCell : UITableViewCell

// ===== PROPERTIES =====

@property (weak, nonatomic) IBOutlet UILabel *nameVariant;
@property (weak, nonatomic) IBOutlet UILabel *difficulty;

@end
