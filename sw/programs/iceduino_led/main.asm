
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__ctr0_io_space_end>:
   0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
   4:	80000117          	auipc	sp,0x80000
   8:	7f810113          	add	sp,sp,2040 # 800007fc <__crt0_stack_begin>
   c:	80000197          	auipc	gp,0x80000
  10:	7f418193          	add	gp,gp,2036 # 80000800 <__global_pointer$>

00000014 <__crt0_cpu_csr_init>:
  14:	00000517          	auipc	a0,0x0
  18:	0d850513          	add	a0,a0,216 # ec <__crt0_dummy_trap_handler>
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
  70:	f9448493          	add	s1,s1,-108 # 0 <__ctr0_io_space_end>

00000074 <__crt0_reset_io_loop>:
  74:	00042023          	sw	zero,0(s0)
  78:	00440413          	add	s0,s0,4
  7c:	fe941ce3          	bne	s0,s1,74 <__crt0_reset_io_loop>

00000080 <__crt0_clear_bss>:
  80:	80000597          	auipc	a1,0x80000
  84:	f8058593          	add	a1,a1,-128 # 80000000 <__BSS_END__>
  88:	80000617          	auipc	a2,0x80000
  8c:	f7860613          	add	a2,a2,-136 # 80000000 <__BSS_END__>

00000090 <__crt0_clear_bss_loop>:
  90:	00c5d863          	bge	a1,a2,a0 <__crt0_clear_bss_loop_end>
  94:	00058023          	sb	zero,0(a1)
  98:	00158593          	add	a1,a1,1
  9c:	ff5ff06f          	j	90 <__crt0_clear_bss_loop>

000000a0 <__crt0_clear_bss_loop_end>:
  a0:	00000597          	auipc	a1,0x0
  a4:	2ac58593          	add	a1,a1,684 # 34c <__crt0_copy_data_src_begin>
  a8:	80000617          	auipc	a2,0x80000
  ac:	f5860613          	add	a2,a2,-168 # 80000000 <__BSS_END__>
  b0:	80000697          	auipc	a3,0x80000
  b4:	f5068693          	add	a3,a3,-176 # 80000000 <__BSS_END__>

000000b8 <__crt0_copy_data_loop>:
  b8:	00d65c63          	bge	a2,a3,d0 <__crt0_copy_data_loop_end>
  bc:	00058703          	lb	a4,0(a1)
  c0:	00e60023          	sb	a4,0(a2)
  c4:	00158593          	add	a1,a1,1
  c8:	00160613          	add	a2,a2,1
  cc:	fedff06f          	j	b8 <__crt0_copy_data_loop>

000000d0 <__crt0_copy_data_loop_end>:
  d0:	00000513          	li	a0,0
  d4:	00000593          	li	a1,0
  d8:	060000ef          	jal	138 <main>

000000dc <__crt0_main_aftermath>:
  dc:	34051073          	.insn	4, 0x34051073

000000e0 <__crt0_main_aftermath_end>:
  e0:	30047073          	.insn	4, 0x30047073

000000e4 <__crt0_main_aftermath_end_loop>:
  e4:	10500073          	wfi
  e8:	ffdff06f          	j	e4 <__crt0_main_aftermath_end_loop>

000000ec <__crt0_dummy_trap_handler>:
  ec:	ff810113          	add	sp,sp,-8
  f0:	00812023          	sw	s0,0(sp)
  f4:	00912223          	sw	s1,4(sp)
  f8:	34202473          	.insn	4, 0x34202473
  fc:	02044663          	bltz	s0,128 <__crt0_dummy_trap_handler_irq>
 100:	34102473          	.insn	4, 0x34102473

00000104 <__crt0_dummy_trap_handler_exc_c_check>:
 104:	00041483          	lh	s1,0(s0)
 108:	0034f493          	and	s1,s1,3
 10c:	00240413          	add	s0,s0,2
 110:	34141073          	.insn	4, 0x34141073
 114:	00300413          	li	s0,3
 118:	00941863          	bne	s0,s1,128 <__crt0_dummy_trap_handler_irq>

0000011c <__crt0_dummy_trap_handler_exc_uncrompressed>:
 11c:	34102473          	.insn	4, 0x34102473
 120:	00240413          	add	s0,s0,2
 124:	34141073          	.insn	4, 0x34141073

00000128 <__crt0_dummy_trap_handler_irq>:
 128:	00012403          	lw	s0,0(sp)
 12c:	00412483          	lw	s1,4(sp)
 130:	00810113          	add	sp,sp,8
 134:	30200073          	mret

