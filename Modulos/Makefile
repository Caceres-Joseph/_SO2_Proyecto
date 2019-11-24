
obj-m    := inotify.o

KDIR    := /lib/modules/$(shell uname -r)/build
PWD    := $(shell pwd)

default:
    $(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

clean:
    rm -rf *.o *.ko *.mod.* *.symvers *.order

test:
	sudo dmesg -C
	sudo insmod inotify.ko
	sudo dmesg
	sudo dmesg -C
	sudo cat /proc/inotify
	sudo rmmod inotify
	sudo dmesg
