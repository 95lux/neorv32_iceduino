#include <neorv32_iceduino.h>

char chars[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

int main() {

    while (1) {
        for (int i = 0; i < 16; i++) {
            iceduino_segdisp_set_char(chars[i]);
            neorv32_cpu_delay_ms(2000);
        }
    }
    return 0;
}

