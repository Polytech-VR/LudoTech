//
//  Variant+DataModel.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Variant+DataModel.h"

// ===== DEFINITION =====

@implementation Variant (DataModel)

// ===== STATIC METHODS =====

+(Variant *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Variant *retValue = nil;
    
    // If no name given, method fails
    if (!name)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Variant"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat: @"%K == %@", @"name", name]];
        
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
                retValue = [[Variant alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                }
            }
        }
    }
    
    return retValue;
}

+(Variant *) getObjectWithName:(NSString *)name withGame:(Game *)game withDifficulty: (Difficulty*)difficulty withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Variant *retValue = nil;
    
    // If no name given, method fails
    if (!name | !difficulty)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Variant"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat: @"%K == %@", @"name", name]];

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
                retValue = [[Variant alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                    retValue.difficulty = difficulty;
                    retValue.game = game;
                }
            }
        }
    }
    return retValue;
}

@end
