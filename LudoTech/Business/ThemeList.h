//
//  ThemeList.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Theme+DataModel.h"

// ===== DECLARATION =====

@interface ThemeList : NSObject

// ===== PROPERTIES =====

@property (strong, nonatomic) NSMutableOrderedSet *list;

// ===== METHODS =====

- (void)addTheme:(Theme *)theme;
- (void)removeTheme:(Theme *)theme;

@end
