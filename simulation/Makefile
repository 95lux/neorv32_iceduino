NEORV32_HOME := ../neorv32
NEORV32_RTL_CORE := $(NEORV32_HOME)/rtl/core
NEORV32_PKG := $(NEORV32_RTL_CORE)/neorv32_package.vhd
NEORV32_MEM_SRC := \
	$(NEORV32_RTL_CORE)/neorv32_imem.vhd \
	$(NEORV32_RTL_CORE)/neorv32_dmem.vhd  
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


ICEDUINO_HOME := ../
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

TOP:= $(ICEDUINO_HOME)/osflow/boards/iceduino/neorv32_iceduino_top.vhd 

# Define the path to the GHDL libraries
GHDL_LIB_PATH := /opt/fpga-toolchain/lib/ghdl

# Using the GHDL_PATH environment variable
export GHDL_PATH := $(GHDL_LIB_PATH)
GHDL_FLAGS := -fsynopsys 

.PHONY: all wave clean

all:	
	rm -f *.cf
	ghdl -a --std=08 -fsynopsys --work=iCE40 ${ICE40_SRC}

	ghdl -a --std=08 -fsynopsys --work=neorv32 ${NEORV32_PKG} ${NEORV32_SRC}
	ghdl -a --std=08 -fsynopsys --work=iceduino ${ICEDUINO_SRC}
	ghdl -i --std=08 -fsynopsys --work=work -P../osflow/boards/iceduino neorv32_iceduino_top_tb.vhd
	ghdl -a --std=08 -fsynopsys --work=work -P../osflow/boards/iceduino neorv32_iceduino_top_tb.vhd
	ghdl -m --std=08 -fsynopsys --work=work -P../osflow/boards/iceduino neorv32_iceduino_top_tb

OUTPUT_DIR := $(CURDIR)/cxxrtl
BIN_PATH:= /opt/fpga-toolchain/bin

wave:
	time ghdl -r --std=08 -fsynopsys --work=work -P../osflow/boards/iceduino neorv32_iceduino_top_tb --wave=neorv32_iceduino_top_tb.ghw --stop-time="100ms" --ieee-asserts=disable
	surfer -s surfer_state.ron neorv32_iceduino_top_tb.ghw
	
clean:
	rm -rf *.cf *.ghw *.sim_mode.* work/
