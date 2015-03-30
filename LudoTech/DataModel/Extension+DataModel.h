//
//  Extension+DataModel.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Extension.h"

// ===== DECLARATION =====

@interface Extension (DataModel)

// ===== METHODS =====

+(Extension *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context;

+(Extension *) getObjectWithName:(NSString *)name withVariant:(Variant *)variant withDifficulty:(Difficulty *)difficultyExtension withIsAlone:(NSNumber *)playAlone withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context;

@end
