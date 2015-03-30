//
//  EditionTableViewCell.h
//  LudoTech
//
//  Created by remy on 30/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameEdition;
@property (weak, nonatomic) IBOutlet UILabel *languageEdition;
@property (weak, nonatomic) IBOutlet UILabel *yearEdition;
@property (weak, nonatomic) IBOutlet UILabel *themeEdition;
@property (weak, nonatomic) IBOutlet UILabel *editorEdition;
@end
