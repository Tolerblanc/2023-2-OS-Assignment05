SIZES = 8K 16K 32K 64K 128K 256K 512K 8M 16M
SCHEDULERS = noop deadline cfq
TEST_TYPES = 0 1 2 # 여기에 필요한 테스트 유형 번호를 추가

all: $(SCHEDULERS)

$(SCHEDULERS):
	for scheduler in $@; do \
		echo $$scheduler | sudo tee /sys/block/sda/queue/scheduler; \
		$(MAKE) test SCHEDULER_NAME=$$scheduler; \
		$(MAKE) cache_clear; \
	done

test: $(SIZES)

$(SIZES):
	for size in $@; do \
		iozone -R $(foreach type,$(TEST_TYPES),-i $(type)) -I -r $$size -s 512m -t 1 -F ~/iozone_test -b ./result/IObench_$(SCHEDULER_NAME)_$$size.xls;\
		$(MAKE) cache_clear; \
	done

cache_clear:
	echo "Clearing cache"
	rm -rf ~/iozone_test
	sync
	echo 3 | sudo tee /proc/sys/vm/drop_caches
