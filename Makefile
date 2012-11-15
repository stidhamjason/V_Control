CC=gcc
TARGETS=cma.o ma.o $(SHARD) ma ma2 ma2.o
STATIC=libcma.a
SHARED=libcma.so
LDFLAGS=~/Desktop/cma/libcma.*
DIRNAME=$$(pwd)
BASE=`basename $(DIRNAME)`

.PHONY: clean


all:$(TARGETS)

test: ma ma2
	./ma & ./ma2	

cma.o: cma.c
	$(CC) -c cma.c

ma.o: ma.c
	$(CC) -c ma.c

ma2.o: ma2.c
	$(CC) -c ma2.c

$(SHARED):cma.o
	$(CC) -shared -o $@ $?

ma: ma.o $(SHARED)
	$(CC) -o $@ ma.o $(LDFLAGS)
	

ma2: ma2.o $(SHARED)
	$(CC) -o $@ ma2.o $(LDFLAGS)
	

$(STATIC): ma.o $(STATIC)
	ar r $@ $?

dist: clean
	tar -cvf jasonStidhamHW6.tar ../$(BASE)

clean:
	-rm *.0
	-rm $(TARGETS)
	-rm $(SHARED) $(STATIC)
