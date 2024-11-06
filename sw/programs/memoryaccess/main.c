#include <neorv32_iceduino.h>

#define COUNT_VALUES 120

uint8_t Values[COUNT_VALUES];
uint32_t* value_ad1, *value_ad2, *value_ad3;
uint32_t value1, value2, value3;

int main() {
    // Loop to initialize Values array
    for(uint8_t count = 0; count < COUNT_VALUES; count++) {
        Values[count] = count;
    }
    
    value_ad1 = (uint32_t*)(&(Values[0]));
    value_ad2 = (uint32_t*)(&(Values[8+2]));
    value_ad3 = (uint32_t*)(&(Values[12+1]));
    value1 = *(value_ad1);
    value2 = *(value_ad2);
    value3 = *(value_ad3);
    
    while(1) {
        // Infinite loop
    }
    
    return 0;
}

