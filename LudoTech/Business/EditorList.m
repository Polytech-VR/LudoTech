//
//  Editor.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "EditorList.h"

// ===== DECLARATION =====

@implementation EditorList

// ===== INSTANCE METHODS =====

-(void)addEditor:(Editor *)editor
{
    [_list addObject:editor];
}

-(void)removeEditor:(Editor *)editor
{
    [_list removeObject:editor];
}

@end
