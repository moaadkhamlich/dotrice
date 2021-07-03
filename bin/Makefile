CXXFLAGS += -Wall -std=c++11
EXE = main
src=$(wildcard *.cpp)
OBJS = $(src:.cpp=.o)

.DEFAULT_GOAL = all

all: build

.PHONY: all build run clean distclean

build: $(EXE)

$(EXE): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

run:
	./$(EXE)

clean:
	$(RM) $(OBJS)

distclean: clean
	$(RM) $(EXE)
	$(RM) *~
