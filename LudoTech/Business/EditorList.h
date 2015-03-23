//
//  Editor.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Editor+DataModel.h"

// ===== DECLARATION =====

@interface EditorList : NSObject

// ===== PROPERTIES =====

@property (strong, nonatomic) NSMutableOrderedSet *list;

// ===== METHODS =====

- (void)addEditor:(Editor *)editor;
- (void)removeEditor:(Editor *)editor;

@end
