//
//  GameList.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game+DataModel.h"

// ===== DECLARATION =====

@interface GameList : NSObject

// ===== PROPERTIES =====

@property (strong, nonatomic) NSMutableOrderedSet *list;

// ===== METHODS =====

- (void)addGame:(Game *)game;
- (void)removeGame:(Game *)game;

@end
