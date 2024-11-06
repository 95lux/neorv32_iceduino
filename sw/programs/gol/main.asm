
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
       4:	80000117          	auipc	sp,0x80000
       8:	7f810113          	add	sp,sp,2040 # 800007fc <__crt0_stack_begin>
       c:	80000197          	auipc	gp,0x80000
      10:	7f418193          	add	gp,gp,2036 # 80000800 <__global_pointer$>

00000014 <__crt0_cpu_csr_init>:
      14:	00000517          	auipc	a0,0x0
      18:	0cc50513          	add	a0,a0,204 # e0 <__crt0_dummy_trap_handler>
      1c:	30551073          	.insn	4, 0x30551073
      20:	34151073          	.insn	4, 0x34151073
      24:	30001073          	.insn	4, 0x30001073
      28:	30401073          	.insn	4, 0x30401073
      2c:	30601073          	.insn	4, 0x30601073
      30:	ffa00593          	li	a1,-6
      34:	32059073          	.insn	4, 0x32059073
      38:	b0001073          	.insn	4, 0xb0001073
      3c:	b8001073          	.insn	4, 0xb8001073
      40:	b0201073          	.insn	4, 0xb0201073
      44:	b8201073          	.insn	4, 0xb8201073

00000048 <__crt0_reg_file_clear>:
      48:	00000093          	li	ra,0
      4c:	00000213          	li	tp,0
      50:	00000293          	li	t0,0
      54:	00000313          	li	t1,0
      58:	00000393          	li	t2,0
      5c:	00000713          	li	a4,0
      60:	00000793          	li	a5,0

00000064 <__crt0_reset_io>:
      64:	00000417          	auipc	s0,0x0
      68:	d9c40413          	add	s0,s0,-612 # fffffe00 <__ctr0_io_space_begin>
      6c:	00000497          	auipc	s1,0x0
      70:	f9448493          	add	s1,s1,-108 # 0 <_start>

00000074 <__crt0_reset_io_loop>:
      74:	00042023          	sw	zero,0(s0)
      78:	00440413          	add	s0,s0,4
      7c:	fe941ce3          	bne	s0,s1,74 <__crt0_reset_io_loop>

00000080 <__crt0_clear_bss>:
      80:	86c18593          	add	a1,gp,-1940 # 8000006c <generation>
      84:	a3c18613          	add	a2,gp,-1476 # 8000023c <__BSS_END__>

00000088 <__crt0_clear_bss_loop>:
      88:	00c5d863          	bge	a1,a2,98 <__crt0_clear_bss_loop_end>
      8c:	00058023          	sb	zero,0(a1)
      90:	00158593          	add	a1,a1,1
      94:	ff5ff06f          	j	88 <__crt0_clear_bss_loop>

00000098 <__crt0_clear_bss_loop_end>:
      98:	00001597          	auipc	a1,0x1
      9c:	fdc58593          	add	a1,a1,-36 # 1074 <__crt0_copy_data_src_begin>
      a0:	80000617          	auipc	a2,0x80000
      a4:	f6060613          	add	a2,a2,-160 # 80000000 <newBorderFieldsGen2>
      a8:	86c18693          	add	a3,gp,-1940 # 8000006c <generation>

000000ac <__crt0_copy_data_loop>:
      ac:	00d65c63          	bge	a2,a3,c4 <__crt0_copy_data_loop_end>
      b0:	00058703          	lb	a4,0(a1)
      b4:	00e60023          	sb	a4,0(a2)
      b8:	00158593          	add	a1,a1,1
      bc:	00160613          	add	a2,a2,1
      c0:	fedff06f          	j	ac <__crt0_copy_data_loop>

000000c4 <__crt0_copy_data_loop_end>:
      c4:	00000513          	li	a0,0
      c8:	00000593          	li	a1,0
      cc:	060000ef          	jal	12c <main>

000000d0 <__crt0_main_aftermath>:
      d0:	34051073          	.insn	4, 0x34051073

000000d4 <__crt0_main_aftermath_end>:
      d4:	30047073          	.insn	4, 0x30047073

000000d8 <__crt0_main_aftermath_end_loop>:
      d8:	10500073          	wfi
      dc:	ffdff06f          	j	d8 <__crt0_main_aftermath_end_loop>

000000e0 <__crt0_dummy_trap_handler>:
      e0:	ff810113          	add	sp,sp,-8
      e4:	00812023          	sw	s0,0(sp)
      e8:	00912223          	sw	s1,4(sp)
      ec:	34202473          	.insn	4, 0x34202473
      f0:	02044663          	bltz	s0,11c <__crt0_dummy_trap_handler_irq>
      f4:	34102473          	.insn	4, 0x34102473

000000f8 <__crt0_dummy_trap_handler_exc_c_check>:
      f8:	00041483          	lh	s1,0(s0)
      fc:	0034f493          	and	s1,s1,3
     100:	00240413          	add	s0,s0,2
     104:	34141073          	.insn	4, 0x34141073
     108:	00300413          	li	s0,3
     10c:	00941863          	bne	s0,s1,11c <__crt0_dummy_trap_handler_irq>

00000110 <__crt0_dummy_trap_handler_exc_uncrompressed>:
     110:	34102473          	.insn	4, 0x34102473
     114:	00240413          	add	s0,s0,2
     118:	34141073          	.insn	4, 0x34141073

0000011c <__crt0_dummy_trap_handler_irq>:
     11c:	00012403          	lw	s0,0(sp)
     120:	00412483          	lw	s1,4(sp)
     124:	00810113          	add	sp,sp,8
     128:	30200073          	mret

0000012c <main>:
#define BAUD_RATE 19200

uint8_t uart_rx_buf[16];


