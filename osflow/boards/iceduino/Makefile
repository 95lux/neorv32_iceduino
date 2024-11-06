# Define the path to the GHDL libraries
GHDL_LIB_PATH := /opt/fpga-toolchain/lib/ghdl

# Using the GHDL_PATH environment variable
export GHDL_PATH := $(GHDL_LIB_PATH)
# GHDL_FLAGS := -P$(GHDL_LIB_PATH)/ieee/v08 -fsynopsys 
GHDL_FLAGS := -fsynopsys 

NEORV32_HOME := ../../../neorv32

ICEDUINO_HOME := ../../..

NEORV32_RTL_CORE := $(NEORV32_HOME)/rtl/core

NEORV32_PKG := $(NEORV32_RTL_CORE)/neorv32_package.vhd

# GHDL_MODULE := 
GHDL_MODULE := -m ghdl

# BIN_PATH:= /opt/fpga-toolchain/bin

NEORV32_MEM_SRC := \
	$(NEORV32_RTL_CORE)/neorv32_imem.vhd \
	$(NEORV32_RTL_CORE)/neorv32_dmem.vhd \


# Teil der NEORV32_CORE_SRC Liste
# $(NEORV32_RTL_CORE)/neorv32_package.vhd \

NEORV32_CORE_SRC := \
	$(NEORV32_RTL_CORE)/neorv32_sys.vhd \
	$(NEORV32_RTL_CORE)/neorv32_clockgate.vhd \
	$(NEORV32_RTL_CORE)/neorv32_fifo.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_decompressor.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_control.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_regfile.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_shifter.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_muldiv.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_bitmanip.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_fpu.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_cfu.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_cond.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_cp_crypto.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_alu.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_lsu.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu_pmp.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cpu.vhd \
	$(NEORV32_RTL_CORE)/neorv32_bus.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cache.vhd \
	$(NEORV32_RTL_CORE)/neorv32_dma.vhd \
	$(NEORV32_RTL_CORE)/neorv32_boot_rom.vhd \
	$(NEORV32_RTL_CORE)/neorv32_xip.vhd \
	$(NEORV32_RTL_CORE)/neorv32_xbus.vhd \
	$(NEORV32_RTL_CORE)/neorv32_cfs.vhd \
	$(NEORV32_RTL_CORE)/neorv32_sdi.vhd \
	$(NEORV32_RTL_CORE)/neorv32_gpio.vhd \
	$(NEORV32_RTL_CORE)/neorv32_wdt.vhd \
	$(NEORV32_RTL_CORE)/neorv32_mtime.vhd \
	$(NEORV32_RTL_CORE)/neorv32_uart.vhd \
	$(NEORV32_RTL_CORE)/neorv32_spi.vhd \
	$(NEORV32_RTL_CORE)/neorv32_twi.vhd \
	$(NEORV32_RTL_CORE)/neorv32_pwm.vhd \
	$(NEORV32_RTL_CORE)/neorv32_trng.vhd \
	$(NEORV32_RTL_CORE)/neorv32_neoled.vhd \
	$(NEORV32_RTL_CORE)/neorv32_xirq.vhd \
	$(NEORV32_RTL_CORE)/neorv32_gptmr.vhd \
	$(NEORV32_RTL_CORE)/neorv32_onewire.vhd \
	$(NEORV32_RTL_CORE)/neorv32_slink.vhd \
	$(NEORV32_RTL_CORE)/neorv32_crc.vhd \
	$(NEORV32_RTL_CORE)/neorv32_sysinfo.vhd \
	$(NEORV32_RTL_CORE)/neorv32_debug_dtm.vhd \
	$(NEORV32_RTL_CORE)/neorv32_debug_auth.vhd \
	$(NEORV32_RTL_CORE)/neorv32_debug_dm.vhd \
	$(NEORV32_RTL_CORE)/neorv32_top.vhd \
	$(NEORV32_RTL_CORE)/neorv32_bootloader_image.vhd

ICEDUINO_APPIMG_SRC := \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/neorv32_application_image.vhd \
# $(ICEDUINO_HOME)/osflow/boards/iceduino/neorv32_bootloader_image.vhd

NEORV32_SRC := ${ICEDUINO_APPIMG_SRC} ${NEORV32_MEM_SRC} ${NEORV32_CORE_SRC}

ICE40_SRC := \
	$(ICEDUINO_HOME)/osflow/device/ice40/sb_ice40_components.vhd

PCF_SRC := \
	$(ICEDUINO_HOME)/osflow/constraint/iceduino.pcf

