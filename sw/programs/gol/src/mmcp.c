#include <stdlib.h>

#include <neorv32_iceduino.h>

#include "mmcp.h"
#include "gol.h"

#define MY_ADDRESS 0x1

bool L1_received = false;

uint8_t rx_buf[L1_PDU_SIZE];
uint8_t tx_buf[L1_PDU_SIZE];

bool updateGenFlag = false;

// sends the tx buffer via both uarts
void send_uart_buf(uint8_t* buf, uint8_t num_bytes){
    for(int i = 0; i < num_bytes; i++){
        neorv32_uart0_putc(buf[i]);
        neorv32_uart1_putc(buf[i]);
    }
}

crc crcSlow(uint8_t const message[], int nBytes) {
    crc remainder = 0;
    for (int byte = 0; byte < nBytes; ++byte) {
        remainder ^= (message[byte] << (WIDTH - 8));
        for (uint8_t bit = 8; bit > 0; --bit) {
            if (remainder & TOPBIT) {
                remainder = (remainder << 1) ^ POLYNOMIAL;
            } else {
                remainder = (remainder << 1);
            }
        }
    }
    return (remainder);
}

void L1_receive(uint8_t L1_PDU[]) {
    // copy all elements except first and last (L1_PCI) from L1_PDU
    uint8_t L1_SDU[L1_SDU_SIZE];
    for (int i = (L1_PCI_SIZE / 2); i < L1_PDU_SIZE - 1; i++) {
        L1_SDU[i - (L1_PCI_SIZE / 2)] = L1_PDU[i];
    }

    L2_receive(L1_SDU);
}

void L2_receive(uint8_t L2_PDU[]) {
    // extract L2_SDU from L2_PDU
    uint8_t L2_SDU[L2_SDU_SIZE];
    for (int i = 0; i < L2_SDU_SIZE; i++) { // copy all but last bit from L2_PDU to L2_SDU
        L2_SDU[i] = L2_PDU[i];
    }
    uint8_t crc = crcSlow(L2_SDU, L2_SDU_SIZE);

    if (crc == L2_PDU[L2_PDU_SIZE - 1]) {
        L3_receive(L2_SDU);
    }
}

void L3_receive(uint8_t L3_PDU[]) {
    uint8_t L3_SDU[L3_SDU_SIZE];
    for (int i = L3_PCI_SIZE; i < L3_PDU_SIZE; i++) {
        L3_SDU[i - L3_PCI_SIZE] = L3_PDU[i];
    }
    uint8_t to = L3_PDU[0];
    uint8_t from = L3_PDU[1];
    uint8_t vers = L3_PDU[2];
    uint8_t hops = L3_PDU[3];

    // error handling
    if (to < 0) { // faulty address
        return;
    }

    if (vers != MMCP_VERSION) { // wrong version
        return;
        // packet gets omitted
    }
    // use cases
    // packet is addressed at myself or is broadcast message
    if ((to == MY_ADDRESS && from == 0) || (to == 0 && from == 0)) {
        L7_receive(L3_SDU);
    } else if (to != MY_ADDRESS) { // packet is addressed at master or another participant
        hops++;
        L3_PDU[3] = hops;
        L2_send(L3_PDU);
        // packet is addressed to master
        // message gets transmitted
    }
}

void L7_receive(uint8_t L7_PDU[]) {
    uint8_t L7_SDU[L7_SDU_SIZE];
    uint8_t ap_nr = L7_PDU[0];
    // copy bytes 1-9 from L7_PDU
    for (int i = 1; i < L7_PDU_SIZE; i++) {
        L7_SDU[i - 1] = L7_PDU[i];
    }
    switch (ap_nr) {
    case 1:
        // set/init currentGen 
        for(int n = 0; n < 64; n++){
            uint8_t x = n % GRIDSIZE;
            uint8_t y = n / GRIDSIZE;
            currentGen[x][y] = (L7_SDU[ (GRIDSIZE - 1) - y] >> x) & 0b1;
        }
        break;
    case 2:
        // calculate next Generation
        updateGenFlag = true;
        break;
    case 3:
        // send current Generation to Master
        // set L7_SDU to all 0s
        for(int i = 0; i < GRIDSIZE; i++){
            L7_SDU[i] = 0b0;
        }

        // fill up L7_SDU
        for(int n = 0; n < 64; n++){
            uint8_t x = n % GRIDSIZE;
            uint8_t y = n / GRIDSIZE;
            L7_SDU[ (GRIDSIZE - 1) - y] |= ((currentGen[x][y] & 0b1) << x);
        }
        break;
    case 4:
    // set color dead
        deadColor.red = L7_SDU[0];
        deadColor.green = L7_SDU[1];
        deadColor.blue = L7_SDU[2];
        break;
    // set color alive
    case 5:
        aliveColor.red = L7_SDU[0];
        aliveColor.green = L7_SDU[1];
        aliveColor.blue = L7_SDU[2];
        break;
    // set border fields
    case 6:
        for(int n = 0; n < BORDERFIELDS_LENGTH; n++){
            // count bytes in reverse, hence the subtraction
            uint8_t byte =  n / GRIDSIZE;
            uint8_t shift = n % GRIDSIZE;

            borderFields[n] = (L7_SDU[(GRIDSIZE - 1) - byte] >> shift) & 0b1;
        }
        break;
    }
    // send back packet
    L7_send(ap_nr, L7_SDU);
}

void L7_send(uint8_t Id, uint8_t L7_SDU[]) {
    uint8_t L7_PDU[L7_PDU_SIZE];
    L7_PDU[0] = Id;
    for (int i = 0; i < L7_SDU_SIZE; i++) {
        L7_PDU[i + L7_PCI_SIZE] = L7_SDU[i];
    }
    L3_send(L7_PDU);
}

void L3_send(uint8_t L3_SDU[]) {
    uint8_t L3_PDU[L3_PDU_SIZE];
    L3_PDU[0] = 0;              // To: master address
    L3_PDU[1] = MY_ADDRESS;        // From: my Address
    L3_PDU[2] = MMCP_VERSION;   // Vers: version 5
    L3_PDU[3] = 0;              // Hop: Hopcounter initialized to 0

    for (int i = 0; i < L3_SDU_SIZE; i++) {
        L3_PDU[i + L3_PCI_SIZE] = L3_SDU[i];
    }

    L2_send(L3_PDU);
}

void L2_send(uint8_t L2_SDU[]) {
    uint8_t L2_PDU[L2_PDU_SIZE];
    for (int i = 0; i < L2_SDU_SIZE; i++) {
        L2_PDU[i] = L2_SDU[i];
    }
    L2_PDU[L2_PDU_SIZE - 1] = (uint8_t)crcSlow(L2_SDU, L2_SDU_SIZE); // write crc check to last element (L2-PCI)
    L1_send(L2_PDU);
}

void L1_send(uint8_t L1_SDU[]) {
    uint8_t L1_PDU[L1_PDU_SIZE];

    for (int i = 0; i < L1_SDU_SIZE; i++) {
        L1_PDU[i + 1] = L1_SDU[i];
    }
    L1_PDU[0] = 0;               // SOF
    L1_PDU[L1_PDU_SIZE - 1] = 0; // EOF

    for (int i = 0; i < L1_PDU_SIZE; i++) {
        tx_buf[i] = L1_PDU[i];
    }

    send_uart_buf(tx_buf, L1_PDU_SIZE);
}
