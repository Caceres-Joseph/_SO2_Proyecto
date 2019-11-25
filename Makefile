
obj-m	:= inotify.o

#KERNELDIR ?= ~/armsystem/kernel/linux-4.9.30/
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

all: default

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules


clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

test:
	sudo dmesg -C
	sudo insmod inotify.ko
	sudo dmesg
	sudo dmesg -C
	sudo cat /proc/inotify
	sudo rmmod inotify
	sudo dmesg
