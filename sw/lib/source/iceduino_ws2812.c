#include "neorv32_iceduino.h"

#define NUM_ADDRESSES 64 // 4 Byte per address

// will only be used within the driver file
static volatile uint32_t* addresses[NUM_ADDRESSES];

#define WORD_SIZE 4 // Assuming a 32-bit word size

void iceduino_ws2812_init() {
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
        addresses[i] = (volatile uint32_t*)(ICEDUINO_WS2812_BASE + (i * WORD_SIZE));
        *addresses[i] = 0; // Optionally initialize to 0 or some default value
    }
}


//set one led
void iceduino_ws2812_set(uint8_t led_index, uint8_t r, uint8_t g, uint8_t b) {
    if (led_index >= NUM_ADDRESSES){
        return;
    }
  *addresses[led_index] =  ((b << 16) | (r << 8)| g ); 
}

//clear output
void iceduino_ws2812_clr(uint8_t led_index) {  
  *addresses[led_index] = 0x00000000;
}