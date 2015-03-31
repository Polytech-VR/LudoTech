//
//  Extension+DataModel.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Extension+DataModel.h"

// ===== DEFINITION =====

@implementation Extension (DataModel)

// ===== STATIC METHODS =====

+(Extension *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Extension *retValue = nil;
    
    // If no name given, method fails
    if (!name)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Extension"];
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
                retValue = [[Extension alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                }
            }
        }
    }
    
    return retValue;
}

+(Extension *) getObjectWithName:(NSString *)name withVariant:(Variant *)variant withDifficulty:(Difficulty *)difficultyExtension withIsAlone:(NSNumber *)playAlone withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Extension *retValue = nil;
    
    // If no name given, method fails
    if (!name | !difficultyExtension | !playAlone | !variant)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Extension"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat: @"(%K == %@) AND (%K == %@)", @"name", name,@"variant", variant]];
        
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
                retValue = [[Extension alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                    retValue.difficulty = difficultyExtension;
                    retValue.playAlone = playAlone;
                    retValue.variant = variant;
                    retValue.game = variant.game;
                }
            }
        }
    }
    return retValue;
}

@end
