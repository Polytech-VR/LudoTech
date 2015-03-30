//
//  Game+DataModel.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Game+DataModel.h"

// ===== DEFINITION =====

@implementation Game (DataModel)

// ===== STATIC METHODS =====

+(Game *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Game *retValue = nil;
    
    // If no name given, method fails
    if (!name)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Game"];
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
                retValue = [[Game alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                }
            }
        }
    }
    
    return retValue;
}

+(Game *) getObjectWithName:(NSString *)name withType: (Type*)type withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Game *retValue = nil;
    
    // If no name given, method fails
    if (!name | !type)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Game"];
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
                retValue = [[Game alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                    retValue.type = type;
                }
            }
        }
    }
    return retValue;
}

@end

