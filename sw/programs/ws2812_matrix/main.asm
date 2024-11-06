
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
  18:	0d450513          	add	a0,a0,212 # e8 <__crt0_dummy_trap_handler>
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
  80:	80000597          	auipc	a1,0x80000
  84:	f8058593          	add	a1,a1,-128 # 80000000 <addresses>
  88:	90018613          	add	a2,gp,-1792 # 80000100 <__BSS_END__>

0000008c <__crt0_clear_bss_loop>:
  8c:	00c5d863          	bge	a1,a2,9c <__crt0_clear_bss_loop_end>
  90:	00058023          	sb	zero,0(a1)
  94:	00158593          	add	a1,a1,1
  98:	ff5ff06f          	j	8c <__crt0_clear_bss_loop>

0000009c <__crt0_clear_bss_loop_end>:
  9c:	00000597          	auipc	a1,0x0
  a0:	16c58593          	add	a1,a1,364 # 208 <__crt0_copy_data_src_begin>
  a4:	80000617          	auipc	a2,0x80000
  a8:	f5c60613          	add	a2,a2,-164 # 80000000 <addresses>
  ac:	80000697          	auipc	a3,0x80000
  b0:	f5468693          	add	a3,a3,-172 # 80000000 <addresses>

000000b4 <__crt0_copy_data_loop>:
  b4:	00d65c63          	bge	a2,a3,cc <__crt0_copy_data_loop_end>
  b8:	00058703          	lb	a4,0(a1)
  bc:	00e60023          	sb	a4,0(a2)
  c0:	00158593          	add	a1,a1,1
  c4:	00160613          	add	a2,a2,1
  c8:	fedff06f          	j	b4 <__crt0_copy_data_loop>

000000cc <__crt0_copy_data_loop_end>:
  cc:	00000513          	li	a0,0
  d0:	00000593          	li	a1,0
  d4:	060000ef          	jal	134 <main>

000000d8 <__crt0_main_aftermath>:
  d8:	34051073          	.insn	4, 0x34051073

000000dc <__crt0_main_aftermath_end>:
  dc:	30047073          	.insn	4, 0x30047073

000000e0 <__crt0_main_aftermath_end_loop>:
  e0:	10500073          	wfi
  e4:	ffdff06f          	j	e0 <__crt0_main_aftermath_end_loop>

000000e8 <__crt0_dummy_trap_handler>:
  e8:	ff810113          	add	sp,sp,-8
  ec:	00812023          	sw	s0,0(sp)
  f0:	00912223          	sw	s1,4(sp)
  f4:	34202473          	.insn	4, 0x34202473
  f8:	02044663          	bltz	s0,124 <__crt0_dummy_trap_handler_irq>
  fc:	34102473          	.insn	4, 0x34102473

00000100 <__crt0_dummy_trap_handler_exc_c_check>:
 100:	00041483          	lh	s1,0(s0)
 104:	0034f493          	and	s1,s1,3
 108:	00240413          	add	s0,s0,2
 10c:	34141073          	.insn	4, 0x34141073
 110:	00300413          	li	s0,3
 114:	00941863          	bne	s0,s1,124 <__crt0_dummy_trap_handler_irq>

00000118 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 118:	34102473          	.insn	4, 0x34102473
 11c:	00240413          	add	s0,s0,2
 120:	34141073          	.insn	4, 0x34141073

00000124 <__crt0_dummy_trap_handler_irq>:
 124:	00012403          	lw	s0,0(sp)
 128:	00412483          	lw	s1,4(sp)
 12c:	00810113          	add	sp,sp,8
 130:	30200073          	mret

00000134 <main>:
#include <neorv32_iceduino.h>