ICEDUINO_SRC := \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/WS2812_addrcounter.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/WS2812_aserial.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/WS2812_aserial.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/WS2812_fsm.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/WS2812_shiftregister.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/RAMtoWS2812.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/iceduino_ws2812_dpram_converter.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/ram.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_ws2812/iceduino_ws2812_top.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_7seg.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_led.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_switch.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_button.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_arduino_gpio.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_pmod.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_arduino_uart.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_arduino_spi.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_arduino_i2c.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/iceduino_arduino_adc.vhd \
	$(ICEDUINO_HOME)/osflow/boards/iceduino/neorv32_iceduino_top.vhd 
	
DESIGN_NAME := iceduino
IMPL_NAME := ${DESIGN_NAME}_impl

.PHONY: all json asc bin clean

# Some phony targets for conveniences
all: bin
json: ${IMPL_NAME}.json
asc: ${IMPL_NAME}.asc
bin: ${IMPL_NAME}.bin

ice40-obj08.cf: ${ICE40_SRC}
	ghdl -a ${GHDL_FLAGS} --std=08 --work=iCE40 ${ICE40_SRC}

neorv32-obj08.cf: ice40-obj08.cf ${NEORV32_PKG} ${NEORV32_SRC}
	ghdl -a ${GHDL_FLAGS} --std=08 --work=neorv32 ${NEORV32_PKG} ${NEORV32_SRC}

iceduino-obj08.cf: neorv32-obj08.cf ${ICEDUINO_SRC} ${ICEDUINO_APPIMG_SRC}
	ghdl -a ${GHDL_FLAGS} --std=08 --work=iceduino ${ICEDUINO_SRC} ${ICEDUINO_APPIMG_SRC}
	

${IMPL_NAME}.json: iceduino-obj08.cf
	yosys ${GHDL_MODULE} -p 'ghdl ${GHDL_FLAGS} --latches --std=08 --work=iceduino --no-formal neorv32_iceduino_top; synth_ice40 -dsp -json $@; ' 2>&1 | tee yosys-report.txt

# firstly use generic synth pass for simulation, to mitigate usage of architecture specific blackboxes
${IMPL_NAME}_generic.json: iceduino-obj08.cf
# yosys ${GHDL_MODULE} -p 'ghdl ${GHDL_FLAGS} --latches --std=08 --work=iceduino --no-formal neorv32_iceduino_top; synth -top neorv32_iceduino_top; write_json $@;' 2>&1 | tee yosys-report.txt
	yosys ${GHDL_MODULE} -p 'ghdl ${GHDL_FLAGS} --latches --std=08 --work=iceduino --no-formal neorv32_iceduino_top; write_json $@;' 2>&1 | tee yosys-report.txt

# New target for writing CXXRTL
# convert tristate logic to non-tristate logic with `tribuf -formal` as tristates are not supported by cxxrtl
# $(OUTPUT_DIR)/$(DESIGN_NAME).cpp: ${IMPL_NAME}_generic.json
cxxrtl/iceduino.cpp: ${IMPL_NAME}_generic.json
	yosys ${GHDL_MODULE} -p 'read_json ${IMPL_NAME}_generic.json; tribuf -formal; hierarchy -check -top neorv32_iceduino_top; write_cxxrtl $@' 2>&1 | tee cxxrtl-report.txt

cxxrtl_sim: cxxrtl/simulator
	time ./simulator -time=100ms | tee cxxrtl/cxxrtl_sim_runtime_report.txt


essent/iceduino.cpp: ${IMPL_NAME}_generic.json
	yosys ${GHDL_MODULE} -p 'read_json ${IMPL_NAME}_generic.json; tribuf -formal; hierarchy -check -top neorv32_iceduino_top; write_firrtl $@' 2>&1 | tee firrtl-report.txt

# Optional: Create the output directory if it doesn't exist
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Make sure the CXXRTL target depends on the output directory
$(OUTPUT_DIR)/$(DESIGN_NAME).cpp: $(OUTPUT_DIR)

${IMPL_NAME}.asc: ${IMPL_NAME}.json ${PCF_SRC}
	/usr/bin/nextpnr-ice40 --ignore-loops --freq 50 \
		--hx8k --package tq144:4k --json $< --pcf ${PCF_SRC} \
		--asc $@ 2>&1 | tee nextpnr-report.txt

${IMPL_NAME}.bin: ${IMPL_NAME}.asc
	icepack $< $@

program: ${IMPL_NAME}.bin
	iceprog $<

clean:
	rm -f *.cf *.asc *.json *-report.txt *.bin *.o

timing: ${IMPL_NAME}.asc
	icetime -p $(PCF_SRC) -P tq144 \
	-d hx4k $<


version:
	ghdl --version
	yosys  --version
	nextpnr-ice40  --version
