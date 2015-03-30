//
//  Person+DataModel.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Person.h"

// ===== DECLARATION =====

@interface Person (DataModel)

// ===== METHODS =====

+(Person *) getObjectWithFirstName:(NSString *)firstname withLastName:(NSString *)lastname withEntityDescription:(NSEntityDescription *)entityDescription inManagedObjectContext:(NSManagedObjectContext *)context;

@end
