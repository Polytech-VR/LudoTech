//
//  Edition+DataModel.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Edition+DataModel.h"

// ===== DEFINITION =====

@implementation Edition (DataModel)

// ===== STATIC METHODS =====

+(Edition *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Edition *retValue = nil;
    
    // If no name given, method fails
    if (!name)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Edition"];
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
                retValue = [[Edition alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                }
            }
        }
    }
    
    return retValue;
}

+(Edition *) getObjectWithName:(NSString *)name withVariant:(Variant *)variant withEditor:(Editor *)editorEdition withLanguage: (Language *)languageEdition withTheme:(Theme *)themeEdition withYear:(NSString *)year withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context
{
    Edition *retValue = nil;
    
    // If no name given, method fails
    if (!name | !editorEdition | !languageEdition | !themeEdition | !year | !variant)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Edition"];
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
                retValue = [[Edition alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
                
                if (retValue)
                {
                    retValue.name = name;
                    retValue.editor = editorEdition;
                    retValue.language = languageEdition;
                    retValue.theme = themeEdition;
                    retValue.year = year;
                    retValue.variant = variant;
                }
            }
        }
    }
    return retValue;
}

@end
