
CUR_DIR=$(shell pwd)

# TODO: add automatic conversin of libopencm3 header with dstep
OPENCM3_DIR=$(HOME)/src/oss/libopencm3

DEVICE=stm32F401re

CC=arm-none-eabi-gcc
DC=ldc2
LD=arm-none-eabi-ld

ifeq ($(DC), ldc2)
# LDC2 --emulated-tls
  D_FLAGS_LDC=--relocation-model=static --fthread-model=local-exec -march=thumb -mcpu=cortex-m4 --float-abi=hard --betterC
else ifeq ($(DC),gdc)
  D_FLAGS_GDC=-fno-pic -march=armv7e-m -mtune=cortex-m4 -mfloat-abi=hard -fno-druntime
endif

D_FLAGS_COMMON=-g $(D_FLAGS_GDC) $(D_FLAGS_LDC)

LDSCRIPT=generated.stm32F401re.ld

SRCS = demo.d io.d clock.d mcudruntime.d ili9327.d lm75a.d sdcard.d
#button.d
OBJS = $(patsubst %.d,%.o,$(SRCS))

include $(OPENCM3_DIR)/mk/genlink-config.mk

.PHONY: clean all upload
.SUFFIXES: .dpp
.PRECIOUS: %.d

all: demo

link: $(LDSCRIPT)

demo: $(LDSCRIPT) $(OBJS)
	$(LD) $(OBJS) --gc-sections -L $(OPENCM3_DIR)/lib/ -lopencm3_stm32f4 -T stm32f401re.ld -o $@.elf

%.o: %.d
	$(DC) $(D_FLAGS_COMMON) -c $<

upload: demo
	openocd -d2 -f board/st_nucleo_f4.cfg -c "program {$<.elf}  verify reset; shutdown;"

include $(OPENCM3_DIR)/mk/genlink-rules.mk

clean:
	rm -f $(OBJS) demo.elf
