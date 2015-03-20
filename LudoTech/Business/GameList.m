//
//  GameList.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "GameList.h"

// ===== DEFINITION =====

@implementation GameList

// ===== INSTANCE METHODS =====

-(void)addGame:(Game *)game
{
    [_list addObject:game];
}

-(void)removeGame:(Game *)game
{
    [_list removeObject:game];
}

@end
