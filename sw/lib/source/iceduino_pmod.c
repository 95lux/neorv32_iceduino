#include <stdbool.h>
#include "neorv32_iceduino.h"


//pmod2
void iceduino_pmod2_set(uint8_t pin){
    uint8_t mask = (uint8_t)(1 << (pin & 0x7));
    ICEDUINO_PMOD2_OUTPUT = ICEDUINO_PMOD2_OUTPUT | mask;
}

bool iceduino_pmod2_get(uint8_t pin){
    uint8_t mask = (uint8_t)(1 << (pin & 0x7));
    return ICEDUINO_PMOD2_INPUT & mask; 
}

void iceduino_pmod2_clr(){
    ICEDUINO_PMOD2_OUTPUT = 0;
}