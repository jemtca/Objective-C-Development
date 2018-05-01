
#import <Foundation/Foundation.h>

char inputChars[255];

int clean_stdin(){
    
    while (getchar() != '\n');
    
    return 1;
    
}

void uppercase(){
    
    NSString *inputString;
    
    printf("Input: ");
    fgets(inputChars, 255, stdin);
    
    inputString = [NSString stringWithUTF8String:inputChars];
    
    inputString = inputString.uppercaseString;
    
    printf("Output: %s", [inputString UTF8String]);
    
}

void lowercase(){
    
    NSString *inputString;
    
    printf("Input: ");
    fgets(inputChars, 255, stdin);
    
    inputString = [NSString stringWithUTF8String:inputChars];
    
    inputString = inputString.lowercaseString;
    
    printf("Output: %s", [inputString UTF8String]);
    
}

void numberize(){
    
    NSString *inputString;
    NSInteger x;
    
    printf("Input (only numbers): ");
    fgets(inputChars, 255, stdin);
    
    inputString = [NSString stringWithUTF8String:inputChars];
    
    x = inputString.integerValue; //ask Rodrigo: white spaces?
    
    if(!x){
        
        printf("Conversion was not successful.\n");
        
    }
    else{
        
        printf("Output: %ld\n", x);
        
    }
    
}

void canadianize(){
    
    NSMutableString *inputString = [[NSMutableString alloc]init];
    //NSString * inputString;
    NSString *canada = @", eh?";
    
    NSRange range;
    
    printf("Input: ");
    //scanf("%s", inputChars);
    fgets(inputChars, 255, stdin);
    
    inputString = [NSMutableString stringWithUTF8String:inputChars];
    //inputString = [NSString stringWithUTF8String:inputChars];
    
    range.location = inputString.length - 1;
    range.length = 1;

    [inputString deleteCharactersInRange:range];
    //inputString = [inputString stringByTrimmingCharactersInSet:NSCharacterSet.newlineCharacterSet];
    
    [inputString appendString:canada];
    //inputString = [inputString stringByAppendingString:canada];
    
    printf("Output: %s\n", [inputString UTF8String]);
    
}

void respond(){
    
    NSMutableString *inputString = [[NSMutableString alloc]init];
    char c;
    
    printf("Input: ");
    fgets(inputChars, 255, stdin);
    
    inputString = [NSMutableString stringWithUTF8String:inputChars];
    
    c = [inputString characterAtIndex:[inputString length] - 2]; //[inputString length] - 1 == '\n'
    
    if(c == '?'){
        
        printf("I don't know.\n");
        
    }
    else if(c == '!'){
        
        printf("Whoa, calm down!\n");
        
    }
    else{
        
        printf("Your input last character is neither '?' nor '!'.\n");
        
    }
    
}

void replaceSpaceForHyphen(){
    
    NSString *inputString;
    
    printf("Input: ");
    fgets(inputChars, 255, stdin);
    
    inputString = [NSString stringWithUTF8String:inputChars];
    
    inputString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    
    printf("Output: %s", [inputString UTF8String]);
    
}

void test(){
    
    NSString *test;
    NSMutableString *test2 = [[NSMutableString alloc]init];
    
    test = @"Immutable string.";
    [test2 appendString:@"Mutable string."];
    
    //first @: literal string, second @: object
    NSLog(@"%@", test);
    printf("%s\n" ,[test UTF8String]);
    NSLog(@"%@" ,test2);
    printf("%s\n" ,[test2 UTF8String]);
    
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        int input;
        char c;
        int temp;
        
        do{
            
            printf("\n1 - Uppercase.");
            printf("\n2 - Lowercase.");
            printf("\n3 - Numberize.");
            printf("\n4 - Canadianize.");
            printf("\n5 - Respond.");
            printf("\n6 - De-Space-It.");
            printf("\n\n0 - Exit.");
            printf("\n\nSelect an option: ");
            temp = scanf("%d%c", &input, &c);
            
            switch(input){
                    
                case 0:
                    
                    break;
                    
                case 1:
                    
                    uppercase();
                    break;
                    
                case 2:
                    
                    lowercase();
                    break;
                    
                case 3:
                    
                    numberize();
                    break;
                    
                case 4:
                    
                    canadianize();
                    break;
                    
                case 5:
                    
                    respond();
                    break;
                    
                case 6:
                    
                    replaceSpaceForHyphen();
                    break;
                    
            }
            
        }while(((temp != 2 || c != '\n') && clean_stdin()) || input != 0);
        
    }
    
    return 0;
}
