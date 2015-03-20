//
//  Language.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Language+DataModel.h"

// ===== DEFINITION =====

@interface LanguageList : NSObject

// ===== DECLARATION =====

@property (strong, nonatomic) NSMutableOrderedSet *list;

// ===== METHODS =====

- (void)addLanguage:(Language *)language;
- (void)removeLanguage:(Language *)language;

@end
