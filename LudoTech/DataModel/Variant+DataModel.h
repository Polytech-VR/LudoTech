//
//  Variant+DataModel.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Variant.h"

// ===== DECLARATION =====

@interface Variant (DataModel)

// ===== METHODS =====

+(Variant *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context;

+(Variant *) getObjectWithName:(NSString *)name withDifficulty:(Difficulty *)difficultyGame withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context;

@end
