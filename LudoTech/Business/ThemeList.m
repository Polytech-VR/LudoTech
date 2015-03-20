//
//  ThemeList.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "ThemeList.h"

// ===== DECLARATION =====

@implementation ThemeList

// ===== INSTANCE METHODS =====

-(void)addTheme:(Theme *)theme
{
    [_list addObject:theme];
}

-(void)removeTheme:(Theme *)theme
{
    [_list removeObject:theme];
}

@end