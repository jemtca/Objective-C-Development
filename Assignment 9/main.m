
#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "DoctorList.h"
#import "PatientList.h"
#import "PrescriptionList.h"

DoctorList *dl;
PatientList *pl;
PrescriptionList *prl;

void someDoctorAndSomePatients(){
    
    Doctor *d1 = [[Doctor alloc] initWithName:@"Doctor 1" andSpecialization:@"spine-related conditions"];
    Doctor *d2 = [[Doctor alloc] initWithName:@"Doctor 2" andSpecialization:@"Pediatrician"];
    Doctor *d3 = [[Doctor alloc] initWithName:@"Doctor 3" andSpecialization:@"Gynecologist/Oncologist"];
    Doctor *d4 = [[Doctor alloc] initWithName:@"Doctor 4" andSpecialization:@"Neuro"];
    
    Patient *p1 = [[Patient alloc] initWithName:@"Patient 1" andAge:[NSNumber numberWithInt:(88)] andHealthCard:YES];
    Patient *p2 = [[Patient alloc] initWithName:@"Patient 2" andAge:[NSNumber numberWithInt:(23)] andHealthCard:NO];
    Patient *p3 = [[Patient alloc] initWithName:@"Patient 3" andAge:[NSNumber numberWithInt:(33)] andHealthCard:YES];
    Patient *p4 = [[Patient alloc] initWithName:@"Patient 4" andAge:[NSNumber numberWithInt:(14)] andHealthCard:NO];
    
    [[pl patients]addObject:p1];
    [[pl patients]addObject:p2];
    [[pl patients]addObject:p3];
    [[pl patients]addObject:p4];
    
    [[dl doctors]addObject:d1];
    
    [[d2 patientsWithHCC]addObject:p3]; //doctor 2 has patient 3
    [[dl doctors]addObject:d2];
    
    [[d3 patientsWithHCC]addObject:p1]; //doctor 3 has patient 1
    [[dl doctors]addObject:d3];
    
    [[d4 patientsWithHCC]addObject:p1]; //doctor 4 has patient 1 and patient 3
    [[d4 patientsWithHCC]addObject:p3];
    [[dl doctors]addObject:d4];
    
    Prescription *pr1 = [[Prescription alloc]
                         initWithPrescription:@"Prescription 1"
                         andDoctor:d2 andPatient:p3];
    Prescription *pr2 = [[Prescription alloc]
                         initWithPrescription:@"Prescription 2"
                         andDoctor:d3 andPatient:p1];
    Prescription *pr3 = [[Prescription alloc]
                         initWithPrescription:@"Prescription 3"
                         andDoctor:d4 andPatient:p1];
    Prescription *pr4 = [[Prescription alloc]
                         initWithPrescription:@"Prescription 4"
                         andDoctor:d4 andPatient:p3];
    
    [[prl prescriptions]addObject:pr1];
    [[prl prescriptions]addObject:pr2];
    [[prl prescriptions]addObject:pr3];
    [[prl prescriptions]addObject:pr4];
    
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        NSString *input;
        NSString *name;
        
        dl = [DoctorList new];
        pl = [PatientList new];
        prl = [PrescriptionList new];
        
        someDoctorAndSomePatients();
        
        do{
           
            [InputCollector printToPrompt:@"1. List Doctors."];
            [InputCollector printToPrompt:@"2. List Patients."];
            [InputCollector printToPrompt:@"3. Doctor's patients with HCC."];
            [InputCollector printToPrompt:@"4. Patient's doctors."];
            [InputCollector printToPrompt:@"5. Patient's prescriptions."];
            [InputCollector printToPrompt:@"6. Visit doctor."];
            [InputCollector printToPrompt:@"7. Prescriptions."];
            [InputCollector printToPrompt:@"0. Exit."];
            [InputCollector printToPrompt:@""];
            input = [InputCollector inputForPrompt:@"Select an option: "];
            
            switch([input intValue]){
                    
                case 0:
                    
                        break;
                    
                case 1:
                    
                        [dl getDoctors];
                        break;
                    
                case 2:
                    
                        [pl getPatients];
                        break;
                    
                case 3:
                    
                        name = [InputCollector inputForPrompt:
                                @"\nType doctor's name: "];
                    
                        if([dl getDoctor:name] == nil){
                            
                            [InputCollector printToPrompt:@"\nThis doctor doesn't exist.\n"];
                        
                        }
                        else if([[[dl getDoctor:name] patientsWithHCC]count] == 0){
                        
                            [InputCollector printToPrompt:@"\nThis doctor doesn't have any patient.\n"];
                            
                        }else{
                            
                            [[dl getDoctor:name] getPatientsWithHCC];
                            
                        }
                    
                        break;
                
                case 4:
                    
                        name = [InputCollector inputForPrompt:
                            @"\nType patient's name: "];
                    
                        if([pl getPatient:name] == nil){
                            
                            [InputCollector printToPrompt:@"\nThis patient doesn't exist."];
                        
                        }
                        else if([[prl getDoctors:name] count] == 0){
                            
                            [InputCollector printToPrompt:@"\nThis patient doesn't have any doctor."];
                            
                        }
                        else{
                            
                            [InputCollector printToPrompt:@""];
                            
                            NSMutableArray *doctors = [prl getDoctors:name];
                            
                            [InputCollector printToPrompt:[NSString stringWithFormat:@"Patient \"%@\" has the following doctor/s:", name]];
                            
                            for(Doctor *d in doctors){
                                
                                [InputCollector printToPrompt:[d name]];
                                
                            }
                            
                            
                        }
                    
                        [InputCollector printToPrompt:@""];
                        break;
                
                case 5:
                    
                        name = [InputCollector inputForPrompt:
                                @"\nType patient's name: "];
                    
                        if([pl getPatient:name] == nil){
                            
                            [InputCollector printToPrompt:@"\nThis patient doesn't exist."];
                            
                        }
                        else if([[prl getDoctors:name] count] == 0){
                            
                            [InputCollector printToPrompt:@"\nThis patient doesn't have any presciption."];
                            
                        }
                        else{
                            
                            [InputCollector printToPrompt:@""];
                            
                            NSMutableArray *prescriptions = [prl getPresPrescription:name];
                            
                            [InputCollector printToPrompt:[NSString stringWithFormat:@"Patient \"%@\" has the following presciption/s:", name]];
                            
                            for(NSString *s in prescriptions){
                                
                                [InputCollector printToPrompt:s];
                                
                            }
                            
                        }
                    
                        [InputCollector printToPrompt:@""];
                        break;
                    
                case 6:
                    
                        name = [InputCollector inputForPrompt:
                            @"\nType patient's name: "];
                    
                    
                        if([pl getPatient:name] == nil){
                            
                            [InputCollector printToPrompt:@"\nThis patient doesn't exist."];
                            
                        }
                        else{
                            
                            NSString *doctor;
                            
                            doctor = [InputCollector inputForPrompt:
                                    @"Type doctor's name: "];
                            
                            if([dl getDoctor:doctor] == nil){
                                
                                [InputCollector printToPrompt:@"\nThis doctor doesn't exist."];

                                
                            }
                            else{
                                
                                if(![[dl getDoctor:doctor]patientWithHCC:[pl getPatient:name]]){
                                    
                                    [InputCollector printToPrompt:@"\nThis patient can't visit a doctor because he hasn't health card."];
                                    
                                }
                                else{
                                    
                                    [[pl getPatient:name]requestMedication​:[dl getDoctor:doctor]];
                                    
                                }
                                
                            }
                            
                        }
                    
                        [InputCollector printToPrompt:@""];
                        break;
                
                case 7:
                    
                    if(1){ //switch statement complains about prescriptions declaration, it solved when it is inside a block
                        
                        [InputCollector printToPrompt:@""];
                        
                        NSMutableArray *prescriptions = [prl getPresPrescriptions];
                        
                        [InputCollector printToPrompt:@"Prescriptions:"];
                        
                        for(NSString *s in prescriptions){
                            
                            [InputCollector printToPrompt:s];
                            
                        }
                    }
                    
                    [InputCollector printToPrompt:@""];
                    break;
                    
                default:
                    
                        [InputCollector printToPrompt:@"Wrong option, try it again."];
                        [InputCollector printToPrompt:@""];

            }
            
        }while(![input isEqualToString:@"0"]);
        
    }
    
    return 0;
    
}