int main() {
     12c:	fd010113          	add	sp,sp,-48
     130:	02112623          	sw	ra,44(sp)
     134:	03212023          	sw	s2,32(sp)
     138:	01312e23          	sw	s3,28(sp)
     13c:	01412c23          	sw	s4,24(sp)
     140:	01512a23          	sw	s5,20(sp)
     144:	02812423          	sw	s0,40(sp)
     148:	02912223          	sw	s1,36(sp)
     14c:	01612823          	sw	s6,16(sp)

    iceduino_ws2812_init();
     150:	22c000ef          	jal	37c <iceduino_ws2812_init>
    neorv32_uart0_setup(BAUD_RATE, PARITY_NONE, FLOW_CONTROL_NONE);
     154:	00005537          	lui	a0,0x5
     158:	00000613          	li	a2,0
     15c:	00000593          	li	a1,0
     160:	b0050513          	add	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3a8c>
     164:	219000ef          	jal	b7c <neorv32_uart0_setup>
    neorv32_uart1_setup(BAUD_RATE, PARITY_NONE, FLOW_CONTROL_NONE);
     168:	00005537          	lui	a0,0x5
     16c:	00000613          	li	a2,0
     170:	00000593          	li	a1,0
     174:	b0050513          	add	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3a8c>
     178:	2f1000ef          	jal	c68 <neorv32_uart1_setup>
    
    // init currentGen
    currentGen[0][0] = 0;
     17c:	9dc18793          	add	a5,gp,-1572 # 800001dc <currentGen>
    currentGen[0][1] = 1;
     180:	00100713          	li	a4,1
     184:	00e780a3          	sb	a4,1(a5)
    currentGen[0][2] = 1;
     188:	00e78123          	sb	a4,2(a5)
    currentGen[0][3] = 0;
    currentGen[0][4] = 1;
     18c:	00e78223          	sb	a4,4(a5)
    currentGen[0][5] = 1;
     190:	00e782a3          	sb	a4,5(a5)
    currentGen[0][6] = 0;
    currentGen[0][7] = 1;
     194:	00e783a3          	sb	a4,7(a5)

    currentGen[1][0] = 1;
     198:	00e78423          	sb	a4,8(a5)
    currentGen[1][1] = 0;
    currentGen[1][2] = 1;
     19c:	00e78523          	sb	a4,10(a5)
    currentGen[1][3] = 0;
    currentGen[1][4] = 1;
     1a0:	00e78623          	sb	a4,12(a5)
    currentGen[1][5] = 0;
    currentGen[1][6] = 1;
     1a4:	00e78723          	sb	a4,14(a5)
    currentGen[1][7] = 0;

    currentGen[2][0] = 1;
     1a8:	00e78823          	sb	a4,16(a5)
    currentGen[2][1] = 1;
     1ac:	00e788a3          	sb	a4,17(a5)
    currentGen[2][2] = 0;
    currentGen[2][3] = 0;
    currentGen[2][4] = 0;
    currentGen[2][5] = 1;
     1b0:	00e78aa3          	sb	a4,21(a5)
    currentGen[2][6] = 1;
     1b4:	00e78b23          	sb	a4,22(a5)
    currentGen[2][7] = 1;
     1b8:	00e78ba3          	sb	a4,23(a5)
    currentGen[0][0] = 0;
     1bc:	00078023          	sb	zero,0(a5)
    currentGen[0][3] = 0;
     1c0:	000781a3          	sb	zero,3(a5)
    currentGen[0][6] = 0;
     1c4:	00078323          	sb	zero,6(a5)
    currentGen[1][1] = 0;
     1c8:	000784a3          	sb	zero,9(a5)
    currentGen[1][3] = 0;
     1cc:	000785a3          	sb	zero,11(a5)
    currentGen[1][5] = 0;
     1d0:	000786a3          	sb	zero,13(a5)
    currentGen[1][7] = 0;
     1d4:	000787a3          	sb	zero,15(a5)
    currentGen[2][2] = 0;
     1d8:	00078923          	sb	zero,18(a5)
    currentGen[2][3] = 0;
     1dc:	000789a3          	sb	zero,19(a5)
    currentGen[2][4] = 0;
     1e0:	00078a23          	sb	zero,20(a5)

    currentGen[3][0] = 0;
     1e4:	00078c23          	sb	zero,24(a5)
    currentGen[3][1] = 0;
     1e8:	00078ca3          	sb	zero,25(a5)
    currentGen[3][2] = 0;
     1ec:	00078d23          	sb	zero,26(a5)
    currentGen[3][3] = 0;
     1f0:	00078da3          	sb	zero,27(a5)
    currentGen[3][4] = 0;
     1f4:	00078e23          	sb	zero,28(a5)
    currentGen[3][5] = 0;
     1f8:	00078ea3          	sb	zero,29(a5)
    currentGen[3][6] = 0;
     1fc:	00078f23          	sb	zero,30(a5)
    currentGen[3][7] = 0;
     200:	00078fa3          	sb	zero,31(a5)

    currentGen[4][0] = 1;
     204:	02e78023          	sb	a4,32(a5)
    currentGen[4][1] = 1;
     208:	02e780a3          	sb	a4,33(a5)
    currentGen[4][2] = 0;
    currentGen[4][3] = 0;
    currentGen[4][4] = 0;
    currentGen[4][5] = 1;
     20c:	02e782a3          	sb	a4,37(a5)
    currentGen[4][6] = 1;
     210:	02e78323          	sb	a4,38(a5)
    currentGen[4][7] = 1;
     214:	02e783a3          	sb	a4,39(a5)

    currentGen[5][0] = 1;
     218:	02e78423          	sb	a4,40(a5)
    currentGen[5][1] = 0;
    currentGen[5][2] = 1;
     21c:	02e78523          	sb	a4,42(a5)
    currentGen[5][3] = 0;
    currentGen[5][4] = 1;
     220:	02e78623          	sb	a4,44(a5)
    currentGen[5][5] = 0;
    currentGen[5][6] = 1;
     224:	02e78723          	sb	a4,46(a5)
    currentGen[5][7] = 0;

    currentGen[6][0] = 0;
    currentGen[6][1] = 1;
     228:	02e788a3          	sb	a4,49(a5)
    currentGen[6][2] = 1;
     22c:	02e78923          	sb	a4,50(a5)
    currentGen[6][3] = 0;
    currentGen[6][4] = 1;
     230:	02e78a23          	sb	a4,52(a5)
    currentGen[6][5] = 1;
     234:	02e78aa3          	sb	a4,53(a5)
    currentGen[6][6] = 0;
    currentGen[6][7] = 1;
     238:	02e78ba3          	sb	a4,55(a5)

    currentGen[7][0] = 1;
     23c:	02e78c23          	sb	a4,56(a5)
    currentGen[7][1] = 0;
    currentGen[7][2] = 1;
     240:	02e78d23          	sb	a4,58(a5)
    currentGen[7][3] = 0;
    currentGen[7][4] = 1;
     244:	02e78e23          	sb	a4,60(a5)
    currentGen[7][5] = 0;
    currentGen[7][6] = 1;
     248:	02e78f23          	sb	a4,62(a5)
    currentGen[4][2] = 0;
     24c:	02078123          	sb	zero,34(a5)
    currentGen[4][3] = 0;
     250:	020781a3          	sb	zero,35(a5)
    currentGen[4][4] = 0;
     254:	02078223          	sb	zero,36(a5)
    currentGen[5][1] = 0;
     258:	020784a3          	sb	zero,41(a5)
    currentGen[5][3] = 0;
     25c:	020785a3          	sb	zero,43(a5)
    currentGen[5][5] = 0;
     260:	020786a3          	sb	zero,45(a5)
    currentGen[5][7] = 0;
     264:	020787a3          	sb	zero,47(a5)
    currentGen[6][0] = 0;
     268:	02078823          	sb	zero,48(a5)
    currentGen[6][3] = 0;
     26c:	020789a3          	sb	zero,51(a5)
    currentGen[6][6] = 0;
     270:	02078b23          	sb	zero,54(a5)
    currentGen[7][1] = 0;
     274:	02078ca3          	sb	zero,57(a5)
    currentGen[7][3] = 0;
     278:	02078da3          	sb	zero,59(a5)
    currentGen[7][5] = 0;
     27c:	02078ea3          	sb	zero,61(a5)
    currentGen[7][7] = 0;
     280:	02078fa3          	sb	zero,63(a5)

    // set some default init colors
    aliveColor.red = 0;
     284:	86018a23          	sb	zero,-1932(gp) # 80000074 <aliveColor>
    aliveColor.green = 100;
     288:	06400713          	li	a4,100
     28c:	87418793          	add	a5,gp,-1932 # 80000074 <aliveColor>
     290:	00e780a3          	sb	a4,1(a5)
    aliveColor.blue = 0;
     294:	00078123          	sb	zero,2(a5)
    
    deadColor.red = 100;
     298:	86e18823          	sb	a4,-1936(gp) # 80000070 <deadColor>
    deadColor.green = 0;
     29c:	87018793          	add	a5,gp,-1936 # 80000070 <deadColor>
     2a0:	000780a3          	sb	zero,1(a5)
    deadColor.blue = 0;
     2a4:	00078123          	sb	zero,2(a5)
            // use nonblocking uart read, to get allow geting pin states for gen flag in parallel
            while(!rx_status){
                rx_status = neorv32_uart0_getc_safe(&rx_byte);
                rx_status |= neorv32_uart1_getc_safe(&rx_byte);

                uart_rx_buf[x] = (uint8_t) rx_byte;
     2a8:	a1c18a13          	add	s4,gp,-1508 # 8000021c <uart_rx_buf>

                // generate next generation via pin
                if(iceduino_pmod2_get(0)) updateGenFlag = 1;
     2ac:	00100a93          	li	s5,1
        for (int x = 0; x < L1_PDU_SIZE; x++){
     2b0:	00000493          	li	s1,0
                uart_rx_buf[x] = (uint8_t) rx_byte;
     2b4:	01448b33          	add	s6,s1,s4
                rx_status = neorv32_uart0_getc_safe(&rx_byte);
     2b8:	00f10513          	add	a0,sp,15
     2bc:	161000ef          	jal	c1c <neorv32_uart0_getc_safe>
     2c0:	00050413          	mv	s0,a0
                rx_status |= neorv32_uart1_getc_safe(&rx_byte);
     2c4:	00f10513          	add	a0,sp,15
     2c8:	241000ef          	jal	d08 <neorv32_uart1_getc_safe>
                uart_rx_buf[x] = (uint8_t) rx_byte;
     2cc:	00f14783          	lbu	a5,15(sp)
                rx_status |= neorv32_uart1_getc_safe(&rx_byte);
     2d0:	00856533          	or	a0,a0,s0
     2d4:	01851413          	sll	s0,a0,0x18
                uart_rx_buf[x] = (uint8_t) rx_byte;
     2d8:	00fb0023          	sb	a5,0(s6)
                if(iceduino_pmod2_get(0)) updateGenFlag = 1;
     2dc:	00000513          	li	a0,0
                rx_status |= neorv32_uart1_getc_safe(&rx_byte);
     2e0:	41845413          	sra	s0,s0,0x18
                if(iceduino_pmod2_get(0)) updateGenFlag = 1;
     2e4:	074000ef          	jal	358 <iceduino_pmod2_get>
     2e8:	00050463          	beqz	a0,2f0 <main+0x1c4>
     2ec:	87518ba3          	sb	s5,-1929(gp) # 80000077 <updateGenFlag>
        
                // generate next generation locally via button 0
                if (iceduino_button_get(0)){
     2f0:	00000513          	li	a0,0
     2f4:	048000ef          	jal	33c <iceduino_button_get>
     2f8:	00050a63          	beqz	a0,30c <main+0x1e0>
                    displayCurrentGen();
     2fc:	378000ef          	jal	674 <displayCurrentGen>
                    updateGenLocally();
     300:	30c000ef          	jal	60c <updateGenLocally>
                    neorv32_cpu_delay_ms(300);
     304:	12c00513          	li	a0,300
     308:	00d000ef          	jal	b14 <neorv32_cpu_delay_ms>
            while(!rx_status){
     30c:	fa0406e3          	beqz	s0,2b8 <main+0x18c>
        for (int x = 0; x < L1_PDU_SIZE; x++){
     310:	00148493          	add	s1,s1,1
     314:	01000793          	li	a5,16
     318:	f8f49ee3          	bne	s1,a5,2b4 <main+0x188>
                }
            }
        }

        L1_receive(uart_rx_buf);
     31c:	a1c18513          	add	a0,gp,-1508 # 8000021c <uart_rx_buf>
     320:	7c8000ef          	jal	ae8 <L1_receive>

        // update Generation
        if (updateGenFlag){
     324:	8771c783          	lbu	a5,-1929(gp) # 80000077 <updateGenFlag>
     328:	f80784e3          	beqz	a5,2b0 <main+0x184>
            updateGeneration();
     32c:	0b4000ef          	jal	3e0 <updateGeneration>
            displayCurrentGen();
     330:	344000ef          	jal	674 <displayCurrentGen>
            updateGenFlag = false;
     334:	86018ba3          	sb	zero,-1929(gp) # 80000077 <updateGenFlag>
     338:	f79ff06f          	j	2b0 <main+0x184>

0000033c <iceduino_button_get>:
#include "neorv32_iceduino.h"

uint8_t iceduino_button_get(int number) {
    uint8_t mask = (uint8_t)(1 << (number & 0xf));
    return ICEDUINO_BUTTON & mask;  
     33c:	f00007b7          	lui	a5,0xf0000
     340:	0107c683          	lbu	a3,16(a5) # f0000010 <__global_pointer$+0x6ffff810>
    uint8_t mask = (uint8_t)(1 << (number & 0xf));
     344:	00f57713          	and	a4,a0,15
     348:	00100793          	li	a5,1
     34c:	00e797b3          	sll	a5,a5,a4
}
     350:	00f6f533          	and	a0,a3,a5
     354:	00008067          	ret

00000358 <iceduino_pmod2_get>:
    ICEDUINO_PMOD2_OUTPUT = ICEDUINO_PMOD2_OUTPUT | mask;
}

bool iceduino_pmod2_get(uint8_t pin){
    uint8_t mask = (uint8_t)(1 << (pin & 0x7));
    return ICEDUINO_PMOD2_INPUT & mask; 
     358:	f00007b7          	lui	a5,0xf0000
     35c:	03078793          	add	a5,a5,48 # f0000030 <__global_pointer$+0x6ffff830>
     360:	0007c783          	lbu	a5,0(a5)
    uint8_t mask = (uint8_t)(1 << (pin & 0x7));
     364:	00757513          	and	a0,a0,7
     368:	00100713          	li	a4,1
     36c:	00a71733          	sll	a4,a4,a0
    return ICEDUINO_PMOD2_INPUT & mask; 
     370:	00e7f533          	and	a0,a5,a4
}
     374:	00a03533          	snez	a0,a0
     378:	00008067          	ret

0000037c <iceduino_ws2812_init>:
static volatile uint32_t* addresses[NUM_ADDRESSES];

#define WORD_SIZE 4 // Assuming a 32-bit word size

void iceduino_ws2812_init() {
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
     37c:	80000737          	lui	a4,0x80000
void iceduino_ws2812_init() {
     380:	f00007b7          	lui	a5,0xf0000
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
     384:	f00006b7          	lui	a3,0xf0000
     388:	07870713          	add	a4,a4,120 # 80000078 <addresses>
void iceduino_ws2812_init() {
     38c:	10078793          	add	a5,a5,256 # f0000100 <__global_pointer$+0x6ffff900>
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
     390:	20068693          	add	a3,a3,512 # f0000200 <__global_pointer$+0x6ffffa00>
        addresses[i] = (volatile uint32_t*)(ICEDUINO_WS2812_BASE + (i * WORD_SIZE));
     394:	00f72023          	sw	a5,0(a4)
        *addresses[i] = 0; // Optionally initialize to 0 or some default value
     398:	0007a023          	sw	zero,0(a5)
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
     39c:	00478793          	add	a5,a5,4
     3a0:	00470713          	add	a4,a4,4
     3a4:	fed798e3          	bne	a5,a3,394 <iceduino_ws2812_init+0x18>
    }
}
     3a8:	00008067          	ret

000003ac <iceduino_ws2812_set>:


//set one led
void iceduino_ws2812_set(uint8_t led_index, uint8_t r, uint8_t g, uint8_t b) {
    if (led_index >= NUM_ADDRESSES){
     3ac:	03f00793          	li	a5,63
     3b0:	02a7e663          	bltu	a5,a0,3dc <iceduino_ws2812_set+0x30>
        return;
    }
  *addresses[led_index] =  ((b << 16) | (r << 8)| g ); 
     3b4:	800007b7          	lui	a5,0x80000
     3b8:	00251513          	sll	a0,a0,0x2
     3bc:	07878793          	add	a5,a5,120 # 80000078 <addresses>
     3c0:	00a787b3          	add	a5,a5,a0
     3c4:	0007a783          	lw	a5,0(a5)
     3c8:	00859593          	sll	a1,a1,0x8
     3cc:	00c5e633          	or	a2,a1,a2
     3d0:	01069693          	sll	a3,a3,0x10
     3d4:	00d66633          	or	a2,a2,a3
     3d8:	00c7a023          	sw	a2,0(a5)
}
     3dc:	00008067          	ret

000003e0 <updateGeneration>:
RGBColor deadColor;

uint8_t generation = 0;

// updates next generation based on the current generation and its neighbours
void updateGeneration() {
     3e0:	fe010113          	add	sp,sp,-32
     3e4:	00112e23          	sw	ra,28(sp)
     3e8:	00812c23          	sw	s0,24(sp)
     3ec:	01212823          	sw	s2,16(sp)
     3f0:	01312623          	sw	s3,12(sp)
     3f4:	01412423          	sw	s4,8(sp)
     3f8:	00912a23          	sw	s1,20(sp)
     3fc:	01512223          	sw	s5,4(sp)
    uint8_t liveNeighbours;

    for (uint8_t x = 0; x < GRIDSIZE; x++) {
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
            liveNeighbours = 0;
     400:	00000e13          	li	t3,0
     404:	0ff00a13          	li	s4,255
            
            // Check all 8 neighbors of the main field
            for (int8_t i = -1; i <= 1; i++) {
     408:	fff00413          	li	s0,-1
                    
                    int8_t nx = (int8_t) x + i;
                    int8_t ny = (int8_t) y + j;
                    
                    // Check if neighbour is within bounds
                    if (nx >= 0 && nx < GRIDSIZE && ny >= 0 && ny < GRIDSIZE) {
     40c:	00700393          	li	t2,7
     410:	97818813          	add	a6,gp,-1672 # 80000178 <borderFields>
                        // whole top border 
                        if (ny == -1 && nx >= -1 && nx <= GRIDSIZE) {
                            liveNeighbours += borderFields[nx + 1];
                        }
                        // bottom corner without bottom right corner and bottom left corner
                        if (ny == GRIDSIZE && nx >= 0 && nx <= GRIDSIZE - 1) {
     414:	00800f93          	li	t6,8
                        if (nx == -1 && ny >= 0 && ny <= GRIDSIZE) {
     418:	0ff00913          	li	s2,255
                        if(currentGen[nx][ny]){
     41c:	9dc18093          	add	ra,gp,-1572 # 800001dc <currentGen>
            // Apply the rules of Game of Life
            if (currentGen[x][y]) { // The cell is alive
                if (liveNeighbours < 2 || liveNeighbours > 3) {
                    nextGen[x][y] = false; // Dies
                } else {
                    nextGen[x][y] = true; // Lives on
     420:	99c18993          	add	s3,gp,-1636 # 8000019c <nextGen>
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
     424:	fffe0293          	add	t0,t3,-1
     428:	003e1f13          	sll	t5,t3,0x3
            liveNeighbours = 0;
     42c:	0ff00613          	li	a2,255
     430:	0ff2f293          	zext.b	t0,t0
                            liveNeighbours += borderFields[36 - ny - 1];
     434:	02300493          	li	s1,35
     438:	1140006f          	j	54c <updateGeneration+0x16c>
                    if (i == 0 && j == 0) {
     43c:	0068eeb3          	or	t4,a7,t1
     440:	020e8a63          	beqz	t4,474 <updateGeneration+0x94>
                    if (nx >= 0 && nx < GRIDSIZE && ny >= 0 && ny < GRIDSIZE) {
     444:	06e3ea63          	bltu	t2,a4,4b8 <updateGeneration+0xd8>
     448:	01869e93          	sll	t4,a3,0x18
     44c:	418ede93          	sra	t4,t4,0x18
     450:	0a8e8a63          	beq	t4,s0,504 <updateGeneration+0x124>
     454:	09fe8263          	beq	t4,t6,4d8 <updateGeneration+0xf8>
                        if(currentGen[nx][ny]){
     458:	00371e93          	sll	t4,a4,0x3
     45c:	01d08eb3          	add	t4,ra,t4
     460:	00de8eb3          	add	t4,t4,a3
     464:	000ece83          	lbu	t4,0(t4)
     468:	000e8663          	beqz	t4,474 <updateGeneration+0x94>
                            liveNeighbours ++;
     46c:	00178793          	add	a5,a5,1
                            liveNeighbours += borderFields[27 - (nx + 1)];
     470:	0ff7f793          	zext.b	a5,a5
                for (int8_t j = -1; j <= 1; j++) {
     474:	00130313          	add	t1,t1,1
     478:	0ff37e93          	zext.b	t4,t1
     47c:	00168693          	add	a3,a3,1
     480:	01831313          	sll	t1,t1,0x18
     484:	41835313          	sra	t1,t1,0x18
     488:	0ff6f693          	zext.b	a3,a3
     48c:	fb5e98e3          	bne	t4,s5,43c <updateGeneration+0x5c>
            for (int8_t i = -1; i <= 1; i++) {
     490:	00188893          	add	a7,a7,1
     494:	0ff8f693          	zext.b	a3,a7
     498:	00170713          	add	a4,a4,1
     49c:	01889893          	sll	a7,a7,0x18
     4a0:	4188d893          	sra	a7,a7,0x18
     4a4:	0ff77713          	zext.b	a4,a4
     4a8:	07568c63          	beq	a3,s5,520 <updateGeneration+0x140>
void updateGeneration() {
     4ac:	00060693          	mv	a3,a2
                for (int8_t j = -1; j <= 1; j++) {
     4b0:	fff00313          	li	t1,-1
     4b4:	f89ff06f          	j	43c <updateGeneration+0x5c>
                        if (nx == -1 && ny >= 0 && ny <= GRIDSIZE) {
     4b8:	03471e63          	bne	a4,s4,4f4 <updateGeneration+0x114>
     4bc:	04e68463          	beq	a3,a4,504 <updateGeneration+0x124>
                            liveNeighbours += borderFields[36 - ny - 1];
     4c0:	40d48eb3          	sub	t4,s1,a3
     4c4:	01d80eb3          	add	t4,a6,t4
     4c8:	000ece83          	lbu	t4,0(t4)
                            liveNeighbours += borderFields[ny + 10 ];
     4cc:	01d787b3          	add	a5,a5,t4
     4d0:	0ff7f793          	zext.b	a5,a5
                        if (ny == GRIDSIZE && nx >= 0 && nx <= GRIDSIZE - 1) {
     4d4:	fbf690e3          	bne	a3,t6,474 <updateGeneration+0x94>
     4d8:	01871e93          	sll	t4,a4,0x18
     4dc:	418ede93          	sra	t4,t4,0x18
     4e0:	f88e8ae3          	beq	t4,s0,474 <updateGeneration+0x94>
     4e4:	f9fe88e3          	beq	t4,t6,474 <updateGeneration+0x94>
                            liveNeighbours += borderFields[27 - (nx + 1)];
     4e8:	40e80eb3          	sub	t4,a6,a4
     4ec:	01aece83          	lbu	t4,26(t4)
     4f0:	0280006f          	j	518 <updateGeneration+0x138>
                        if (nx == GRIDSIZE && ny >= 0 && ny <= GRIDSIZE) {
     4f4:	01268863          	beq	a3,s2,504 <updateGeneration+0x124>
                            liveNeighbours += borderFields[ny + 10 ];
     4f8:	00d80eb3          	add	t4,a6,a3
     4fc:	00aece83          	lbu	t4,10(t4)
     500:	fcdff06f          	j	4cc <updateGeneration+0xec>
                            liveNeighbours += borderFields[nx + 1];
     504:	00170e93          	add	t4,a4,1
     508:	018e9e93          	sll	t4,t4,0x18
     50c:	418ede93          	sra	t4,t4,0x18
     510:	01d80eb3          	add	t4,a6,t4
     514:	000ece83          	lbu	t4,0(t4)
                            liveNeighbours += borderFields[27 - (nx + 1)];
     518:	01d787b3          	add	a5,a5,t4
     51c:	f55ff06f          	j	470 <updateGeneration+0x90>
            if (currentGen[x][y]) { // The cell is alive
     520:	001f0733          	add	a4,t5,ra
     524:	00074703          	lbu	a4,0(a4)
     528:	02070c63          	beqz	a4,560 <updateGeneration+0x180>
                if (liveNeighbours < 2 || liveNeighbours > 3) {
     52c:	ffe78793          	add	a5,a5,-2
     530:	0027b793          	sltiu	a5,a5,2
                    nextGen[x][y] = true; // Lives on
     534:	013f0733          	add	a4,t5,s3
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
     538:	00160613          	add	a2,a2,1
                    nextGen[x][y] = true; // Lives on
     53c:	00f70023          	sb	a5,0(a4)
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
     540:	0ff67613          	zext.b	a2,a2
     544:	001f0f13          	add	t5,t5,1
     548:	02760263          	beq	a2,t2,56c <updateGeneration+0x18c>
            for (int8_t i = -1; i <= 1; i++) {
     54c:	00028713          	mv	a4,t0
     550:	fff00893          	li	a7,-1
            liveNeighbours = 0;
     554:	00000793          	li	a5,0
                for (int8_t j = -1; j <= 1; j++) {
     558:	00200a93          	li	s5,2
     55c:	f51ff06f          	j	4ac <updateGeneration+0xcc>
                }
            } else { // The cell is dead
                if (liveNeighbours == 3) {
     560:	ffd78793          	add	a5,a5,-3
     564:	0017b793          	seqz	a5,a5
     568:	fcdff06f          	j	534 <updateGeneration+0x154>
    for (uint8_t x = 0; x < GRIDSIZE; x++) {
     56c:	001e0e13          	add	t3,t3,1
     570:	ebfe1ae3          	bne	t3,t6,424 <updateGeneration+0x44>
    }

    // copy nextGen to currentGen for the next iteration
    for (uint8_t x = 0; x < GRIDSIZE; x++) {
        for (uint8_t y = 0; y < GRIDSIZE; y++) {
            currentGen[x][y] = nextGen[x][y];
     574:	04000613          	li	a2,64
     578:	99c18593          	add	a1,gp,-1636 # 8000019c <nextGen>
     57c:	9dc18513          	add	a0,gp,-1572 # 800001dc <currentGen>
     580:	139000ef          	jal	eb8 <memcpy>
        }
    }
}
     584:	01c12083          	lw	ra,28(sp)
     588:	01812403          	lw	s0,24(sp)
     58c:	01412483          	lw	s1,20(sp)
     590:	01012903          	lw	s2,16(sp)
     594:	00c12983          	lw	s3,12(sp)
     598:	00812a03          	lw	s4,8(sp)
     59c:	00412a83          	lw	s5,4(sp)
     5a0:	02010113          	add	sp,sp,32
     5a4:	00008067          	ret

000005a8 <controlWS2812Cell>:
// converts from cartesian to snake index
void controlWS2812Cell(bool state, uint8_t x, uint8_t y){
    uint8_t index;

    // convert cartesian coordinate to snake index
    index = y * GRIDSIZE + x;
     5a8:	00361613          	sll	a2,a2,0x3
void controlWS2812Cell(bool state, uint8_t x, uint8_t y){
     5ac:	00050793          	mv	a5,a0
    index = y * GRIDSIZE + x;
     5b0:	00c585b3          	add	a1,a1,a2
     5b4:	0ff5f513          	zext.b	a0,a1

    if (state == true){
     5b8:	00078c63          	beqz	a5,5d0 <controlWS2812Cell+0x28>
        // LED on
        iceduino_ws2812_set(index, aliveColor.red,aliveColor.green,aliveColor.blue);
     5bc:	87418713          	add	a4,gp,-1932 # 80000074 <aliveColor>
     5c0:	00274683          	lbu	a3,2(a4)
     5c4:	00174603          	lbu	a2,1(a4)
     5c8:	8741c583          	lbu	a1,-1932(gp) # 80000074 <aliveColor>
    } else {
        // LED off
        iceduino_ws2812_set(index, deadColor.red,deadColor.green,deadColor.blue);
     5cc:	de1ff06f          	j	3ac <iceduino_ws2812_set>
     5d0:	87018713          	add	a4,gp,-1936 # 80000070 <deadColor>
     5d4:	00274683          	lbu	a3,2(a4)
     5d8:	00174603          	lbu	a2,1(a4)
     5dc:	8701c583          	lbu	a1,-1936(gp) # 80000070 <deadColor>
     5e0:	fedff06f          	j	5cc <controlWS2812Cell+0x24>

000005e4 <setBorderFields>:
    }
}

// setter for the whole border cells buffer
void setBorderFields(bool newBorderFields[BORDERFIELDS_LENGTH]){
    for(int i = 0; i < BORDERFIELDS_LENGTH; i++){
     5e4:	00000793          	li	a5,0
        borderFields[i] = newBorderFields[i];
     5e8:	97818713          	add	a4,gp,-1672 # 80000178 <borderFields>
    for(int i = 0; i < BORDERFIELDS_LENGTH; i++){
     5ec:	02400693          	li	a3,36
        borderFields[i] = newBorderFields[i];
     5f0:	00f50633          	add	a2,a0,a5
     5f4:	00064583          	lbu	a1,0(a2)
     5f8:	00e78633          	add	a2,a5,a4
    for(int i = 0; i < BORDERFIELDS_LENGTH; i++){
     5fc:	00178793          	add	a5,a5,1
        borderFields[i] = newBorderFields[i];
     600:	00b60023          	sb	a1,0(a2)
    for(int i = 0; i < BORDERFIELDS_LENGTH; i++){
     604:	fed796e3          	bne	a5,a3,5f0 <setBorderFields+0xc>
    }
}
     608:	00008067          	ret

0000060c <updateGenLocally>:

// local testing function, to set the appropriate generation of borderFields, for correct generation calculation
void updateGenLocally(){
     60c:	ff010113          	add	sp,sp,-16
     610:	00812423          	sw	s0,8(sp)
    switch (generation){
     614:	86c1c783          	lbu	a5,-1940(gp) # 8000006c <generation>
void updateGenLocally(){
     618:	00112623          	sw	ra,12(sp)
    switch (generation){
     61c:	00100713          	li	a4,1
     620:	02e78a63          	beq	a5,a4,654 <updateGenLocally+0x48>
     624:	00200713          	li	a4,2
     628:	02e78c63          	beq	a5,a4,660 <updateGenLocally+0x54>
     62c:	00079c63          	bnez	a5,644 <updateGenLocally+0x38>
        case 0: setBorderFields(newBorderFieldsGen0);
     630:	84818513          	add	a0,gp,-1976 # 80000048 <newBorderFieldsGen0>
            generation ++;
            break;
        case 1: setBorderFields(newBorderFieldsGen1);
     634:	fb1ff0ef          	jal	5e4 <setBorderFields>
            generation ++;
     638:	86c1c783          	lbu	a5,-1940(gp) # 8000006c <generation>
     63c:	00178793          	add	a5,a5,1
     640:	86f18623          	sb	a5,-1940(gp) # 8000006c <generation>
        case 2: setBorderFields(newBorderFieldsGen2);
            generation = 0;
            break;
    }
    updateGeneration();
}
     644:	00812403          	lw	s0,8(sp)
     648:	00c12083          	lw	ra,12(sp)
     64c:	01010113          	add	sp,sp,16
    updateGeneration();
     650:	d91ff06f          	j	3e0 <updateGeneration>
        case 1: setBorderFields(newBorderFieldsGen1);
     654:	80000537          	lui	a0,0x80000
     658:	02450513          	add	a0,a0,36 # 80000024 <newBorderFieldsGen1>
     65c:	fd9ff06f          	j	634 <updateGenLocally+0x28>
        case 2: setBorderFields(newBorderFieldsGen2);
     660:	80000537          	lui	a0,0x80000
     664:	00050513          	mv	a0,a0
     668:	f7dff0ef          	jal	5e4 <setBorderFields>
            generation = 0;
     66c:	86018623          	sb	zero,-1940(gp) # 8000006c <generation>
            break;
     670:	fd5ff06f          	j	644 <updateGenLocally+0x38>

00000674 <displayCurrentGen>:

// Displays the current Generation on the LED-matrix
void displayCurrentGen(){
     674:	fe010113          	add	sp,sp,-32
     678:	00912a23          	sw	s1,20(sp)
     67c:	01212823          	sw	s2,16(sp)
     680:	01412423          	sw	s4,8(sp)
     684:	00112e23          	sw	ra,28(sp)
     688:	00812c23          	sw	s0,24(sp)
     68c:	01312623          	sw	s3,12(sp)
     690:	9dc18493          	add	s1,gp,-1572 # 800001dc <currentGen>
    for(int x = 0; x < GRIDSIZE; x ++){
     694:	00000913          	li	s2,0
        for(int y = 0; y < GRIDSIZE; y++){
     698:	00800a13          	li	s4,8
     69c:	00000413          	li	s0,0
            bool currentCell = currentGen[x][y];
            controlWS2812Cell(currentCell, x,y);
     6a0:	0ff97993          	zext.b	s3,s2
            bool currentCell = currentGen[x][y];
     6a4:	008487b3          	add	a5,s1,s0
            controlWS2812Cell(currentCell, x,y);
     6a8:	0007c503          	lbu	a0,0(a5)
     6ac:	0ff47613          	zext.b	a2,s0
     6b0:	00098593          	mv	a1,s3
        for(int y = 0; y < GRIDSIZE; y++){
     6b4:	00140413          	add	s0,s0,1
            controlWS2812Cell(currentCell, x,y);
     6b8:	ef1ff0ef          	jal	5a8 <controlWS2812Cell>
        for(int y = 0; y < GRIDSIZE; y++){
     6bc:	ff4414e3          	bne	s0,s4,6a4 <displayCurrentGen+0x30>
    for(int x = 0; x < GRIDSIZE; x ++){
     6c0:	00190913          	add	s2,s2,1
     6c4:	00848493          	add	s1,s1,8
     6c8:	fc891ae3          	bne	s2,s0,69c <displayCurrentGen+0x28>
        }
    }
}
     6cc:	01c12083          	lw	ra,28(sp)
     6d0:	01812403          	lw	s0,24(sp)
     6d4:	01412483          	lw	s1,20(sp)
     6d8:	01012903          	lw	s2,16(sp)
     6dc:	00c12983          	lw	s3,12(sp)
     6e0:	00812a03          	lw	s4,8(sp)
     6e4:	02010113          	add	sp,sp,32
     6e8:	00008067          	ret

000006ec <send_uart_buf>:
uint8_t tx_buf[L1_PDU_SIZE];

bool updateGenFlag = false;

// sends the tx buffer via both uarts
void send_uart_buf(uint8_t* buf, uint8_t num_bytes){
     6ec:	fe010113          	add	sp,sp,-32
     6f0:	00812c23          	sw	s0,24(sp)
     6f4:	00912a23          	sw	s1,20(sp)
     6f8:	01212823          	sw	s2,16(sp)
     6fc:	00112e23          	sw	ra,28(sp)
     700:	01312623          	sw	s3,12(sp)
     704:	00050913          	mv	s2,a0
     708:	00058493          	mv	s1,a1
    for(int i = 0; i < num_bytes; i++){
     70c:	00000413          	li	s0,0
     710:	02944063          	blt	s0,s1,730 <send_uart_buf+0x44>
        neorv32_uart0_putc(buf[i]);
        neorv32_uart1_putc(buf[i]);
    }
}
     714:	01c12083          	lw	ra,28(sp)
     718:	01812403          	lw	s0,24(sp)
     71c:	01412483          	lw	s1,20(sp)
     720:	01012903          	lw	s2,16(sp)
     724:	00c12983          	lw	s3,12(sp)
     728:	02010113          	add	sp,sp,32
     72c:	00008067          	ret
        neorv32_uart0_putc(buf[i]);
     730:	008909b3          	add	s3,s2,s0
     734:	0009c503          	lbu	a0,0(s3)
    for(int i = 0; i < num_bytes; i++){
     738:	00140413          	add	s0,s0,1
        neorv32_uart0_putc(buf[i]);
     73c:	4d0000ef          	jal	c0c <neorv32_uart0_putc>
        neorv32_uart1_putc(buf[i]);
     740:	0009c503          	lbu	a0,0(s3)
     744:	5b4000ef          	jal	cf8 <neorv32_uart1_putc>
    for(int i = 0; i < num_bytes; i++){
     748:	fc9ff06f          	j	710 <send_uart_buf+0x24>

0000074c <crcSlow>:

crc crcSlow(uint8_t const message[], int nBytes) {
     74c:	00050613          	mv	a2,a0
    crc remainder = 0;
    for (int byte = 0; byte < nBytes; ++byte) {
     750:	00000693          	li	a3,0
    crc remainder = 0;
     754:	00000513          	li	a0,0
    for (int byte = 0; byte < nBytes; ++byte) {
     758:	00b6c463          	blt	a3,a1,760 <crcSlow+0x14>
                remainder = (remainder << 1);
            }
        }
    }
    return (remainder);
}
     75c:	00008067          	ret
        remainder ^= (message[byte] << (WIDTH - 8));
     760:	00d607b3          	add	a5,a2,a3
     764:	0007c783          	lbu	a5,0(a5)
     768:	00800713          	li	a4,8
     76c:	00f54533          	xor	a0,a0,a5
            if (remainder & TOPBIT) {
     770:	01851793          	sll	a5,a0,0x18
     774:	4187d793          	sra	a5,a5,0x18
     778:	0207d263          	bgez	a5,79c <crcSlow+0x50>
                remainder = (remainder << 1) ^ POLYNOMIAL;
     77c:	00179793          	sll	a5,a5,0x1
     780:	0077c793          	xor	a5,a5,7
        for (uint8_t bit = 8; bit > 0; --bit) {
     784:	fff70713          	add	a4,a4,-1
     788:	0ff77713          	zext.b	a4,a4
                remainder = (remainder << 1);
     78c:	0ff7f513          	zext.b	a0,a5
        for (uint8_t bit = 8; bit > 0; --bit) {
     790:	fe0710e3          	bnez	a4,770 <crcSlow+0x24>
    for (int byte = 0; byte < nBytes; ++byte) {
     794:	00168693          	add	a3,a3,1
     798:	fc1ff06f          	j	758 <crcSlow+0xc>
                remainder = (remainder << 1);
     79c:	00151793          	sll	a5,a0,0x1
     7a0:	fe5ff06f          	j	784 <crcSlow+0x38>

000007a4 <L1_send>:
    }
    L2_PDU[L2_PDU_SIZE - 1] = (uint8_t)crcSlow(L2_SDU, L2_SDU_SIZE); // write crc check to last element (L2-PCI)
    L1_send(L2_PDU);
}

void L1_send(uint8_t L1_SDU[]) {
     7a4:	fe010113          	add	sp,sp,-32
     7a8:	00050593          	mv	a1,a0
    uint8_t L1_PDU[L1_PDU_SIZE];

    for (int i = 0; i < L1_SDU_SIZE; i++) {
        L1_PDU[i + 1] = L1_SDU[i];
     7ac:	00e00613          	li	a2,14
     7b0:	00110513          	add	a0,sp,1
void L1_send(uint8_t L1_SDU[]) {
     7b4:	00112e23          	sw	ra,28(sp)
     7b8:	00812c23          	sw	s0,24(sp)
        L1_PDU[i + 1] = L1_SDU[i];
     7bc:	6fc000ef          	jal	eb8 <memcpy>
    }
    L1_PDU[0] = 0;               // SOF
    L1_PDU[L1_PDU_SIZE - 1] = 0; // EOF

    for (int i = 0; i < L1_PDU_SIZE; i++) {
        tx_buf[i] = L1_PDU[i];
     7c0:	00010593          	mv	a1,sp
     7c4:	a2c18513          	add	a0,gp,-1492 # 8000022c <tx_buf>
     7c8:	01000613          	li	a2,16
    L1_PDU[0] = 0;               // SOF
     7cc:	00010023          	sb	zero,0(sp)
    L1_PDU[L1_PDU_SIZE - 1] = 0; // EOF
     7d0:	000107a3          	sb	zero,15(sp)
        tx_buf[i] = L1_PDU[i];
     7d4:	6e4000ef          	jal	eb8 <memcpy>
    }

    send_uart_buf(tx_buf, L1_PDU_SIZE);
     7d8:	a2c18513          	add	a0,gp,-1492 # 8000022c <tx_buf>
}
     7dc:	01812403          	lw	s0,24(sp)
     7e0:	01c12083          	lw	ra,28(sp)
    send_uart_buf(tx_buf, L1_PDU_SIZE);
     7e4:	01000593          	li	a1,16
}
     7e8:	02010113          	add	sp,sp,32
    send_uart_buf(tx_buf, L1_PDU_SIZE);
     7ec:	f01ff06f          	j	6ec <send_uart_buf>

000007f0 <L2_send>:
void L2_send(uint8_t L2_SDU[]) {
     7f0:	fe010113          	add	sp,sp,-32
     7f4:	00812c23          	sw	s0,24(sp)
        L2_PDU[i] = L2_SDU[i];
     7f8:	00d00613          	li	a2,13
void L2_send(uint8_t L2_SDU[]) {
     7fc:	00050413          	mv	s0,a0
        L2_PDU[i] = L2_SDU[i];
     800:	00050593          	mv	a1,a0
     804:	00010513          	mv	a0,sp
void L2_send(uint8_t L2_SDU[]) {
     808:	00112e23          	sw	ra,28(sp)
        L2_PDU[i] = L2_SDU[i];
     80c:	6ac000ef          	jal	eb8 <memcpy>
    L2_PDU[L2_PDU_SIZE - 1] = (uint8_t)crcSlow(L2_SDU, L2_SDU_SIZE); // write crc check to last element (L2-PCI)
     810:	00d00593          	li	a1,13
     814:	00040513          	mv	a0,s0
     818:	f35ff0ef          	jal	74c <crcSlow>
     81c:	00a106a3          	sb	a0,13(sp)
    L1_send(L2_PDU);
     820:	00010513          	mv	a0,sp
     824:	f81ff0ef          	jal	7a4 <L1_send>
}
     828:	01c12083          	lw	ra,28(sp)
     82c:	01812403          	lw	s0,24(sp)
     830:	02010113          	add	sp,sp,32
     834:	00008067          	ret

00000838 <L3_send>:
void L3_send(uint8_t L3_SDU[]) {
     838:	fe010113          	add	sp,sp,-32
    L3_PDU[0] = 0;              // To: master address
     83c:	000307b7          	lui	a5,0x30
void L3_send(uint8_t L3_SDU[]) {
     840:	00050593          	mv	a1,a0
    L3_PDU[0] = 0;              // To: master address
     844:	10078793          	add	a5,a5,256 # 30100 <__crt0_copy_data_src_begin+0x2f08c>
        L3_PDU[i + L3_PCI_SIZE] = L3_SDU[i];
     848:	00900613          	li	a2,9
     84c:	00410513          	add	a0,sp,4
void L3_send(uint8_t L3_SDU[]) {
     850:	00112e23          	sw	ra,28(sp)
    L3_PDU[0] = 0;              // To: master address
     854:	00f12023          	sw	a5,0(sp)
        L3_PDU[i + L3_PCI_SIZE] = L3_SDU[i];
     858:	660000ef          	jal	eb8 <memcpy>
    L2_send(L3_PDU);
     85c:	00010513          	mv	a0,sp
     860:	f91ff0ef          	jal	7f0 <L2_send>
}
     864:	01c12083          	lw	ra,28(sp)
     868:	02010113          	add	sp,sp,32
     86c:	00008067          	ret

00000870 <L7_send>:
void L7_send(uint8_t Id, uint8_t L7_SDU[]) {
     870:	fe010113          	add	sp,sp,-32
    L7_PDU[0] = Id;
     874:	00a10223          	sb	a0,4(sp)
        L7_PDU[i + L7_PCI_SIZE] = L7_SDU[i];
     878:	00800613          	li	a2,8
     87c:	00510513          	add	a0,sp,5
void L7_send(uint8_t Id, uint8_t L7_SDU[]) {
     880:	00112e23          	sw	ra,28(sp)
        L7_PDU[i + L7_PCI_SIZE] = L7_SDU[i];
     884:	634000ef          	jal	eb8 <memcpy>
    L3_send(L7_PDU);
     888:	00410513          	add	a0,sp,4
     88c:	fadff0ef          	jal	838 <L3_send>
}
     890:	01c12083          	lw	ra,28(sp)
     894:	02010113          	add	sp,sp,32
     898:	00008067          	ret

0000089c <L7_receive>:
void L7_receive(uint8_t L7_PDU[]) {
     89c:	fe010113          	add	sp,sp,-32
     8a0:	00112e23          	sw	ra,28(sp)
     8a4:	00812c23          	sw	s0,24(sp)
    uint8_t ap_nr = L7_PDU[0];
     8a8:	00054403          	lbu	s0,0(a0) # 80000000 <newBorderFieldsGen2>
        L7_SDU[i - 1] = L7_PDU[i];
     8ac:	00150593          	add	a1,a0,1
     8b0:	00800613          	li	a2,8
     8b4:	00810513          	add	a0,sp,8
     8b8:	600000ef          	jal	eb8 <memcpy>
    switch (ap_nr) {
     8bc:	fff40793          	add	a5,s0,-1
     8c0:	0ff7f793          	zext.b	a5,a5
     8c4:	00500713          	li	a4,5
     8c8:	06f76263          	bltu	a4,a5,92c <L7_receive+0x90>
     8cc:	00001737          	lui	a4,0x1
     8d0:	00279793          	sll	a5,a5,0x2
     8d4:	05c70713          	add	a4,a4,92 # 105c <__etext>
     8d8:	00e787b3          	add	a5,a5,a4
     8dc:	0007a783          	lw	a5,0(a5)
     8e0:	00078067          	jr	a5
     8e4:	00000713          	li	a4,0
            currentGen[x][y] = (L7_SDU[ (GRIDSIZE - 1) - y] >> x) & 0b1;
     8e8:	9dc18613          	add	a2,gp,-1572 # 800001dc <currentGen>
     8ec:	00700813          	li	a6,7
        for(int n = 0; n < 64; n++){
     8f0:	04000513          	li	a0,64
            uint8_t x = n % GRIDSIZE;
     8f4:	00777593          	and	a1,a4,7
            currentGen[x][y] = (L7_SDU[ (GRIDSIZE - 1) - y] >> x) & 0b1;
     8f8:	00359693          	sll	a3,a1,0x3
            uint8_t y = n / GRIDSIZE;
     8fc:	40375793          	sra	a5,a4,0x3
            currentGen[x][y] = (L7_SDU[ (GRIDSIZE - 1) - y] >> x) & 0b1;
     900:	00d606b3          	add	a3,a2,a3
     904:	00f686b3          	add	a3,a3,a5
     908:	40f807b3          	sub	a5,a6,a5
     90c:	01078793          	add	a5,a5,16
     910:	002787b3          	add	a5,a5,sp
     914:	ff87c783          	lbu	a5,-8(a5)
        for(int n = 0; n < 64; n++){
     918:	00170713          	add	a4,a4,1
            currentGen[x][y] = (L7_SDU[ (GRIDSIZE - 1) - y] >> x) & 0b1;
     91c:	40b7d7b3          	sra	a5,a5,a1
     920:	0017f793          	and	a5,a5,1
     924:	00f68023          	sb	a5,0(a3)
        for(int n = 0; n < 64; n++){
     928:	fca716e3          	bne	a4,a0,8f4 <L7_receive+0x58>
    L7_send(ap_nr, L7_SDU);
     92c:	00810593          	add	a1,sp,8
     930:	00040513          	mv	a0,s0
     934:	f3dff0ef          	jal	870 <L7_send>
}
     938:	01c12083          	lw	ra,28(sp)
     93c:	01812403          	lw	s0,24(sp)
     940:	02010113          	add	sp,sp,32
     944:	00008067          	ret
        updateGenFlag = true;
     948:	00100713          	li	a4,1
     94c:	86e18ba3          	sb	a4,-1929(gp) # 80000077 <updateGenFlag>
        break;
     950:	fddff06f          	j	92c <L7_receive+0x90>
            L7_SDU[i] = 0b0;
     954:	00012423          	sw	zero,8(sp)
     958:	00012623          	sw	zero,12(sp)
        for(int n = 0; n < 64; n++){
     95c:	00000793          	li	a5,0
            L7_SDU[ (GRIDSIZE - 1) - y] |= ((currentGen[x][y] & 0b1) << x);
     960:	00700893          	li	a7,7
     964:	9dc18613          	add	a2,gp,-1572 # 800001dc <currentGen>
        for(int n = 0; n < 64; n++){
     968:	04000813          	li	a6,64
            uint8_t y = n / GRIDSIZE;
     96c:	4037d513          	sra	a0,a5,0x3
            L7_SDU[ (GRIDSIZE - 1) - y] |= ((currentGen[x][y] & 0b1) << x);
     970:	40a886b3          	sub	a3,a7,a0
            uint8_t x = n % GRIDSIZE;
     974:	0077f593          	and	a1,a5,7
            L7_SDU[ (GRIDSIZE - 1) - y] |= ((currentGen[x][y] & 0b1) << x);
     978:	01068713          	add	a4,a3,16
     97c:	002706b3          	add	a3,a4,sp
     980:	00359713          	sll	a4,a1,0x3
     984:	00e60733          	add	a4,a2,a4
     988:	00a70733          	add	a4,a4,a0
     98c:	00074703          	lbu	a4,0(a4)
        for(int n = 0; n < 64; n++){
     990:	00178793          	add	a5,a5,1
            L7_SDU[ (GRIDSIZE - 1) - y] |= ((currentGen[x][y] & 0b1) << x);
     994:	00b71733          	sll	a4,a4,a1
     998:	ff86c583          	lbu	a1,-8(a3)
     99c:	00b76733          	or	a4,a4,a1
     9a0:	fee68c23          	sb	a4,-8(a3)
        for(int n = 0; n < 64; n++){
     9a4:	fd0794e3          	bne	a5,a6,96c <L7_receive+0xd0>
     9a8:	f85ff06f          	j	92c <L7_receive+0x90>
        deadColor.red = L7_SDU[0];
     9ac:	00814703          	lbu	a4,8(sp)
     9b0:	86e18823          	sb	a4,-1936(gp) # 80000070 <deadColor>
        deadColor.green = L7_SDU[1];
     9b4:	87018793          	add	a5,gp,-1936 # 80000070 <deadColor>
        aliveColor.green = L7_SDU[1];
     9b8:	00914703          	lbu	a4,9(sp)
     9bc:	00e780a3          	sb	a4,1(a5)
        aliveColor.blue = L7_SDU[2];
     9c0:	00a14703          	lbu	a4,10(sp)
     9c4:	00e78123          	sb	a4,2(a5)
        break;
     9c8:	f65ff06f          	j	92c <L7_receive+0x90>
        aliveColor.red = L7_SDU[0];
     9cc:	00814703          	lbu	a4,8(sp)
     9d0:	86e18a23          	sb	a4,-1932(gp) # 80000074 <aliveColor>
        aliveColor.green = L7_SDU[1];
     9d4:	87418793          	add	a5,gp,-1932 # 80000074 <aliveColor>
     9d8:	fe1ff06f          	j	9b8 <L7_receive+0x11c>
    switch (ap_nr) {
     9dc:	00000793          	li	a5,0
            borderFields[n] = (L7_SDU[(GRIDSIZE - 1) - byte] >> shift) & 0b1;
     9e0:	97818693          	add	a3,gp,-1672 # 80000178 <borderFields>
     9e4:	00700813          	li	a6,7
        for(int n = 0; n < BORDERFIELDS_LENGTH; n++){
     9e8:	02400613          	li	a2,36
            uint8_t byte =  n / GRIDSIZE;
     9ec:	4037d713          	sra	a4,a5,0x3
            borderFields[n] = (L7_SDU[(GRIDSIZE - 1) - byte] >> shift) & 0b1;
     9f0:	40e80733          	sub	a4,a6,a4
     9f4:	01070713          	add	a4,a4,16
     9f8:	00270733          	add	a4,a4,sp
     9fc:	ff874703          	lbu	a4,-8(a4)
            uint8_t shift = n % GRIDSIZE;
     a00:	0077f513          	and	a0,a5,7
            borderFields[n] = (L7_SDU[(GRIDSIZE - 1) - byte] >> shift) & 0b1;
     a04:	00d785b3          	add	a1,a5,a3
     a08:	40a75733          	sra	a4,a4,a0
     a0c:	00177713          	and	a4,a4,1
     a10:	00e58023          	sb	a4,0(a1)
        for(int n = 0; n < BORDERFIELDS_LENGTH; n++){
     a14:	00178793          	add	a5,a5,1
     a18:	fcc79ae3          	bne	a5,a2,9ec <L7_receive+0x150>
     a1c:	f11ff06f          	j	92c <L7_receive+0x90>

00000a20 <L3_receive>:
void L3_receive(uint8_t L3_PDU[]) {
     a20:	fe010113          	add	sp,sp,-32
     a24:	00812c23          	sw	s0,24(sp)
        L3_SDU[i - L3_PCI_SIZE] = L3_PDU[i];
     a28:	00450593          	add	a1,a0,4
void L3_receive(uint8_t L3_PDU[]) {
     a2c:	00050413          	mv	s0,a0
        L3_SDU[i - L3_PCI_SIZE] = L3_PDU[i];
     a30:	00900613          	li	a2,9
     a34:	00410513          	add	a0,sp,4
void L3_receive(uint8_t L3_PDU[]) {
     a38:	00112e23          	sw	ra,28(sp)
        L3_SDU[i - L3_PCI_SIZE] = L3_PDU[i];
     a3c:	47c000ef          	jal	eb8 <memcpy>
    if (vers != MMCP_VERSION) { // wrong version
     a40:	00244703          	lbu	a4,2(s0)
     a44:	00300793          	li	a5,3
     a48:	02f71263          	bne	a4,a5,a6c <L3_receive+0x4c>
    uint8_t to = L3_PDU[0];
     a4c:	00044683          	lbu	a3,0(s0)
    if ((to == MY_ADDRESS && from == 0) || (to == 0 && from == 0)) {
     a50:	00100713          	li	a4,1
    uint8_t from = L3_PDU[1];
     a54:	00144603          	lbu	a2,1(s0)
    uint8_t hops = L3_PDU[3];
     a58:	00344783          	lbu	a5,3(s0)
    if ((to == MY_ADDRESS && from == 0) || (to == 0 && from == 0)) {
     a5c:	02d76263          	bltu	a4,a3,a80 <L3_receive+0x60>
     a60:	00061e63          	bnez	a2,a7c <L3_receive+0x5c>
        L7_receive(L3_SDU);
     a64:	00410513          	add	a0,sp,4
     a68:	e35ff0ef          	jal	89c <L7_receive>
}
     a6c:	01c12083          	lw	ra,28(sp)
     a70:	01812403          	lw	s0,24(sp)
     a74:	02010113          	add	sp,sp,32
     a78:	00008067          	ret
    } else if (to != MY_ADDRESS) { // packet is addressed at master or another participant
     a7c:	fee688e3          	beq	a3,a4,a6c <L3_receive+0x4c>
        hops++;
     a80:	00178793          	add	a5,a5,1
        L3_PDU[3] = hops;
     a84:	00f401a3          	sb	a5,3(s0)
        L2_send(L3_PDU);
     a88:	00040513          	mv	a0,s0
}
     a8c:	01812403          	lw	s0,24(sp)
     a90:	01c12083          	lw	ra,28(sp)
     a94:	02010113          	add	sp,sp,32
        L2_send(L3_PDU);
     a98:	d59ff06f          	j	7f0 <L2_send>

00000a9c <L2_receive>:
void L2_receive(uint8_t L2_PDU[]) {
     a9c:	fe010113          	add	sp,sp,-32
        L2_SDU[i] = L2_PDU[i];
     aa0:	00050593          	mv	a1,a0
void L2_receive(uint8_t L2_PDU[]) {
     aa4:	00812c23          	sw	s0,24(sp)
        L2_SDU[i] = L2_PDU[i];
     aa8:	00d00613          	li	a2,13
void L2_receive(uint8_t L2_PDU[]) {
     aac:	00050413          	mv	s0,a0
        L2_SDU[i] = L2_PDU[i];
     ab0:	00010513          	mv	a0,sp
void L2_receive(uint8_t L2_PDU[]) {
     ab4:	00112e23          	sw	ra,28(sp)
        L2_SDU[i] = L2_PDU[i];
     ab8:	400000ef          	jal	eb8 <memcpy>
    uint8_t crc = crcSlow(L2_SDU, L2_SDU_SIZE);
     abc:	00d00593          	li	a1,13
     ac0:	00010513          	mv	a0,sp
     ac4:	c89ff0ef          	jal	74c <crcSlow>
    if (crc == L2_PDU[L2_PDU_SIZE - 1]) {
     ac8:	00d44783          	lbu	a5,13(s0)
     acc:	00a79663          	bne	a5,a0,ad8 <L2_receive+0x3c>
        L3_receive(L2_SDU);
     ad0:	00010513          	mv	a0,sp
     ad4:	f4dff0ef          	jal	a20 <L3_receive>
}
     ad8:	01c12083          	lw	ra,28(sp)
     adc:	01812403          	lw	s0,24(sp)
     ae0:	02010113          	add	sp,sp,32
     ae4:	00008067          	ret

00000ae8 <L1_receive>:
void L1_receive(uint8_t L1_PDU[]) {
     ae8:	fe010113          	add	sp,sp,-32
        L1_SDU[i - (L1_PCI_SIZE / 2)] = L1_PDU[i];
     aec:	00150593          	add	a1,a0,1
     af0:	00e00613          	li	a2,14
     af4:	00010513          	mv	a0,sp
void L1_receive(uint8_t L1_PDU[]) {
     af8:	00112e23          	sw	ra,28(sp)
        L1_SDU[i - (L1_PCI_SIZE / 2)] = L1_PDU[i];
     afc:	3bc000ef          	jal	eb8 <memcpy>
    L2_receive(L1_SDU);
     b00:	00010513          	mv	a0,sp
     b04:	f99ff0ef          	jal	a9c <L2_receive>
}
     b08:	01c12083          	lw	ra,28(sp)
     b0c:	02010113          	add	sp,sp,32
     b10:	00008067          	ret

00000b14 <neorv32_cpu_delay_ms>:
     b14:	fe010113          	add	sp,sp,-32
     b18:	00112e23          	sw	ra,28(sp)
     b1c:	00050613          	mv	a2,a0
     b20:	00055863          	bgez	a0,b30 <neorv32_cpu_delay_ms+0x1c>
     b24:	40a00633          	neg	a2,a0
     b28:	01061613          	sll	a2,a2,0x10
     b2c:	41065613          	sra	a2,a2,0x10
     b30:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
     b34:	3e800593          	li	a1,1000
     b38:	00c12623          	sw	a2,12(sp)
     b3c:	2d0000ef          	jal	e0c <__hidden___udivsi3>
     b40:	00c12603          	lw	a2,12(sp)
     b44:	00000593          	li	a1,0
     b48:	41f65693          	sra	a3,a2,0x1f
     b4c:	22c000ef          	jal	d78 <__muldi3>
     b50:	01c59593          	sll	a1,a1,0x1c
     b54:	00455513          	srl	a0,a0,0x4
     b58:	00a5e533          	or	a0,a1,a0

00000b5c <__neorv32_cpu_delay_ms_start>:
     b5c:	00050a63          	beqz	a0,b70 <__neorv32_cpu_delay_ms_end>
     b60:	00050863          	beqz	a0,b70 <__neorv32_cpu_delay_ms_end>
     b64:	fff50513          	add	a0,a0,-1
     b68:	00000013          	nop
     b6c:	ff1ff06f          	j	b5c <__neorv32_cpu_delay_ms_start>

00000b70 <__neorv32_cpu_delay_ms_end>:
     b70:	01c12083          	lw	ra,28(sp)
     b74:	02010113          	add	sp,sp,32
     b78:	00008067          	ret

00000b7c <neorv32_uart0_setup>:
     b7c:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
     b80:	fe002703          	lw	a4,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
     b84:	00151513          	sll	a0,a0,0x1
     b88:	00000793          	li	a5,0
     b8c:	04a77463          	bgeu	a4,a0,bd4 <neorv32_uart0_setup+0x58>
     b90:	000016b7          	lui	a3,0x1
     b94:	00000713          	li	a4,0
     b98:	ffe68693          	add	a3,a3,-2 # ffe <memcpy+0x146>
     b9c:	04f6e663          	bltu	a3,a5,be8 <neorv32_uart0_setup+0x6c>
     ba0:	00367613          	and	a2,a2,3
     ba4:	0035f593          	and	a1,a1,3
     ba8:	fff78793          	add	a5,a5,-1
     bac:	01461613          	sll	a2,a2,0x14
     bb0:	00c7e7b3          	or	a5,a5,a2
     bb4:	01659593          	sll	a1,a1,0x16
     bb8:	01871713          	sll	a4,a4,0x18
     bbc:	00b7e7b3          	or	a5,a5,a1
     bc0:	00e7e7b3          	or	a5,a5,a4
     bc4:	10000737          	lui	a4,0x10000
     bc8:	00e7e7b3          	or	a5,a5,a4
     bcc:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
     bd0:	00008067          	ret
     bd4:	00178793          	add	a5,a5,1
     bd8:	01079793          	sll	a5,a5,0x10
     bdc:	40a70733          	sub	a4,a4,a0
     be0:	0107d793          	srl	a5,a5,0x10
     be4:	fa9ff06f          	j	b8c <neorv32_uart0_setup+0x10>
     be8:	ffe70513          	add	a0,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xfffef8a>
     bec:	0fd57513          	and	a0,a0,253
     bf0:	00051a63          	bnez	a0,c04 <neorv32_uart0_setup+0x88>
     bf4:	0037d793          	srl	a5,a5,0x3
     bf8:	00170713          	add	a4,a4,1
     bfc:	0ff77713          	zext.b	a4,a4
     c00:	f9dff06f          	j	b9c <neorv32_uart0_setup+0x20>
     c04:	0017d793          	srl	a5,a5,0x1
     c08:	ff1ff06f          	j	bf8 <neorv32_uart0_setup+0x7c>

00000c0c <neorv32_uart0_putc>:
     c0c:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
     c10:	fe07cee3          	bltz	a5,c0c <neorv32_uart0_putc>
     c14:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
     c18:	00008067          	ret

00000c1c <neorv32_uart0_getc_safe>:
     c1c:	fa402703          	lw	a4,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
     c20:	00050693          	mv	a3,a0
     c24:	02075e63          	bgez	a4,c60 <neorv32_uart0_getc_safe+0x44>
     c28:	200007b7          	lui	a5,0x20000
     c2c:	10000637          	lui	a2,0x10000
     c30:	00f777b3          	and	a5,a4,a5
     c34:	00c77633          	and	a2,a4,a2
     c38:	00f035b3          	snez	a1,a5
     c3c:	00060a63          	beqz	a2,c50 <neorv32_uart0_getc_safe+0x34>
     c40:	ffe00793          	li	a5,-2
     c44:	40b78533          	sub	a0,a5,a1
     c48:	00e68023          	sb	a4,0(a3)
     c4c:	00008067          	ret
     c50:	00100513          	li	a0,1
     c54:	fe078ae3          	beqz	a5,c48 <neorv32_uart0_getc_safe+0x2c>
     c58:	40b00533          	neg	a0,a1
     c5c:	fedff06f          	j	c48 <neorv32_uart0_getc_safe+0x2c>
     c60:	00000513          	li	a0,0
     c64:	00008067          	ret

00000c68 <neorv32_uart1_setup>:
     c68:	fc002823          	sw	zero,-48(zero) # ffffffd0 <__ctr0_io_space_begin+0x1d0>
     c6c:	fe002703          	lw	a4,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
     c70:	00151513          	sll	a0,a0,0x1
     c74:	00000793          	li	a5,0
     c78:	04a77463          	bgeu	a4,a0,cc0 <neorv32_uart1_setup+0x58>
     c7c:	000016b7          	lui	a3,0x1
     c80:	00000713          	li	a4,0
     c84:	ffe68693          	add	a3,a3,-2 # ffe <memcpy+0x146>
     c88:	04f6e663          	bltu	a3,a5,cd4 <neorv32_uart1_setup+0x6c>
     c8c:	00367613          	and	a2,a2,3
     c90:	0035f593          	and	a1,a1,3
     c94:	fff78793          	add	a5,a5,-1 # 1fffffff <__crt0_copy_data_src_begin+0x1fffef8b>
     c98:	01461613          	sll	a2,a2,0x14
     c9c:	00c7e7b3          	or	a5,a5,a2
     ca0:	01659593          	sll	a1,a1,0x16
     ca4:	01871713          	sll	a4,a4,0x18
     ca8:	00b7e7b3          	or	a5,a5,a1
     cac:	00e7e7b3          	or	a5,a5,a4
     cb0:	10000737          	lui	a4,0x10000
     cb4:	00e7e7b3          	or	a5,a5,a4
     cb8:	fcf02823          	sw	a5,-48(zero) # ffffffd0 <__ctr0_io_space_begin+0x1d0>
     cbc:	00008067          	ret
     cc0:	00178793          	add	a5,a5,1
     cc4:	01079793          	sll	a5,a5,0x10
     cc8:	40a70733          	sub	a4,a4,a0
     ccc:	0107d793          	srl	a5,a5,0x10
     cd0:	fa9ff06f          	j	c78 <neorv32_uart1_setup+0x10>
     cd4:	ffe70513          	add	a0,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xfffef8a>
     cd8:	0fd57513          	and	a0,a0,253
     cdc:	00051a63          	bnez	a0,cf0 <neorv32_uart1_setup+0x88>
     ce0:	0037d793          	srl	a5,a5,0x3
     ce4:	00170713          	add	a4,a4,1
     ce8:	0ff77713          	zext.b	a4,a4
     cec:	f9dff06f          	j	c88 <neorv32_uart1_setup+0x20>
     cf0:	0017d793          	srl	a5,a5,0x1
     cf4:	ff1ff06f          	j	ce4 <neorv32_uart1_setup+0x7c>

00000cf8 <neorv32_uart1_putc>:
     cf8:	fd002783          	lw	a5,-48(zero) # ffffffd0 <__ctr0_io_space_begin+0x1d0>
     cfc:	fe07cee3          	bltz	a5,cf8 <neorv32_uart1_putc>
     d00:	fca02a23          	sw	a0,-44(zero) # ffffffd4 <__ctr0_io_space_begin+0x1d4>
     d04:	00008067          	ret

00000d08 <neorv32_uart1_getc_safe>:
     d08:	fd402703          	lw	a4,-44(zero) # ffffffd4 <__ctr0_io_space_begin+0x1d4>
     d0c:	00050693          	mv	a3,a0
     d10:	02075e63          	bgez	a4,d4c <neorv32_uart1_getc_safe+0x44>
     d14:	200007b7          	lui	a5,0x20000
     d18:	10000637          	lui	a2,0x10000
     d1c:	00f777b3          	and	a5,a4,a5
     d20:	00c77633          	and	a2,a4,a2
     d24:	00f035b3          	snez	a1,a5
     d28:	00060a63          	beqz	a2,d3c <neorv32_uart1_getc_safe+0x34>
     d2c:	ffe00793          	li	a5,-2
     d30:	40b78533          	sub	a0,a5,a1
     d34:	00e68023          	sb	a4,0(a3)
     d38:	00008067          	ret
     d3c:	00100513          	li	a0,1
     d40:	fe078ae3          	beqz	a5,d34 <neorv32_uart1_getc_safe+0x2c>
     d44:	40b00533          	neg	a0,a1
     d48:	fedff06f          	j	d34 <neorv32_uart1_getc_safe+0x2c>
     d4c:	00000513          	li	a0,0
     d50:	00008067          	ret

00000d54 <__mulsi3>:
     d54:	00050613          	mv	a2,a0
     d58:	00000513          	li	a0,0
     d5c:	0015f693          	and	a3,a1,1
     d60:	00068463          	beqz	a3,d68 <__mulsi3+0x14>
     d64:	00c50533          	add	a0,a0,a2
     d68:	0015d593          	srl	a1,a1,0x1
     d6c:	00161613          	sll	a2,a2,0x1
     d70:	fe0596e3          	bnez	a1,d5c <__mulsi3+0x8>
     d74:	00008067          	ret

00000d78 <__muldi3>:
     d78:	00050e13          	mv	t3,a0
     d7c:	ff010113          	add	sp,sp,-16
     d80:	00068313          	mv	t1,a3
     d84:	00112623          	sw	ra,12(sp)
     d88:	00060513          	mv	a0,a2
     d8c:	000e0893          	mv	a7,t3
     d90:	00060693          	mv	a3,a2
     d94:	00000713          	li	a4,0
     d98:	00000793          	li	a5,0
     d9c:	00000813          	li	a6,0
     da0:	0016fe93          	and	t4,a3,1
     da4:	00171613          	sll	a2,a4,0x1
     da8:	000e8a63          	beqz	t4,dbc <__muldi3+0x44>
     dac:	01088833          	add	a6,a7,a6
     db0:	00e787b3          	add	a5,a5,a4
     db4:	01183733          	sltu	a4,a6,a7
     db8:	00f707b3          	add	a5,a4,a5
     dbc:	01f8d713          	srl	a4,a7,0x1f
     dc0:	0016d693          	srl	a3,a3,0x1
     dc4:	00e66733          	or	a4,a2,a4
     dc8:	00189893          	sll	a7,a7,0x1
     dcc:	fc069ae3          	bnez	a3,da0 <__muldi3+0x28>
     dd0:	00058663          	beqz	a1,ddc <__muldi3+0x64>
     dd4:	f81ff0ef          	jal	d54 <__mulsi3>
     dd8:	00a787b3          	add	a5,a5,a0
     ddc:	00030a63          	beqz	t1,df0 <__muldi3+0x78>
     de0:	000e0513          	mv	a0,t3
     de4:	00030593          	mv	a1,t1
     de8:	f6dff0ef          	jal	d54 <__mulsi3>
     dec:	00f507b3          	add	a5,a0,a5
     df0:	00c12083          	lw	ra,12(sp)
     df4:	00080513          	mv	a0,a6
     df8:	00078593          	mv	a1,a5
     dfc:	01010113          	add	sp,sp,16
     e00:	00008067          	ret

00000e04 <__divsi3>:
     e04:	06054063          	bltz	a0,e64 <__umodsi3+0x10>
     e08:	0605c663          	bltz	a1,e74 <__umodsi3+0x20>

00000e0c <__hidden___udivsi3>:
     e0c:	00058613          	mv	a2,a1
     e10:	00050593          	mv	a1,a0
     e14:	fff00513          	li	a0,-1
     e18:	02060c63          	beqz	a2,e50 <__hidden___udivsi3+0x44>
     e1c:	00100693          	li	a3,1
     e20:	00b67a63          	bgeu	a2,a1,e34 <__hidden___udivsi3+0x28>
     e24:	00c05863          	blez	a2,e34 <__hidden___udivsi3+0x28>
     e28:	00161613          	sll	a2,a2,0x1
     e2c:	00169693          	sll	a3,a3,0x1
     e30:	feb66ae3          	bltu	a2,a1,e24 <__hidden___udivsi3+0x18>
     e34:	00000513          	li	a0,0
     e38:	00c5e663          	bltu	a1,a2,e44 <__hidden___udivsi3+0x38>
     e3c:	40c585b3          	sub	a1,a1,a2
     e40:	00d56533          	or	a0,a0,a3
     e44:	0016d693          	srl	a3,a3,0x1
     e48:	00165613          	srl	a2,a2,0x1
     e4c:	fe0696e3          	bnez	a3,e38 <__hidden___udivsi3+0x2c>
     e50:	00008067          	ret

00000e54 <__umodsi3>:
     e54:	00008293          	mv	t0,ra
     e58:	fb5ff0ef          	jal	e0c <__hidden___udivsi3>
     e5c:	00058513          	mv	a0,a1
     e60:	00028067          	jr	t0
     e64:	40a00533          	neg	a0,a0
     e68:	00b04863          	bgtz	a1,e78 <__umodsi3+0x24>
     e6c:	40b005b3          	neg	a1,a1
     e70:	f9dff06f          	j	e0c <__hidden___udivsi3>
     e74:	40b005b3          	neg	a1,a1
     e78:	00008293          	mv	t0,ra
     e7c:	f91ff0ef          	jal	e0c <__hidden___udivsi3>
     e80:	40a00533          	neg	a0,a0
     e84:	00028067          	jr	t0

00000e88 <__modsi3>:
     e88:	00008293          	mv	t0,ra
     e8c:	0005ca63          	bltz	a1,ea0 <__modsi3+0x18>
     e90:	00054c63          	bltz	a0,ea8 <__modsi3+0x20>
     e94:	f79ff0ef          	jal	e0c <__hidden___udivsi3>
     e98:	00058513          	mv	a0,a1
     e9c:	00028067          	jr	t0
     ea0:	40b005b3          	neg	a1,a1
     ea4:	fe0558e3          	bgez	a0,e94 <__modsi3+0xc>
     ea8:	40a00533          	neg	a0,a0
     eac:	f61ff0ef          	jal	e0c <__hidden___udivsi3>
     eb0:	40b00533          	neg	a0,a1
     eb4:	00028067          	jr	t0

00000eb8 <memcpy>:
     eb8:	00a5c7b3          	xor	a5,a1,a0
     ebc:	0037f793          	and	a5,a5,3
     ec0:	00c508b3          	add	a7,a0,a2
     ec4:	06079463          	bnez	a5,f2c <memcpy+0x74>
     ec8:	00300793          	li	a5,3
     ecc:	06c7f063          	bgeu	a5,a2,f2c <memcpy+0x74>
     ed0:	00357793          	and	a5,a0,3
     ed4:	00050713          	mv	a4,a0
     ed8:	06079a63          	bnez	a5,f4c <memcpy+0x94>
     edc:	ffc8f613          	and	a2,a7,-4
     ee0:	40e606b3          	sub	a3,a2,a4
     ee4:	02000793          	li	a5,32
     ee8:	08d7ce63          	blt	a5,a3,f84 <memcpy+0xcc>
     eec:	00058693          	mv	a3,a1
     ef0:	00070793          	mv	a5,a4
     ef4:	02c77863          	bgeu	a4,a2,f24 <memcpy+0x6c>
     ef8:	0006a803          	lw	a6,0(a3)
     efc:	00478793          	add	a5,a5,4 # 20000004 <__crt0_copy_data_src_begin+0x1fffef90>
     f00:	00468693          	add	a3,a3,4
     f04:	ff07ae23          	sw	a6,-4(a5)
     f08:	fec7e8e3          	bltu	a5,a2,ef8 <memcpy+0x40>
     f0c:	fff60793          	add	a5,a2,-1 # fffffff <__crt0_copy_data_src_begin+0xfffef8b>
     f10:	40e787b3          	sub	a5,a5,a4
     f14:	ffc7f793          	and	a5,a5,-4
     f18:	00478793          	add	a5,a5,4
     f1c:	00f70733          	add	a4,a4,a5
     f20:	00f585b3          	add	a1,a1,a5
     f24:	01176863          	bltu	a4,a7,f34 <memcpy+0x7c>
     f28:	00008067          	ret
     f2c:	00050713          	mv	a4,a0
     f30:	05157863          	bgeu	a0,a7,f80 <memcpy+0xc8>
     f34:	0005c783          	lbu	a5,0(a1)
     f38:	00170713          	add	a4,a4,1
     f3c:	00158593          	add	a1,a1,1
     f40:	fef70fa3          	sb	a5,-1(a4)
     f44:	fee898e3          	bne	a7,a4,f34 <memcpy+0x7c>
     f48:	00008067          	ret
     f4c:	0005c683          	lbu	a3,0(a1)
     f50:	00170713          	add	a4,a4,1
     f54:	00377793          	and	a5,a4,3
     f58:	fed70fa3          	sb	a3,-1(a4)
     f5c:	00158593          	add	a1,a1,1
     f60:	f6078ee3          	beqz	a5,edc <memcpy+0x24>
     f64:	0005c683          	lbu	a3,0(a1)
     f68:	00170713          	add	a4,a4,1
     f6c:	00377793          	and	a5,a4,3
     f70:	fed70fa3          	sb	a3,-1(a4)
     f74:	00158593          	add	a1,a1,1
     f78:	fc079ae3          	bnez	a5,f4c <memcpy+0x94>
     f7c:	f61ff06f          	j	edc <memcpy+0x24>
     f80:	00008067          	ret
     f84:	ff010113          	add	sp,sp,-16
     f88:	00812623          	sw	s0,12(sp)
     f8c:	02000413          	li	s0,32
     f90:	0005a383          	lw	t2,0(a1)
     f94:	0045a283          	lw	t0,4(a1)
     f98:	0085af83          	lw	t6,8(a1)
     f9c:	00c5af03          	lw	t5,12(a1)
     fa0:	0105ae83          	lw	t4,16(a1)
     fa4:	0145ae03          	lw	t3,20(a1)
     fa8:	0185a303          	lw	t1,24(a1)
     fac:	01c5a803          	lw	a6,28(a1)
     fb0:	0205a683          	lw	a3,32(a1)
     fb4:	02470713          	add	a4,a4,36
     fb8:	40e607b3          	sub	a5,a2,a4
     fbc:	fc772e23          	sw	t2,-36(a4)
     fc0:	fe572023          	sw	t0,-32(a4)
     fc4:	fff72223          	sw	t6,-28(a4)
     fc8:	ffe72423          	sw	t5,-24(a4)
     fcc:	ffd72623          	sw	t4,-20(a4)
     fd0:	ffc72823          	sw	t3,-16(a4)
     fd4:	fe672a23          	sw	t1,-12(a4)
     fd8:	ff072c23          	sw	a6,-8(a4)
     fdc:	fed72e23          	sw	a3,-4(a4)
     fe0:	02458593          	add	a1,a1,36
     fe4:	faf446e3          	blt	s0,a5,f90 <memcpy+0xd8>
     fe8:	00058693          	mv	a3,a1
     fec:	00070793          	mv	a5,a4
     ff0:	02c77863          	bgeu	a4,a2,1020 <memcpy+0x168>
     ff4:	0006a803          	lw	a6,0(a3)
     ff8:	00478793          	add	a5,a5,4
     ffc:	00468693          	add	a3,a3,4
    1000:	ff07ae23          	sw	a6,-4(a5)
    1004:	fec7e8e3          	bltu	a5,a2,ff4 <memcpy+0x13c>
    1008:	fff60793          	add	a5,a2,-1
    100c:	40e787b3          	sub	a5,a5,a4
    1010:	ffc7f793          	and	a5,a5,-4
    1014:	00478793          	add	a5,a5,4
    1018:	00f70733          	add	a4,a4,a5
    101c:	00f585b3          	add	a1,a1,a5
    1020:	01176863          	bltu	a4,a7,1030 <memcpy+0x178>
    1024:	00c12403          	lw	s0,12(sp)
    1028:	01010113          	add	sp,sp,16
    102c:	00008067          	ret
    1030:	0005c783          	lbu	a5,0(a1)
    1034:	00170713          	add	a4,a4,1
    1038:	00158593          	add	a1,a1,1
    103c:	fef70fa3          	sb	a5,-1(a4)
    1040:	fee882e3          	beq	a7,a4,1024 <memcpy+0x16c>
    1044:	0005c783          	lbu	a5,0(a1)
    1048:	00170713          	add	a4,a4,1
    104c:	00158593          	add	a1,a1,1
    1050:	fef70fa3          	sb	a5,-1(a4)
    1054:	fce89ee3          	bne	a7,a4,1030 <memcpy+0x178>
    1058:	fcdff06f          	j	1024 <memcpy+0x16c>
