//
//  Person+DataModel.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Person+DataModel.h"

// ===== DEFINITION =====

@implementation Person (DataModel)

// ===== STATIC METHODS =====

+(Person *) getObjectWithFirstName:(NSString *)firstname withLastName:(NSString *)lastname withNationality:(NSString *)nationality withEntityDescription:(NSEntityDescription *)entityDescription inManagedObjectContext:(NSManagedObjectContext *)context
{
    Person *retValue = nil;
    
    // If no name given, method fails
    if (!firstname & !lastname& !nationality)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat: @"%K == %@", @"firstName", firstname]];
        
        // Execute Fetch Request
        NSError *fetchError = nil;
        NSArray *result = [context executeFetchRequest:fetchRequest error:&fetchError];
        
        if (!fetchError)
        {
            if ([result count] > 0)
            {
                retValue = result[0];
            }
            
            else
            {
                retValue = [[Person alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.firstName = firstname;
                    retValue.lastName = lastname;
                    retValue.nationality = nationality;
                }
            }
        }
    }
    
    return retValue;
}

@end