00000138 <main>:
#include <neorv32_iceduino.h>


int main() {
 138:	ff010113          	add	sp,sp,-16
 13c:	00812423          	sw	s0,8(sp)
 140:	00112623          	sw	ra,12(sp)

  iceduino_led_clr();

  int cnt = 0;
 144:	00000413          	li	s0,0
  iceduino_led_clr();
 148:	02c000ef          	jal	174 <iceduino_led_clr>

  while (1) {
    iceduino_led_set(cnt & 0xFF);
 14c:	0ff47513          	zext.b	a0,s0
 150:	014000ef          	jal	164 <iceduino_led_set>
    neorv32_cpu_delay_ms(100);
 154:	06400513          	li	a0,100
 158:	028000ef          	jal	180 <neorv32_cpu_delay_ms>
    cnt++;
 15c:	00140413          	add	s0,s0,1
  while (1) {
 160:	fedff06f          	j	14c <main+0x14>

00000164 <iceduino_led_set>:
#include "neorv32_iceduino.h"

//set led port (0-7)
void iceduino_led_set(int value) {
  ICEDUINO_LED = (uint8_t) value;
 164:	0ff57513          	zext.b	a0,a0
 168:	f00007b7          	lui	a5,0xf0000
 16c:	00a78023          	sb	a0,0(a5) # f0000000 <__global_pointer$+0x6ffff800>
}
 170:	00008067          	ret

00000174 <iceduino_led_clr>:

//clear output
void iceduino_led_clr() {  
  ICEDUINO_LED = 0x00000000;
 174:	f00007b7          	lui	a5,0xf0000
 178:	00078023          	sb	zero,0(a5) # f0000000 <__global_pointer$+0x6ffff800>
}
 17c:	00008067          	ret

00000180 <neorv32_cpu_delay_ms>:
 180:	fe010113          	add	sp,sp,-32
 184:	00112e23          	sw	ra,28(sp)
 188:	00050613          	mv	a2,a0
 18c:	00055863          	bgez	a0,19c <neorv32_cpu_delay_ms+0x1c>
 190:	40a00633          	neg	a2,a0
 194:	01061613          	sll	a2,a2,0x10
 198:	41065613          	sra	a2,a2,0x10
 19c:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 1a0:	3e800593          	li	a1,1000
 1a4:	00c12623          	sw	a2,12(sp)
 1a8:	0f8000ef          	jal	2a0 <__hidden___udivsi3>
 1ac:	00c12603          	lw	a2,12(sp)
 1b0:	00000593          	li	a1,0
 1b4:	41f65693          	sra	a3,a2,0x1f
 1b8:	054000ef          	jal	20c <__muldi3>
 1bc:	01c59593          	sll	a1,a1,0x1c
 1c0:	00455513          	srl	a0,a0,0x4
 1c4:	00a5e533          	or	a0,a1,a0

000001c8 <__neorv32_cpu_delay_ms_start>:
 1c8:	00050a63          	beqz	a0,1dc <__neorv32_cpu_delay_ms_end>
 1cc:	00050863          	beqz	a0,1dc <__neorv32_cpu_delay_ms_end>
 1d0:	fff50513          	add	a0,a0,-1
 1d4:	00000013          	nop
 1d8:	ff1ff06f          	j	1c8 <__neorv32_cpu_delay_ms_start>

000001dc <__neorv32_cpu_delay_ms_end>:
 1dc:	01c12083          	lw	ra,28(sp)
 1e0:	02010113          	add	sp,sp,32
 1e4:	00008067          	ret

000001e8 <__mulsi3>:
 1e8:	00050613          	mv	a2,a0
 1ec:	00000513          	li	a0,0
 1f0:	0015f693          	and	a3,a1,1
 1f4:	00068463          	beqz	a3,1fc <__mulsi3+0x14>
 1f8:	00c50533          	add	a0,a0,a2
 1fc:	0015d593          	srl	a1,a1,0x1
 200:	00161613          	sll	a2,a2,0x1
 204:	fe0596e3          	bnez	a1,1f0 <__mulsi3+0x8>
 208:	00008067          	ret

0000020c <__muldi3>:
 20c:	00050e13          	mv	t3,a0
 210:	ff010113          	add	sp,sp,-16
 214:	00068313          	mv	t1,a3
 218:	00112623          	sw	ra,12(sp)
 21c:	00060513          	mv	a0,a2
 220:	000e0893          	mv	a7,t3
 224:	00060693          	mv	a3,a2
 228:	00000713          	li	a4,0
 22c:	00000793          	li	a5,0
 230:	00000813          	li	a6,0
 234:	0016fe93          	and	t4,a3,1
 238:	00171613          	sll	a2,a4,0x1
 23c:	000e8a63          	beqz	t4,250 <__muldi3+0x44>
 240:	01088833          	add	a6,a7,a6
 244:	00e787b3          	add	a5,a5,a4
 248:	01183733          	sltu	a4,a6,a7
 24c:	00f707b3          	add	a5,a4,a5
 250:	01f8d713          	srl	a4,a7,0x1f
 254:	0016d693          	srl	a3,a3,0x1
 258:	00e66733          	or	a4,a2,a4
 25c:	00189893          	sll	a7,a7,0x1
 260:	fc069ae3          	bnez	a3,234 <__muldi3+0x28>
 264:	00058663          	beqz	a1,270 <__muldi3+0x64>
 268:	f81ff0ef          	jal	1e8 <__mulsi3>
 26c:	00a787b3          	add	a5,a5,a0
 270:	00030a63          	beqz	t1,284 <__muldi3+0x78>
 274:	000e0513          	mv	a0,t3
 278:	00030593          	mv	a1,t1
 27c:	f6dff0ef          	jal	1e8 <__mulsi3>
 280:	00f507b3          	add	a5,a0,a5
 284:	00c12083          	lw	ra,12(sp)
 288:	00080513          	mv	a0,a6
 28c:	00078593          	mv	a1,a5
 290:	01010113          	add	sp,sp,16
 294:	00008067          	ret

00000298 <__divsi3>:
 298:	06054063          	bltz	a0,2f8 <__umodsi3+0x10>
 29c:	0605c663          	bltz	a1,308 <__umodsi3+0x20>

000002a0 <__hidden___udivsi3>:
 2a0:	00058613          	mv	a2,a1
 2a4:	00050593          	mv	a1,a0
 2a8:	fff00513          	li	a0,-1
 2ac:	02060c63          	beqz	a2,2e4 <__hidden___udivsi3+0x44>
 2b0:	00100693          	li	a3,1
 2b4:	00b67a63          	bgeu	a2,a1,2c8 <__hidden___udivsi3+0x28>
 2b8:	00c05863          	blez	a2,2c8 <__hidden___udivsi3+0x28>
 2bc:	00161613          	sll	a2,a2,0x1
 2c0:	00169693          	sll	a3,a3,0x1
 2c4:	feb66ae3          	bltu	a2,a1,2b8 <__hidden___udivsi3+0x18>
 2c8:	00000513          	li	a0,0
 2cc:	00c5e663          	bltu	a1,a2,2d8 <__hidden___udivsi3+0x38>
 2d0:	40c585b3          	sub	a1,a1,a2
 2d4:	00d56533          	or	a0,a0,a3
 2d8:	0016d693          	srl	a3,a3,0x1
 2dc:	00165613          	srl	a2,a2,0x1
 2e0:	fe0696e3          	bnez	a3,2cc <__hidden___udivsi3+0x2c>
 2e4:	00008067          	ret

000002e8 <__umodsi3>:
 2e8:	00008293          	mv	t0,ra
 2ec:	fb5ff0ef          	jal	2a0 <__hidden___udivsi3>
 2f0:	00058513          	mv	a0,a1
 2f4:	00028067          	jr	t0
 2f8:	40a00533          	neg	a0,a0
 2fc:	00b04863          	bgtz	a1,30c <__umodsi3+0x24>
 300:	40b005b3          	neg	a1,a1
 304:	f9dff06f          	j	2a0 <__hidden___udivsi3>
 308:	40b005b3          	neg	a1,a1
 30c:	00008293          	mv	t0,ra
 310:	f91ff0ef          	jal	2a0 <__hidden___udivsi3>
 314:	40a00533          	neg	a0,a0
 318:	00028067          	jr	t0

0000031c <__modsi3>:
 31c:	00008293          	mv	t0,ra
 320:	0005ca63          	bltz	a1,334 <__modsi3+0x18>
 324:	00054c63          	bltz	a0,33c <__modsi3+0x20>
 328:	f79ff0ef          	jal	2a0 <__hidden___udivsi3>
 32c:	00058513          	mv	a0,a1
 330:	00028067          	jr	t0
 334:	40b005b3          	neg	a1,a1
 338:	fe0558e3          	bgez	a0,328 <__modsi3+0xc>
 33c:	40a00533          	neg	a0,a0
 340:	f61ff0ef          	jal	2a0 <__hidden___udivsi3>
 344:	40b00533          	neg	a0,a1
 348:	00028067          	jr	t0
