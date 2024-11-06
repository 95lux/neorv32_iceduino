#include <neorv32_iceduino.h>

int main() {
    uint8_t red;
    uint8_t green;
    uint8_t blue;

    iceduino_ws2812_init();
    iceduino_ws2812_set(0, 0, 0 ,50);
    for(int i = 0; i < 64; i++){
        red = i*2;
        
        iceduino_ws2812_set(i, i*2, i*-2 ,i*4);
    }
    return 0;
}

