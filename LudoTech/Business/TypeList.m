//
//  TypeList.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "TypeList.h"

// ===== DEFINITION =====

@implementation TypeList

// ===== INSTANCE METHODS =====

-(void)addType:(Type *)type
{
    [_list addObject:type];
}

-(void)removeType:(Type *)type
{
    [_list removeObject:type];
}

@end
