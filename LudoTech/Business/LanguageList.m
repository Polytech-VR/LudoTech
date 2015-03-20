//
//  Language.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "LanguageList.h"

// ===== DECLARATION =====

@implementation LanguageList

// ===== INSTANCE METHODS =====

-(void)addLanguage:(Language *)language
{
    [_list addObject:language];
}

-(void)removeLanguage:(Language *)language
{
    [_list removeObject:language];
}

@end
