
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
   4:	80000117          	auipc	sp,0x80000
   8:	7f810113          	addi	sp,sp,2040 # 800007fc <__crt0_stack_begin>
   c:	80000197          	auipc	gp,0x80000
  10:	7f418193          	addi	gp,gp,2036 # 80000800 <__global_pointer$>

00000014 <__crt0_cpu_csr_init>:
  14:	00000517          	auipc	a0,0x0
  18:	0cc50513          	addi	a0,a0,204 # e0 <__crt0_dummy_trap_handler>
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
  68:	d9c40413          	addi	s0,s0,-612 # fffffe00 <__ctr0_io_space_begin>
  6c:	00000497          	auipc	s1,0x0
  70:	f9448493          	addi	s1,s1,-108 # 0 <_start>

00000074 <__crt0_reset_io_loop>:
  74:	00042023          	sw	zero,0(s0)
  78:	00440413          	addi	s0,s0,4
  7c:	fe941ce3          	bne	s0,s1,74 <__crt0_reset_io_loop>

00000080 <__crt0_clear_bss>:
  80:	81018593          	addi	a1,gp,-2032 # 80000010 <__BSS_END__>
  84:	81018613          	addi	a2,gp,-2032 # 80000010 <__BSS_END__>

00000088 <__crt0_clear_bss_loop>:
  88:	00c5d863          	bge	a1,a2,98 <__crt0_clear_bss_loop_end>
  8c:	00058023          	sb	zero,0(a1)
  90:	00158593          	addi	a1,a1,1
  94:	ff5ff06f          	j	88 <__crt0_clear_bss_loop>

00000098 <__crt0_clear_bss_loop_end>:
  98:	00000597          	auipc	a1,0x0
  9c:	21458593          	addi	a1,a1,532 # 2ac <__crt0_copy_data_src_begin>
  a0:	80000617          	auipc	a2,0x80000
  a4:	f6060613          	addi	a2,a2,-160 # 80000000 <chars>
  a8:	81018693          	addi	a3,gp,-2032 # 80000010 <__BSS_END__>

000000ac <__crt0_copy_data_loop>:
  ac:	00d65c63          	bge	a2,a3,c4 <__crt0_copy_data_loop_end>
  b0:	00058703          	lb	a4,0(a1)
  b4:	00e60023          	sb	a4,0(a2)
  b8:	00158593          	addi	a1,a1,1
  bc:	00160613          	addi	a2,a2,1
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
  e0:	ff810113          	addi	sp,sp,-8
  e4:	00812023          	sw	s0,0(sp)
  e8:	00912223          	sw	s1,4(sp)
  ec:	34202473          	.insn	4, 0x34202473
  f0:	02044663          	bltz	s0,11c <__crt0_dummy_trap_handler_irq>
  f4:	34102473          	.insn	4, 0x34102473

000000f8 <__crt0_dummy_trap_handler_exc_c_check>:
  f8:	00041483          	lh	s1,0(s0)
  fc:	0034f493          	andi	s1,s1,3
 100:	00240413          	addi	s0,s0,2
 104:	34141073          	.insn	4, 0x34141073
 108:	00300413          	li	s0,3
 10c:	00941863          	bne	s0,s1,11c <__crt0_dummy_trap_handler_irq>

00000110 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 110:	34102473          	.insn	4, 0x34102473
 114:	00240413          	addi	s0,s0,2
 118:	34141073          	.insn	4, 0x34141073

0000011c <__crt0_dummy_trap_handler_irq>:
 11c:	00012403          	lw	s0,0(sp)
 120:	00412483          	lw	s1,4(sp)
 124:	00810113          	addi	sp,sp,8
 128:	30200073          	mret

0000012c <main>:
#include <neorv32_iceduino.h>