int main() {
 134:	ff010113          	add	sp,sp,-16
 138:	00112623          	sw	ra,12(sp)
 13c:	00812423          	sw	s0,8(sp)
 140:	00912223          	sw	s1,4(sp)
    uint8_t red;
    uint8_t green;
    uint8_t blue;

    iceduino_ws2812_init();
 144:	060000ef          	jal	1a4 <iceduino_ws2812_init>
    iceduino_ws2812_set(0, 0, 0 ,50);
 148:	03200693          	li	a3,50
 14c:	00000613          	li	a2,0
 150:	00000593          	li	a1,0
 154:	00000513          	li	a0,0
 158:	07c000ef          	jal	1d4 <iceduino_ws2812_set>
    for(int i = 0; i < 64; i++){
 15c:	00000413          	li	s0,0
 160:	04000493          	li	s1,64
        red = i*2;
 164:	0ff47513          	zext.b	a0,s0
        
        iceduino_ws2812_set(i, i*2, i*-2 ,i*4);
 168:	00151593          	sll	a1,a0,0x1
 16c:	0ff5f593          	zext.b	a1,a1
 170:	00251693          	sll	a3,a0,0x2
 174:	40b00633          	neg	a2,a1
 178:	0fc6f693          	and	a3,a3,252
 17c:	0ff67613          	zext.b	a2,a2
    for(int i = 0; i < 64; i++){
 180:	00140413          	add	s0,s0,1
        iceduino_ws2812_set(i, i*2, i*-2 ,i*4);
 184:	050000ef          	jal	1d4 <iceduino_ws2812_set>
    for(int i = 0; i < 64; i++){
 188:	fc941ee3          	bne	s0,s1,164 <main+0x30>
    }
    return 0;
}
 18c:	00c12083          	lw	ra,12(sp)
 190:	00812403          	lw	s0,8(sp)
 194:	00412483          	lw	s1,4(sp)
 198:	00000513          	li	a0,0
 19c:	01010113          	add	sp,sp,16
 1a0:	00008067          	ret

000001a4 <iceduino_ws2812_init>:
volatile uint32_t* addresses[NUM_ADDRESSES];

#define WORD_SIZE 4 // Assuming a 32-bit word size

void iceduino_ws2812_init() {
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
 1a4:	80000737          	lui	a4,0x80000
void iceduino_ws2812_init() {
 1a8:	f00007b7          	lui	a5,0xf0000
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
 1ac:	f00006b7          	lui	a3,0xf0000
 1b0:	00070713          	mv	a4,a4
void iceduino_ws2812_init() {
 1b4:	10078793          	add	a5,a5,256 # f0000100 <__global_pointer$+0x6ffff900>
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
 1b8:	20068693          	add	a3,a3,512 # f0000200 <__global_pointer$+0x6ffffa00>
        addresses[i] = (volatile uint32_t*)(ICEDUINO_WS2812_BASE + (i * WORD_SIZE));
 1bc:	00f72023          	sw	a5,0(a4) # 80000000 <addresses>
        *addresses[i] = 0; // Optionally initialize to 0 or some default value
 1c0:	0007a023          	sw	zero,0(a5)
    for (uint32_t i = 0; i < NUM_ADDRESSES; i++) {
 1c4:	00478793          	add	a5,a5,4
 1c8:	00470713          	add	a4,a4,4
 1cc:	fed798e3          	bne	a5,a3,1bc <iceduino_ws2812_init+0x18>
    }
}
 1d0:	00008067          	ret

000001d4 <iceduino_ws2812_set>:


//set one led
void iceduino_ws2812_set(uint8_t led_index, uint8_t r, uint8_t g, uint8_t b) {
    if (led_index >= NUM_ADDRESSES){
 1d4:	03f00793          	li	a5,63
 1d8:	02a7e663          	bltu	a5,a0,204 <iceduino_ws2812_set+0x30>
        return;
    }
  *addresses[led_index] =  ((b << 16) | (g << 8)| b ); 
 1dc:	800007b7          	lui	a5,0x80000
 1e0:	00251513          	sll	a0,a0,0x2
 1e4:	00078793          	mv	a5,a5
 1e8:	00a787b3          	add	a5,a5,a0
 1ec:	0007a783          	lw	a5,0(a5) # 80000000 <addresses>
 1f0:	00861613          	sll	a2,a2,0x8
 1f4:	00d66633          	or	a2,a2,a3
 1f8:	01069693          	sll	a3,a3,0x10
 1fc:	00d66633          	or	a2,a2,a3
 200:	00c7a023          	sw	a2,0(a5)
}
 204:	00008067          	ret
