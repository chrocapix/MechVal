CXXFLAGS += -std=c++1z
#CXXFLAGS += -stdlib=libc++
# LDFLAGS += -stdlib=libc++
CXXFLAGS += -Werror
CXXFLAGS += -Wall -Wextra -Wpedantic -Wconversion
CXXFLAGS += -Wfatal-errors
CXXFLAGS += -Wshadow
CXXFLAGS += -O3
CXXFLAGS += -mavx2
CXXFLAGS += -mfma


CXX = clang++
 LD = clang++

.PHONY: clean dep test test_x64 test_avx test_fma

test: test_x64 test_avx test_fma


test_x64: test_math_x64.exe
	./test_math_x64.exe
test_avx: test_math_avx.exe
	./test_math_avx.exe
test_fma: test_math_fma.exe
	./test_math_fma.exe

%.exe: %.o
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)

test_math_x64.s: test_math.cpp math.h
	$(CXX) $(CXXFLAGS) -mno-avx -mno-fma -masm=intel -S $< -o $@

test_math_avx.s: test_math.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mno-fma -masm=intel -S $< -o $@

test_math_fma.s: test_math.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mfma    -masm=intel -S $< -o $@


test_math_x64.o: test_math.cpp math.h
	$(CXX) $(CXXFLAGS) -mno-avx -mno-fma -O0 -c $< -o $@

test_math_avx.o: test_math.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mno-fma -O0 -c $< -o $@

test_math_fma.o: test_math.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mfma    -O0 -c $< -o $@

clean:
	rm -fv *.exe *.o

dep:
	$(CXX) $(CXXFLAGS) -MM *.cpp >.depend

-include .depend