char chars[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

int main() {
 12c:	ff010113          	addi	sp,sp,-16
 130:	00912223          	sw	s1,4(sp)

    while (1) {
        for (int i = 0; i < 16; i++) {
            iceduino_segdisp_set_char(chars[i]);
 134:	800004b7          	lui	s1,0x80000
int main() {
 138:	01212023          	sw	s2,0(sp)
 13c:	00112623          	sw	ra,12(sp)
 140:	00812423          	sw	s0,8(sp)
            iceduino_segdisp_set_char(chars[i]);
 144:	00048493          	mv	s1,s1
        for (int i = 0; i < 16; i++) {
 148:	01000913          	li	s2,16
 14c:	00000413          	li	s0,0
            iceduino_segdisp_set_char(chars[i]);
 150:	009407b3          	add	a5,s0,s1
 154:	0007c503          	lbu	a0,0(a5)
        for (int i = 0; i < 16; i++) {
 158:	00140413          	addi	s0,s0,1
            iceduino_segdisp_set_char(chars[i]);
 15c:	00c000ef          	jal	168 <iceduino_segdisp_set_char>
        for (int i = 0; i < 16; i++) {
 160:	ff2418e3          	bne	s0,s2,150 <main+0x24>
 164:	fe9ff06f          	j	14c <main+0x20>

00000168 <iceduino_segdisp_set_char>:
#include "neorv32_iceduino.h"

//set segment port (0-7)
void iceduino_segdisp_set_char(char ch) {
  if ((ch < '0' || ch > '9') && (ch < 'a' || ch > 'f')) {
 168:	fd050793          	addi	a5,a0,-48
 16c:	0ff7f793          	zext.b	a5,a5
 170:	00900713          	li	a4,9
 174:	00f77c63          	bgeu	a4,a5,18c <iceduino_segdisp_set_char+0x24>
 178:	f9f50793          	addi	a5,a0,-97
 17c:	0ff7f793          	zext.b	a5,a5
 180:	00500713          	li	a4,5
 184:	02f77a63          	bgeu	a4,a5,1b8 <iceduino_segdisp_set_char+0x50>
 188:	00008067          	ret
    return; // Character is not in the valid range ('0' to 'f')
  }
  
  switch (ch) {
 18c:	fcf50513          	addi	a0,a0,-49
 190:	0ff57513          	zext.b	a0,a0
 194:	00800793          	li	a5,8
 198:	04a7e663          	bltu	a5,a0,1e4 <iceduino_segdisp_set_char+0x7c>
 19c:	27400793          	li	a5,628
 1a0:	00251513          	slli	a0,a0,0x2
 1a4:	00f50533          	add	a0,a0,a5
 1a8:	00052703          	lw	a4,0(a0)
 1ac:	f00007b7          	lui	a5,0xf0000
 1b0:	01878793          	addi	a5,a5,24 # f0000018 <__global_pointer$+0x6ffff818>
 1b4:	00070067          	jr	a4
 1b8:	f9e50513          	addi	a0,a0,-98
 1bc:	0ff57513          	zext.b	a0,a0
 1c0:	00400793          	li	a5,4
 1c4:	06a7ec63          	bltu	a5,a0,23c <iceduino_segdisp_set_char+0xd4>
 1c8:	29800793          	li	a5,664
 1cc:	00251513          	slli	a0,a0,0x2
 1d0:	00f50533          	add	a0,a0,a5
 1d4:	00052703          	lw	a4,0(a0)
 1d8:	f00007b7          	lui	a5,0xf0000
 1dc:	01878793          	addi	a5,a5,24 # f0000018 <__global_pointer$+0x6ffff818>
 1e0:	00070067          	jr	a4
    case '0': 
      ICEDUINO_SEGDISP = (uint8_t) 0x0; 
 1e4:	f00007b7          	lui	a5,0xf0000
 1e8:	00078c23          	sb	zero,24(a5) # f0000018 <__global_pointer$+0x6ffff818>
 1ec:	00008067          	ret
      break;
    case '1': 
      ICEDUINO_SEGDISP = (uint8_t) 0x1;
 1f0:	00100713          	li	a4,1
      break; 
    case 'e': 
      ICEDUINO_SEGDISP = (uint8_t) 0xe;
      break; 
    case 'f': 
      ICEDUINO_SEGDISP = (uint8_t) 0xf;
 1f4:	00e78023          	sb	a4,0(a5)
      break; 
  }
}
 1f8:	00008067          	ret
      ICEDUINO_SEGDISP = (uint8_t) 0x2;
 1fc:	00200713          	li	a4,2
 200:	ff5ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x3;
 204:	00300713          	li	a4,3
 208:	fedff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x4;
 20c:	00400713          	li	a4,4
 210:	fe5ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x5;
 214:	00500713          	li	a4,5
 218:	fddff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x6;
 21c:	00600713          	li	a4,6
 220:	fd5ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x7;
 224:	00700713          	li	a4,7
 228:	fcdff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x8;
 22c:	00800713          	li	a4,8
 230:	fc5ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0x9;
 234:	00900713          	li	a4,9
 238:	fbdff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0xa;
 23c:	f00007b7          	lui	a5,0xf0000
 240:	00a00713          	li	a4,10
 244:	00e78c23          	sb	a4,24(a5) # f0000018 <__global_pointer$+0x6ffff818>
      break; 
 248:	00008067          	ret
      ICEDUINO_SEGDISP = (uint8_t) 0xb;
 24c:	00b00713          	li	a4,11
 250:	fa5ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0xc;
 254:	00c00713          	li	a4,12
 258:	f9dff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0xd;
 25c:	00d00713          	li	a4,13
 260:	f95ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0xe;
 264:	00e00713          	li	a4,14
 268:	f8dff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
      ICEDUINO_SEGDISP = (uint8_t) 0xf;
 26c:	00f00713          	li	a4,15
 270:	f85ff06f          	j	1f4 <iceduino_segdisp_set_char+0x8c>
