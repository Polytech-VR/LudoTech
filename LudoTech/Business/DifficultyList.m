//
//  DifficultyList.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "DifficultyList.h"

// ===== DECLARATION =====

@implementation DifficultyList

// ===== INSTANCE METHODS =====

-(void)addDifficulty:(Difficulty *)difficulty
{
    [_list addObject:difficulty];
}

-(void)removeDifficulty:(Difficulty *)difficulty
{
    [_list removeObject:difficulty];
}

@end
