#include "neorv32_iceduino.h"

//set segment port (0-7)
void iceduino_segdisp_set_char(char ch) {
  if ((ch < '0' || ch > '9') && (ch < 'a' || ch > 'f')) {
    return; // Character is not in the valid range ('0' to 'f')
  }
  
  switch (ch) {
    case '0': 
      ICEDUINO_SEGDISP = (uint8_t) 0x0; 
      break;
    case '1': 
      ICEDUINO_SEGDISP = (uint8_t) 0x1;
      break; 
    case '2': 
      ICEDUINO_SEGDISP = (uint8_t) 0x2;
      break; 
    case '3': 
      ICEDUINO_SEGDISP = (uint8_t) 0x3;
      break; 
    case '4': 
      ICEDUINO_SEGDISP = (uint8_t) 0x4;
      break; 
    case '5': 
      ICEDUINO_SEGDISP = (uint8_t) 0x5;
      break; 
    case '6': 
      ICEDUINO_SEGDISP = (uint8_t) 0x6;
      break; 
    case '7': 
      ICEDUINO_SEGDISP = (uint8_t) 0x7;
      break; 
    case '8': 
      ICEDUINO_SEGDISP = (uint8_t) 0x8;
      break; 
    case '9': 
      ICEDUINO_SEGDISP = (uint8_t) 0x9;
      break; 
    case 'a': 
      ICEDUINO_SEGDISP = (uint8_t) 0xa;
      break; 
    case 'b': 
      ICEDUINO_SEGDISP = (uint8_t) 0xb;
      break; 
    case 'c': 
      ICEDUINO_SEGDISP = (uint8_t) 0xc;
      break; 
    case 'd': 
      ICEDUINO_SEGDISP = (uint8_t) 0xd;
      break; 
    case 'e': 
      ICEDUINO_SEGDISP = (uint8_t) 0xe;
      break; 
    case 'f': 
      ICEDUINO_SEGDISP = (uint8_t) 0xf;
      break; 
  }
}

void iceduino_segdisp_set(int val) {
  if (val < 0 || val > 15) {
    return; 
  }
  ICEDUINO_SEGDISP = (uint8_t) val;
}

//clear output
void iceduino_segdisp_clr() {  
  ICEDUINO_SEGDISP = 0x00000000;
}

//set led pin 
void iceduino_segdisp_set_pin(int pin) {
  uint8_t mask = (uint8_t)(1 << (pin & 0x7));
  ICEDUINO_SEGDISP = ICEDUINO_SEGDISP | mask;
}

//clear led pin
void iceduino_segdisp_clr_pin(int pin) {
  uint8_t mask = (uint8_t)(1 << (pin & 0x7));
  ICEDUINO_SEGDISP = ICEDUINO_SEGDISP & ~mask;
}


