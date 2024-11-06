#include <stdio.h>
#include <stdbool.h>
#include <neorv32_iceduino.h>

#include "gol.h"
#include "mmcp.h"

#define BAUD_RATE 19200

uint8_t uart_rx_buf[16];


int main() {

    iceduino_ws2812_init();
    neorv32_uart0_setup(BAUD_RATE, PARITY_NONE, FLOW_CONTROL_NONE);
    neorv32_uart1_setup(BAUD_RATE, PARITY_NONE, FLOW_CONTROL_NONE);
    
    // init currentGen
    currentGen[0][0] = 0;
    currentGen[0][1] = 1;
    currentGen[0][2] = 1;
    currentGen[0][3] = 0;
    currentGen[0][4] = 1;
    currentGen[0][5] = 1;
    currentGen[0][6] = 0;
    currentGen[0][7] = 1;

    currentGen[1][0] = 1;
    currentGen[1][1] = 0;
    currentGen[1][2] = 1;
    currentGen[1][3] = 0;
    currentGen[1][4] = 1;
    currentGen[1][5] = 0;
    currentGen[1][6] = 1;
    currentGen[1][7] = 0;

    currentGen[2][0] = 1;
    currentGen[2][1] = 1;
    currentGen[2][2] = 0;
    currentGen[2][3] = 0;
    currentGen[2][4] = 0;
    currentGen[2][5] = 1;
    currentGen[2][6] = 1;
    currentGen[2][7] = 1;

    currentGen[3][0] = 0;
    currentGen[3][1] = 0;
    currentGen[3][2] = 0;
    currentGen[3][3] = 0;
    currentGen[3][4] = 0;
    currentGen[3][5] = 0;
    currentGen[3][6] = 0;
    currentGen[3][7] = 0;

    currentGen[4][0] = 1;
    currentGen[4][1] = 1;
    currentGen[4][2] = 0;
    currentGen[4][3] = 0;
    currentGen[4][4] = 0;
    currentGen[4][5] = 1;
    currentGen[4][6] = 1;
    currentGen[4][7] = 1;

    currentGen[5][0] = 1;
    currentGen[5][1] = 0;
    currentGen[5][2] = 1;
    currentGen[5][3] = 0;
    currentGen[5][4] = 1;
    currentGen[5][5] = 0;
    currentGen[5][6] = 1;
    currentGen[5][7] = 0;

    currentGen[6][0] = 0;
    currentGen[6][1] = 1;
    currentGen[6][2] = 1;
    currentGen[6][3] = 0;
    currentGen[6][4] = 1;
    currentGen[6][5] = 1;
    currentGen[6][6] = 0;
    currentGen[6][7] = 1;

    currentGen[7][0] = 1;
    currentGen[7][1] = 0;
    currentGen[7][2] = 1;
    currentGen[7][3] = 0;
    currentGen[7][4] = 1;
    currentGen[7][5] = 0;
    currentGen[7][6] = 1;
    currentGen[7][7] = 0;

    // set some default init colors
    aliveColor.red = 0;
    aliveColor.green = 100;
    aliveColor.blue = 0;
    
    deadColor.red = 100;
    deadColor.green = 0;
    deadColor.blue = 0;

    uint8_t rx_status = 0;
    char rx_byte;

    while(1){
        for (int x = 0; x < L1_PDU_SIZE; x++){
            rx_status = 0;
            // use nonblocking uart read, to get allow geting pin states for gen flag in parallel
            while(!rx_status){
                rx_status = neorv32_uart0_getc_safe(&rx_byte);
                rx_status |= neorv32_uart1_getc_safe(&rx_byte);

                uart_rx_buf[x] = (uint8_t) rx_byte;

                // generate next generation via pin
                if(iceduino_pmod2_get(0)) updateGenFlag = 1;
        
                // generate next generation locally via button 0
                if (iceduino_button_get(0)){
                    displayCurrentGen();
                    updateGenLocally();
                    neorv32_cpu_delay_ms(300);
                }
            }
        }

        L1_receive(uart_rx_buf);

        // update Generation
        if (updateGenFlag){
            updateGeneration();
            displayCurrentGen();
            updateGenFlag = false;
        }
    }
    return 0;
}