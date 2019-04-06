CC=gcc
CXX=g++
RM=rm -f


CPPFLAGS=-std=c++11 -O2 -g -pg  -I.
LDFLAGS=-std=c++11 -O2 -g -pg  -pthread
LDLIBS=

PROGRAM=blockfinder_simple_int

SRCS=ncs.cpp \
     classes.cpp \
     blockfinder.cpp \
     scheme.cpp \
     blockfinder_main.cpp \
     PatternCodes.cpp \
     tasks.cpp

OBJS=$(subst .cpp,.o,$(SRCS))

all: $(PROGRAM)

ncs.o: ncs.cpp ncs.h

classes.o: classes.cpp ncs.h

blockfinder.o: blockfinder.cpp blockfinder.h ncs.h

blockfinder_main.o: blockfinder_main.cpp blockfinder.h ncs.h

scheme.o: scheme.cpp scheme.h

PatternCodes.o: PatternCodes.cpp PatternCodes.h

tasks.o: tasks.cpp tasks.h

$(PROGRAM): $(OBJS)
	$(CXX) $(LDFLAGS) -o $(PROGRAM) $(OBJS) $(LDLIBS)

clean:
	rm -rf $(OBJS) $(PROGRAM)
