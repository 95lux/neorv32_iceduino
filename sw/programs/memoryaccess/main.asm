
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
  18:	0d450513          	addi	a0,a0,212 # e8 <__crt0_dummy_trap_handler>
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
  80:	80000597          	auipc	a1,0x80000
  84:	f8058593          	addi	a1,a1,-128 # 80000000 <value3>
  88:	89018613          	addi	a2,gp,-1904 # 80000090 <__BSS_END__>

0000008c <__crt0_clear_bss_loop>:
  8c:	00c5d863          	bge	a1,a2,9c <__crt0_clear_bss_loop_end>
  90:	00058023          	sb	zero,0(a1)
  94:	00158593          	addi	a1,a1,1
  98:	ff5ff06f          	j	8c <__crt0_clear_bss_loop>

0000009c <__crt0_clear_bss_loop_end>:
  9c:	00000597          	auipc	a1,0x0
  a0:	12858593          	addi	a1,a1,296 # 1c4 <__crt0_copy_data_src_begin>
  a4:	80000617          	auipc	a2,0x80000
  a8:	f5c60613          	addi	a2,a2,-164 # 80000000 <value3>
  ac:	80000697          	auipc	a3,0x80000
  b0:	f5468693          	addi	a3,a3,-172 # 80000000 <value3>

000000b4 <__crt0_copy_data_loop>:
  b4:	00d65c63          	bge	a2,a3,cc <__crt0_copy_data_loop_end>
  b8:	00058703          	lb	a4,0(a1)
  bc:	00e60023          	sb	a4,0(a2)
  c0:	00158593          	addi	a1,a1,1
  c4:	00160613          	addi	a2,a2,1
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
  e8:	ff810113          	addi	sp,sp,-8
  ec:	00812023          	sw	s0,0(sp)
  f0:	00912223          	sw	s1,4(sp)
  f4:	34202473          	.insn	4, 0x34202473
  f8:	02044663          	bltz	s0,124 <__crt0_dummy_trap_handler_irq>
  fc:	34102473          	.insn	4, 0x34102473

00000100 <__crt0_dummy_trap_handler_exc_c_check>:
 100:	00041483          	lh	s1,0(s0)
 104:	0034f493          	andi	s1,s1,3
 108:	00240413          	addi	s0,s0,2
 10c:	34141073          	.insn	4, 0x34141073
 110:	00300413          	li	s0,3
 114:	00941863          	bne	s0,s1,124 <__crt0_dummy_trap_handler_irq>

00000118 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 118:	34102473          	.insn	4, 0x34102473
 11c:	00240413          	addi	s0,s0,2
 120:	34141073          	.insn	4, 0x34141073

00000124 <__crt0_dummy_trap_handler_irq>:
 124:	00012403          	lw	s0,0(sp)
 128:	00412483          	lw	s1,4(sp)
 12c:	00810113          	addi	sp,sp,8
 130:	30200073          	mret

00000134 <main>:
uint32_t value1, value2, value3;

int main() {
    // Loop to initialize Values array
    for(uint8_t count = 0; count < COUNT_VALUES; count++) {
        Values[count] = count;
 134:	800006b7          	lui	a3,0x80000
int main() {
 138:	00000713          	li	a4,0
        Values[count] = count;
 13c:	01868793          	addi	a5,a3,24 # 80000018 <Values>
    for(uint8_t count = 0; count < COUNT_VALUES; count++) {
 140:	07800613          	li	a2,120
        Values[count] = count;
 144:	00f705b3          	add	a1,a4,a5
 148:	00e58023          	sb	a4,0(a1)
    for(uint8_t count = 0; count < COUNT_VALUES; count++) {
 14c:	00170713          	addi	a4,a4,1
 150:	fec71ae3          	bne	a4,a2,144 <main+0x10>
    }
    
    value_ad1 = (uint32_t*)(&(Values[0]));
 154:	80f1aa23          	sw	a5,-2028(gp) # 80000014 <value_ad1>
    value_ad2 = (uint32_t*)(&(Values[8+2]));
 158:	80000737          	lui	a4,0x80000
 15c:	02270713          	addi	a4,a4,34 # 80000022 <Values+0xa>
    value_ad3 = (uint32_t*)(&(Values[12+1]));
    value1 = *(value_ad1);
 160:	0186a683          	lw	a3,24(a3)
    value_ad2 = (uint32_t*)(&(Values[8+2]));
 164:	80e1a823          	sw	a4,-2032(gp) # 80000010 <value_ad2>
    value_ad3 = (uint32_t*)(&(Values[12+1]));
 168:	80000737          	lui	a4,0x80000
 16c:	02570713          	addi	a4,a4,37 # 80000025 <Values+0xd>
 170:	80e1a623          	sw	a4,-2036(gp) # 8000000c <value_ad3>
    value1 = *(value_ad1);
 174:	80d1a423          	sw	a3,-2040(gp) # 80000008 <value1>
    value2 = *(value_ad2);
 178:	00c7d703          	lhu	a4,12(a5)
 17c:	00a7d683          	lhu	a3,10(a5)
 180:	01071713          	slli	a4,a4,0x10
 184:	00d76733          	or	a4,a4,a3
 188:	800006b7          	lui	a3,0x80000
 18c:	00e6a223          	sw	a4,4(a3) # 80000004 <value2>
    value3 = *(value_ad3);
 190:	00e7c683          	lbu	a3,14(a5)
 194:	00d7c703          	lbu	a4,13(a5)
 198:	00869693          	slli	a3,a3,0x8
 19c:	00e6e6b3          	or	a3,a3,a4
 1a0:	00f7c703          	lbu	a4,15(a5)
 1a4:	0107c783          	lbu	a5,16(a5)
 1a8:	01071713          	slli	a4,a4,0x10
 1ac:	00d76733          	or	a4,a4,a3
 1b0:	01879793          	slli	a5,a5,0x18
 1b4:	00e7e7b3          	or	a5,a5,a4
 1b8:	80000737          	lui	a4,0x80000
 1bc:	00f72023          	sw	a5,0(a4) # 80000000 <value3>
    
    while(1) {
 1c0:	0000006f          	j	1c0 <main+0x8c>
