CXXFLAGS += -std=c++1z
#CXXFLAGS += -stdlib=libc++
# LDFLAGS += -stdlib=libc++
CXXFLAGS += -I/usr/local/include
CXXFLAGS += -Werror
CXXFLAGS += -Wall -Wextra -Wpedantic -Wconversion
CXXFLAGS += -Wfatal-errors
CXXFLAGS += -Wshadow
CXXFLAGS += -O3
CXXFLAGS += -mavx2
CXXFLAGS += -mfma


CXX = clang++
 LD = clang++

.PHONY: clean dep test_math default \
	test_pack test_vect \
	test_x64 test_avx test_fma \
	do_test_pack_x64 do_test_pack_avx do_test_pack_fma \
	do_test_vect_x64 do_test_vect_avx do_test_vect_fma 

default: dp_exp.exe dp_orbit.exe dp_swich.exe root.exe opt2d.exe


opt2d.exe: opt2d.o config.o

dp_exp.exe: dp_exp.o
dp_orbit.exe: dp_orbit.o
dp_swich.exe: dp_swich.o

root.exe: root.o


test_math: test_vect test_pack

test_pack: do_test_pack_x64 do_test_pack_avx do_test_pack_fma
test_vect: do_test_vect_x64 do_test_vect_avx do_test_vect_fma

test_x64: do_test_vect_x64 do_test_pack_x64
test_avx: do_test_vect_avx do_test_pack_avx
test_fma: do_test_vect_fma do_test_pack_fma

do_test_vect_x64: test_vect_x64.exe
	./$<
do_test_vect_avx: test_vect_avx.exe
	./$<
do_test_vect_fma: test_vect_fma.exe
	./$<

do_test_pack_x64: test_pack_x64.exe
	./$<
do_test_pack_avx: test_pack_avx.exe
	./$<
do_test_pack_fma: test_pack_fma.exe
	./$<


%.exe: %.o
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)


test_vect_x64.o: test_vect.cpp math.h
	$(CXX) $(CXXFLAGS) -mno-avx -mno-fma -O0 -c $< -o $@

test_vect_avx.o: test_vect.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mno-fma -O0 -c $< -o $@

test_vect_fma.o: test_vect.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mfma    -O0 -c $< -o $@

test_pack_x64.o: test_pack.cpp math.h
	$(CXX) $(CXXFLAGS) -mno-avx -mno-fma -O0 -c $< -o $@

test_pack_avx.o: test_pack.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mno-fma -O0 -c $< -o $@

test_pack_fma.o: test_pack.cpp math.h
	$(CXX) $(CXXFLAGS) -mavx2   -mfma    -O0 -c $< -o $@

clean:
	rm -fv *.exe *.o

dep:
	$(CXX) $(CXXFLAGS) -MM *.cpp >.depend

-include .depend

