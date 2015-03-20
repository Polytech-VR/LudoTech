//
//  DifficultyList.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Difficulty+DataModel.h"

// ===== DEFINITION =====

@interface DifficultyList : NSObject

// ===== DECLARATION =====

@property (strong, nonatomic) NSMutableOrderedSet *list;

// ===== METHODS =====

- (void)addDifficulty:(Difficulty *)difficulty;
- (void)removeDifficulty:(Difficulty *)difficulty;

@end
