//
//  TypeList.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type+DataModel.h"

// ===== DECLARATION =====

@interface TypeList : NSObject

// ===== PROPERTIES =====

@property (strong, nonatomic) NSMutableOrderedSet *list;

// ===== METHODS =====

- (void)addType:(Type *)type;
- (void)removeType:(Type *)type;

@end
