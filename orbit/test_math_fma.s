	.text
	.intel_syntax noprefix
	.def	 _Z9test_packPKd;
	.scl	2;
	.type	32;
	.endef
	.globl	_Z9test_packPKd
	.p2align	4, 0x90
_Z9test_packPKd:                        # @_Z9test_packPKd
.Lcfi0:
.seh_proc _Z9test_packPKd
# BB#0:
	push	rsi
.Lcfi1:
	.seh_pushreg 6
	sub	rsp, 32
.Lcfi2:
	.seh_stackalloc 32
.Lcfi3:
	.seh_endprologue
	mov	rsi, rcx
	call	_Z12test_pack_spIdN4math6scalarEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIdN4math6pack2dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIdN4math6pack4dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spId1XEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarE1XEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spId1YEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarE1YEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spId1NEvPKT0_
	mov	rcx, rsi
	add	rsp, 32
	pop	rsi
	jmp	_Z12test_pack_spIN4math6scalarE1NEvPKT0_ # TAILCALL
	.seh_handlerdata
	.text
.Lcfi4:
	.seh_endproc

	.def	 _Z12test_pack_spIdN4math6scalarEEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIdN4math6scalarEEvPKT0_
	.globl	_Z12test_pack_spIdN4math6scalarEEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIdN4math6scalarEEvPKT0_: # @_Z12test_pack_spIdN4math6scalarEEvPKT0_
.Lcfi5:
.seh_proc _Z12test_pack_spIdN4math6scalarEEvPKT0_
# BB#0:
	push	rsi
.Lcfi6:
	.seh_pushreg 6
	push	rdi
.Lcfi7:
	.seh_pushreg 7
	push	rbp
.Lcfi8:
	.seh_pushreg 5
	push	rbx
.Lcfi9:
	.seh_pushreg 3
	sub	rsp, 120
.Lcfi10:
	.seh_stackalloc 120
	vmovapd	xmmword ptr [rsp + 96], xmm8 # 16-byte Spill
.Lcfi11:
	.seh_savexmm 8, 96
	vmovaps	xmmword ptr [rsp + 80], xmm7 # 16-byte Spill
.Lcfi12:
	.seh_savexmm 7, 80
	vmovapd	xmmword ptr [rsp + 64], xmm6 # 16-byte Spill
.Lcfi13:
	.seh_savexmm 6, 64
.Lcfi14:
	.seh_endprologue
	mov	rdx, qword ptr [rcx]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rdx
	vmovq	xmm7, rdx
	vucomisd	xmm7, xmm7
	jp	.LBB1_26
# BB#1:
	movabs	rax, count
	mov	ebx, dword ptr [rax]
	lea	edi, [rbx + 1]
	mov	dword ptr [rax], edi
	mov	rdi, qword ptr [rcx + 8]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rdi
	vmovq	xmm0, rdi
	vmulsd	xmm6, xmm0, xmm7
	vmovsd	qword ptr [rsp + 48], xmm6
	vucomisd	xmm6, xmm6
	jp	.LBB1_2
# BB#5:
	lea	esi, [rbx + 4]
	mov	dword ptr [rax], esi
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rdi
	vaddsd	xmm8, xmm0, xmm7
	vmovsd	qword ptr [rsp + 48], xmm8
	vucomisd	xmm8, xmm8
	jp	.LBB1_6
# BB#7:
	add	ebx, 7
	mov	dword ptr [rax], ebx
	mov	rbx, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rdi
	mov	qword ptr [rsp + 48], rbx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm1, rbx
	vfmadd213sd	xmm7, xmm0, xmm1
	vmovq	rdx, xmm7
	vmovq	qword ptr [rsp + 32], xmm7
	vaddsd	xmm6, xmm6, xmm1
	vmovq	xmm0, rdx
	vucomisd	xmm6, xmm0
	jne	.LBB1_27
	jp	.LBB1_27
# BB#8:
	inc	dword ptr [rax]
	mov	rdx, qword ptr [rcx]
	mov	rbx, qword ptr [rcx + 8]
	mov	rdi, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rbx
	mov	qword ptr [rsp + 48], rdi
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbx
	vmovq	xmm2, rdi
	vmulsd	xmm3, xmm1, xmm0
	vfmadd213sd	xmm0, xmm1, xmm2
	vmovq	rdx, xmm0
	vmovq	qword ptr [rsp + 32], xmm0
	vaddsd	xmm6, xmm3, xmm2
	vmovq	xmm0, rdx
	vucomisd	xmm6, xmm0
	jne	.LBB1_28
	jp	.LBB1_28
# BB#9:
	inc	dword ptr [rax]
	mov	rdx, qword ptr [rcx]
	mov	rbx, qword ptr [rcx + 8]
	mov	rdi, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rbx
	mov	qword ptr [rsp + 48], rdi
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbx
	vmovq	xmm2, rdi
	vmulsd	xmm3, xmm0, xmm1
	vfmadd213sd	xmm0, xmm1, xmm2
	vmovq	rdx, xmm0
	vmovq	qword ptr [rsp + 32], xmm0
	vaddsd	xmm6, xmm3, xmm2
	vmovq	xmm0, rdx
	vucomisd	xmm6, xmm0
	jne	.LBB1_15
	jp	.LBB1_15
# BB#10:
	inc	dword ptr [rax]
	mov	rdx, qword ptr [rcx]
	mov	rbp, qword ptr [rcx + 8]
	mov	rbx, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rbp
	mov	qword ptr [rsp + 48], rbx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbp
	vmulsd	xmm0, xmm0, xmm1
	vmovq	xmm1, rbx
	vaddsd	xmm6, xmm0, xmm1
	vmovsd	qword ptr [rsp + 32], xmm6
	vucomisd	xmm6, xmm6
	jp	.LBB1_17
# BB#11:
	inc	dword ptr [rax]
	mov	rdx, qword ptr [rcx]
	mov	rbp, qword ptr [rcx + 8]
	mov	rbx, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rbp
	mov	qword ptr [rsp + 48], rbx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbp
	vmovq	xmm2, rbx
	vmulsd	xmm3, xmm0, xmm1
	vfmadd213sd	xmm0, xmm1, xmm2
	vmovq	rdx, xmm0
	vmovq	qword ptr [rsp + 32], xmm0
	vaddsd	xmm6, xmm2, xmm3
	vmovq	xmm0, rdx
	vucomisd	xmm6, xmm0
	jne	.LBB1_18
	jp	.LBB1_18
# BB#12:
	inc	dword ptr [rax]
	mov	rdx, qword ptr [rcx]
	mov	rbp, qword ptr [rcx + 8]
	mov	rbx, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rbp
	mov	qword ptr [rsp + 48], rbx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbp
	vmovq	xmm2, rbx
	vmulsd	xmm3, xmm1, xmm0
	vfmadd213sd	xmm0, xmm1, xmm2
	vmovq	rdx, xmm0
	vmovq	qword ptr [rsp + 32], xmm0
	vaddsd	xmm6, xmm2, xmm3
	vmovq	xmm0, rdx
	vucomisd	xmm6, xmm0
	jne	.LBB1_23
	jp	.LBB1_23
# BB#13:
	inc	dword ptr [rax]
	mov	rdx, qword ptr [rcx]
	mov	rbp, qword ptr [rcx + 8]
	mov	rcx, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 56], rdx
	mov	qword ptr [rsp + 40], rbp
	mov	qword ptr [rsp + 48], rcx
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbp
	vmovq	xmm2, rcx
	vmulsd	xmm3, xmm0, xmm1
	vfmadd213sd	xmm0, xmm1, xmm2
	vmovq	rcx, xmm0
	vmovq	qword ptr [rsp + 32], xmm0
	vaddsd	xmm6, xmm3, xmm2
	vmovq	xmm0, rcx
	vucomisd	xmm6, xmm0
	jne	.LBB1_24
	jp	.LBB1_24
# BB#14:
	inc	dword ptr [rax]
	vmovaps	xmm6, xmmword ptr [rsp + 64] # 16-byte Reload
	vmovaps	xmm7, xmmword ptr [rsp + 80] # 16-byte Reload
	vmovaps	xmm8, xmmword ptr [rsp + 96] # 16-byte Reload
	add	rsp, 120
	pop	rbx
	pop	rbp
	pop	rdi
	pop	rsi
	ret
.LBB1_26:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm7
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsp + 40] # xmm1 = mem[0],zero
	jmp	.LBB1_4
.LBB1_2:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 48]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	jmp	.LBB1_3
.LBB1_6:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 48]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm8
.LBB1_3:
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsp + 48] # xmm1 = mem[0],zero
	jmp	.LBB1_4
.LBB1_27:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	ebp, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rsi, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rsi
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rsi
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 48]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebp
	jmp	.LBB1_22
.LBB1_28:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbp, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbp
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbp
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB1_16
.LBB1_15:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB1_16:
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 48]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB1_21
.LBB1_17:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB1_19
.LBB1_18:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB1_19:
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB1_20
.LBB1_23:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB1_25
.LBB1_24:
	movabs	rax, _ZN6layoutIN4math6scalarEE1iE
	mov	esi, dword ptr [rax]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 56]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB1_25:
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 40]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB1_20:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 48]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB1_21:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
.LBB1_22:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsp + 32] # xmm1 = mem[0],zero
.LBB1_4:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIdN4math6scalarEEvPKT0_
.Lcfi15:
	.seh_endproc

	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	main
	.p2align	4, 0x90
main:                                   # @main
.Lcfi16:
.seh_proc main
# BB#0:
	push	rbp
.Lcfi17:
	.seh_pushreg 5
	push	rsi
.Lcfi18:
	.seh_pushreg 6
	push	rdi
.Lcfi19:
	.seh_pushreg 7
	push	rbx
.Lcfi20:
	.seh_pushreg 3
	sub	rsp, 1368
.Lcfi21:
	.seh_stackalloc 1368
	lea	rbp, [rsp + 128]
.Lcfi22:
	.seh_setframe 5, 128
.Lcfi23:
	.seh_endprologue
	and	rsp, -32
	call	__main
	mov	dword ptr [rsp + 48], 42
	movabs	rax, 47244640246
	mov	qword ptr [rsp + 56], rax
	xor	ebx, ebx
	lea	rsi, [rsp + 48]
	lea	rdi, [rsp + 56]
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, rdi
	mov	rdx, rsi
	mov	r8, rdi
	call	_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
	vcvtsi2sd	xmm0, xmm1, eax
	vmovsd	qword ptr [rsp + 8*rbx + 64], xmm0
	inc	rbx
	cmp	rbx, 160
	jne	.LBB2_1
# BB#2:
	xor	edi, edi
	.p2align	4, 0x90
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
	lea	rsi, [rsp + rdi + 64]
	mov	rcx, rsi
	call	_Z12test_pack_spIdN4math6scalarEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIdN4math6pack2dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIdN4math6pack4dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spId1XEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarE1XEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spId1YEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarE1YEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spId1NEvPKT0_
	mov	rcx, rsi
	call	_Z12test_pack_spIN4math6scalarE1NEvPKT0_
	sub	rdi, -128
	cmp	rdi, 896
	jne	.LBB2_3
# BB#4:
	movabs	rax, count
	mov	edx, dword ptr [rax]
	movabs	rcx, _ZSt4cout
	call	_ZNSolsEi
	movabs	rdx, .L.str
	mov	r8d, 15
	mov	rcx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	xor	eax, eax
	lea	rsp, [rbp + 1240]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	rbp
	ret
	.seh_handlerdata
	.text
.Lcfi24:
	.seh_endproc

	.def	 _ZlsIN4math6scalarEERSoS2_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsIN4math6scalarEERSoS2_7printerIT_E
	.globl	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	.p2align	4, 0x90
_ZlsIN4math6scalarEERSoS2_7printerIT_E: # @_ZlsIN4math6scalarEERSoS2_7printerIT_E
.Lcfi25:
.seh_proc _ZlsIN4math6scalarEERSoS2_7printerIT_E
# BB#0:
	push	rsi
.Lcfi26:
	.seh_pushreg 6
	sub	rsp, 32
.Lcfi27:
	.seh_stackalloc 32
.Lcfi28:
	.seh_endprologue
	mov	rsi, rcx
	vmovsd	xmm1, qword ptr [rdx]   # xmm1 = mem[0],zero
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	mov	qword ptr [rsi + rax + 16], 4
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	add	rsp, 32
	pop	rsi
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsIN4math6scalarEERSoS2_7printerIT_E
.Lcfi29:
	.seh_endproc

	.def	 _ZlsIdERSoS0_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsIdERSoS0_7printerIT_E
	.globl	_ZlsIdERSoS0_7printerIT_E
	.p2align	4, 0x90
_ZlsIdERSoS0_7printerIT_E:              # @_ZlsIdERSoS0_7printerIT_E
.Lcfi30:
.seh_proc _ZlsIdERSoS0_7printerIT_E
# BB#0:
	push	rsi
.Lcfi31:
	.seh_pushreg 6
	sub	rsp, 32
.Lcfi32:
	.seh_stackalloc 32
.Lcfi33:
	.seh_endprologue
	mov	rsi, rcx
	vmovsd	xmm1, qword ptr [rdx]   # xmm1 = mem[0],zero
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	mov	qword ptr [rsi + rax + 16], 4
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	add	rsp, 32
	pop	rsi
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsIdERSoS0_7printerIT_E
.Lcfi34:
	.seh_endproc

	.def	 _Z12test_pack_spIdN4math6pack2dEEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIdN4math6pack2dEEvPKT0_
	.globl	_Z12test_pack_spIdN4math6pack2dEEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIdN4math6pack2dEEvPKT0_: # @_Z12test_pack_spIdN4math6pack2dEEvPKT0_
.Lcfi35:
.seh_proc _Z12test_pack_spIdN4math6pack2dEEvPKT0_
# BB#0:
	push	r15
.Lcfi36:
	.seh_pushreg 15
	push	r14
.Lcfi37:
	.seh_pushreg 14
	push	rsi
.Lcfi38:
	.seh_pushreg 6
	push	rdi
.Lcfi39:
	.seh_pushreg 7
	push	rbp
.Lcfi40:
	.seh_pushreg 5
	push	rbx
.Lcfi41:
	.seh_pushreg 3
	sub	rsp, 168
.Lcfi42:
	.seh_stackalloc 168
	vmovaps	xmmword ptr [rsp + 144], xmm6 # 16-byte Spill
.Lcfi43:
	.seh_savexmm 6, 144
.Lcfi44:
	.seh_endprologue
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovapd	xmm0, xmmword ptr [rcx]
	vmovapd	xmmword ptr [rsp + 32], xmm0
	movabs	r9, _ZN6layoutIN4math6pack2dEE1iE
	mov	r15d, dword ptr [r9]
	movsxd	rsi, r15d
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_1
	jp	.LBB5_1
# BB#2:
	mov	r14d, dword ptr [r9 + 4]
	movsxd	rbp, r14d
	vmovsd	xmm6, qword ptr [rsp + 8*rbp + 48] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB5_3
	jp	.LBB5_3
# BB#67:
	movabs	r8, count
	mov	edi, dword ptr [r8]
	lea	eax, [rdi + 1]
	mov	dword ptr [r8], eax
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rcx + 16]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rcx + 16]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	vmovapd	xmm0, xmmword ptr [rsp + 32]
	vmulpd	xmm0, xmm0, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm0
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 48] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_68
	jp	.LBB5_68
# BB#5:
	vmovsd	xmm0, qword ptr [rsp + 8*rbp + 48] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbp + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 80]
	jne	.LBB5_6
	jp	.LBB5_6
# BB#65:
	lea	rbx, [rcx + 16]
	lea	eax, [rdi + 2]
	mov	dword ptr [r8], eax
	mov	r10, qword ptr [rcx]
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	qword ptr [rsp + 96], r10
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovq	xmm2, r10
	vmovddup	xmm3, xmm2      # xmm3 = xmm2[0,0]
	vmulpd	xmm0, xmm3, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm0
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_66
	jp	.LBB5_66
# BB#8:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB5_9
	jp	.LBB5_9
# BB#63:
	lea	eax, [rdi + 3]
	mov	dword ptr [r8], eax
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	rdx, qword ptr [rcx + 16]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	qword ptr [rsp + 96], rdx
	vmovq	xmm0, rdx
	vmovddup	xmm1, xmm0      # xmm1 = xmm0[0,0]
	vmulpd	xmm4, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm4
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_64
	jp	.LBB5_64
# BB#16:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB5_17
	jp	.LBB5_17
# BB#61:
	lea	eax, [rdi + 4]
	mov	dword ptr [r8], eax
	vmovaps	xmm4, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm4
	vmovaps	xmm4, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm4
	vmovaps	xmm4, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm4
	vmovaps	xmm4, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 96], xmm4
	vmovapd	xmm4, xmmword ptr [rsp + 32]
	vaddpd	xmm4, xmm4, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm4
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 48] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_62
	jp	.LBB5_62
# BB#19:
	vmovsd	xmm4, qword ptr [rsp + 8*rbp + 48] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rbp + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 80]
	jne	.LBB5_20
	jp	.LBB5_20
# BB#59:
	lea	eax, [rdi + 5]
	mov	dword ptr [r8], eax
	vmovaps	xmm4, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm4
	mov	qword ptr [rsp + 96], r10
	vmovapd	xmm4, xmmword ptr [rbx]
	vmovapd	xmmword ptr [rsp + 64], xmm4
	vaddpd	xmm3, xmm3, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_60
	jp	.LBB5_60
# BB#22:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB5_23
	jp	.LBB5_23
# BB#57:
	lea	eax, [rdi + 6]
	mov	dword ptr [r8], eax
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm2
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm2
	mov	qword ptr [rsp + 96], rdx
	vaddpd	xmm2, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm2
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_58
	jp	.LBB5_58
# BB#27:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB5_28
	jp	.LBB5_28
# BB#30:
	add	edi, 7
	mov	dword ptr [r8], edi
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm2
	mov	rax, qword ptr [rcx + 32]
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm2
	mov	qword ptr [rsp + 96], rdx
	mov	qword ptr [rsp + 80], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rax
	vmovddup	xmm3, xmm2      # xmm3 = xmm2[0,0]
	vfmadd132pd	xmm1, xmm3, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm1
	movsxd	rsi, dword ptr [r9]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_32
	jp	.LBB5_32
# BB#31:
	movsxd	rsi, dword ptr [r9 + 4]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_32
	jp	.LBB5_32
# BB#36:
	inc	dword ptr [r8]
	mov	rax, qword ptr [rcx]
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	rdx, qword ptr [rcx + 32]
	mov	qword ptr [rsp + 96], rax
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	qword ptr [rsp + 80], rdx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rax
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovq	xmm1, rdx
	vmovddup	xmm3, xmm1      # xmm3 = xmm1[0,0]
	vfmadd231pd	xmm3, xmm2, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm3
	movsxd	rsi, dword ptr [r9]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_38
	jp	.LBB5_38
# BB#37:
	movsxd	rsi, dword ptr [r9 + 4]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm0, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_38
	jp	.LBB5_38
# BB#39:
	inc	dword ptr [r8]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	rax, qword ptr [rcx + 32]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	mov	qword ptr [rsp + 112], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovapd	xmm1, xmmword ptr [rsp + 32]
	vmovq	xmm0, rax
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vfmadd231pd	xmm2, xmm1, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm2
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 48] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 64]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_41
	jp	.LBB5_41
# BB#40:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 48] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 64]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_41
	jp	.LBB5_41
# BB#42:
	inc	dword ptr [r8]
	mov	rax, qword ptr [rcx]
	mov	rdx, qword ptr [rcx + 16]
	vmovaps	xmm0, xmmword ptr [rcx + 32]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	qword ptr [rsp + 96], rax
	mov	qword ptr [rsp + 80], rdx
	vmovaps	xmm0, xmmword ptr [rcx + 32]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rax
	vmovq	xmm1, rdx
	vmulsd	xmm0, xmm0, xmm1
	vmovddup	xmm1, xmm0      # xmm1 = xmm0[0,0]
	vaddpd	xmm1, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm1
	movsxd	rsi, dword ptr [r9]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_44
	jp	.LBB5_44
# BB#43:
	movsxd	rsi, dword ptr [r9 + 4]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB5_44
	jp	.LBB5_44
# BB#45:
	lea	rdx, [rcx + 32]
	inc	dword ptr [r8]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	rax, qword ptr [rcx + 16]
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	mov	qword ptr [rsp + 112], rax
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovapd	xmm1, xmmword ptr [rsp + 32]
	vmovq	xmm0, rax
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vfmadd213pd	xmm2, xmm1, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm2
	movsxd	rsi, dword ptr [r9]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_47
	jp	.LBB5_47
# BB#46:
	movsxd	rsi, dword ptr [r9 + 4]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_47
	jp	.LBB5_47
# BB#50:
	inc	dword ptr [r8]
	mov	rax, qword ptr [rcx]
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	qword ptr [rsp + 112], rax
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rax
	vmovddup	xmm1, xmm0      # xmm1 = xmm0[0,0]
	vmovapd	xmm2, xmmword ptr [rsp + 32]
	vfmadd213pd	xmm2, xmm1, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm2
	movsxd	rsi, dword ptr [r9]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_52
	jp	.LBB5_52
# BB#51:
	movsxd	rsi, dword ptr [r9 + 4]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 48]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB5_52
	jp	.LBB5_52
# BB#53:
	inc	dword ptr [r8]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 80], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 112], xmm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	xmm0, xmmword ptr [rsp + 96]
	vmovapd	xmm1, xmmword ptr [rsp + 80]
	vfmadd213pd	xmm1, xmm0, xmmword ptr [rsp + 112]
	vmovapd	xmmword ptr [rsp + 128], xmm1
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 48] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 64]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 32]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB5_55
	jp	.LBB5_55
# BB#54:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 48] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 64]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 32]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB5_55
	jp	.LBB5_55
# BB#56:
	inc	dword ptr [r8]
	vmovaps	xmm6, xmmword ptr [rsp + 144] # 16-byte Reload
	add	rsp, 168
	pop	rbx
	pop	rbp
	pop	rdi
	pop	rsi
	pop	r14
	pop	r15
	ret
.LBB5_32:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbp, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbp
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbp
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB5_33
.LBB5_38:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbp, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbp
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbp
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB5_33:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB5_34
.LBB5_41:
	lea	r14, [rsp + 8*rsi + 80]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB5_49
.LBB5_44:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB5_34:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	jmp	.LBB5_35
.LBB5_47:
	lea	r14, [rsp + 8*rsi + 80]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB5_48
.LBB5_52:
	lea	r14, [rsp + 8*rsi + 80]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB5_48:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB5_49:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	jmp	.LBB5_35
.LBB5_55:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
.LBB5_35:
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB5_14
.LBB5_1:
	lea	rdi, [rsp + 8*rsi + 32]
	jmp	.LBB5_4
.LBB5_3:
	lea	rdi, [rsp + 8*rbp + 32]
	mov	r15d, r14d
.LBB5_4:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, r15d
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB5_15
.LBB5_68:
	lea	rsi, [rsp + 8*rsi + 80]
	mov	r14d, r15d
	jmp	.LBB5_7
.LBB5_6:
	lea	rsi, [rsp + 8*rbp + 80]
.LBB5_7:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	jmp	.LBB5_12
.LBB5_66:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB5_10
.LBB5_9:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB5_10:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	jmp	.LBB5_11
.LBB5_64:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB5_18
.LBB5_17:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB5_18:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
.LBB5_11:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB5_12:
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB5_13
.LBB5_62:
	lea	rsi, [rsp + 8*rsi + 80]
	mov	r14d, r15d
	jmp	.LBB5_21
.LBB5_20:
	lea	rsi, [rsp + 8*rbp + 80]
.LBB5_21:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	jmp	.LBB5_26
.LBB5_60:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB5_24
.LBB5_23:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB5_24:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	jmp	.LBB5_25
.LBB5_58:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB5_29
.LBB5_28:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB5_29:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
.LBB5_25:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB5_26:
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB5_13:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, r14d
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
.LBB5_14:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB5_15:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIdN4math6pack2dEEvPKT0_
.Lcfi45:
	.seh_endproc

	.def	 _Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
	.globl	_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_: # @_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
.Lcfi46:
.seh_proc _Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
# BB#0:
	push	r15
.Lcfi47:
	.seh_pushreg 15
	push	r14
.Lcfi48:
	.seh_pushreg 14
	push	rsi
.Lcfi49:
	.seh_pushreg 6
	push	rdi
.Lcfi50:
	.seh_pushreg 7
	push	rbp
.Lcfi51:
	.seh_pushreg 5
	push	rbx
.Lcfi52:
	.seh_pushreg 3
	sub	rsp, 168
.Lcfi53:
	.seh_stackalloc 168
	vmovaps	xmmword ptr [rsp + 144], xmm6 # 16-byte Spill
.Lcfi54:
	.seh_savexmm 6, 144
.Lcfi55:
	.seh_endprologue
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovapd	xmm0, xmmword ptr [rcx]
	vmovapd	xmmword ptr [rsp + 32], xmm0
	movabs	r9, _ZN6layoutIN4math6pack2dEE1iE
	mov	r15d, dword ptr [r9]
	movsxd	rsi, r15d
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_1
	jp	.LBB6_1
# BB#2:
	mov	r14d, dword ptr [r9 + 4]
	movsxd	rbp, r14d
	vmovsd	xmm6, qword ptr [rsp + 8*rbp + 48] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB6_3
	jp	.LBB6_3
# BB#73:
	movabs	r8, count
	mov	edi, dword ptr [r8]
	lea	eax, [rdi + 1]
	mov	dword ptr [r8], eax
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rcx + 16]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rcx + 16]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	vmovapd	xmm0, xmmword ptr [rsp + 32]
	vmulpd	xmm0, xmm0, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm0
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 48] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_74
	jp	.LBB6_74
# BB#5:
	vmovsd	xmm0, qword ptr [rsp + 8*rbp + 48] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbp + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 80]
	jne	.LBB6_6
	jp	.LBB6_6
# BB#71:
	lea	rbx, [rcx + 16]
	lea	eax, [rdi + 2]
	mov	dword ptr [r8], eax
	mov	r10, qword ptr [rcx]
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	qword ptr [rsp + 96], r10
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovq	xmm2, r10
	vmovddup	xmm3, xmm2      # xmm3 = xmm2[0,0]
	vmulpd	xmm0, xmm3, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm0
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_72
	jp	.LBB6_72
# BB#8:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB6_9
	jp	.LBB6_9
# BB#69:
	lea	eax, [rdi + 3]
	mov	dword ptr [r8], eax
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	rdx, qword ptr [rcx + 16]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	qword ptr [rsp + 96], rdx
	vmovq	xmm0, rdx
	vmovddup	xmm1, xmm0      # xmm1 = xmm0[0,0]
	vmulpd	xmm4, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm4
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_70
	jp	.LBB6_70
# BB#16:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB6_17
	jp	.LBB6_17
# BB#67:
	lea	eax, [rdi + 4]
	mov	dword ptr [r8], eax
	vmovaps	xmm4, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm4
	vmovaps	xmm4, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm4
	vmovaps	xmm4, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm4
	vmovaps	xmm4, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 96], xmm4
	vmovapd	xmm4, xmmword ptr [rsp + 32]
	vaddpd	xmm4, xmm4, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm4
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 48] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_68
	jp	.LBB6_68
# BB#19:
	vmovsd	xmm4, qword ptr [rsp + 8*rbp + 48] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rbp + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 80]
	jne	.LBB6_20
	jp	.LBB6_20
# BB#65:
	lea	eax, [rdi + 5]
	mov	dword ptr [r8], eax
	vmovaps	xmm4, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm4
	mov	qword ptr [rsp + 96], r10
	vmovapd	xmm4, xmmword ptr [rbx]
	vmovapd	xmmword ptr [rsp + 64], xmm4
	vaddpd	xmm3, xmm3, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_66
	jp	.LBB6_66
# BB#22:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB6_23
	jp	.LBB6_23
# BB#63:
	lea	eax, [rdi + 6]
	mov	dword ptr [r8], eax
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm2
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm2
	mov	qword ptr [rsp + 96], rdx
	vaddpd	xmm2, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm2
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_64
	jp	.LBB6_64
# BB#27:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rbp + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rbp + 32]
	jne	.LBB6_28
	jp	.LBB6_28
# BB#30:
	add	edi, 7
	mov	dword ptr [r8], edi
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm2
	mov	rax, qword ptr [rcx + 32]
	vmovaps	xmm2, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 64], xmm2
	mov	qword ptr [rsp + 96], rdx
	mov	qword ptr [rsp + 80], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rax
	vmovddup	xmm3, xmm2      # xmm3 = xmm2[0,0]
	vfmadd132pd	xmm1, xmm3, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm1
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_32
	jp	.LBB6_32
# BB#31:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_32
	jp	.LBB6_32
# BB#61:
	inc	dword ptr [r8]
	mov	rax, qword ptr [rcx]
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	rdx, qword ptr [rcx + 32]
	mov	qword ptr [rsp + 96], rax
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	qword ptr [rsp + 80], rdx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm6, rax
	vmovddup	xmm1, xmm6      # xmm1 = xmm6[0,0]
	vmovq	xmm0, rdx
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vfmadd231pd	xmm2, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm2
	movsxd	rsi, dword ptr [r9]
	vmovapd	xmm1, xmm6
	vfmadd132sd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm1, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_62
	jp	.LBB6_62
# BB#36:
	movsxd	rsi, dword ptr [r9 + 4]
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_37
	jp	.LBB6_37
# BB#39:
	inc	dword ptr [r8]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	rax, qword ptr [rcx + 32]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	mov	qword ptr [rsp + 112], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovapd	xmm1, xmmword ptr [rsp + 32]
	vmovq	xmm0, rax
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vfmadd231pd	xmm2, xmm1, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm2
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_41
	jp	.LBB6_41
# BB#40:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_41
	jp	.LBB6_41
# BB#59:
	inc	dword ptr [r8]
	mov	rax, qword ptr [rcx]
	mov	rdx, qword ptr [rcx + 16]
	vmovaps	xmm0, xmmword ptr [rcx + 32]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	qword ptr [rsp + 96], rax
	mov	qword ptr [rsp + 80], rdx
	vmovaps	xmm0, xmmword ptr [rcx + 32]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm6, rax
	vmovq	xmm0, rdx
	vmulsd	xmm1, xmm6, xmm0
	vmovddup	xmm1, xmm1      # xmm1 = xmm1[0,0]
	vaddpd	xmm1, xmm1, xmmword ptr [rsp + 64]
	vmovapd	xmmword ptr [rsp + 32], xmm1
	movsxd	rsi, dword ptr [r9]
	vmovapd	xmm1, xmm6
	vfmadd213sd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm1, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_60
	jp	.LBB6_60
# BB#42:
	movsxd	rsi, dword ptr [r9 + 4]
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB6_43
	jp	.LBB6_43
# BB#45:
	lea	rdx, [rcx + 32]
	inc	dword ptr [r8]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	mov	rax, qword ptr [rcx + 16]
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	mov	qword ptr [rsp + 112], rax
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovapd	xmm1, xmmword ptr [rsp + 32]
	vmovq	xmm0, rax
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vfmadd213pd	xmm2, xmm1, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm2
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_47
	jp	.LBB6_47
# BB#46:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_47
	jp	.LBB6_47
# BB#57:
	inc	dword ptr [r8]
	mov	rax, qword ptr [rcx]
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	mov	qword ptr [rsp + 112], rax
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm6, rax
	vmovddup	xmm0, xmm6      # xmm0 = xmm6[0,0]
	vmovapd	xmm1, xmmword ptr [rsp + 32]
	vfmadd213pd	xmm1, xmm0, xmmword ptr [rsp + 96]
	vmovapd	xmmword ptr [rsp + 80], xmm1
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 64] # xmm1 = mem[0],zero
	vmovapd	xmm0, xmm6
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_58
	jp	.LBB6_58
# BB#50:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 48]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 80]
	jne	.LBB6_51
	jp	.LBB6_51
# BB#53:
	inc	dword ptr [r8]
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 48], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 64], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	vmovaps	xmm0, xmmword ptr [rcx]
	vmovaps	xmmword ptr [rsp + 96], xmm0
	vmovaps	xmm0, xmmword ptr [rbx]
	vmovaps	xmmword ptr [rsp + 80], xmm0
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 112], xmm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	xmm0, xmmword ptr [rsp + 96]
	vmovapd	xmm1, xmmword ptr [rsp + 80]
	vfmadd213pd	xmm1, xmm0, xmmword ptr [rsp + 112]
	vmovapd	xmmword ptr [rsp + 128], xmm1
	movsxd	rsi, dword ptr [r9]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 32] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB6_55
	jp	.LBB6_55
# BB#54:
	movsxd	rsi, dword ptr [r9 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 48] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 32] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB6_55
	jp	.LBB6_55
# BB#56:
	inc	dword ptr [r8]
	vmovaps	xmm6, xmmword ptr [rsp + 144] # 16-byte Reload
	add	rsp, 168
	pop	rbx
	pop	rbp
	pop	rdi
	pop	rsi
	pop	r14
	pop	r15
	ret
.LBB6_32:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB6_33
.LBB6_41:
	lea	r14, [rsp + 8*rsi + 80]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB6_49
.LBB6_47:
	lea	r14, [rsp + 8*rsi + 80]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB6_48
.LBB6_55:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	jmp	.LBB6_35
.LBB6_1:
	lea	rdi, [rsp + 8*rsi + 32]
	jmp	.LBB6_4
.LBB6_3:
	lea	rdi, [rsp + 8*rbp + 32]
	mov	r15d, r14d
.LBB6_4:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, r15d
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB6_15
.LBB6_74:
	lea	rsi, [rsp + 8*rsi + 80]
	mov	r14d, r15d
	jmp	.LBB6_7
.LBB6_6:
	lea	rsi, [rsp + 8*rbp + 80]
.LBB6_7:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	jmp	.LBB6_12
.LBB6_72:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB6_10
.LBB6_9:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB6_10:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	jmp	.LBB6_11
.LBB6_70:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB6_18
.LBB6_17:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB6_18:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB6_11:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB6_12:
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB6_13
.LBB6_68:
	lea	rsi, [rsp + 8*rsi + 80]
	mov	r14d, r15d
	jmp	.LBB6_21
.LBB6_20:
	lea	rsi, [rsp + 8*rbp + 80]
.LBB6_21:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	jmp	.LBB6_26
.LBB6_66:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB6_24
.LBB6_23:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB6_24:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	jmp	.LBB6_25
.LBB6_64:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	r14d, r15d
	jmp	.LBB6_29
.LBB6_28:
	lea	rsi, [rsp + 8*rbp + 32]
.LBB6_29:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB6_25:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB6_26:
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB6_13:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, r14d
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
	jmp	.LBB6_14
.LBB6_62:
	lea	r14, [rsp + 8*rsi + 32]
	vmovapd	xmm6, xmm1
	jmp	.LBB6_38
.LBB6_37:
	lea	r14, [rsp + 8*rsi + 32]
.LBB6_38:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB6_33:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB6_34
.LBB6_60:
	lea	r14, [rsp + 8*rsi + 32]
	vmovapd	xmm6, xmm1
	jmp	.LBB6_44
.LBB6_43:
	lea	r14, [rsp + 8*rsi + 32]
.LBB6_44:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack2dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB6_34:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	jmp	.LBB6_35
.LBB6_58:
	lea	r14, [rsp + 8*rsi + 80]
	vmovapd	xmm6, xmm0
	jmp	.LBB6_52
.LBB6_51:
	lea	r14, [rsp + 8*rsi + 80]
.LBB6_52:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack2dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 112]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB6_48:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 96]
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.LBB6_49:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 80]
.LBB6_35:
	mov	rcx, rax
	call	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
.LBB6_14:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB6_15:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarENS0_6pack2dEEvPKT0_
.Lcfi56:
	.seh_endproc

	.def	 _ZlsIN4math6pack2dEERSoS2_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	.globl	_ZlsIN4math6pack2dEERSoS2_7printerIT_E
	.p2align	4, 0x90
_ZlsIN4math6pack2dEERSoS2_7printerIT_E: # @_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.Lcfi57:
.seh_proc _ZlsIN4math6pack2dEERSoS2_7printerIT_E
# BB#0:
	push	rsi
.Lcfi58:
	.seh_pushreg 6
	push	rdi
.Lcfi59:
	.seh_pushreg 7
	sub	rsp, 56
.Lcfi60:
	.seh_stackalloc 56
.Lcfi61:
	.seh_endprologue
	mov	rsi, rcx
	vmovaps	xmm0, xmmword ptr [rdx]
	vmovaps	xmmword ptr [rsp + 32], xmm0
	movabs	rdi, _ZN6layoutIN4math6pack2dEE1iE
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 4]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	add	rsp, 56
	pop	rdi
	pop	rsi
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsIN4math6pack2dEERSoS2_7printerIT_E
.Lcfi62:
	.seh_endproc

	.def	 _Z12test_pack_spIdN4math6pack4dEEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIdN4math6pack4dEEvPKT0_
	.globl	_Z12test_pack_spIdN4math6pack4dEEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIdN4math6pack4dEEvPKT0_: # @_Z12test_pack_spIdN4math6pack4dEEvPKT0_
.Lcfi63:
.seh_proc _Z12test_pack_spIdN4math6pack4dEEvPKT0_
# BB#0:
	push	rbp
.Lcfi64:
	.seh_pushreg 5
	push	r15
.Lcfi65:
	.seh_pushreg 15
	push	r14
.Lcfi66:
	.seh_pushreg 14
	push	r13
.Lcfi67:
	.seh_pushreg 13
	push	r12
.Lcfi68:
	.seh_pushreg 12
	push	rsi
.Lcfi69:
	.seh_pushreg 6
	push	rdi
.Lcfi70:
	.seh_pushreg 7
	push	rbx
.Lcfi71:
	.seh_pushreg 3
	sub	rsp, 344
.Lcfi72:
	.seh_stackalloc 344
	lea	rbp, [rsp + 128]
.Lcfi73:
	.seh_setframe 5, 128
	vmovaps	xmmword ptr [rbp + 192], xmm6 # 16-byte Spill
.Lcfi74:
	.seh_savexmm 6, 320
.Lcfi75:
	.seh_endprologue
	and	rsp, -32
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	movabs	r11, _ZN6layoutIN4math6pack4dEE1iE
	mov	r14d, dword ptr [r11]
	movsxd	rsi, r14d
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_1
	jp	.LBB8_1
# BB#2:
	mov	r13d, dword ptr [r11 + 4]
	movsxd	rdi, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB8_3
	jp	.LBB8_3
# BB#105:
	mov	r8d, dword ptr [r11 + 8]
	movsxd	rdx, r8d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB8_106
	jp	.LBB8_106
# BB#107:
	mov	r9d, dword ptr [r11 + 12]
	movsxd	rax, r9d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB8_108
	jp	.LBB8_108
# BB#109:
	movabs	r10, count
	mov	r15d, dword ptr [r10]
	lea	ebx, [r15 + 1]
	mov	dword ptr [r10], ebx
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 64]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm0
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_110
	jp	.LBB8_110
# BB#5:
	vmovsd	xmm0, qword ptr [rsp + 8*rdi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 128]
	jne	.LBB8_6
	jp	.LBB8_6
# BB#99:
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 128]
	jne	.LBB8_100
	jp	.LBB8_100
# BB#101:
	mov	dword ptr [rsp + 220], r14d # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 128]
	jne	.LBB8_102
	jp	.LBB8_102
# BB#103:
	lea	r12, [rcx + 32]
	lea	ebx, [r15 + 2]
	mov	dword ptr [r10], ebx
	mov	r14, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	qword ptr [rsp + 224], r14
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovq	xmm2, r14
	vpbroadcastq	ymm3, xmm2
	vmulpd	ymm0, ymm3, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_104
	jp	.LBB8_104
# BB#9:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB8_10
	jp	.LBB8_10
# BB#93:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB8_94
	jp	.LBB8_94
# BB#95:
	mov	dword ptr [rsp + 60], r13d # 4-byte Spill
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB8_96
	jp	.LBB8_96
# BB#97:
	lea	ebx, [r15 + 3]
	mov	dword ptr [r10], ebx
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	r13, qword ptr [rcx + 32]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 224], r13
	vmovq	xmm0, r13
	vpbroadcastq	ymm1, xmm0
	vmulpd	ymm4, ymm1, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_98
	jp	.LBB8_98
# BB#12:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB8_13
	jp	.LBB8_13
# BB#87:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB8_88
	jp	.LBB8_88
# BB#89:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB8_90
	jp	.LBB8_90
# BB#91:
	lea	ebx, [r15 + 4]
	mov	dword ptr [r10], ebx
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm4
	vmovaps	ymm4, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm4
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm4
	vmovaps	ymm4, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovapd	ymm4, ymmword ptr [rsp + 64]
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm4
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_92
	jp	.LBB8_92
# BB#15:
	vmovsd	xmm4, qword ptr [rsp + 8*rdi + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 128]
	jne	.LBB8_16
	jp	.LBB8_16
# BB#81:
	vmovsd	xmm4, qword ptr [rsp + 8*rdx + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 128]
	jne	.LBB8_82
	jp	.LBB8_82
# BB#83:
	vmovsd	xmm4, qword ptr [rsp + 8*rax + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 128]
	jne	.LBB8_84
	jp	.LBB8_84
# BB#85:
	lea	ebx, [r15 + 5]
	mov	dword ptr [r10], ebx
	vmovaps	ymm4, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm4
	mov	qword ptr [rsp + 224], r14
	vmovapd	ymm4, ymmword ptr [r12]
	vmovapd	ymmword ptr [rsp + 160], ymm4
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_86
	jp	.LBB8_86
# BB#18:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB8_19
	jp	.LBB8_19
# BB#75:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB8_76
	jp	.LBB8_76
# BB#77:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB8_78
	jp	.LBB8_78
# BB#79:
	lea	ebx, [r15 + 6]
	mov	dword ptr [r10], ebx
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm2
	mov	qword ptr [rsp + 224], r13
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm2
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_80
	jp	.LBB8_80
# BB#27:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB8_28
	jp	.LBB8_28
# BB#71:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB8_72
	jp	.LBB8_72
# BB#73:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB8_74
	jp	.LBB8_74
# BB#30:
	add	r15d, 7
	mov	dword ptr [r10], r15d
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm2
	mov	rax, qword ptr [rcx + 64]
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm2
	mov	qword ptr [rsp + 224], r13
	mov	qword ptr [rsp + 128], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rax
	vpbroadcastq	ymm3, xmm2
	vfmadd132pd	ymm1, ymm3, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm1
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_32
	jp	.LBB8_32
# BB#31:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_32
	jp	.LBB8_32
# BB#68:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_32
	jp	.LBB8_32
# BB#69:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_32
	jp	.LBB8_32
# BB#70:
	inc	dword ptr [r10]
	mov	rax, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	rdx, qword ptr [rcx + 64]
	mov	qword ptr [rsp + 224], rax
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 128], rdx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rax
	vpbroadcastq	ymm2, xmm0
	vmovq	xmm1, rdx
	vpbroadcastq	ymm3, xmm1
	vfmadd231pd	ymm3, ymm2, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_37
	jp	.LBB8_37
# BB#36:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_37
	jp	.LBB8_37
# BB#65:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_37
	jp	.LBB8_37
# BB#66:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm0, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_37
	jp	.LBB8_37
# BB#67:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rax, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 288], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovapd	ymm1, ymmword ptr [rsp + 64]
	vmovq	xmm0, rax
	vpbroadcastq	ymm2, xmm0
	vfmadd231pd	ymm2, ymm1, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 96] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_39
	jp	.LBB8_39
# BB#38:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 96] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_39
	jp	.LBB8_39
# BB#62:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 96] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_39
	jp	.LBB8_39
# BB#63:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 96] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_39
	jp	.LBB8_39
# BB#64:
	inc	dword ptr [r10]
	mov	rax, qword ptr [rcx]
	mov	rdx, qword ptr [rcx + 32]
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	qword ptr [rsp + 224], rax
	mov	qword ptr [rsp + 128], rdx
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rax
	vmovq	xmm1, rdx
	vmulsd	xmm0, xmm0, xmm1
	vbroadcastsd	ymm1, xmm0
	vaddpd	ymm1, ymm1, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm1
	movsxd	rsi, dword ptr [r11]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_41
	jp	.LBB8_41
# BB#40:
	movsxd	rsi, dword ptr [r11 + 4]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_41
	jp	.LBB8_41
# BB#59:
	movsxd	rsi, dword ptr [r11 + 8]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_41
	jp	.LBB8_41
# BB#60:
	movsxd	rsi, dword ptr [r11 + 12]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB8_41
	jp	.LBB8_41
# BB#61:
	lea	rax, [rcx + 64]
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	rdx, qword ptr [rcx + 32]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	mov	qword ptr [rsp + 288], rdx
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovapd	ymm1, ymmword ptr [rsp + 64]
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_43
	jp	.LBB8_43
# BB#42:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_43
	jp	.LBB8_43
# BB#56:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_43
	jp	.LBB8_43
# BB#57:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_43
	jp	.LBB8_43
# BB#58:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 288], rdx
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_47
	jp	.LBB8_47
# BB#46:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_47
	jp	.LBB8_47
# BB#53:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_47
	jp	.LBB8_47
# BB#54:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 96]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB8_47
	jp	.LBB8_47
# BB#55:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 288], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 224]
	vmovapd	ymm1, ymmword ptr [rsp + 128]
	vfmadd213pd	ymm1, ymm0, ymmword ptr [rsp + 288]
	vmovapd	ymmword ptr [rsp + 256], ymm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB8_49
	jp	.LBB8_49
# BB#48:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB8_49
	jp	.LBB8_49
# BB#50:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB8_49
	jp	.LBB8_49
# BB#51:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB8_49
	jp	.LBB8_49
# BB#52:
	inc	dword ptr [r10]
	vmovaps	xmm6, xmmword ptr [rbp + 192] # 16-byte Reload
	lea	rsp, [rbp + 216]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB8_32:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB8_33
.LBB8_37:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB8_33:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB8_34
.LBB8_39:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB8_45
.LBB8_41:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB8_34:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	jmp	.LBB8_35
.LBB8_43:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB8_44
.LBB8_47:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB8_44:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB8_45:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	jmp	.LBB8_35
.LBB8_49:
	lea	r14, [rsp + 8*rsi + 256]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 256]
.LBB8_35:
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB8_25
.LBB8_1:
	mov	ebx, r14d
	lea	rdi, [rsp + 8*rsi + 64]
	jmp	.LBB8_4
.LBB8_3:
	lea	rdi, [rsp + 8*rdi + 64]
	mov	ebx, r13d
	jmp	.LBB8_4
.LBB8_106:
	lea	rdi, [rsp + 8*rdx + 64]
	mov	ebx, r8d
	jmp	.LBB8_4
.LBB8_108:
	lea	rdi, [rsp + 8*rax + 64]
	mov	ebx, r9d
.LBB8_4:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB8_26
.LBB8_110:
	lea	rsi, [rsp + 8*rsi + 128]
	mov	ebx, r14d
	jmp	.LBB8_7
.LBB8_6:
	mov	ebx, r13d
	lea	rsi, [rsp + 8*rdi + 128]
	jmp	.LBB8_7
.LBB8_100:
	lea	rsi, [rsp + 8*rdx + 128]
	mov	ebx, r8d
	jmp	.LBB8_7
.LBB8_102:
	lea	rsi, [rsp + 8*rax + 128]
	mov	ebx, r9d
.LBB8_7:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	jmp	.LBB8_8
.LBB8_104:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB8_11
.LBB8_10:
	mov	ebx, r13d
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB8_11
.LBB8_94:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	ebx, r8d
	jmp	.LBB8_11
.LBB8_96:
	lea	rsi, [rsp + 8*rax + 64]
	mov	ebx, r9d
.LBB8_11:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB8_8:
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	jmp	.LBB8_24
.LBB8_98:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB8_14
.LBB8_13:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB8_14
.LBB8_88:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB8_14
.LBB8_90:
	lea	rsi, [rsp + 8*rax + 64]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB8_14:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB8_23
.LBB8_92:
	lea	rsi, [rsp + 8*rsi + 128]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB8_17
.LBB8_16:
	lea	rsi, [rsp + 8*rdi + 128]
	jmp	.LBB8_17
.LBB8_82:
	lea	rsi, [rsp + 8*rdx + 128]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB8_17
.LBB8_84:
	lea	rsi, [rsp + 8*rax + 128]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB8_17:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	jmp	.LBB8_22
.LBB8_86:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB8_20
.LBB8_19:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB8_20
.LBB8_76:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB8_20
.LBB8_78:
	lea	rsi, [rsp + 8*rax + 64]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB8_20:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	jmp	.LBB8_21
.LBB8_80:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB8_29
.LBB8_28:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB8_29
.LBB8_72:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB8_29
.LBB8_74:
	lea	rsi, [rsp + 8*rax + 64]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB8_29:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
.LBB8_21:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB8_22:
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB8_23:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, dword ptr [rsp + 60] # 4-byte Reload
.LBB8_24:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
.LBB8_25:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB8_26:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIdN4math6pack4dEEvPKT0_
.Lcfi76:
	.seh_endproc

	.def	 _Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
	.globl	_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_: # @_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
.Lcfi77:
.seh_proc _Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
# BB#0:
	push	rbp
.Lcfi78:
	.seh_pushreg 5
	push	r15
.Lcfi79:
	.seh_pushreg 15
	push	r14
.Lcfi80:
	.seh_pushreg 14
	push	r13
.Lcfi81:
	.seh_pushreg 13
	push	r12
.Lcfi82:
	.seh_pushreg 12
	push	rsi
.Lcfi83:
	.seh_pushreg 6
	push	rdi
.Lcfi84:
	.seh_pushreg 7
	push	rbx
.Lcfi85:
	.seh_pushreg 3
	sub	rsp, 344
.Lcfi86:
	.seh_stackalloc 344
	lea	rbp, [rsp + 128]
.Lcfi87:
	.seh_setframe 5, 128
	vmovaps	xmmword ptr [rbp + 192], xmm6 # 16-byte Spill
.Lcfi88:
	.seh_savexmm 6, 320
.Lcfi89:
	.seh_endprologue
	and	rsp, -32
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	movabs	r11, _ZN6layoutIN4math6pack4dEE1iE
	mov	r14d, dword ptr [r11]
	movsxd	rsi, r14d
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_1
	jp	.LBB9_1
# BB#2:
	mov	r13d, dword ptr [r11 + 4]
	movsxd	rdi, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB9_3
	jp	.LBB9_3
# BB#111:
	mov	r8d, dword ptr [r11 + 8]
	movsxd	rdx, r8d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB9_112
	jp	.LBB9_112
# BB#113:
	mov	r9d, dword ptr [r11 + 12]
	movsxd	rax, r9d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 96] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB9_114
	jp	.LBB9_114
# BB#115:
	movabs	r10, count
	mov	r15d, dword ptr [r10]
	lea	ebx, [r15 + 1]
	mov	dword ptr [r10], ebx
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 64]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm0
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_116
	jp	.LBB9_116
# BB#5:
	vmovsd	xmm0, qword ptr [rsp + 8*rdi + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 128]
	jne	.LBB9_6
	jp	.LBB9_6
# BB#105:
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 128]
	jne	.LBB9_106
	jp	.LBB9_106
# BB#107:
	mov	dword ptr [rsp + 220], r14d # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 96] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 128]
	jne	.LBB9_108
	jp	.LBB9_108
# BB#109:
	lea	r12, [rcx + 32]
	lea	ebx, [r15 + 2]
	mov	dword ptr [r10], ebx
	mov	r14, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	qword ptr [rsp + 224], r14
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovq	xmm2, r14
	vpbroadcastq	ymm3, xmm2
	vmulpd	ymm0, ymm3, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_110
	jp	.LBB9_110
# BB#8:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB9_9
	jp	.LBB9_9
# BB#99:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB9_100
	jp	.LBB9_100
# BB#101:
	mov	dword ptr [rsp + 60], r13d # 4-byte Spill
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB9_102
	jp	.LBB9_102
# BB#103:
	lea	ebx, [r15 + 3]
	mov	dword ptr [r10], ebx
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	r13, qword ptr [rcx + 32]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 224], r13
	vmovq	xmm0, r13
	vpbroadcastq	ymm1, xmm0
	vmulpd	ymm4, ymm1, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_104
	jp	.LBB9_104
# BB#12:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB9_13
	jp	.LBB9_13
# BB#93:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB9_94
	jp	.LBB9_94
# BB#95:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB9_96
	jp	.LBB9_96
# BB#97:
	lea	ebx, [r15 + 4]
	mov	dword ptr [r10], ebx
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm4
	vmovaps	ymm4, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm4
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm4
	vmovaps	ymm4, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovapd	ymm4, ymmword ptr [rsp + 64]
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm4
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_98
	jp	.LBB9_98
# BB#15:
	vmovsd	xmm4, qword ptr [rsp + 8*rdi + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 128]
	jne	.LBB9_16
	jp	.LBB9_16
# BB#87:
	vmovsd	xmm4, qword ptr [rsp + 8*rdx + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 128]
	jne	.LBB9_88
	jp	.LBB9_88
# BB#89:
	vmovsd	xmm4, qword ptr [rsp + 8*rax + 96] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 128]
	jne	.LBB9_90
	jp	.LBB9_90
# BB#91:
	lea	ebx, [r15 + 5]
	mov	dword ptr [r10], ebx
	vmovaps	ymm4, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm4
	mov	qword ptr [rsp + 224], r14
	vmovapd	ymm4, ymmword ptr [r12]
	vmovapd	ymmword ptr [rsp + 160], ymm4
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_92
	jp	.LBB9_92
# BB#18:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB9_19
	jp	.LBB9_19
# BB#81:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB9_82
	jp	.LBB9_82
# BB#83:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB9_84
	jp	.LBB9_84
# BB#85:
	lea	ebx, [r15 + 6]
	mov	dword ptr [r10], ebx
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm2
	mov	qword ptr [rsp + 224], r13
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm2
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_86
	jp	.LBB9_86
# BB#27:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB9_28
	jp	.LBB9_28
# BB#77:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB9_78
	jp	.LBB9_78
# BB#79:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 64]
	jne	.LBB9_80
	jp	.LBB9_80
# BB#30:
	add	r15d, 7
	mov	dword ptr [r10], r15d
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm2
	mov	rax, qword ptr [rcx + 64]
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 160], ymm2
	mov	qword ptr [rsp + 224], r13
	mov	qword ptr [rsp + 128], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rax
	vpbroadcastq	ymm3, xmm2
	vfmadd132pd	ymm1, ymm3, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_32
	jp	.LBB9_32
# BB#31:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_32
	jp	.LBB9_32
# BB#74:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_32
	jp	.LBB9_32
# BB#75:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_32
	jp	.LBB9_32
# BB#76:
	inc	dword ptr [r10]
	mov	rax, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	rdx, qword ptr [rcx + 64]
	mov	qword ptr [rsp + 224], rax
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 128], rdx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rax
	vpbroadcastq	ymm2, xmm0
	vmovq	xmm1, rdx
	vpbroadcastq	ymm3, xmm1
	vfmadd231pd	ymm3, ymm2, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	movsxd	rsi, dword ptr [r11]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_37
	jp	.LBB9_37
# BB#36:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_37
	jp	.LBB9_37
# BB#71:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_37
	jp	.LBB9_37
# BB#72:
	movsxd	rsi, dword ptr [r11 + 12]
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_73
	jp	.LBB9_73
# BB#39:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rax, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 288], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovapd	ymm1, ymmword ptr [rsp + 64]
	vmovq	xmm0, rax
	vpbroadcastq	ymm2, xmm0
	vfmadd231pd	ymm2, ymm1, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_41
	jp	.LBB9_41
# BB#40:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_41
	jp	.LBB9_41
# BB#68:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_41
	jp	.LBB9_41
# BB#69:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_41
	jp	.LBB9_41
# BB#70:
	inc	dword ptr [r10]
	mov	rax, qword ptr [rcx]
	mov	rdx, qword ptr [rcx + 32]
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	qword ptr [rsp + 224], rax
	mov	qword ptr [rsp + 128], rdx
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rax
	vmovq	xmm1, rdx
	vmulsd	xmm2, xmm0, xmm1
	vbroadcastsd	ymm2, xmm2
	vaddpd	ymm2, ymm2, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 64], ymm2
	movsxd	rsi, dword ptr [r11]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_43
	jp	.LBB9_43
# BB#42:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_43
	jp	.LBB9_43
# BB#65:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_43
	jp	.LBB9_43
# BB#66:
	movsxd	rsi, dword ptr [r11 + 12]
	vfmadd213sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB9_67
	jp	.LBB9_67
# BB#45:
	lea	rax, [rcx + 64]
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	mov	rdx, qword ptr [rcx + 32]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	mov	qword ptr [rsp + 288], rdx
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovapd	ymm1, ymmword ptr [rsp + 64]
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_47
	jp	.LBB9_47
# BB#46:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_47
	jp	.LBB9_47
# BB#62:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_47
	jp	.LBB9_47
# BB#63:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_47
	jp	.LBB9_47
# BB#64:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 288], rdx
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 224]
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_51
	jp	.LBB9_51
# BB#50:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_51
	jp	.LBB9_51
# BB#59:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_51
	jp	.LBB9_51
# BB#60:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 96]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 128]
	jne	.LBB9_61
	jp	.LBB9_61
# BB#53:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 96], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [r12]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymmword ptr [rsp + 288], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 224]
	vmovapd	ymm1, ymmword ptr [rsp + 128]
	vfmadd213pd	ymm1, ymm0, ymmword ptr [rsp + 288]
	vmovapd	ymmword ptr [rsp + 256], ymm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB9_55
	jp	.LBB9_55
# BB#54:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB9_55
	jp	.LBB9_55
# BB#56:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB9_55
	jp	.LBB9_55
# BB#57:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 96] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 256]
	jne	.LBB9_55
	jp	.LBB9_55
# BB#58:
	inc	dword ptr [r10]
	vmovaps	xmm6, xmmword ptr [rbp + 192] # 16-byte Reload
	lea	rsp, [rbp + 216]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB9_32:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB9_33
.LBB9_41:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB9_49
.LBB9_47:
	lea	r14, [rsp + 8*rsi + 128]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB9_48
.LBB9_55:
	lea	r14, [rsp + 8*rsi + 256]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 256]
	jmp	.LBB9_35
.LBB9_37:
	lea	r14, [rsp + 8*rsi + 64]
	jmp	.LBB9_38
.LBB9_43:
	lea	r14, [rsp + 8*rsi + 64]
	jmp	.LBB9_44
.LBB9_51:
	lea	r14, [rsp + 8*rsi + 128]
	jmp	.LBB9_52
.LBB9_1:
	mov	ebx, r14d
	lea	rdi, [rsp + 8*rsi + 64]
	jmp	.LBB9_4
.LBB9_3:
	lea	rdi, [rsp + 8*rdi + 64]
	mov	ebx, r13d
	jmp	.LBB9_4
.LBB9_112:
	lea	rdi, [rsp + 8*rdx + 64]
	mov	ebx, r8d
	jmp	.LBB9_4
.LBB9_114:
	lea	rdi, [rsp + 8*rax + 64]
	mov	ebx, r9d
.LBB9_4:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB9_26
.LBB9_116:
	lea	rsi, [rsp + 8*rsi + 128]
	mov	ebx, r14d
	jmp	.LBB9_7
.LBB9_6:
	mov	ebx, r13d
	lea	rsi, [rsp + 8*rdi + 128]
	jmp	.LBB9_7
.LBB9_106:
	lea	rsi, [rsp + 8*rdx + 128]
	mov	ebx, r8d
	jmp	.LBB9_7
.LBB9_108:
	lea	rsi, [rsp + 8*rax + 128]
	mov	ebx, r9d
.LBB9_7:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	jmp	.LBB9_11
.LBB9_110:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB9_10
.LBB9_9:
	mov	ebx, r13d
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB9_10
.LBB9_100:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	ebx, r8d
	jmp	.LBB9_10
.LBB9_102:
	lea	rsi, [rsp + 8*rax + 64]
	mov	ebx, r9d
.LBB9_10:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB9_11:
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	jmp	.LBB9_24
.LBB9_104:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB9_14
.LBB9_13:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB9_14
.LBB9_94:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB9_14
.LBB9_96:
	lea	rsi, [rsp + 8*rax + 64]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB9_14:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB9_23
.LBB9_98:
	lea	rsi, [rsp + 8*rsi + 128]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB9_17
.LBB9_16:
	lea	rsi, [rsp + 8*rdi + 128]
	jmp	.LBB9_17
.LBB9_88:
	lea	rsi, [rsp + 8*rdx + 128]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB9_17
.LBB9_90:
	lea	rsi, [rsp + 8*rax + 128]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB9_17:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	jmp	.LBB9_22
.LBB9_92:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB9_20
.LBB9_19:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB9_20
.LBB9_82:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB9_20
.LBB9_84:
	lea	rsi, [rsp + 8*rax + 64]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB9_20:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	jmp	.LBB9_21
.LBB9_86:
	lea	rsi, [rsp + 8*rsi + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
	jmp	.LBB9_29
.LBB9_28:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB9_29
.LBB9_78:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	dword ptr [rsp + 60], r8d # 4-byte Spill
	jmp	.LBB9_29
.LBB9_80:
	lea	rsi, [rsp + 8*rax + 64]
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
.LBB9_29:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB9_21:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB9_22:
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB9_23:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, dword ptr [rsp + 60] # 4-byte Reload
.LBB9_24:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
	jmp	.LBB9_25
.LBB9_73:
	lea	r14, [rsp + 8*rsi + 64]
	vmovapd	xmm6, xmm0
.LBB9_38:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB9_33:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB9_34
.LBB9_67:
	lea	r14, [rsp + 8*rsi + 64]
	vmovapd	xmm6, xmm0
.LBB9_44:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6pack4dE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 160]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB9_34:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	jmp	.LBB9_35
.LBB9_61:
	lea	r14, [rsp + 8*rsi + 128]
	vmovapd	xmm6, xmm0
.LBB9_52:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6pack4dE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB9_48:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.LBB9_49:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 128]
.LBB9_35:
	mov	rcx, rax
	call	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
.LBB9_25:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB9_26:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarENS0_6pack4dEEvPKT0_
.Lcfi90:
	.seh_endproc

	.def	 _ZlsIN4math6pack4dEERSoS2_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	.globl	_ZlsIN4math6pack4dEERSoS2_7printerIT_E
	.p2align	4, 0x90
_ZlsIN4math6pack4dEERSoS2_7printerIT_E: # @_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.Lcfi91:
.seh_proc _ZlsIN4math6pack4dEERSoS2_7printerIT_E
# BB#0:
	push	rbp
.Lcfi92:
	.seh_pushreg 5
	push	rsi
.Lcfi93:
	.seh_pushreg 6
	push	rdi
.Lcfi94:
	.seh_pushreg 7
	sub	rsp, 64
.Lcfi95:
	.seh_stackalloc 64
	lea	rbp, [rsp + 64]
.Lcfi96:
	.seh_setframe 5, 64
.Lcfi97:
	.seh_endprologue
	and	rsp, -32
	mov	rsi, rcx
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 32], ymm0
	movabs	rdi, _ZN6layoutIN4math6pack4dEE1iE
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	vzeroupper
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 4]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 8]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 12]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	mov	rsp, rbp
	pop	rdi
	pop	rsi
	pop	rbp
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsIN4math6pack4dEERSoS2_7printerIT_E
.Lcfi98:
	.seh_endproc

	.def	 _Z12test_pack_spId1XEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spId1XEvPKT0_
	.globl	_Z12test_pack_spId1XEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spId1XEvPKT0_:            # @_Z12test_pack_spId1XEvPKT0_
.Lcfi99:
.seh_proc _Z12test_pack_spId1XEvPKT0_
# BB#0:
	push	rbp
.Lcfi100:
	.seh_pushreg 5
	push	r15
.Lcfi101:
	.seh_pushreg 15
	push	r14
.Lcfi102:
	.seh_pushreg 14
	push	r13
.Lcfi103:
	.seh_pushreg 13
	push	r12
.Lcfi104:
	.seh_pushreg 12
	push	rsi
.Lcfi105:
	.seh_pushreg 6
	push	rdi
.Lcfi106:
	.seh_pushreg 7
	push	rbx
.Lcfi107:
	.seh_pushreg 3
	sub	rsp, 600
.Lcfi108:
	.seh_stackalloc 600
	lea	rbp, [rsp + 128]
.Lcfi109:
	.seh_setframe 5, 128
	vmovaps	xmmword ptr [rbp + 448], xmm6 # 16-byte Spill
.Lcfi110:
	.seh_savexmm 6, 576
.Lcfi111:
	.seh_endprologue
	and	rsp, -32
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovapd	ymmword ptr [rsp + 64], ymm0
	movabs	rdi, _ZN6layoutI1XE1iE
	mov	eax, dword ptr [rdi]
	movsxd	r15, eax
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB11_125
	jp	.LBB11_125
# BB#1:
	mov	r10d, dword ptr [rdi + 4]
	movsxd	r13, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*r13 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB11_126
	jp	.LBB11_126
# BB#2:
	mov	r11d, dword ptr [rdi + 8]
	movsxd	r12, r11d
	vmovsd	xmm6, qword ptr [rsp + 8*r12 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB11_127
	jp	.LBB11_127
# BB#3:
	mov	ebx, dword ptr [rdi + 12]
	movsxd	r14, ebx
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB11_128
	jp	.LBB11_128
# BB#4:
	mov	esi, dword ptr [rdi + 16]
	movsxd	r8, esi
	vmovsd	xmm6, qword ptr [rsp + 8*r8 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB11_129
	jp	.LBB11_129
# BB#5:
	mov	dword ptr [rsp + 220], eax # 4-byte Spill
	mov	edx, dword ptr [rdi + 20]
	movsxd	r9, edx
	vmovsd	xmm6, qword ptr [rsp + 8*r9 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB11_130
	jp	.LBB11_130
# BB#6:
	mov	dword ptr [rsp + 60], r10d # 4-byte Spill
	mov	dword ptr [rsp + 212], edx # 4-byte Spill
	mov	dword ptr [rsp + 216], esi # 4-byte Spill
	mov	edx, dword ptr [rdi + 24]
	mov	dword ptr [rsp + 196], edx # 4-byte Spill
	movsxd	r10, edx
	vmovsd	xmm6, qword ptr [rsp + 8*r10 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB11_131
	jp	.LBB11_131
# BB#7:
	mov	dword ptr [rsp + 204], ebx # 4-byte Spill
	mov	dword ptr [rsp + 208], r11d # 4-byte Spill
	mov	esi, dword ptr [rdi + 28]
	movsxd	r11, esi
	vmovsd	xmm6, qword ptr [rsp + 8*r11 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	mov	rdx, r15
	jne	.LBB11_132
	jp	.LBB11_132
# BB#8:
	movabs	rbx, count
	mov	r15d, dword ptr [rbx]
	lea	eax, [r15 + 1]
	mov	dword ptr [rbx], eax
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymm1, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymm1, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 64]
	vmovapd	ymm1, ymmword ptr [rsp + 96]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 352]
	vmulpd	ymm1, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm0
	vmovapd	ymmword ptr [rsp + 256], ymm1
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 224]
	jne	.LBB11_134
	jp	.LBB11_134
# BB#9:
	vmovsd	xmm0, qword ptr [rsp + 8*r13 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 224]
	jne	.LBB11_135
	jp	.LBB11_135
# BB#10:
	vmovsd	xmm0, qword ptr [rsp + 8*r12 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 224]
	jne	.LBB11_136
	jp	.LBB11_136
# BB#11:
	vmovsd	xmm0, qword ptr [rsp + 8*r14 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 224]
	jne	.LBB11_137
	jp	.LBB11_137
# BB#12:
	vmovsd	xmm0, qword ptr [rsp + 8*r8 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 224]
	jne	.LBB11_138
	jp	.LBB11_138
# BB#13:
	vmovsd	xmm0, qword ptr [rsp + 8*r9 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 224]
	jne	.LBB11_139
	jp	.LBB11_139
# BB#14:
	vmovsd	xmm0, qword ptr [rsp + 8*r10 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 224]
	jne	.LBB11_140
	jp	.LBB11_140
# BB#15:
	mov	dword ptr [rsp + 200], esi # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*r11 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 224]
	jne	.LBB11_141
	jp	.LBB11_141
# BB#16:
	lea	rdi, [rcx + 64]
	lea	eax, [r15 + 2]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	mov	rsi, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rdi]
	vmovaps	ymm1, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 352], rsi
	vmovaps	ymm0, ymmword ptr [rdi]
	vmovaps	ymm1, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovq	xmm2, rsi
	vpbroadcastq	ymm3, xmm2
	vmulpd	ymm0, ymm3, ymmword ptr [rsp + 288]
	vmulpd	ymm1, ymm3, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	vmovapd	ymmword ptr [rsp + 96], ymm1
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB11_143
	jp	.LBB11_143
# BB#17:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB11_144
	jp	.LBB11_144
# BB#18:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB11_145
	jp	.LBB11_145
# BB#19:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB11_146
	jp	.LBB11_146
# BB#20:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB11_147
	jp	.LBB11_147
# BB#21:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB11_148
	jp	.LBB11_148
# BB#22:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB11_149
	jp	.LBB11_149
# BB#23:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB11_150
	jp	.LBB11_150
# BB#24:
	lea	eax, [r15 + 3]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rax, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	qword ptr [rsp + 352], rax
	vmovq	xmm0, rax
	vpbroadcastq	ymm1, xmm0
	vmulpd	ymm4, ymm1, ymmword ptr [rsp + 288]
	vmulpd	ymm5, ymm1, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm5
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB11_154
	jp	.LBB11_154
# BB#25:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB11_155
	jp	.LBB11_155
# BB#26:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB11_156
	jp	.LBB11_156
# BB#27:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB11_157
	jp	.LBB11_157
# BB#28:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB11_158
	jp	.LBB11_158
# BB#29:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB11_159
	jp	.LBB11_159
# BB#30:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB11_160
	jp	.LBB11_160
# BB#31:
	mov	qword ptr [rsp + 504], rax # 8-byte Spill
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB11_161
	jp	.LBB11_161
# BB#32:
	lea	eax, [r15 + 4]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm5
	vmovaps	ymmword ptr [rsp + 128], ymm4
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovaps	ymm5, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm5
	vmovaps	ymmword ptr [rsp + 288], ymm4
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm5
	vmovaps	ymmword ptr [rsp + 64], ymm4
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovaps	ymm5, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm5
	vmovaps	ymmword ptr [rsp + 352], ymm4
	vmovapd	ymm4, ymmword ptr [rsp + 64]
	vmovapd	ymm5, ymmword ptr [rsp + 96]
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 352]
	vaddpd	ymm5, ymm5, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm4
	vmovapd	ymmword ptr [rsp + 256], ymm5
	vmovsd	xmm4, qword ptr [rsp + 8*rdx + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdx + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 224]
	jne	.LBB11_164
	jp	.LBB11_164
# BB#33:
	vmovsd	xmm4, qword ptr [rsp + 8*r13 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r13 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 224]
	jne	.LBB11_165
	jp	.LBB11_165
# BB#34:
	vmovsd	xmm4, qword ptr [rsp + 8*r12 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r12 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 224]
	jne	.LBB11_166
	jp	.LBB11_166
# BB#35:
	vmovsd	xmm4, qword ptr [rsp + 8*r14 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r14 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 224]
	jne	.LBB11_167
	jp	.LBB11_167
# BB#36:
	vmovsd	xmm4, qword ptr [rsp + 8*r8 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r8 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 224]
	jne	.LBB11_168
	jp	.LBB11_168
# BB#37:
	vmovsd	xmm4, qword ptr [rsp + 8*r9 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r9 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 224]
	jne	.LBB11_169
	jp	.LBB11_169
# BB#38:
	vmovsd	xmm4, qword ptr [rsp + 8*r10 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r10 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 224]
	jne	.LBB11_170
	jp	.LBB11_170
# BB#39:
	vmovsd	xmm4, qword ptr [rsp + 8*r11 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r11 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 224]
	jne	.LBB11_171
	jp	.LBB11_171
# BB#40:
	lea	eax, [r15 + 5]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovaps	ymm5, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm5
	vmovaps	ymmword ptr [rsp + 128], ymm4
	mov	qword ptr [rsp + 352], rsi
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovapd	ymm5, ymmword ptr [rdi + 32]
	vmovapd	ymmword ptr [rsp + 320], ymm5
	vmovaps	ymmword ptr [rsp + 288], ymm4
	vaddpd	ymm4, ymm3, ymmword ptr [rsp + 288]
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB11_174
	jp	.LBB11_174
# BB#41:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB11_175
	jp	.LBB11_175
# BB#42:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB11_176
	jp	.LBB11_176
# BB#43:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB11_177
	jp	.LBB11_177
# BB#44:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB11_178
	jp	.LBB11_178
# BB#45:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB11_179
	jp	.LBB11_179
# BB#46:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB11_180
	jp	.LBB11_180
# BB#47:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB11_181
	jp	.LBB11_181
# BB#48:
	mov	rsi, r15
	lea	eax, [r15 + 6]
	movabs	r15, count
	mov	dword ptr [r15], eax
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm3
	vmovaps	ymmword ptr [rsp + 128], ymm2
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm3
	vmovaps	ymmword ptr [rsp + 288], ymm2
	mov	rbx, qword ptr [rsp + 504] # 8-byte Reload
	mov	qword ptr [rsp + 352], rbx
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 288]
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm2
	vmovapd	ymmword ptr [rsp + 96], ymm3
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB11_184
	jp	.LBB11_184
# BB#49:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB11_185
	jp	.LBB11_185
# BB#50:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	mov	rax, rdi
	jne	.LBB11_186
	jp	.LBB11_186
# BB#51:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB11_187
	jp	.LBB11_187
# BB#52:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB11_188
	jp	.LBB11_188
# BB#53:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB11_189
	jp	.LBB11_189
# BB#54:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB11_190
	jp	.LBB11_190
# BB#55:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB11_191
	jp	.LBB11_191
# BB#56:
	add	esi, 7
	mov	dword ptr [r15], esi
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm3
	vmovaps	ymmword ptr [rsp + 128], ymm2
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm3
	vmovaps	ymmword ptr [rsp + 288], ymm2
	mov	qword ptr [rsp + 352], rbx
	mov	qword ptr [rsp + 224], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rdx
	vpbroadcastq	ymm3, xmm2
	vmovapd	ymm4, ymmword ptr [rsp + 288]
	vfmadd132pd	ymm4, ymm3, ymm1
	vfmadd132pd	ymm1, ymm3, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm1
	movabs	rbx, _ZN6layoutI1XE1iE
	movsxd	rsi, dword ptr [rbx]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#57:
	movsxd	rsi, dword ptr [rbx + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#58:
	movsxd	rsi, dword ptr [rbx + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#59:
	movsxd	rsi, dword ptr [rbx + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#60:
	movsxd	rsi, dword ptr [rbx + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#61:
	movsxd	rsi, dword ptr [rbx + 20]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#62:
	movsxd	rsi, dword ptr [rbx + 24]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#63:
	movsxd	rsi, dword ptr [rbx + 28]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_113
	jp	.LBB11_113
# BB#64:
	inc	dword ptr [r15]
	mov	rdx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rdi, qword ptr [rcx + 128]
	mov	qword ptr [rsp + 352], rdx
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	qword ptr [rsp + 224], rdi
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vmovq	xmm1, rdi
	vpbroadcastq	ymm3, xmm1
	vmovapd	ymm4, ymmword ptr [rsp + 288]
	vfmadd213pd	ymm4, ymm2, ymm3
	vfmadd231pd	ymm3, ymm2, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#65:
	movsxd	rsi, dword ptr [rbx + 4]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#66:
	movsxd	rsi, dword ptr [rbx + 8]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#67:
	movsxd	rsi, dword ptr [rbx + 12]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#68:
	movsxd	rsi, dword ptr [rbx + 16]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#69:
	movsxd	rsi, dword ptr [rbx + 20]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#70:
	movsxd	rsi, dword ptr [rbx + 24]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#71:
	movsxd	rsi, dword ptr [rbx + 28]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_114
	jp	.LBB11_114
# BB#72:
	inc	dword ptr [r15]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	qword ptr [rsp + 512], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vmovapd	ymm3, ymmword ptr [rsp + 96]
	vfmadd132pd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vfmadd132pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm2
	vmovapd	ymmword ptr [rsp + 256], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#73:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#74:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#75:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#76:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#77:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#78:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#79:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_116
	jp	.LBB11_116
# BB#80:
	inc	dword ptr [r15]
	mov	rdx, qword ptr [rcx]
	mov	rdi, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 352], rdx
	mov	qword ptr [rsp + 224], rdi
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rdi
	vmulsd	xmm0, xmm0, xmm1
	vbroadcastsd	ymm1, xmm0
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 288]
	vaddpd	ymm1, ymm1, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm2
	vmovapd	ymmword ptr [rsp + 96], ymm1
	movsxd	rsi, dword ptr [rbx]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#81:
	movsxd	rsi, dword ptr [rbx + 4]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#82:
	movsxd	rsi, dword ptr [rbx + 8]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#83:
	movsxd	rsi, dword ptr [rbx + 12]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#84:
	movsxd	rsi, dword ptr [rbx + 16]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#85:
	movsxd	rsi, dword ptr [rbx + 20]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#86:
	movsxd	rsi, dword ptr [rbx + 24]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#87:
	movsxd	rsi, dword ptr [rbx + 28]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB11_117
	jp	.LBB11_117
# BB#88:
	mov	rdx, rcx
	inc	dword ptr [r15]
	sub	rdx, -128
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rdi, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	mov	qword ptr [rsp + 512], rdi
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vmovapd	ymm3, ymmword ptr [rsp + 96]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm2
	vmovapd	ymmword ptr [rsp + 256], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#89:
	movsxd	rsi, dword ptr [rbx + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#90:
	movsxd	rsi, dword ptr [rbx + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#91:
	movsxd	rsi, dword ptr [rbx + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#92:
	movsxd	rsi, dword ptr [rbx + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#93:
	movsxd	rsi, dword ptr [rbx + 20]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#94:
	movsxd	rsi, dword ptr [rbx + 24]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#95:
	movsxd	rsi, dword ptr [rbx + 28]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_119
	jp	.LBB11_119
# BB#96:
	inc	dword ptr [r15]
	mov	rdi, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	qword ptr [rsp + 512], rdi
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vmovapd	ymm3, ymmword ptr [rsp + 96]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm2
	vmovapd	ymmword ptr [rsp + 256], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#97:
	movsxd	rsi, dword ptr [rbx + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#98:
	movsxd	rsi, dword ptr [rbx + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#99:
	movsxd	rsi, dword ptr [rbx + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#100:
	movsxd	rsi, dword ptr [rbx + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#101:
	movsxd	rsi, dword ptr [rbx + 20]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#102:
	movsxd	rsi, dword ptr [rbx + 24]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#103:
	movsxd	rsi, dword ptr [rbx + 28]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB11_120
	jp	.LBB11_120
# BB#104:
	inc	dword ptr [r15]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 544], ymm1
	vmovaps	ymmword ptr [rsp + 512], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 352]
	vmovapd	ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymm2, ymmword ptr [rsp + 224]
	vmovapd	ymm3, ymmword ptr [rsp + 256]
	vfmadd213pd	ymm2, ymm0, ymmword ptr [rsp + 512]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 544]
	vmovapd	ymmword ptr [rsp + 416], ymm2
	vmovapd	ymmword ptr [rsp + 448], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#105:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#106:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#107:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#108:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#109:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#110:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#111:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 288]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB11_123
	jp	.LBB11_123
# BB#112:
	inc	dword ptr [r15]
	vmovaps	xmm6, xmmword ptr [rbp + 448] # 16-byte Reload
	lea	rsp, [rbp + 472]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB11_113:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB11_115
.LBB11_114:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB11_115:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB11_118
.LBB11_116:
	lea	r14, [rsp + 8*rsi + 224]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB11_122
.LBB11_117:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB11_118:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	jmp	.LBB11_124
.LBB11_119:
	lea	r14, [rsp + 8*rsi + 224]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB11_121
.LBB11_120:
	lea	r14, [rsp + 8*rsi + 224]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB11_121:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB11_122:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	jmp	.LBB11_124
.LBB11_123:
	lea	r14, [rsp + 8*rsi + 416]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 416]
.LBB11_124:
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	jmp	.LBB11_153
.LBB11_125:
	mov	ebx, eax
	lea	rdi, [rsp + 8*r15 + 64]
	jmp	.LBB11_133
.LBB11_126:
	lea	rdi, [rsp + 8*r13 + 64]
	mov	ebx, r10d
	jmp	.LBB11_133
.LBB11_127:
	lea	rdi, [rsp + 8*r12 + 64]
	mov	ebx, r11d
	jmp	.LBB11_133
.LBB11_128:
	lea	rdi, [rsp + 8*r14 + 64]
	jmp	.LBB11_133
.LBB11_129:
	lea	rdi, [rsp + 8*r8 + 64]
	mov	ebx, esi
	jmp	.LBB11_133
.LBB11_130:
	lea	rdi, [rsp + 8*r9 + 64]
	mov	ebx, edx
	jmp	.LBB11_133
.LBB11_131:
	lea	rdi, [rsp + 8*r10 + 64]
	mov	ebx, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_133
.LBB11_132:
	mov	ebx, esi
	lea	rdi, [rsp + 8*r11 + 64]
.LBB11_133:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB11_198
.LBB11_134:
	lea	r14, [rsp + 8*rdx + 224]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB11_142
.LBB11_135:
	mov	ebx, dword ptr [rsp + 60] # 4-byte Reload
	lea	r14, [rsp + 8*r13 + 224]
	jmp	.LBB11_142
.LBB11_136:
	lea	r14, [rsp + 8*r12 + 224]
	mov	ebx, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB11_142
.LBB11_137:
	lea	r14, [rsp + 8*r14 + 224]
	mov	ebx, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB11_142
.LBB11_138:
	lea	r14, [rsp + 8*r8 + 224]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB11_142
.LBB11_139:
	lea	r14, [rsp + 8*r9 + 224]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB11_142
.LBB11_140:
	lea	r14, [rsp + 8*r10 + 224]
	mov	ebx, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_142
.LBB11_141:
	lea	r14, [rsp + 8*r11 + 224]
	mov	ebx, dword ptr [rsp + 200] # 4-byte Reload
.LBB11_142:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	jmp	.LBB11_152
.LBB11_143:
	lea	r14, [rsp + 8*rdx + 64]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB11_151
.LBB11_144:
	mov	ebx, dword ptr [rsp + 60] # 4-byte Reload
	lea	r14, [rsp + 8*r13 + 64]
	jmp	.LBB11_151
.LBB11_145:
	lea	r14, [rsp + 8*r12 + 64]
	mov	ebx, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB11_151
.LBB11_146:
	lea	r14, [rsp + 8*r14 + 64]
	mov	ebx, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB11_151
.LBB11_147:
	lea	r14, [rsp + 8*r8 + 64]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB11_151
.LBB11_148:
	lea	r14, [rsp + 8*r9 + 64]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB11_151
.LBB11_149:
	lea	r14, [rsp + 8*r10 + 64]
	mov	ebx, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_151
.LBB11_150:
	lea	r14, [rsp + 8*r11 + 64]
	mov	ebx, dword ptr [rsp + 200] # 4-byte Reload
.LBB11_151:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB11_152:
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
.LBB11_153:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB11_197
.LBB11_154:
	lea	rbx, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB11_162
.LBB11_155:
	lea	rbx, [rsp + 8*r13 + 64]
	jmp	.LBB11_163
.LBB11_156:
	lea	rbx, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB11_162
.LBB11_157:
	lea	rbx, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB11_162
.LBB11_158:
	lea	rbx, [rsp + 8*r8 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB11_162
.LBB11_159:
	lea	rbx, [rsp + 8*r9 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB11_162
.LBB11_160:
	lea	rbx, [rsp + 8*r10 + 64]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_162
.LBB11_161:
	lea	rbx, [rsp + 8*r11 + 64]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB11_162:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB11_163:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB11_196
.LBB11_164:
	lea	rbx, [rsp + 8*rdx + 224]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB11_172
.LBB11_165:
	lea	rbx, [rsp + 8*r13 + 224]
	jmp	.LBB11_173
.LBB11_166:
	lea	rbx, [rsp + 8*r12 + 224]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB11_172
.LBB11_167:
	lea	rbx, [rsp + 8*r14 + 224]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB11_172
.LBB11_168:
	lea	rbx, [rsp + 8*r8 + 224]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB11_172
.LBB11_169:
	lea	rbx, [rsp + 8*r9 + 224]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB11_172
.LBB11_170:
	lea	rbx, [rsp + 8*r10 + 224]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_172
.LBB11_171:
	lea	rbx, [rsp + 8*r11 + 224]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB11_172:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB11_173:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	jmp	.LBB11_195
.LBB11_174:
	lea	rbx, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB11_182
.LBB11_175:
	lea	rbx, [rsp + 8*r13 + 64]
	jmp	.LBB11_183
.LBB11_176:
	lea	rbx, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB11_182
.LBB11_177:
	lea	rbx, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB11_182
.LBB11_178:
	lea	rbx, [rsp + 8*r8 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB11_182
.LBB11_179:
	lea	rbx, [rsp + 8*r9 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB11_182
.LBB11_180:
	lea	rbx, [rsp + 8*r10 + 64]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_182
.LBB11_181:
	lea	rbx, [rsp + 8*r11 + 64]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB11_182:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB11_183:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	jmp	.LBB11_194
.LBB11_184:
	lea	rbx, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB11_192
.LBB11_185:
	lea	rbx, [rsp + 8*r13 + 64]
	jmp	.LBB11_193
.LBB11_186:
	lea	rbx, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB11_192
.LBB11_187:
	lea	rbx, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB11_192
.LBB11_188:
	lea	rbx, [rsp + 8*r8 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB11_192
.LBB11_189:
	lea	rbx, [rsp + 8*r9 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB11_192
.LBB11_190:
	lea	rbx, [rsp + 8*r10 + 64]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB11_192
.LBB11_191:
	lea	rbx, [rsp + 8*r11 + 64]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB11_192:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB11_193:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
.LBB11_194:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB11_195:
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB11_196:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, dword ptr [rsp + 60] # 4-byte Reload
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rbx]   # xmm1 = mem[0],zero
.LBB11_197:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB11_198:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spId1XEvPKT0_
.Lcfi112:
	.seh_endproc

	.def	 _Z12test_pack_spIN4math6scalarE1XEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarE1XEvPKT0_
	.globl	_Z12test_pack_spIN4math6scalarE1XEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIN4math6scalarE1XEvPKT0_: # @_Z12test_pack_spIN4math6scalarE1XEvPKT0_
.Lcfi113:
.seh_proc _Z12test_pack_spIN4math6scalarE1XEvPKT0_
# BB#0:
	push	rbp
.Lcfi114:
	.seh_pushreg 5
	push	r15
.Lcfi115:
	.seh_pushreg 15
	push	r14
.Lcfi116:
	.seh_pushreg 14
	push	r13
.Lcfi117:
	.seh_pushreg 13
	push	r12
.Lcfi118:
	.seh_pushreg 12
	push	rsi
.Lcfi119:
	.seh_pushreg 6
	push	rdi
.Lcfi120:
	.seh_pushreg 7
	push	rbx
.Lcfi121:
	.seh_pushreg 3
	sub	rsp, 600
.Lcfi122:
	.seh_stackalloc 600
	lea	rbp, [rsp + 128]
.Lcfi123:
	.seh_setframe 5, 128
	vmovaps	xmmword ptr [rbp + 448], xmm6 # 16-byte Spill
.Lcfi124:
	.seh_savexmm 6, 576
.Lcfi125:
	.seh_endprologue
	and	rsp, -32
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovapd	ymmword ptr [rsp + 64], ymm0
	movabs	rdi, _ZN6layoutI1XE1iE
	mov	eax, dword ptr [rdi]
	movsxd	r15, eax
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB12_128
	jp	.LBB12_128
# BB#1:
	mov	r10d, dword ptr [rdi + 4]
	movsxd	r13, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*r13 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB12_129
	jp	.LBB12_129
# BB#2:
	mov	r11d, dword ptr [rdi + 8]
	movsxd	r12, r11d
	vmovsd	xmm6, qword ptr [rsp + 8*r12 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB12_130
	jp	.LBB12_130
# BB#3:
	mov	ebx, dword ptr [rdi + 12]
	movsxd	r14, ebx
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB12_131
	jp	.LBB12_131
# BB#4:
	mov	esi, dword ptr [rdi + 16]
	movsxd	r8, esi
	vmovsd	xmm6, qword ptr [rsp + 8*r8 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB12_132
	jp	.LBB12_132
# BB#5:
	mov	dword ptr [rsp + 220], eax # 4-byte Spill
	mov	edx, dword ptr [rdi + 20]
	movsxd	r9, edx
	vmovsd	xmm6, qword ptr [rsp + 8*r9 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB12_133
	jp	.LBB12_133
# BB#6:
	mov	dword ptr [rsp + 60], r10d # 4-byte Spill
	mov	dword ptr [rsp + 212], edx # 4-byte Spill
	mov	dword ptr [rsp + 216], esi # 4-byte Spill
	mov	edx, dword ptr [rdi + 24]
	mov	dword ptr [rsp + 196], edx # 4-byte Spill
	movsxd	r10, edx
	vmovsd	xmm6, qword ptr [rsp + 8*r10 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB12_134
	jp	.LBB12_134
# BB#7:
	mov	dword ptr [rsp + 204], ebx # 4-byte Spill
	mov	dword ptr [rsp + 208], r11d # 4-byte Spill
	mov	esi, dword ptr [rdi + 28]
	movsxd	r11, esi
	vmovsd	xmm6, qword ptr [rsp + 8*r11 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	mov	rdx, r15
	jne	.LBB12_135
	jp	.LBB12_135
# BB#8:
	movabs	rbx, count
	mov	r15d, dword ptr [rbx]
	lea	eax, [r15 + 1]
	mov	dword ptr [rbx], eax
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymm1, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymm1, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 64]
	vmovapd	ymm1, ymmword ptr [rsp + 96]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 352]
	vmulpd	ymm1, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm0
	vmovapd	ymmword ptr [rsp + 256], ymm1
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 224]
	jne	.LBB12_137
	jp	.LBB12_137
# BB#9:
	vmovsd	xmm0, qword ptr [rsp + 8*r13 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 224]
	jne	.LBB12_138
	jp	.LBB12_138
# BB#10:
	vmovsd	xmm0, qword ptr [rsp + 8*r12 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 224]
	jne	.LBB12_139
	jp	.LBB12_139
# BB#11:
	vmovsd	xmm0, qword ptr [rsp + 8*r14 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 224]
	jne	.LBB12_140
	jp	.LBB12_140
# BB#12:
	vmovsd	xmm0, qword ptr [rsp + 8*r8 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 224]
	jne	.LBB12_141
	jp	.LBB12_141
# BB#13:
	vmovsd	xmm0, qword ptr [rsp + 8*r9 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 224]
	jne	.LBB12_142
	jp	.LBB12_142
# BB#14:
	vmovsd	xmm0, qword ptr [rsp + 8*r10 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 224]
	jne	.LBB12_143
	jp	.LBB12_143
# BB#15:
	mov	dword ptr [rsp + 200], esi # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*r11 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 224]
	jne	.LBB12_144
	jp	.LBB12_144
# BB#16:
	lea	rdi, [rcx + 64]
	lea	eax, [r15 + 2]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	mov	rsi, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rdi]
	vmovaps	ymm1, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 352], rsi
	vmovaps	ymm0, ymmword ptr [rdi]
	vmovaps	ymm1, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovq	xmm2, rsi
	vpbroadcastq	ymm3, xmm2
	vmulpd	ymm0, ymm3, ymmword ptr [rsp + 288]
	vmulpd	ymm1, ymm3, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	vmovapd	ymmword ptr [rsp + 96], ymm1
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB12_146
	jp	.LBB12_146
# BB#17:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB12_147
	jp	.LBB12_147
# BB#18:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB12_148
	jp	.LBB12_148
# BB#19:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB12_149
	jp	.LBB12_149
# BB#20:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB12_150
	jp	.LBB12_150
# BB#21:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB12_151
	jp	.LBB12_151
# BB#22:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB12_152
	jp	.LBB12_152
# BB#23:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB12_153
	jp	.LBB12_153
# BB#24:
	lea	eax, [r15 + 3]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rax, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	qword ptr [rsp + 352], rax
	vmovq	xmm0, rax
	vpbroadcastq	ymm1, xmm0
	vmulpd	ymm4, ymm1, ymmword ptr [rsp + 288]
	vmulpd	ymm5, ymm1, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm5
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB12_157
	jp	.LBB12_157
# BB#25:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB12_158
	jp	.LBB12_158
# BB#26:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB12_159
	jp	.LBB12_159
# BB#27:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB12_160
	jp	.LBB12_160
# BB#28:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB12_161
	jp	.LBB12_161
# BB#29:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB12_162
	jp	.LBB12_162
# BB#30:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB12_163
	jp	.LBB12_163
# BB#31:
	mov	qword ptr [rsp + 504], rax # 8-byte Spill
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB12_164
	jp	.LBB12_164
# BB#32:
	lea	eax, [r15 + 4]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm5
	vmovaps	ymmword ptr [rsp + 128], ymm4
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovaps	ymm5, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm5
	vmovaps	ymmword ptr [rsp + 288], ymm4
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm5
	vmovaps	ymmword ptr [rsp + 64], ymm4
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovaps	ymm5, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm5
	vmovaps	ymmword ptr [rsp + 352], ymm4
	vmovapd	ymm4, ymmword ptr [rsp + 64]
	vmovapd	ymm5, ymmword ptr [rsp + 96]
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 352]
	vaddpd	ymm5, ymm5, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm4
	vmovapd	ymmword ptr [rsp + 256], ymm5
	vmovsd	xmm4, qword ptr [rsp + 8*rdx + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdx + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 224]
	jne	.LBB12_167
	jp	.LBB12_167
# BB#33:
	vmovsd	xmm4, qword ptr [rsp + 8*r13 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r13 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 224]
	jne	.LBB12_168
	jp	.LBB12_168
# BB#34:
	vmovsd	xmm4, qword ptr [rsp + 8*r12 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r12 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 224]
	jne	.LBB12_169
	jp	.LBB12_169
# BB#35:
	vmovsd	xmm4, qword ptr [rsp + 8*r14 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r14 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 224]
	jne	.LBB12_170
	jp	.LBB12_170
# BB#36:
	vmovsd	xmm4, qword ptr [rsp + 8*r8 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r8 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 224]
	jne	.LBB12_171
	jp	.LBB12_171
# BB#37:
	vmovsd	xmm4, qword ptr [rsp + 8*r9 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r9 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 224]
	jne	.LBB12_172
	jp	.LBB12_172
# BB#38:
	vmovsd	xmm4, qword ptr [rsp + 8*r10 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r10 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 224]
	jne	.LBB12_173
	jp	.LBB12_173
# BB#39:
	vmovsd	xmm4, qword ptr [rsp + 8*r11 + 128] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r11 + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 224]
	jne	.LBB12_174
	jp	.LBB12_174
# BB#40:
	lea	eax, [r15 + 5]
	movabs	rbx, count
	mov	dword ptr [rbx], eax
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovaps	ymm5, ymmword ptr [rdi + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm5
	vmovaps	ymmword ptr [rsp + 128], ymm4
	mov	qword ptr [rsp + 352], rsi
	vmovaps	ymm4, ymmword ptr [rdi]
	vmovapd	ymm5, ymmword ptr [rdi + 32]
	vmovapd	ymmword ptr [rsp + 320], ymm5
	vmovaps	ymmword ptr [rsp + 288], ymm4
	vaddpd	ymm4, ymm3, ymmword ptr [rsp + 288]
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB12_177
	jp	.LBB12_177
# BB#41:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB12_178
	jp	.LBB12_178
# BB#42:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB12_179
	jp	.LBB12_179
# BB#43:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB12_180
	jp	.LBB12_180
# BB#44:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB12_181
	jp	.LBB12_181
# BB#45:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB12_182
	jp	.LBB12_182
# BB#46:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB12_183
	jp	.LBB12_183
# BB#47:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB12_184
	jp	.LBB12_184
# BB#48:
	mov	rsi, r15
	lea	eax, [r15 + 6]
	movabs	r15, count
	mov	dword ptr [r15], eax
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm3
	vmovaps	ymmword ptr [rsp + 128], ymm2
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm3
	vmovaps	ymmword ptr [rsp + 288], ymm2
	mov	rbx, qword ptr [rsp + 504] # 8-byte Reload
	mov	qword ptr [rsp + 352], rbx
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 288]
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm2
	vmovapd	ymmword ptr [rsp + 96], ymm3
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB12_187
	jp	.LBB12_187
# BB#49:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 64]
	jne	.LBB12_188
	jp	.LBB12_188
# BB#50:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	mov	rax, rdi
	jne	.LBB12_189
	jp	.LBB12_189
# BB#51:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB12_190
	jp	.LBB12_190
# BB#52:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 64]
	jne	.LBB12_191
	jp	.LBB12_191
# BB#53:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 64]
	jne	.LBB12_192
	jp	.LBB12_192
# BB#54:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 64]
	jne	.LBB12_193
	jp	.LBB12_193
# BB#55:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 64]
	jne	.LBB12_194
	jp	.LBB12_194
# BB#56:
	add	esi, 7
	mov	dword ptr [r15], esi
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm3
	vmovaps	ymmword ptr [rsp + 128], ymm2
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm3
	vmovaps	ymmword ptr [rsp + 288], ymm2
	mov	qword ptr [rsp + 352], rbx
	mov	qword ptr [rsp + 224], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rdx
	vpbroadcastq	ymm3, xmm2
	vmovapd	ymm4, ymmword ptr [rsp + 288]
	vfmadd132pd	ymm4, ymm3, ymm1
	vfmadd132pd	ymm1, ymm3, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm1
	movabs	rbx, _ZN6layoutI1XE1iE
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#57:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#58:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#59:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#60:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#61:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#62:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#63:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_113
	jp	.LBB12_113
# BB#64:
	inc	dword ptr [r15]
	mov	rdx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rdi, qword ptr [rcx + 128]
	mov	qword ptr [rsp + 352], rdx
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	qword ptr [rsp + 224], rdi
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vmovq	xmm1, rdi
	vpbroadcastq	ymm3, xmm1
	vmovapd	ymm4, ymmword ptr [rsp + 288]
	vfmadd213pd	ymm4, ymm2, ymm3
	vfmadd231pd	ymm3, ymm2, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#65:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#66:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#67:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#68:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#69:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#70:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_117
	jp	.LBB12_117
# BB#71:
	movsxd	rsi, dword ptr [rbx + 28]
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_202
	jp	.LBB12_202
# BB#72:
	inc	dword ptr [r15]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	qword ptr [rsp + 512], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vmovapd	ymm3, ymmword ptr [rsp + 96]
	vfmadd132pd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vfmadd132pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm2
	vmovapd	ymmword ptr [rsp + 256], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#73:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#74:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#75:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#76:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#77:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#78:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#79:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_114
	jp	.LBB12_114
# BB#80:
	inc	dword ptr [r15]
	mov	rdx, qword ptr [rcx]
	mov	rdi, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 352], rdx
	mov	qword ptr [rsp + 224], rdi
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rdi
	vmulsd	xmm2, xmm0, xmm1
	vbroadcastsd	ymm2, xmm2
	vaddpd	ymm3, ymm2, ymmword ptr [rsp + 288]
	vaddpd	ymm2, ymm2, ymmword ptr [rsp + 320]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	ymmword ptr [rsp + 96], ymm2
	movsxd	rsi, dword ptr [rbx]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#81:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#82:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#83:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#84:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#85:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#86:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_120
	jp	.LBB12_120
# BB#87:
	movsxd	rsi, dword ptr [rbx + 28]
	vfmadd213sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB12_203
	jp	.LBB12_203
# BB#88:
	mov	rdx, rcx
	inc	dword ptr [r15]
	sub	rdx, -128
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rdi, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	mov	qword ptr [rsp + 512], rdi
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vmovapd	ymm3, ymmword ptr [rsp + 96]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm2
	vmovapd	ymmword ptr [rsp + 256], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#89:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#90:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#91:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#92:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#93:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#94:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#95:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_115
	jp	.LBB12_115
# BB#96:
	inc	dword ptr [r15]
	mov	rdi, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	mov	qword ptr [rsp + 512], rdi
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 64]
	vmovapd	ymm3, ymmword ptr [rsp + 96]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymmword ptr [rsp + 224], ymm2
	vmovapd	ymmword ptr [rsp + 256], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#97:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#98:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#99:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#100:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#101:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#102:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_123
	jp	.LBB12_123
# BB#103:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 288] # xmm1 = mem[0],zero
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 224]
	jne	.LBB12_204
	jp	.LBB12_204
# BB#104:
	inc	dword ptr [r15]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 160], ymm1
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 320], ymm1
	vmovaps	ymmword ptr [rsp + 288], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 544], ymm1
	vmovaps	ymmword ptr [rsp + 512], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 352]
	vmovapd	ymm1, ymmword ptr [rsp + 384]
	vmovapd	ymm2, ymmword ptr [rsp + 224]
	vmovapd	ymm3, ymmword ptr [rsp + 256]
	vfmadd213pd	ymm2, ymm0, ymmword ptr [rsp + 512]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 544]
	vmovapd	ymmword ptr [rsp + 416], ymm2
	vmovapd	ymmword ptr [rsp + 448], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#105:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#106:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#107:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#108:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#109:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#110:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#111:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 288]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 416]
	jne	.LBB12_116
	jp	.LBB12_116
# BB#112:
	inc	dword ptr [r15]
	vmovaps	xmm6, xmmword ptr [rbp + 448] # 16-byte Reload
	lea	rsp, [rbp + 472]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB12_113:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB12_119
.LBB12_114:
	lea	r14, [rsp + 8*rsi + 224]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB12_126
.LBB12_115:
	lea	r14, [rsp + 8*rsi + 224]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB12_125
.LBB12_116:
	lea	r14, [rsp + 8*rsi + 416]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 416]
	jmp	.LBB12_127
.LBB12_117:
	lea	r14, [rsp + 8*rsi + 64]
.LBB12_118:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB12_119:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB12_122
.LBB12_120:
	lea	r14, [rsp + 8*rsi + 64]
.LBB12_121:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB12_122:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	jmp	.LBB12_127
.LBB12_123:
	lea	r14, [rsp + 8*rsi + 224]
.LBB12_124:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB12_125:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
.LBB12_126:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
.LBB12_127:
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	jmp	.LBB12_156
.LBB12_128:
	mov	ebx, eax
	lea	rdi, [rsp + 8*r15 + 64]
	jmp	.LBB12_136
.LBB12_129:
	lea	rdi, [rsp + 8*r13 + 64]
	mov	ebx, r10d
	jmp	.LBB12_136
.LBB12_130:
	lea	rdi, [rsp + 8*r12 + 64]
	mov	ebx, r11d
	jmp	.LBB12_136
.LBB12_131:
	lea	rdi, [rsp + 8*r14 + 64]
	jmp	.LBB12_136
.LBB12_132:
	lea	rdi, [rsp + 8*r8 + 64]
	mov	ebx, esi
	jmp	.LBB12_136
.LBB12_133:
	lea	rdi, [rsp + 8*r9 + 64]
	mov	ebx, edx
	jmp	.LBB12_136
.LBB12_134:
	lea	rdi, [rsp + 8*r10 + 64]
	mov	ebx, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_136
.LBB12_135:
	mov	ebx, esi
	lea	rdi, [rsp + 8*r11 + 64]
.LBB12_136:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB12_201
.LBB12_137:
	lea	r14, [rsp + 8*rdx + 224]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB12_145
.LBB12_138:
	mov	ebx, dword ptr [rsp + 60] # 4-byte Reload
	lea	r14, [rsp + 8*r13 + 224]
	jmp	.LBB12_145
.LBB12_139:
	lea	r14, [rsp + 8*r12 + 224]
	mov	ebx, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB12_145
.LBB12_140:
	lea	r14, [rsp + 8*r14 + 224]
	mov	ebx, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB12_145
.LBB12_141:
	lea	r14, [rsp + 8*r8 + 224]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB12_145
.LBB12_142:
	lea	r14, [rsp + 8*r9 + 224]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB12_145
.LBB12_143:
	lea	r14, [rsp + 8*r10 + 224]
	mov	ebx, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_145
.LBB12_144:
	lea	r14, [rsp + 8*r11 + 224]
	mov	ebx, dword ptr [rsp + 200] # 4-byte Reload
.LBB12_145:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	jmp	.LBB12_155
.LBB12_146:
	lea	r14, [rsp + 8*rdx + 64]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB12_154
.LBB12_147:
	mov	ebx, dword ptr [rsp + 60] # 4-byte Reload
	lea	r14, [rsp + 8*r13 + 64]
	jmp	.LBB12_154
.LBB12_148:
	lea	r14, [rsp + 8*r12 + 64]
	mov	ebx, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB12_154
.LBB12_149:
	lea	r14, [rsp + 8*r14 + 64]
	mov	ebx, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB12_154
.LBB12_150:
	lea	r14, [rsp + 8*r8 + 64]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB12_154
.LBB12_151:
	lea	r14, [rsp + 8*r9 + 64]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB12_154
.LBB12_152:
	lea	r14, [rsp + 8*r10 + 64]
	mov	ebx, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_154
.LBB12_153:
	lea	r14, [rsp + 8*r11 + 64]
	mov	ebx, dword ptr [rsp + 200] # 4-byte Reload
.LBB12_154:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB12_155:
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
.LBB12_156:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB12_200
.LBB12_157:
	lea	rbx, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB12_165
.LBB12_158:
	lea	rbx, [rsp + 8*r13 + 64]
	jmp	.LBB12_166
.LBB12_159:
	lea	rbx, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB12_165
.LBB12_160:
	lea	rbx, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB12_165
.LBB12_161:
	lea	rbx, [rsp + 8*r8 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB12_165
.LBB12_162:
	lea	rbx, [rsp + 8*r9 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB12_165
.LBB12_163:
	lea	rbx, [rsp + 8*r10 + 64]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_165
.LBB12_164:
	lea	rbx, [rsp + 8*r11 + 64]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB12_165:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB12_166:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB12_199
.LBB12_167:
	lea	rbx, [rsp + 8*rdx + 224]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB12_175
.LBB12_168:
	lea	rbx, [rsp + 8*r13 + 224]
	jmp	.LBB12_176
.LBB12_169:
	lea	rbx, [rsp + 8*r12 + 224]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB12_175
.LBB12_170:
	lea	rbx, [rsp + 8*r14 + 224]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB12_175
.LBB12_171:
	lea	rbx, [rsp + 8*r8 + 224]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB12_175
.LBB12_172:
	lea	rbx, [rsp + 8*r9 + 224]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB12_175
.LBB12_173:
	lea	rbx, [rsp + 8*r10 + 224]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_175
.LBB12_174:
	lea	rbx, [rsp + 8*r11 + 224]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB12_175:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB12_176:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1X
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	jmp	.LBB12_198
.LBB12_177:
	lea	rbx, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB12_185
.LBB12_178:
	lea	rbx, [rsp + 8*r13 + 64]
	jmp	.LBB12_186
.LBB12_179:
	lea	rbx, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB12_185
.LBB12_180:
	lea	rbx, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB12_185
.LBB12_181:
	lea	rbx, [rsp + 8*r8 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB12_185
.LBB12_182:
	lea	rbx, [rsp + 8*r9 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB12_185
.LBB12_183:
	lea	rbx, [rsp + 8*r10 + 64]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_185
.LBB12_184:
	lea	rbx, [rsp + 8*r11 + 64]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB12_185:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB12_186:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	jmp	.LBB12_197
.LBB12_187:
	lea	rbx, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB12_195
.LBB12_188:
	lea	rbx, [rsp + 8*r13 + 64]
	jmp	.LBB12_196
.LBB12_189:
	lea	rbx, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 208] # 4-byte Reload
	jmp	.LBB12_195
.LBB12_190:
	lea	rbx, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 204] # 4-byte Reload
	jmp	.LBB12_195
.LBB12_191:
	lea	rbx, [rsp + 8*r8 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB12_195
.LBB12_192:
	lea	rbx, [rsp + 8*r9 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
	jmp	.LBB12_195
.LBB12_193:
	lea	rbx, [rsp + 8*r10 + 64]
	mov	eax, dword ptr [rsp + 196] # 4-byte Reload
	jmp	.LBB12_195
.LBB12_194:
	lea	rbx, [rsp + 8*r11 + 64]
	mov	eax, dword ptr [rsp + 200] # 4-byte Reload
.LBB12_195:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB12_196:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1X
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 288]
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB12_197:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB12_198:
	mov	rcx, rax
	call	_ZlsI1XERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB12_199:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, dword ptr [rsp + 60] # 4-byte Reload
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rbx]   # xmm1 = mem[0],zero
.LBB12_200:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB12_201:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
.LBB12_202:
	lea	r14, [rsp + 8*rsi + 64]
	vmovapd	xmm6, xmm0
	jmp	.LBB12_118
.LBB12_203:
	lea	r14, [rsp + 8*rsi + 64]
	vmovapd	xmm6, xmm0
	jmp	.LBB12_121
.LBB12_204:
	lea	r14, [rsp + 8*rsi + 224]
	vmovapd	xmm6, xmm0
	jmp	.LBB12_124
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarE1XEvPKT0_
.Lcfi126:
	.seh_endproc

	.def	 _ZlsI1XERSoS1_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsI1XERSoS1_7printerIT_E
	.globl	_ZlsI1XERSoS1_7printerIT_E
	.p2align	4, 0x90
_ZlsI1XERSoS1_7printerIT_E:             # @_ZlsI1XERSoS1_7printerIT_E
.Lcfi127:
.seh_proc _ZlsI1XERSoS1_7printerIT_E
# BB#0:
	push	rbp
.Lcfi128:
	.seh_pushreg 5
	push	rsi
.Lcfi129:
	.seh_pushreg 6
	push	rdi
.Lcfi130:
	.seh_pushreg 7
	sub	rsp, 96
.Lcfi131:
	.seh_stackalloc 96
	lea	rbp, [rsp + 96]
.Lcfi132:
	.seh_setframe 5, 96
.Lcfi133:
	.seh_endprologue
	and	rsp, -32
	mov	rsi, rcx
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	movabs	rdi, _ZN6layoutI1XE1iE
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	vzeroupper
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 4]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 8]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 12]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 16]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 20]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 24]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 28]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	mov	rsp, rbp
	pop	rdi
	pop	rsi
	pop	rbp
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsI1XERSoS1_7printerIT_E
.Lcfi134:
	.seh_endproc

	.def	 _Z12test_pack_spId1YEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spId1YEvPKT0_
	.globl	_Z12test_pack_spId1YEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spId1YEvPKT0_:            # @_Z12test_pack_spId1YEvPKT0_
.Lcfi135:
.seh_proc _Z12test_pack_spId1YEvPKT0_
# BB#0:
	push	rbp
.Lcfi136:
	.seh_pushreg 5
	push	r15
.Lcfi137:
	.seh_pushreg 15
	push	r14
.Lcfi138:
	.seh_pushreg 14
	push	r13
.Lcfi139:
	.seh_pushreg 13
	push	r12
.Lcfi140:
	.seh_pushreg 12
	push	rsi
.Lcfi141:
	.seh_pushreg 6
	push	rdi
.Lcfi142:
	.seh_pushreg 7
	push	rbx
.Lcfi143:
	.seh_pushreg 3
	sub	rsp, 1176
.Lcfi144:
	.seh_stackalloc 1176
	lea	rbp, [rsp + 128]
.Lcfi145:
	.seh_setframe 5, 128
	vmovapd	xmmword ptr [rbp + 1024], xmm7 # 16-byte Spill
.Lcfi146:
	.seh_savexmm 7, 1152
	vmovaps	xmmword ptr [rbp + 1008], xmm6 # 16-byte Spill
.Lcfi147:
	.seh_savexmm 6, 1136
.Lcfi148:
	.seh_endprologue
	and	rsp, -32
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovapd	ymm2, ymmword ptr [rcx + 64]
	vmovapd	ymm3, ymmword ptr [rcx + 96]
	vmovapd	ymmword ptr [rsp + 128], ymm3
	vmovapd	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovapd	ymmword ptr [rsp + 32], ymm0
	movabs	rax, _ZN6layoutI1YE1iE
	mov	r15d, dword ptr [rax]
	movsxd	rdx, r15d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 688], rdx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_226
	jp	.LBB14_226
# BB#1:
	mov	r9d, dword ptr [rax + 4]
	movsxd	rdx, r9d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 680], rdx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_227
	jp	.LBB14_227
# BB#2:
	mov	r13d, dword ptr [rax + 8]
	movsxd	rdx, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_228
	jp	.LBB14_228
# BB#3:
	mov	r8d, dword ptr [rax + 12]
	movsxd	rdi, r8d
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB14_229
	jp	.LBB14_229
# BB#4:
	mov	qword ptr [rsp + 696], rdx # 8-byte Spill
	mov	r10d, dword ptr [rax + 16]
	movsxd	rbx, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 32]
	jne	.LBB14_230
	jp	.LBB14_230
# BB#5:
	mov	qword ptr [rsp + 664], rbx # 8-byte Spill
	mov	qword ptr [rsp + 672], rdi # 8-byte Spill
	mov	r14d, dword ptr [rax + 20]
	movsxd	rdx, r14d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 648], rdx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_231
	jp	.LBB14_231
# BB#6:
	mov	dword ptr [rsp + 344], r13d # 4-byte Spill
	mov	r11d, dword ptr [rax + 24]
	movsxd	rdx, r11d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 640], rdx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_232
	jp	.LBB14_232
# BB#7:
	mov	r13d, dword ptr [rax + 28]
	movsxd	rdx, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	r12, rdx
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_233
	jp	.LBB14_233
# BB#8:
	mov	edx, dword ptr [rax + 32]
	movsxd	rdi, edx
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 840], rdi # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB14_234
	jp	.LBB14_234
# BB#9:
	mov	edi, dword ptr [rax + 36]
	movsxd	rsi, edi
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 632], rsi # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_235
	jp	.LBB14_235
# BB#10:
	mov	dword ptr [rsp + 348], r9d # 4-byte Spill
	mov	esi, dword ptr [rax + 40]
	movsxd	rbx, esi
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 624], rbx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 32]
	jne	.LBB14_236
	jp	.LBB14_236
# BB#11:
	mov	dword ptr [rsp + 340], esi # 4-byte Spill
	mov	esi, dword ptr [rax + 44]
	movsxd	rbx, esi
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 160] # xmm6 = mem[0],zero
	mov	r9, rbx
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 32]
	jne	.LBB14_237
	jp	.LBB14_237
# BB#12:
	mov	dword ptr [rsp + 336], r15d # 4-byte Spill
	mov	dword ptr [rsp + 328], edi # 4-byte Spill
	mov	dword ptr [rsp + 332], edx # 4-byte Spill
	mov	edx, dword ptr [rax + 48]
	movsxd	rdi, edx
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 832], rdi # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB14_238
	jp	.LBB14_238
# BB#13:
	mov	edi, dword ptr [rax + 52]
	movsxd	r15, edi
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB14_240
	jp	.LBB14_240
# BB#14:
	mov	dword ptr [rsp + 312], esi # 4-byte Spill
	mov	dword ptr [rsp + 316], r13d # 4-byte Spill
	mov	dword ptr [rsp + 320], r11d # 4-byte Spill
	mov	dword ptr [rsp + 324], r14d # 4-byte Spill
	mov	r13d, dword ptr [rax + 56]
	movsxd	r14, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB14_241
	jp	.LBB14_241
# BB#15:
	mov	dword ptr [rsp + 292], r13d # 4-byte Spill
	mov	dword ptr [rsp + 296], edi # 4-byte Spill
	mov	dword ptr [rsp + 300], edx # 4-byte Spill
	mov	dword ptr [rsp + 304], r10d # 4-byte Spill
	mov	dword ptr [rsp + 308], r8d # 4-byte Spill
	mov	r10d, dword ptr [rax + 60]
	movsxd	r8, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*r8 + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	mov	r11, r12
	mov	r13, r9
	jne	.LBB14_242
	jp	.LBB14_242
# BB#16:
	movabs	rdi, count
	mov	edx, dword ptr [rdi]
	mov	qword ptr [rsp + 656], rdx # 8-byte Spill
	lea	ebx, [rdx + 1]
	mov	dword ptr [rdi], ebx
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymm2, ymmword ptr [rcx + 192]
	vmovaps	ymm3, ymmword ptr [rcx + 224]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymm2, ymmword ptr [rcx + 192]
	vmovaps	ymm3, ymmword ptr [rcx + 224]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 32]
	vmovapd	ymm1, ymmword ptr [rsp + 64]
	vmovapd	ymm2, ymmword ptr [rsp + 96]
	vmovapd	ymm3, ymmword ptr [rsp + 128]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 704]
	vmulpd	ymm1, ymm1, ymmword ptr [rsp + 736]
	vmulpd	ymm2, ymm2, ymmword ptr [rsp + 768]
	vmulpd	ymm3, ymm3, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 352], ymm0
	vmovapd	ymmword ptr [rsp + 384], ymm1
	vmovapd	ymmword ptr [rsp + 416], ymm2
	vmovapd	ymmword ptr [rsp + 448], ymm3
	mov	rdx, qword ptr [rsp + 688] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 352]
	mov	r12, qword ptr [rsp + 840] # 8-byte Reload
	mov	r9, qword ptr [rsp + 832] # 8-byte Reload
	jne	.LBB14_245
	jp	.LBB14_245
# BB#17:
	mov	rdx, qword ptr [rsp + 680] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 352]
	mov	rdi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB14_246
	jp	.LBB14_246
# BB#18:
	vmovsd	xmm0, qword ptr [rsp + 8*rdi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 352]
	jne	.LBB14_247
	jp	.LBB14_247
# BB#19:
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_248
	jp	.LBB14_248
# BB#20:
	mov	rdx, qword ptr [rsp + 664] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 352]
	jne	.LBB14_249
	jp	.LBB14_249
# BB#21:
	mov	rdx, qword ptr [rsp + 648] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 352]
	mov	rbx, qword ptr [rsp + 640] # 8-byte Reload
	mov	rsi, qword ptr [rsp + 632] # 8-byte Reload
	jne	.LBB14_250
	jp	.LBB14_250
# BB#22:
	vmovsd	xmm0, qword ptr [rsp + 8*rbx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 352]
	jne	.LBB14_251
	jp	.LBB14_251
# BB#23:
	vmovsd	xmm0, qword ptr [rsp + 8*r11 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 352]
	jne	.LBB14_252
	jp	.LBB14_252
# BB#24:
	vmovsd	xmm0, qword ptr [rsp + 8*r12 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 352]
	jne	.LBB14_253
	jp	.LBB14_253
# BB#25:
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_254
	jp	.LBB14_254
# BB#26:
	mov	rdx, qword ptr [rsp + 624] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 352]
	jne	.LBB14_255
	jp	.LBB14_255
# BB#27:
	vmovsd	xmm0, qword ptr [rsp + 8*r13 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 352]
	jne	.LBB14_256
	jp	.LBB14_256
# BB#28:
	vmovsd	xmm0, qword ptr [rsp + 8*r9 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 352]
	jne	.LBB14_257
	jp	.LBB14_257
# BB#29:
	vmovsd	xmm0, qword ptr [rsp + 8*r15 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 352]
	jne	.LBB14_258
	jp	.LBB14_258
# BB#30:
	vmovsd	xmm0, qword ptr [rsp + 8*r14 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 352]
	jne	.LBB14_259
	jp	.LBB14_259
# BB#31:
	mov	dword ptr [rsp + 288], r10d # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*r8 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 352]
	jne	.LBB14_260
	jp	.LBB14_260
# BB#32:
	mov	rbx, rcx
	sub	rbx, -128
	mov	rdx, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rdx + 2]
	movabs	r10, count
	mov	dword ptr [r10], esi
	mov	rdx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 704], rdx
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	mov	qword ptr [rsp + 856], rdx # 8-byte Spill
	vmovq	xmm2, rdx
	vpbroadcastq	ymm3, xmm2
	vmulpd	ymm0, ymm3, ymmword ptr [rsp + 480]
	vmulpd	ymm1, ymm3, ymmword ptr [rsp + 512]
	vmulpd	ymm4, ymm3, ymmword ptr [rsp + 544]
	vmulpd	ymm5, ymm3, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm0
	vmovapd	ymmword ptr [rsp + 64], ymm1
	vmovapd	ymmword ptr [rsp + 96], ymm4
	vmovapd	ymmword ptr [rsp + 128], ymm5
	mov	rdx, qword ptr [rsp + 688] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_262
	jp	.LBB14_262
# BB#33:
	mov	r10, qword ptr [rsp + 680] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 32]
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	jne	.LBB14_263
	jp	.LBB14_263
# BB#34:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB14_264
	jp	.LBB14_264
# BB#35:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_265
	jp	.LBB14_265
# BB#36:
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_266
	jp	.LBB14_266
# BB#37:
	mov	rsi, qword ptr [rsp + 648] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_267
	jp	.LBB14_267
# BB#38:
	mov	rsi, qword ptr [rsp + 640] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_268
	jp	.LBB14_268
# BB#39:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB14_269
	jp	.LBB14_269
# BB#40:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	mov	rsi, qword ptr [rsp + 632] # 8-byte Reload
	jne	.LBB14_270
	jp	.LBB14_270
# BB#41:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_271
	jp	.LBB14_271
# BB#42:
	mov	rsi, qword ptr [rsp + 624] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_272
	jp	.LBB14_272
# BB#43:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB14_273
	jp	.LBB14_273
# BB#44:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB14_274
	jp	.LBB14_274
# BB#45:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB14_275
	jp	.LBB14_275
# BB#46:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB14_276
	jp	.LBB14_276
# BB#47:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB14_277
	jp	.LBB14_277
# BB#48:
	mov	rsi, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rsi + 3]
	movabs	rdi, count
	mov	dword ptr [rdi], esi
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm5
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rsi, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm5
	vmovaps	ymmword ptr [rsp + 544], ymm4
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	mov	qword ptr [rsp + 704], rsi
	mov	qword ptr [rsp + 848], rsi # 8-byte Spill
	vmovq	xmm0, rsi
	vpbroadcastq	ymm1, xmm0
	vmulpd	ymm4, ymm1, ymmword ptr [rsp + 480]
	vmulpd	ymm5, ymm1, ymmword ptr [rsp + 512]
	vmulpd	ymm6, ymm1, ymmword ptr [rsp + 544]
	vmulpd	ymm7, ymm1, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm7
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_279
	jp	.LBB14_279
# BB#49:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 32]
	mov	rsi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB14_280
	jp	.LBB14_280
# BB#50:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_281
	jp	.LBB14_281
# BB#51:
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_282
	jp	.LBB14_282
# BB#52:
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_283
	jp	.LBB14_283
# BB#53:
	mov	rsi, qword ptr [rsp + 648] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_284
	jp	.LBB14_284
# BB#54:
	mov	rsi, qword ptr [rsp + 640] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_285
	jp	.LBB14_285
# BB#55:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB14_286
	jp	.LBB14_286
# BB#56:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	mov	rsi, qword ptr [rsp + 632] # 8-byte Reload
	jne	.LBB14_287
	jp	.LBB14_287
# BB#57:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_288
	jp	.LBB14_288
# BB#58:
	mov	rsi, qword ptr [rsp + 624] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_289
	jp	.LBB14_289
# BB#59:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB14_290
	jp	.LBB14_290
# BB#60:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB14_291
	jp	.LBB14_291
# BB#61:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB14_292
	jp	.LBB14_292
# BB#62:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB14_293
	jp	.LBB14_293
# BB#63:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB14_294
	jp	.LBB14_294
# BB#64:
	mov	rsi, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rsi + 4]
	movabs	rdi, count
	mov	dword ptr [rdi], esi
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymm6, ymmword ptr [rcx + 64]
	vmovaps	ymm7, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm7
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vmovaps	ymmword ptr [rsp + 192], ymm5
	vmovaps	ymmword ptr [rsp + 160], ymm4
	vmovaps	ymm4, ymmword ptr [rbx]
	vmovaps	ymm5, ymmword ptr [rbx + 32]
	vmovaps	ymm6, ymmword ptr [rbx + 64]
	vmovaps	ymm7, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm7
	vmovaps	ymmword ptr [rsp + 544], ymm6
	vmovaps	ymmword ptr [rsp + 512], ymm5
	vmovaps	ymmword ptr [rsp + 480], ymm4
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymm6, ymmword ptr [rcx + 64]
	vmovaps	ymm7, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm7
	vmovaps	ymmword ptr [rsp + 96], ymm6
	vmovaps	ymmword ptr [rsp + 64], ymm5
	vmovaps	ymmword ptr [rsp + 32], ymm4
	vmovaps	ymm4, ymmword ptr [rbx]
	vmovaps	ymm5, ymmword ptr [rbx + 32]
	vmovaps	ymm6, ymmword ptr [rbx + 64]
	vmovaps	ymm7, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm7
	vmovaps	ymmword ptr [rsp + 768], ymm6
	vmovaps	ymmword ptr [rsp + 736], ymm5
	vmovaps	ymmword ptr [rsp + 704], ymm4
	vmovapd	ymm4, ymmword ptr [rsp + 32]
	vmovapd	ymm5, ymmword ptr [rsp + 64]
	vmovapd	ymm6, ymmword ptr [rsp + 96]
	vmovapd	ymm7, ymmword ptr [rsp + 128]
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 704]
	vaddpd	ymm5, ymm5, ymmword ptr [rsp + 736]
	vaddpd	ymm6, ymm6, ymmword ptr [rsp + 768]
	vaddpd	ymm7, ymm7, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 352], ymm4
	vmovapd	ymmword ptr [rsp + 384], ymm5
	vmovapd	ymmword ptr [rsp + 416], ymm6
	vmovapd	ymmword ptr [rsp + 448], ymm7
	vmovsd	xmm4, qword ptr [rsp + 8*rdx + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rdx + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 352]
	jne	.LBB14_297
	jp	.LBB14_297
# BB#65:
	vmovsd	xmm4, qword ptr [rsp + 8*r10 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r10 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 352]
	mov	rsi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB14_298
	jp	.LBB14_298
# BB#66:
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_299
	jp	.LBB14_299
# BB#67:
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_300
	jp	.LBB14_300
# BB#68:
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_301
	jp	.LBB14_301
# BB#69:
	mov	rsi, qword ptr [rsp + 648] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_302
	jp	.LBB14_302
# BB#70:
	mov	rsi, qword ptr [rsp + 640] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_303
	jp	.LBB14_303
# BB#71:
	vmovsd	xmm4, qword ptr [rsp + 8*r11 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r11 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 352]
	jne	.LBB14_304
	jp	.LBB14_304
# BB#72:
	vmovsd	xmm4, qword ptr [rsp + 8*r12 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r12 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 352]
	mov	rsi, qword ptr [rsp + 632] # 8-byte Reload
	jne	.LBB14_305
	jp	.LBB14_305
# BB#73:
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_306
	jp	.LBB14_306
# BB#74:
	mov	rsi, qword ptr [rsp + 624] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_307
	jp	.LBB14_307
# BB#75:
	vmovsd	xmm4, qword ptr [rsp + 8*r13 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r13 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 352]
	jne	.LBB14_308
	jp	.LBB14_308
# BB#76:
	vmovsd	xmm4, qword ptr [rsp + 8*r9 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r9 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 352]
	jne	.LBB14_309
	jp	.LBB14_309
# BB#77:
	vmovsd	xmm4, qword ptr [rsp + 8*r15 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r15 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 352]
	jne	.LBB14_310
	jp	.LBB14_310
# BB#78:
	vmovsd	xmm4, qword ptr [rsp + 8*r14 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r14 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 352]
	jne	.LBB14_311
	jp	.LBB14_311
# BB#79:
	vmovsd	xmm4, qword ptr [rsp + 8*r8 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r8 + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 352]
	jne	.LBB14_312
	jp	.LBB14_312
# BB#80:
	mov	rsi, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rsi + 5]
	movabs	rdi, count
	mov	dword ptr [rdi], esi
	vmovaps	ymm4, ymmword ptr [rbx]
	vmovaps	ymm5, ymmword ptr [rbx + 32]
	vmovaps	ymm6, ymmword ptr [rbx + 64]
	vmovaps	ymm7, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm7
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vmovaps	ymmword ptr [rsp + 192], ymm5
	vmovaps	ymmword ptr [rsp + 160], ymm4
	mov	rsi, qword ptr [rsp + 856] # 8-byte Reload
	mov	qword ptr [rsp + 704], rsi
	vmovaps	ymm4, ymmword ptr [rbx]
	vmovaps	ymm5, ymmword ptr [rbx + 32]
	vmovaps	ymm6, ymmword ptr [rbx + 64]
	vmovapd	ymm7, ymmword ptr [rbx + 96]
	vmovapd	ymmword ptr [rsp + 576], ymm7
	vmovaps	ymmword ptr [rsp + 544], ymm6
	vmovaps	ymmword ptr [rsp + 512], ymm5
	vmovaps	ymmword ptr [rsp + 480], ymm4
	vaddpd	ymm4, ymm3, ymmword ptr [rsp + 480]
	vaddpd	ymm5, ymm3, ymmword ptr [rsp + 512]
	vaddpd	ymm6, ymm3, ymmword ptr [rsp + 544]
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_314
	jp	.LBB14_314
# BB#81:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 32]
	mov	rdx, qword ptr [rsp + 696] # 8-byte Reload
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	jne	.LBB14_315
	jp	.LBB14_315
# BB#82:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_316
	jp	.LBB14_316
# BB#83:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_317
	jp	.LBB14_317
# BB#84:
	mov	rdx, qword ptr [rsp + 664] # 8-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_318
	jp	.LBB14_318
# BB#85:
	mov	rdx, qword ptr [rsp + 648] # 8-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	mov	rdi, qword ptr [rsp + 640] # 8-byte Reload
	mov	rsi, qword ptr [rsp + 632] # 8-byte Reload
	jne	.LBB14_319
	jp	.LBB14_319
# BB#86:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB14_320
	jp	.LBB14_320
# BB#87:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB14_321
	jp	.LBB14_321
# BB#88:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	jne	.LBB14_322
	jp	.LBB14_322
# BB#89:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_323
	jp	.LBB14_323
# BB#90:
	mov	rdx, qword ptr [rsp + 624] # 8-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_324
	jp	.LBB14_324
# BB#91:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB14_325
	jp	.LBB14_325
# BB#92:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB14_326
	jp	.LBB14_326
# BB#93:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB14_327
	jp	.LBB14_327
# BB#94:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB14_328
	jp	.LBB14_328
# BB#95:
	mov	esi, dword ptr [rsp + 348] # 4-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB14_329
	jp	.LBB14_329
# BB#96:
	mov	rdx, qword ptr [rsp + 656] # 8-byte Reload
	lea	r10d, [rdx + 6]
	movabs	rdi, count
	mov	dword ptr [rdi], r10d
	mov	r10, rdi
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm5
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovaps	ymmword ptr [rsp + 192], ymm3
	vmovaps	ymmword ptr [rsp + 160], ymm2
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm5
	vmovaps	ymmword ptr [rsp + 544], ymm4
	vmovaps	ymmword ptr [rsp + 512], ymm3
	vmovaps	ymmword ptr [rsp + 480], ymm2
	mov	rdx, qword ptr [rsp + 848] # 8-byte Reload
	mov	qword ptr [rsp + 704], rdx
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 480]
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 512]
	vaddpd	ymm4, ymm1, ymmword ptr [rsp + 544]
	vaddpd	ymm5, ymm1, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm2
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	ymmword ptr [rsp + 96], ymm4
	vmovapd	ymmword ptr [rsp + 128], ymm5
	mov	rdx, qword ptr [rsp + 688] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_333
	jp	.LBB14_333
# BB#97:
	mov	rdx, qword ptr [rsp + 680] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	mov	rdi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB14_334
	jp	.LBB14_334
# BB#98:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB14_335
	jp	.LBB14_335
# BB#99:
	mov	rdx, qword ptr [rsp + 672] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	jne	.LBB14_336
	jp	.LBB14_336
# BB#100:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_337
	jp	.LBB14_337
# BB#101:
	mov	rdx, qword ptr [rsp + 648] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_338
	jp	.LBB14_338
# BB#102:
	mov	rdx, qword ptr [rsp + 640] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	mov	rsi, qword ptr [rsp + 632] # 8-byte Reload
	jne	.LBB14_339
	jp	.LBB14_339
# BB#103:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB14_340
	jp	.LBB14_340
# BB#104:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	jne	.LBB14_341
	jp	.LBB14_341
# BB#105:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_342
	jp	.LBB14_342
# BB#106:
	mov	rdx, qword ptr [rsp + 624] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB14_343
	jp	.LBB14_343
# BB#107:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB14_344
	jp	.LBB14_344
# BB#108:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB14_345
	jp	.LBB14_345
# BB#109:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB14_346
	jp	.LBB14_346
# BB#110:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB14_347
	jp	.LBB14_347
# BB#111:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB14_348
	jp	.LBB14_348
# BB#112:
	mov	rdx, qword ptr [rsp + 656] # 8-byte Reload
	add	edx, 7
	mov	dword ptr [r10], edx
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm5
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovaps	ymmword ptr [rsp + 192], ymm3
	vmovaps	ymmword ptr [rsp + 160], ymm2
	mov	rdx, qword ptr [rcx + 256]
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm5
	vmovaps	ymmword ptr [rsp + 544], ymm4
	vmovaps	ymmword ptr [rsp + 512], ymm3
	vmovaps	ymmword ptr [rsp + 480], ymm2
	mov	rdi, qword ptr [rsp + 848] # 8-byte Reload
	mov	qword ptr [rsp + 704], rdi
	mov	qword ptr [rsp + 352], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rdx
	vpbroadcastq	ymm3, xmm2
	vmovapd	ymm4, ymmword ptr [rsp + 480]
	vfmadd132pd	ymm4, ymm3, ymm1
	vmovapd	ymm5, ymmword ptr [rsp + 512]
	vfmadd132pd	ymm5, ymm3, ymm1
	vmovapd	ymm6, ymmword ptr [rsp + 544]
	vfmadd132pd	ymm6, ymm3, ymm1
	vfmadd132pd	ymm1, ymm3, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm1
	movsxd	rsi, dword ptr [rax]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#113:
	movsxd	rsi, dword ptr [rax + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#114:
	movsxd	rsi, dword ptr [rax + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#115:
	movsxd	rsi, dword ptr [rax + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#116:
	movsxd	rsi, dword ptr [rax + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#117:
	movsxd	rsi, dword ptr [rax + 20]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#118:
	movsxd	rsi, dword ptr [rax + 24]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#119:
	movsxd	rsi, dword ptr [rax + 28]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#120:
	movsxd	rsi, dword ptr [rax + 32]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#121:
	movsxd	rsi, dword ptr [rax + 36]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#122:
	movsxd	rsi, dword ptr [rax + 40]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#123:
	movsxd	rsi, dword ptr [rax + 44]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#124:
	movsxd	rsi, dword ptr [rax + 48]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#125:
	movsxd	rsi, dword ptr [rax + 52]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#126:
	movsxd	rsi, dword ptr [rax + 56]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#127:
	movsxd	rsi, dword ptr [rax + 60]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_214
	jp	.LBB14_214
# BB#128:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rdi, qword ptr [rcx + 256]
	mov	qword ptr [rsp + 704], rdx
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	mov	qword ptr [rsp + 352], rdi
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vmovq	xmm1, rdi
	vpbroadcastq	ymm3, xmm1
	vmovapd	ymm4, ymmword ptr [rsp + 480]
	vfmadd213pd	ymm4, ymm2, ymm3
	vmovapd	ymm5, ymmword ptr [rsp + 512]
	vfmadd213pd	ymm5, ymm2, ymm3
	vmovapd	ymm6, ymmword ptr [rsp + 544]
	vfmadd213pd	ymm6, ymm2, ymm3
	vfmadd231pd	ymm3, ymm2, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm3
	movsxd	rsi, dword ptr [rax]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#129:
	movsxd	rsi, dword ptr [rax + 4]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#130:
	movsxd	rsi, dword ptr [rax + 8]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#131:
	movsxd	rsi, dword ptr [rax + 12]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#132:
	movsxd	rsi, dword ptr [rax + 16]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#133:
	movsxd	rsi, dword ptr [rax + 20]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#134:
	movsxd	rsi, dword ptr [rax + 24]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#135:
	movsxd	rsi, dword ptr [rax + 28]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#136:
	movsxd	rsi, dword ptr [rax + 32]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#137:
	movsxd	rsi, dword ptr [rax + 36]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#138:
	movsxd	rsi, dword ptr [rax + 40]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#139:
	movsxd	rsi, dword ptr [rax + 44]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#140:
	movsxd	rsi, dword ptr [rax + 48]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#141:
	movsxd	rsi, dword ptr [rax + 52]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#142:
	movsxd	rsi, dword ptr [rax + 56]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#143:
	movsxd	rsi, dword ptr [rax + 60]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_215
	jp	.LBB14_215
# BB#144:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	mov	rdx, qword ptr [rcx + 256]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	mov	qword ptr [rsp + 864], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 32]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vmovapd	ymm4, ymmword ptr [rsp + 96]
	vmovapd	ymm5, ymmword ptr [rsp + 128]
	vfmadd132pd	ymm2, ymm1, ymmword ptr [rsp + 704]
	vfmadd132pd	ymm3, ymm1, ymmword ptr [rsp + 736]
	vfmadd132pd	ymm4, ymm1, ymmword ptr [rsp + 768]
	vfmadd132pd	ymm5, ymm1, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 352], ymm2
	vmovapd	ymmword ptr [rsp + 384], ymm3
	vmovapd	ymmword ptr [rsp + 416], ymm4
	vmovapd	ymmword ptr [rsp + 448], ymm5
	movsxd	rsi, dword ptr [rax]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#145:
	movsxd	rsi, dword ptr [rax + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#146:
	movsxd	rsi, dword ptr [rax + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#147:
	movsxd	rsi, dword ptr [rax + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#148:
	movsxd	rsi, dword ptr [rax + 16]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#149:
	movsxd	rsi, dword ptr [rax + 20]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#150:
	movsxd	rsi, dword ptr [rax + 24]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#151:
	movsxd	rsi, dword ptr [rax + 28]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#152:
	movsxd	rsi, dword ptr [rax + 32]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#153:
	movsxd	rsi, dword ptr [rax + 36]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#154:
	movsxd	rsi, dword ptr [rax + 40]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#155:
	movsxd	rsi, dword ptr [rax + 44]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#156:
	movsxd	rsi, dword ptr [rax + 48]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#157:
	movsxd	rsi, dword ptr [rax + 52]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#158:
	movsxd	rsi, dword ptr [rax + 56]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#159:
	movsxd	rsi, dword ptr [rax + 60]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 160] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_217
	jp	.LBB14_217
# BB#160:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	mov	rdi, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rcx + 256]
	vmovaps	ymm1, ymmword ptr [rcx + 288]
	vmovaps	ymm2, ymmword ptr [rcx + 320]
	vmovaps	ymm3, ymmword ptr [rcx + 352]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 704], rdx
	mov	qword ptr [rsp + 352], rdi
	vmovaps	ymm0, ymmword ptr [rcx + 256]
	vmovaps	ymm1, ymmword ptr [rcx + 288]
	vmovaps	ymm2, ymmword ptr [rcx + 320]
	vmovaps	ymm3, ymmword ptr [rcx + 352]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rdi
	vmulsd	xmm0, xmm0, xmm1
	vbroadcastsd	ymm1, xmm0
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 480]
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 512]
	vaddpd	ymm4, ymm1, ymmword ptr [rsp + 544]
	vaddpd	ymm1, ymm1, ymmword ptr [rsp + 576]
	vmovapd	ymmword ptr [rsp + 32], ymm2
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	ymmword ptr [rsp + 96], ymm4
	vmovapd	ymmword ptr [rsp + 128], ymm1
	movsxd	rsi, dword ptr [rax]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#161:
	movsxd	rsi, dword ptr [rax + 4]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#162:
	movsxd	rsi, dword ptr [rax + 8]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#163:
	movsxd	rsi, dword ptr [rax + 12]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#164:
	movsxd	rsi, dword ptr [rax + 16]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#165:
	movsxd	rsi, dword ptr [rax + 20]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#166:
	movsxd	rsi, dword ptr [rax + 24]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#167:
	movsxd	rsi, dword ptr [rax + 28]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#168:
	movsxd	rsi, dword ptr [rax + 32]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#169:
	movsxd	rsi, dword ptr [rax + 36]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#170:
	movsxd	rsi, dword ptr [rax + 40]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#171:
	movsxd	rsi, dword ptr [rax + 44]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#172:
	movsxd	rsi, dword ptr [rax + 48]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#173:
	movsxd	rsi, dword ptr [rax + 52]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#174:
	movsxd	rsi, dword ptr [rax + 56]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#175:
	movsxd	rsi, dword ptr [rax + 60]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB14_218
	jp	.LBB14_218
# BB#176:
	lea	rdx, [rcx + 256]
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rdi, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	mov	qword ptr [rsp + 864], rdi
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 32]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vmovapd	ymm4, ymmword ptr [rsp + 96]
	vmovapd	ymm5, ymmword ptr [rsp + 128]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 704]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 736]
	vfmadd213pd	ymm4, ymm1, ymmword ptr [rsp + 768]
	vfmadd213pd	ymm5, ymm1, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 352], ymm2
	vmovapd	ymmword ptr [rsp + 384], ymm3
	vmovapd	ymmword ptr [rsp + 416], ymm4
	vmovapd	ymmword ptr [rsp + 448], ymm5
	movsxd	rsi, dword ptr [rax]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#177:
	movsxd	rsi, dword ptr [rax + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#178:
	movsxd	rsi, dword ptr [rax + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#179:
	movsxd	rsi, dword ptr [rax + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#180:
	movsxd	rsi, dword ptr [rax + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#181:
	movsxd	rsi, dword ptr [rax + 20]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#182:
	movsxd	rsi, dword ptr [rax + 24]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#183:
	movsxd	rsi, dword ptr [rax + 28]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#184:
	movsxd	rsi, dword ptr [rax + 32]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#185:
	movsxd	rsi, dword ptr [rax + 36]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#186:
	movsxd	rsi, dword ptr [rax + 40]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#187:
	movsxd	rsi, dword ptr [rax + 44]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#188:
	movsxd	rsi, dword ptr [rax + 48]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#189:
	movsxd	rsi, dword ptr [rax + 52]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#190:
	movsxd	rsi, dword ptr [rax + 56]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#191:
	movsxd	rsi, dword ptr [rax + 60]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_220
	jp	.LBB14_220
# BB#192:
	inc	dword ptr [r10]
	mov	rdi, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	mov	qword ptr [rsp + 864], rdi
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 32]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vmovapd	ymm4, ymmword ptr [rsp + 96]
	vmovapd	ymm5, ymmword ptr [rsp + 128]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 704]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 736]
	vfmadd213pd	ymm4, ymm1, ymmword ptr [rsp + 768]
	vfmadd213pd	ymm5, ymm1, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 352], ymm2
	vmovapd	ymmword ptr [rsp + 384], ymm3
	vmovapd	ymmword ptr [rsp + 416], ymm4
	vmovapd	ymmword ptr [rsp + 448], ymm5
	movsxd	rsi, dword ptr [rax]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#193:
	movsxd	rsi, dword ptr [rax + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#194:
	movsxd	rsi, dword ptr [rax + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#195:
	movsxd	rsi, dword ptr [rax + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#196:
	movsxd	rsi, dword ptr [rax + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#197:
	movsxd	rsi, dword ptr [rax + 20]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#198:
	movsxd	rsi, dword ptr [rax + 24]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#199:
	movsxd	rsi, dword ptr [rax + 28]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#200:
	movsxd	rsi, dword ptr [rax + 32]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#201:
	movsxd	rsi, dword ptr [rax + 36]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#202:
	movsxd	rsi, dword ptr [rax + 40]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#203:
	movsxd	rsi, dword ptr [rax + 44]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#204:
	movsxd	rsi, dword ptr [rax + 48]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#205:
	movsxd	rsi, dword ptr [rax + 52]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#206:
	movsxd	rsi, dword ptr [rax + 56]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#207:
	movsxd	rsi, dword ptr [rax + 60]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 160]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 480]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 352]
	jne	.LBB14_221
	jp	.LBB14_221
# BB#208:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 576], ymm3
	vmovaps	ymmword ptr [rsp + 544], ymm2
	vmovaps	ymmword ptr [rsp + 512], ymm1
	vmovaps	ymmword ptr [rsp + 480], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	vmovaps	ymm0, ymmword ptr [rbx]
	vmovaps	ymm1, ymmword ptr [rbx + 32]
	vmovaps	ymm2, ymmword ptr [rbx + 64]
	vmovaps	ymm3, ymmword ptr [rbx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 960], ymm3
	vmovaps	ymmword ptr [rsp + 928], ymm2
	vmovaps	ymmword ptr [rsp + 896], ymm1
	vmovaps	ymmword ptr [rsp + 864], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 704]
	vmovapd	ymm1, ymmword ptr [rsp + 736]
	vmovapd	ymm2, ymmword ptr [rsp + 768]
	vmovapd	ymm3, ymmword ptr [rsp + 800]
	vmovapd	ymm4, ymmword ptr [rsp + 352]
	vmovapd	ymm5, ymmword ptr [rsp + 384]
	vmovapd	ymm6, ymmword ptr [rsp + 416]
	vmovapd	ymm7, ymmword ptr [rsp + 448]
	vfmadd213pd	ymm4, ymm0, ymmword ptr [rsp + 864]
	vfmadd213pd	ymm5, ymm1, ymmword ptr [rsp + 896]
	vfmadd213pd	ymm6, ymm2, ymmword ptr [rsp + 928]
	vfmadd213pd	ymm7, ymm3, ymmword ptr [rsp + 960]
	vmovapd	ymmword ptr [rsp + 992], ymm4
	vmovapd	ymmword ptr [rsp + 1024], ymm5
	vmovapd	ymmword ptr [rsp + 1056], ymm6
	vmovapd	ymmword ptr [rsp + 1088], ymm7
	lea	rcx, [rax + 64]
	.p2align	4, 0x90
.LBB14_209:                             # =>This Inner Loop Header: Depth=1
	movsxd	rsi, dword ptr [rax]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 32]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 992]
	jne	.LBB14_213
	jp	.LBB14_213
# BB#210:                               #   in Loop: Header=BB14_209 Depth=1
	movsxd	rsi, dword ptr [rax + 4]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 480]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 32]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 992]
	jne	.LBB14_213
	jp	.LBB14_213
# BB#211:                               #   in Loop: Header=BB14_209 Depth=1
	add	rax, 8
	cmp	rax, rcx
	jne	.LBB14_209
# BB#212:
	inc	dword ptr [r10]
	vmovaps	xmm6, xmmword ptr [rbp + 1008] # 16-byte Reload
	vmovaps	xmm7, xmmword ptr [rbp + 1024] # 16-byte Reload
	lea	rsp, [rbp + 1048]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB14_213:
	lea	r14, [rsp + 8*rsi + 992]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 992]
	jmp	.LBB14_224
.LBB14_214:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB14_216
.LBB14_215:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB14_216:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB14_219
.LBB14_217:
	lea	r14, [rsp + 8*rsi + 352]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB14_223
.LBB14_218:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB14_219:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	jmp	.LBB14_224
.LBB14_220:
	lea	r14, [rsp + 8*rsi + 352]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB14_222
.LBB14_221:
	lea	r14, [rsp + 8*rsi + 352]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB14_222:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB14_223:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
.LBB14_224:
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
.LBB14_225:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB14_350
.LBB14_226:
	mov	r13d, r15d
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	jmp	.LBB14_244
.LBB14_227:
	mov	rax, qword ptr [rsp + 680] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, r9d
	jmp	.LBB14_244
.LBB14_228:
	lea	r15, [rsp + 8*rdx + 32]
	jmp	.LBB14_244
.LBB14_229:
	lea	r15, [rsp + 8*rdi + 32]
	mov	r13d, r8d
	jmp	.LBB14_244
.LBB14_230:
	lea	r15, [rsp + 8*rbx + 32]
	jmp	.LBB14_243
.LBB14_231:
	mov	rax, qword ptr [rsp + 648] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, r14d
	jmp	.LBB14_244
.LBB14_232:
	mov	rax, qword ptr [rsp + 640] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, r11d
	jmp	.LBB14_244
.LBB14_233:
	lea	r15, [rsp + 8*r12 + 32]
	jmp	.LBB14_244
.LBB14_234:
	mov	rax, qword ptr [rsp + 840] # 8-byte Reload
	jmp	.LBB14_239
.LBB14_235:
	mov	rax, qword ptr [rsp + 632] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, edi
	jmp	.LBB14_244
.LBB14_236:
	mov	rax, qword ptr [rsp + 624] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, esi
	jmp	.LBB14_244
.LBB14_237:
	lea	r15, [rsp + 8*r9 + 32]
	mov	r13d, esi
	jmp	.LBB14_244
.LBB14_238:
	mov	rax, qword ptr [rsp + 832] # 8-byte Reload
.LBB14_239:
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, edx
	jmp	.LBB14_244
.LBB14_240:
	lea	r15, [rsp + 8*r15 + 32]
	mov	r13d, edi
	jmp	.LBB14_244
.LBB14_241:
	lea	r15, [rsp + 8*r14 + 32]
	jmp	.LBB14_244
.LBB14_242:
	lea	r15, [rsp + 8*r8 + 32]
.LBB14_243:
	mov	r13d, r10d
.LBB14_244:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, r13d
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r15]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB14_351
.LBB14_245:
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	lea	r14, [rsp + 8*rax + 352]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_246:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	mov	rax, qword ptr [rsp + 680] # 8-byte Reload
	lea	r14, [rsp + 8*rax + 352]
	jmp	.LBB14_261
.LBB14_247:
	lea	r14, [rsp + 8*rdi + 352]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_248:
	lea	r14, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_249:
	lea	r14, [rsp + 8*rdx + 352]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_250:
	lea	r14, [rsp + 8*rdx + 352]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_251:
	lea	r14, [rsp + 8*rbx + 352]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_252:
	lea	r14, [rsp + 8*r11 + 352]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_253:
	lea	r14, [rsp + 8*r12 + 352]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_254:
	lea	r14, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_255:
	lea	r14, [rsp + 8*rdx + 352]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_256:
	lea	r14, [rsp + 8*r13 + 352]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_257:
	lea	r14, [rsp + 8*r9 + 352]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_258:
	lea	r14, [rsp + 8*r15 + 352]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_259:
	lea	r14, [rsp + 8*r14 + 352]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB14_261
.LBB14_260:
	lea	r14, [rsp + 8*r8 + 352]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB14_261:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	jmp	.LBB14_225
.LBB14_262:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_263:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 32]
	jmp	.LBB14_278
.LBB14_264:
	lea	rsi, [rsp + 8*rdi + 32]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_265:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_266:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_267:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_268:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_269:
	lea	rsi, [rsp + 8*r11 + 32]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_270:
	lea	rsi, [rsp + 8*r12 + 32]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_271:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_272:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_273:
	lea	rsi, [rsp + 8*r13 + 32]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_274:
	lea	rsi, [rsp + 8*r9 + 32]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_275:
	lea	rsi, [rsp + 8*r15 + 32]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_276:
	lea	rsi, [rsp + 8*r14 + 32]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB14_278
.LBB14_277:
	lea	rsi, [rsp + 8*r8 + 32]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB14_278:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	jmp	.LBB14_296
.LBB14_279:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_280:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 32]
	jmp	.LBB14_295
.LBB14_281:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_282:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_283:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_284:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_285:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_286:
	lea	rsi, [rsp + 8*r11 + 32]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_287:
	lea	rsi, [rsp + 8*r12 + 32]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_288:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_289:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_290:
	lea	rsi, [rsp + 8*r13 + 32]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_291:
	lea	rsi, [rsp + 8*r9 + 32]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_292:
	lea	rsi, [rsp + 8*r15 + 32]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_293:
	lea	rsi, [rsp + 8*r14 + 32]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB14_295
.LBB14_294:
	lea	rsi, [rsp + 8*r8 + 32]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB14_295:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
.LBB14_296:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB14_332
.LBB14_297:
	lea	rsi, [rsp + 8*rdx + 352]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_298:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 352]
	jmp	.LBB14_313
.LBB14_299:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_300:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_301:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_302:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_303:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_304:
	lea	rsi, [rsp + 8*r11 + 352]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_305:
	lea	rsi, [rsp + 8*r12 + 352]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_306:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_307:
	lea	rsi, [rsp + 8*rsi + 352]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_308:
	lea	rsi, [rsp + 8*r13 + 352]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_309:
	lea	rsi, [rsp + 8*r9 + 352]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_310:
	lea	rsi, [rsp + 8*r15 + 352]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_311:
	lea	rsi, [rsp + 8*r14 + 352]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB14_313
.LBB14_312:
	lea	rsi, [rsp + 8*r8 + 352]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB14_313:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	jmp	.LBB14_331
.LBB14_314:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_315:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 32]
	jmp	.LBB14_330
.LBB14_316:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_317:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_318:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_319:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_320:
	lea	rsi, [rsp + 8*rdi + 32]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_321:
	lea	rsi, [rsp + 8*r11 + 32]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_322:
	lea	rsi, [rsp + 8*r12 + 32]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_323:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_324:
	lea	rsi, [rsp + 8*rdx + 32]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_325:
	lea	rsi, [rsp + 8*r13 + 32]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_326:
	lea	rsi, [rsp + 8*r9 + 32]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_327:
	lea	rsi, [rsp + 8*r15 + 32]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_328:
	lea	rsi, [rsp + 8*r14 + 32]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB14_330
.LBB14_329:
	lea	rsi, [rsp + 8*r8 + 32]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB14_330:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB14_331:
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB14_332:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
	jmp	.LBB14_350
.LBB14_333:
	lea	rbx, [rsp + 8*rdx + 32]
	mov	esi, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_334:
	lea	rbx, [rsp + 8*rdx + 32]
	jmp	.LBB14_349
.LBB14_335:
	lea	rbx, [rsp + 8*rdi + 32]
	mov	esi, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_336:
	lea	rbx, [rsp + 8*rdx + 32]
	mov	esi, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_337:
	lea	rbx, [rsp + 8*rsi + 32]
	mov	esi, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_338:
	lea	rbx, [rsp + 8*rdx + 32]
	mov	esi, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_339:
	lea	rbx, [rsp + 8*rdx + 32]
	mov	esi, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_340:
	lea	rbx, [rsp + 8*r11 + 32]
	mov	esi, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_341:
	lea	rbx, [rsp + 8*r12 + 32]
	mov	esi, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_342:
	lea	rbx, [rsp + 8*rsi + 32]
	mov	esi, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_343:
	lea	rbx, [rsp + 8*rdx + 32]
	mov	esi, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_344:
	lea	rbx, [rsp + 8*r13 + 32]
	mov	esi, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_345:
	lea	rbx, [rsp + 8*r9 + 32]
	mov	esi, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_346:
	lea	rbx, [rsp + 8*r15 + 32]
	mov	esi, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_347:
	lea	rbx, [rsp + 8*r14 + 32]
	mov	esi, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB14_349
.LBB14_348:
	lea	rbx, [rsp + 8*r8 + 32]
	mov	esi, dword ptr [rsp + 288] # 4-byte Reload
.LBB14_349:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 480]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rbx]   # xmm1 = mem[0],zero
.LBB14_350:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB14_351:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spId1YEvPKT0_
.Lcfi149:
	.seh_endproc

	.def	 _Z12test_pack_spIN4math6scalarE1YEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarE1YEvPKT0_
	.globl	_Z12test_pack_spIN4math6scalarE1YEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIN4math6scalarE1YEvPKT0_: # @_Z12test_pack_spIN4math6scalarE1YEvPKT0_
.Lcfi150:
.seh_proc _Z12test_pack_spIN4math6scalarE1YEvPKT0_
# BB#0:
	push	rbp
.Lcfi151:
	.seh_pushreg 5
	push	r15
.Lcfi152:
	.seh_pushreg 15
	push	r14
.Lcfi153:
	.seh_pushreg 14
	push	r13
.Lcfi154:
	.seh_pushreg 13
	push	r12
.Lcfi155:
	.seh_pushreg 12
	push	rsi
.Lcfi156:
	.seh_pushreg 6
	push	rdi
.Lcfi157:
	.seh_pushreg 7
	push	rbx
.Lcfi158:
	.seh_pushreg 3
	sub	rsp, 1176
.Lcfi159:
	.seh_stackalloc 1176
	lea	rbp, [rsp + 128]
.Lcfi160:
	.seh_setframe 5, 128
	vmovapd	xmmword ptr [rbp + 1024], xmm7 # 16-byte Spill
.Lcfi161:
	.seh_savexmm 7, 1152
	vmovaps	xmmword ptr [rbp + 1008], xmm6 # 16-byte Spill
.Lcfi162:
	.seh_savexmm 6, 1136
.Lcfi163:
	.seh_endprologue
	and	rsp, -32
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovapd	ymm2, ymmword ptr [rcx + 64]
	vmovapd	ymm3, ymmword ptr [rcx + 96]
	vmovapd	ymmword ptr [rsp + 128], ymm3
	vmovapd	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovapd	ymmword ptr [rsp + 32], ymm0
	movabs	rbx, _ZN6layoutI1YE1iE
	mov	r15d, dword ptr [rbx]
	movsxd	rax, r15d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 688], rax # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_194
	jp	.LBB15_194
# BB#1:
	mov	r9d, dword ptr [rbx + 4]
	movsxd	rax, r9d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 680], rax # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_195
	jp	.LBB15_195
# BB#2:
	mov	r13d, dword ptr [rbx + 8]
	movsxd	rax, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_196
	jp	.LBB15_196
# BB#3:
	mov	r8d, dword ptr [rbx + 12]
	movsxd	rdi, r8d
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB15_197
	jp	.LBB15_197
# BB#4:
	mov	qword ptr [rsp + 696], rax # 8-byte Spill
	mov	r10d, dword ptr [rbx + 16]
	movsxd	rdx, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB15_198
	jp	.LBB15_198
# BB#5:
	mov	qword ptr [rsp + 664], rdx # 8-byte Spill
	mov	qword ptr [rsp + 672], rdi # 8-byte Spill
	mov	r14d, dword ptr [rbx + 20]
	movsxd	rax, r14d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 504], rax # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_199
	jp	.LBB15_199
# BB#6:
	mov	dword ptr [rsp + 344], r13d # 4-byte Spill
	mov	r11d, dword ptr [rbx + 24]
	movsxd	rax, r11d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 496], rax # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_200
	jp	.LBB15_200
# BB#7:
	mov	r13d, dword ptr [rbx + 28]
	movsxd	rax, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rax + 160] # xmm6 = mem[0],zero
	mov	r12, rax
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_201
	jp	.LBB15_201
# BB#8:
	mov	eax, dword ptr [rbx + 32]
	movsxd	rdi, eax
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 840], rdi # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB15_202
	jp	.LBB15_202
# BB#9:
	mov	edi, dword ptr [rbx + 36]
	movsxd	rsi, edi
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 488], rsi # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_203
	jp	.LBB15_203
# BB#10:
	mov	dword ptr [rsp + 348], r9d # 4-byte Spill
	mov	esi, dword ptr [rbx + 40]
	movsxd	rdx, esi
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 480], rdx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB15_204
	jp	.LBB15_204
# BB#11:
	mov	dword ptr [rsp + 340], esi # 4-byte Spill
	mov	esi, dword ptr [rbx + 44]
	movsxd	rdx, esi
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	r9, rdx
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB15_205
	jp	.LBB15_205
# BB#12:
	mov	dword ptr [rsp + 336], r15d # 4-byte Spill
	mov	dword ptr [rsp + 328], edi # 4-byte Spill
	mov	dword ptr [rsp + 332], eax # 4-byte Spill
	mov	eax, dword ptr [rbx + 48]
	movsxd	rdx, eax
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 160] # xmm6 = mem[0],zero
	mov	qword ptr [rsp + 832], rdx # 8-byte Spill
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 32]
	jne	.LBB15_206
	jp	.LBB15_206
# BB#13:
	mov	edi, dword ptr [rbx + 52]
	movsxd	r15, edi
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB15_208
	jp	.LBB15_208
# BB#14:
	mov	dword ptr [rsp + 312], esi # 4-byte Spill
	mov	dword ptr [rsp + 316], r13d # 4-byte Spill
	mov	dword ptr [rsp + 320], r11d # 4-byte Spill
	mov	dword ptr [rsp + 324], r14d # 4-byte Spill
	mov	r13d, dword ptr [rbx + 56]
	movsxd	r14, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB15_209
	jp	.LBB15_209
# BB#15:
	mov	dword ptr [rsp + 292], r13d # 4-byte Spill
	mov	dword ptr [rsp + 296], edi # 4-byte Spill
	mov	dword ptr [rsp + 300], eax # 4-byte Spill
	mov	dword ptr [rsp + 304], r10d # 4-byte Spill
	mov	dword ptr [rsp + 308], r8d # 4-byte Spill
	mov	r10d, dword ptr [rbx + 60]
	movsxd	r8, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*r8 + 160] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	mov	r11, r12
	mov	r13, r9
	jne	.LBB15_210
	jp	.LBB15_210
# BB#16:
	movabs	rdi, count
	mov	eax, dword ptr [rdi]
	mov	qword ptr [rsp + 656], rax # 8-byte Spill
	lea	edx, [rax + 1]
	mov	dword ptr [rdi], edx
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymm2, ymmword ptr [rcx + 192]
	vmovaps	ymm3, ymmword ptr [rcx + 224]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymm1, ymmword ptr [rcx + 160]
	vmovaps	ymm2, ymmword ptr [rcx + 192]
	vmovaps	ymm3, ymmword ptr [rcx + 224]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 32]
	vmovapd	ymm1, ymmword ptr [rsp + 64]
	vmovapd	ymm2, ymmword ptr [rsp + 96]
	vmovapd	ymm3, ymmword ptr [rsp + 128]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 704]
	vmulpd	ymm1, ymm1, ymmword ptr [rsp + 736]
	vmulpd	ymm2, ymm2, ymmword ptr [rsp + 768]
	vmulpd	ymm3, ymm3, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 512], ymm0
	vmovapd	ymmword ptr [rsp + 544], ymm1
	vmovapd	ymmword ptr [rsp + 576], ymm2
	vmovapd	ymmword ptr [rsp + 608], ymm3
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 512]
	mov	r12, qword ptr [rsp + 840] # 8-byte Reload
	mov	r9, qword ptr [rsp + 832] # 8-byte Reload
	jne	.LBB15_213
	jp	.LBB15_213
# BB#17:
	mov	rax, qword ptr [rsp + 680] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 512]
	mov	rdi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB15_214
	jp	.LBB15_214
# BB#18:
	vmovsd	xmm0, qword ptr [rsp + 8*rdi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 512]
	jne	.LBB15_215
	jp	.LBB15_215
# BB#19:
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_216
	jp	.LBB15_216
# BB#20:
	mov	rax, qword ptr [rsp + 664] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 512]
	jne	.LBB15_217
	jp	.LBB15_217
# BB#21:
	mov	rax, qword ptr [rsp + 504] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 512]
	mov	rdx, qword ptr [rsp + 496] # 8-byte Reload
	mov	rsi, qword ptr [rsp + 488] # 8-byte Reload
	jne	.LBB15_218
	jp	.LBB15_218
# BB#22:
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 512]
	jne	.LBB15_219
	jp	.LBB15_219
# BB#23:
	vmovsd	xmm0, qword ptr [rsp + 8*r11 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 512]
	jne	.LBB15_220
	jp	.LBB15_220
# BB#24:
	vmovsd	xmm0, qword ptr [rsp + 8*r12 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 512]
	jne	.LBB15_221
	jp	.LBB15_221
# BB#25:
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_222
	jp	.LBB15_222
# BB#26:
	mov	rax, qword ptr [rsp + 480] # 8-byte Reload
	vmovsd	xmm0, qword ptr [rsp + 8*rax + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 512]
	jne	.LBB15_223
	jp	.LBB15_223
# BB#27:
	vmovsd	xmm0, qword ptr [rsp + 8*r13 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 512]
	jne	.LBB15_224
	jp	.LBB15_224
# BB#28:
	vmovsd	xmm0, qword ptr [rsp + 8*r9 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 512]
	jne	.LBB15_225
	jp	.LBB15_225
# BB#29:
	vmovsd	xmm0, qword ptr [rsp + 8*r15 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 512]
	jne	.LBB15_226
	jp	.LBB15_226
# BB#30:
	vmovsd	xmm0, qword ptr [rsp + 8*r14 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 512]
	jne	.LBB15_227
	jp	.LBB15_227
# BB#31:
	mov	dword ptr [rsp + 288], r10d # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*r8 + 160] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 512]
	jne	.LBB15_228
	jp	.LBB15_228
# BB#32:
	mov	rdx, rcx
	sub	rdx, -128
	mov	rax, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rax + 2]
	movabs	r10, count
	mov	dword ptr [r10], esi
	mov	rax, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 704], rax
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	qword ptr [rsp + 856], rax # 8-byte Spill
	vmovq	xmm2, rax
	vpbroadcastq	ymm3, xmm2
	vmulpd	ymm0, ymm3, ymmword ptr [rsp + 352]
	vmulpd	ymm1, ymm3, ymmword ptr [rsp + 384]
	vmulpd	ymm4, ymm3, ymmword ptr [rsp + 416]
	vmulpd	ymm5, ymm3, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm0
	vmovapd	ymmword ptr [rsp + 64], ymm1
	vmovapd	ymmword ptr [rsp + 96], ymm4
	vmovapd	ymmword ptr [rsp + 128], ymm5
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_230
	jp	.LBB15_230
# BB#33:
	mov	r10, qword ptr [rsp + 680] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 32]
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	jne	.LBB15_231
	jp	.LBB15_231
# BB#34:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB15_232
	jp	.LBB15_232
# BB#35:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_233
	jp	.LBB15_233
# BB#36:
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_234
	jp	.LBB15_234
# BB#37:
	mov	rsi, qword ptr [rsp + 504] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_235
	jp	.LBB15_235
# BB#38:
	mov	rsi, qword ptr [rsp + 496] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_236
	jp	.LBB15_236
# BB#39:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB15_237
	jp	.LBB15_237
# BB#40:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	mov	rsi, qword ptr [rsp + 488] # 8-byte Reload
	jne	.LBB15_238
	jp	.LBB15_238
# BB#41:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_239
	jp	.LBB15_239
# BB#42:
	mov	rsi, qword ptr [rsp + 480] # 8-byte Reload
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_240
	jp	.LBB15_240
# BB#43:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB15_241
	jp	.LBB15_241
# BB#44:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB15_242
	jp	.LBB15_242
# BB#45:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB15_243
	jp	.LBB15_243
# BB#46:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB15_244
	jp	.LBB15_244
# BB#47:
	vmulsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB15_245
	jp	.LBB15_245
# BB#48:
	mov	rsi, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rsi + 3]
	movabs	rdi, count
	mov	dword ptr [rdi], esi
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm5
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rsi, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm5
	vmovaps	ymmword ptr [rsp + 416], ymm4
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	qword ptr [rsp + 704], rsi
	mov	qword ptr [rsp + 848], rsi # 8-byte Spill
	vmovq	xmm0, rsi
	vpbroadcastq	ymm1, xmm0
	vmulpd	ymm4, ymm1, ymmword ptr [rsp + 352]
	vmulpd	ymm5, ymm1, ymmword ptr [rsp + 384]
	vmulpd	ymm6, ymm1, ymmword ptr [rsp + 416]
	vmulpd	ymm7, ymm1, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm7
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_247
	jp	.LBB15_247
# BB#49:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r10 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 32]
	mov	rsi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB15_248
	jp	.LBB15_248
# BB#50:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_249
	jp	.LBB15_249
# BB#51:
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_250
	jp	.LBB15_250
# BB#52:
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_251
	jp	.LBB15_251
# BB#53:
	mov	rsi, qword ptr [rsp + 504] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_252
	jp	.LBB15_252
# BB#54:
	mov	rsi, qword ptr [rsp + 496] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_253
	jp	.LBB15_253
# BB#55:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB15_254
	jp	.LBB15_254
# BB#56:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	mov	rsi, qword ptr [rsp + 488] # 8-byte Reload
	jne	.LBB15_255
	jp	.LBB15_255
# BB#57:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_256
	jp	.LBB15_256
# BB#58:
	mov	rsi, qword ptr [rsp + 480] # 8-byte Reload
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_257
	jp	.LBB15_257
# BB#59:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB15_258
	jp	.LBB15_258
# BB#60:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB15_259
	jp	.LBB15_259
# BB#61:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB15_260
	jp	.LBB15_260
# BB#62:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB15_261
	jp	.LBB15_261
# BB#63:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB15_262
	jp	.LBB15_262
# BB#64:
	mov	rsi, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rsi + 4]
	movabs	rdi, count
	mov	dword ptr [rdi], esi
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymm6, ymmword ptr [rcx + 64]
	vmovaps	ymm7, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm7
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vmovaps	ymmword ptr [rsp + 192], ymm5
	vmovaps	ymmword ptr [rsp + 160], ymm4
	vmovaps	ymm4, ymmword ptr [rdx]
	vmovaps	ymm5, ymmword ptr [rdx + 32]
	vmovaps	ymm6, ymmword ptr [rdx + 64]
	vmovaps	ymm7, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm7
	vmovaps	ymmword ptr [rsp + 416], ymm6
	vmovaps	ymmword ptr [rsp + 384], ymm5
	vmovaps	ymmword ptr [rsp + 352], ymm4
	vmovaps	ymm4, ymmword ptr [rcx]
	vmovaps	ymm5, ymmword ptr [rcx + 32]
	vmovaps	ymm6, ymmword ptr [rcx + 64]
	vmovaps	ymm7, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm7
	vmovaps	ymmword ptr [rsp + 96], ymm6
	vmovaps	ymmword ptr [rsp + 64], ymm5
	vmovaps	ymmword ptr [rsp + 32], ymm4
	vmovaps	ymm4, ymmword ptr [rdx]
	vmovaps	ymm5, ymmword ptr [rdx + 32]
	vmovaps	ymm6, ymmword ptr [rdx + 64]
	vmovaps	ymm7, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm7
	vmovaps	ymmword ptr [rsp + 768], ymm6
	vmovaps	ymmword ptr [rsp + 736], ymm5
	vmovaps	ymmword ptr [rsp + 704], ymm4
	vmovapd	ymm4, ymmword ptr [rsp + 32]
	vmovapd	ymm5, ymmword ptr [rsp + 64]
	vmovapd	ymm6, ymmword ptr [rsp + 96]
	vmovapd	ymm7, ymmword ptr [rsp + 128]
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 704]
	vaddpd	ymm5, ymm5, ymmword ptr [rsp + 736]
	vaddpd	ymm6, ymm6, ymmword ptr [rsp + 768]
	vaddpd	ymm7, ymm7, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 512], ymm4
	vmovapd	ymmword ptr [rsp + 544], ymm5
	vmovapd	ymmword ptr [rsp + 576], ymm6
	vmovapd	ymmword ptr [rsp + 608], ymm7
	vmovsd	xmm4, qword ptr [rsp + 8*rax + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rax + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 512]
	jne	.LBB15_265
	jp	.LBB15_265
# BB#65:
	vmovsd	xmm4, qword ptr [rsp + 8*r10 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r10 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 512]
	mov	rsi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB15_266
	jp	.LBB15_266
# BB#66:
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_267
	jp	.LBB15_267
# BB#67:
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_268
	jp	.LBB15_268
# BB#68:
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_269
	jp	.LBB15_269
# BB#69:
	mov	rsi, qword ptr [rsp + 504] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_270
	jp	.LBB15_270
# BB#70:
	mov	rsi, qword ptr [rsp + 496] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_271
	jp	.LBB15_271
# BB#71:
	vmovsd	xmm4, qword ptr [rsp + 8*r11 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r11 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 512]
	jne	.LBB15_272
	jp	.LBB15_272
# BB#72:
	vmovsd	xmm4, qword ptr [rsp + 8*r12 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r12 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 512]
	mov	rsi, qword ptr [rsp + 488] # 8-byte Reload
	jne	.LBB15_273
	jp	.LBB15_273
# BB#73:
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_274
	jp	.LBB15_274
# BB#74:
	mov	rsi, qword ptr [rsp + 480] # 8-byte Reload
	vmovsd	xmm4, qword ptr [rsp + 8*rsi + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_275
	jp	.LBB15_275
# BB#75:
	vmovsd	xmm4, qword ptr [rsp + 8*r13 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r13 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 512]
	jne	.LBB15_276
	jp	.LBB15_276
# BB#76:
	vmovsd	xmm4, qword ptr [rsp + 8*r9 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r9 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 512]
	jne	.LBB15_277
	jp	.LBB15_277
# BB#77:
	vmovsd	xmm4, qword ptr [rsp + 8*r15 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r15 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 512]
	jne	.LBB15_278
	jp	.LBB15_278
# BB#78:
	vmovsd	xmm4, qword ptr [rsp + 8*r14 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r14 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 512]
	jne	.LBB15_279
	jp	.LBB15_279
# BB#79:
	vmovsd	xmm4, qword ptr [rsp + 8*r8 + 160] # xmm4 = mem[0],zero
	vaddsd	xmm6, xmm4, qword ptr [rsp + 8*r8 + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 512]
	jne	.LBB15_280
	jp	.LBB15_280
# BB#80:
	mov	rsi, qword ptr [rsp + 656] # 8-byte Reload
	lea	esi, [rsi + 5]
	movabs	rdi, count
	mov	dword ptr [rdi], esi
	vmovaps	ymm4, ymmword ptr [rdx]
	vmovaps	ymm5, ymmword ptr [rdx + 32]
	vmovaps	ymm6, ymmword ptr [rdx + 64]
	vmovaps	ymm7, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm7
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vmovaps	ymmword ptr [rsp + 192], ymm5
	vmovaps	ymmword ptr [rsp + 160], ymm4
	mov	rsi, qword ptr [rsp + 856] # 8-byte Reload
	mov	qword ptr [rsp + 704], rsi
	vmovaps	ymm4, ymmword ptr [rdx]
	vmovaps	ymm5, ymmword ptr [rdx + 32]
	vmovaps	ymm6, ymmword ptr [rdx + 64]
	vmovapd	ymm7, ymmword ptr [rdx + 96]
	vmovapd	ymmword ptr [rsp + 448], ymm7
	vmovaps	ymmword ptr [rsp + 416], ymm6
	vmovaps	ymmword ptr [rsp + 384], ymm5
	vmovaps	ymmword ptr [rsp + 352], ymm4
	vaddpd	ymm4, ymm3, ymmword ptr [rsp + 352]
	vaddpd	ymm5, ymm3, ymmword ptr [rsp + 384]
	vaddpd	ymm6, ymm3, ymmword ptr [rsp + 416]
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm3
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_282
	jp	.LBB15_282
# BB#81:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r10 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r10 + 32]
	mov	rax, qword ptr [rsp + 696] # 8-byte Reload
	mov	rsi, qword ptr [rsp + 672] # 8-byte Reload
	jne	.LBB15_283
	jp	.LBB15_283
# BB#82:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_284
	jp	.LBB15_284
# BB#83:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_285
	jp	.LBB15_285
# BB#84:
	mov	rax, qword ptr [rsp + 664] # 8-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_286
	jp	.LBB15_286
# BB#85:
	mov	rax, qword ptr [rsp + 504] # 8-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	mov	rdi, qword ptr [rsp + 496] # 8-byte Reload
	mov	rsi, qword ptr [rsp + 488] # 8-byte Reload
	jne	.LBB15_287
	jp	.LBB15_287
# BB#86:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB15_288
	jp	.LBB15_288
# BB#87:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB15_289
	jp	.LBB15_289
# BB#88:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	jne	.LBB15_290
	jp	.LBB15_290
# BB#89:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_291
	jp	.LBB15_291
# BB#90:
	mov	rax, qword ptr [rsp + 480] # 8-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_292
	jp	.LBB15_292
# BB#91:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB15_293
	jp	.LBB15_293
# BB#92:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB15_294
	jp	.LBB15_294
# BB#93:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB15_295
	jp	.LBB15_295
# BB#94:
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB15_296
	jp	.LBB15_296
# BB#95:
	mov	esi, dword ptr [rsp + 348] # 4-byte Reload
	vaddsd	xmm6, xmm2, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB15_297
	jp	.LBB15_297
# BB#96:
	mov	rax, qword ptr [rsp + 656] # 8-byte Reload
	lea	r10d, [rax + 6]
	movabs	rdi, count
	mov	dword ptr [rdi], r10d
	mov	r10, rdi
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm5
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovaps	ymmword ptr [rsp + 192], ymm3
	vmovaps	ymmword ptr [rsp + 160], ymm2
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm5
	vmovaps	ymmword ptr [rsp + 416], ymm4
	vmovaps	ymmword ptr [rsp + 384], ymm3
	vmovaps	ymmword ptr [rsp + 352], ymm2
	mov	rax, qword ptr [rsp + 848] # 8-byte Reload
	mov	qword ptr [rsp + 704], rax
	vaddpd	ymm2, ymm1, ymmword ptr [rsp + 352]
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vaddpd	ymm4, ymm1, ymmword ptr [rsp + 416]
	vaddpd	ymm5, ymm1, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm2
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	ymmword ptr [rsp + 96], ymm4
	vmovapd	ymmword ptr [rsp + 128], ymm5
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_301
	jp	.LBB15_301
# BB#97:
	mov	rax, qword ptr [rsp + 680] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	mov	rdi, qword ptr [rsp + 696] # 8-byte Reload
	jne	.LBB15_302
	jp	.LBB15_302
# BB#98:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 32]
	jne	.LBB15_303
	jp	.LBB15_303
# BB#99:
	mov	rax, qword ptr [rsp + 672] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	mov	rsi, qword ptr [rsp + 664] # 8-byte Reload
	jne	.LBB15_304
	jp	.LBB15_304
# BB#100:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_305
	jp	.LBB15_305
# BB#101:
	mov	rax, qword ptr [rsp + 504] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_306
	jp	.LBB15_306
# BB#102:
	mov	rax, qword ptr [rsp + 496] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	mov	rsi, qword ptr [rsp + 488] # 8-byte Reload
	jne	.LBB15_307
	jp	.LBB15_307
# BB#103:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r11 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r11 + 32]
	jne	.LBB15_308
	jp	.LBB15_308
# BB#104:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 32]
	jne	.LBB15_309
	jp	.LBB15_309
# BB#105:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_310
	jp	.LBB15_310
# BB#106:
	mov	rax, qword ptr [rsp + 480] # 8-byte Reload
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rax + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rax + 32]
	jne	.LBB15_311
	jp	.LBB15_311
# BB#107:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r13 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r13 + 32]
	jne	.LBB15_312
	jp	.LBB15_312
# BB#108:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r9 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r9 + 32]
	jne	.LBB15_313
	jp	.LBB15_313
# BB#109:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 32]
	jne	.LBB15_314
	jp	.LBB15_314
# BB#110:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 32]
	jne	.LBB15_315
	jp	.LBB15_315
# BB#111:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r8 + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*r8 + 32]
	jne	.LBB15_316
	jp	.LBB15_316
# BB#112:
	mov	rax, qword ptr [rsp + 656] # 8-byte Reload
	add	eax, 7
	mov	dword ptr [r10], eax
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm5
	vmovaps	ymmword ptr [rsp + 224], ymm4
	vmovaps	ymmword ptr [rsp + 192], ymm3
	vmovaps	ymmword ptr [rsp + 160], ymm2
	mov	rax, qword ptr [rcx + 256]
	vmovaps	ymm2, ymmword ptr [rcx]
	vmovaps	ymm3, ymmword ptr [rcx + 32]
	vmovaps	ymm4, ymmword ptr [rcx + 64]
	vmovaps	ymm5, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm5
	vmovaps	ymmword ptr [rsp + 416], ymm4
	vmovaps	ymmword ptr [rsp + 384], ymm3
	vmovaps	ymmword ptr [rsp + 352], ymm2
	mov	rdi, qword ptr [rsp + 848] # 8-byte Reload
	mov	qword ptr [rsp + 704], rdi
	mov	qword ptr [rsp + 512], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm2, rax
	vpbroadcastq	ymm3, xmm2
	vmovapd	ymm4, ymmword ptr [rsp + 352]
	vfmadd132pd	ymm4, ymm3, ymm1
	vmovapd	ymm5, ymmword ptr [rsp + 384]
	vfmadd132pd	ymm5, ymm3, ymm1
	vmovapd	ymm6, ymmword ptr [rsp + 416]
	vfmadd132pd	ymm6, ymm3, ymm1
	vfmadd132pd	ymm1, ymm3, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm1
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#113:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#114:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#115:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#116:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#117:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#118:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#119:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#120:
	movsxd	rsi, dword ptr [rbx + 32]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#121:
	movsxd	rsi, dword ptr [rbx + 36]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#122:
	movsxd	rsi, dword ptr [rbx + 40]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#123:
	movsxd	rsi, dword ptr [rbx + 44]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#124:
	movsxd	rsi, dword ptr [rbx + 48]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#125:
	movsxd	rsi, dword ptr [rbx + 52]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#126:
	movsxd	rsi, dword ptr [rbx + 56]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#127:
	movsxd	rsi, dword ptr [rbx + 60]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm2
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_183
	jp	.LBB15_183
# BB#128:
	inc	dword ptr [r10]
	mov	rax, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rdi, qword ptr [rcx + 256]
	mov	qword ptr [rsp + 704], rax
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	qword ptr [rsp + 512], rdi
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rax
	vpbroadcastq	ymm2, xmm0
	vmovq	xmm1, rdi
	vpbroadcastq	ymm3, xmm1
	vmovapd	ymm4, ymmword ptr [rsp + 352]
	vfmadd213pd	ymm4, ymm2, ymm3
	vmovapd	ymm5, ymmword ptr [rsp + 384]
	vfmadd213pd	ymm5, ymm2, ymm3
	vmovapd	ymm6, ymmword ptr [rsp + 416]
	vfmadd213pd	ymm6, ymm2, ymm3
	vfmadd231pd	ymm3, ymm2, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm4
	vmovapd	ymmword ptr [rsp + 64], ymm5
	vmovapd	ymmword ptr [rsp + 96], ymm6
	vmovapd	ymmword ptr [rsp + 128], ymm3
	movsxd	rsi, dword ptr [rbx]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#129:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#130:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#131:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#132:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#133:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#134:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#135:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#136:
	movsxd	rsi, dword ptr [rbx + 32]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#137:
	movsxd	rsi, dword ptr [rbx + 36]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#138:
	movsxd	rsi, dword ptr [rbx + 40]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#139:
	movsxd	rsi, dword ptr [rbx + 44]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#140:
	movsxd	rsi, dword ptr [rbx + 48]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#141:
	movsxd	rsi, dword ptr [rbx + 52]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#142:
	movsxd	rsi, dword ptr [rbx + 56]
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_184
	jp	.LBB15_184
# BB#143:
	movsxd	rsi, dword ptr [rbx + 60]
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_318
	jp	.LBB15_318
# BB#144:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	rax, qword ptr [rcx + 256]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	mov	qword ptr [rsp + 864], rax
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rax
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 32]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vmovapd	ymm4, ymmword ptr [rsp + 96]
	vmovapd	ymm5, ymmword ptr [rsp + 128]
	vfmadd132pd	ymm2, ymm1, ymmword ptr [rsp + 704]
	vfmadd132pd	ymm3, ymm1, ymmword ptr [rsp + 736]
	vfmadd132pd	ymm4, ymm1, ymmword ptr [rsp + 768]
	vfmadd132pd	ymm5, ymm1, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 512], ymm2
	vmovapd	ymmword ptr [rsp + 544], ymm3
	vmovapd	ymmword ptr [rsp + 576], ymm4
	vmovapd	ymmword ptr [rsp + 608], ymm5
	lea	rax, [rbx + 64]
	.p2align	4, 0x90
.LBB15_145:                             # =>This Inner Loop Header: Depth=1
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_177
	jp	.LBB15_177
# BB#146:                               #   in Loop: Header=BB15_145 Depth=1
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_177
	jp	.LBB15_177
# BB#147:                               #   in Loop: Header=BB15_145 Depth=1
	add	rbx, 8
	cmp	rbx, rax
	jne	.LBB15_145
# BB#148:
	inc	dword ptr [r10]
	mov	rax, qword ptr [rcx]
	mov	rbx, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rcx + 256]
	vmovaps	ymm1, ymmword ptr [rcx + 288]
	vmovaps	ymm2, ymmword ptr [rcx + 320]
	vmovaps	ymm3, ymmword ptr [rcx + 352]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	qword ptr [rsp + 704], rax
	mov	qword ptr [rsp + 512], rbx
	vmovaps	ymm0, ymmword ptr [rcx + 256]
	vmovaps	ymm1, ymmword ptr [rcx + 288]
	vmovaps	ymm2, ymmword ptr [rcx + 320]
	vmovaps	ymm3, ymmword ptr [rcx + 352]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rax
	vmovq	xmm1, rbx
	vmulsd	xmm2, xmm0, xmm1
	vbroadcastsd	ymm2, xmm2
	vaddpd	ymm3, ymm2, ymmword ptr [rsp + 352]
	vaddpd	ymm4, ymm2, ymmword ptr [rsp + 384]
	vaddpd	ymm5, ymm2, ymmword ptr [rsp + 416]
	vaddpd	ymm2, ymm2, ymmword ptr [rsp + 448]
	vmovapd	ymmword ptr [rsp + 32], ymm3
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	ymmword ptr [rsp + 96], ymm5
	vmovapd	ymmword ptr [rsp + 128], ymm2
	movabs	rbx, _ZN6layoutI1YE1iE
	movsxd	rsi, dword ptr [rbx]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#149:
	movsxd	rsi, dword ptr [rbx + 4]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#150:
	movsxd	rsi, dword ptr [rbx + 8]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#151:
	movsxd	rsi, dword ptr [rbx + 12]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#152:
	movsxd	rsi, dword ptr [rbx + 16]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#153:
	movsxd	rsi, dword ptr [rbx + 20]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#154:
	movsxd	rsi, dword ptr [rbx + 24]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#155:
	movsxd	rsi, dword ptr [rbx + 28]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#156:
	movsxd	rsi, dword ptr [rbx + 32]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#157:
	movsxd	rsi, dword ptr [rbx + 36]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#158:
	movsxd	rsi, dword ptr [rbx + 40]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#159:
	movsxd	rsi, dword ptr [rbx + 44]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#160:
	movsxd	rsi, dword ptr [rbx + 48]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#161:
	movsxd	rsi, dword ptr [rbx + 52]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#162:
	movsxd	rsi, dword ptr [rbx + 56]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_187
	jp	.LBB15_187
# BB#163:
	movsxd	rsi, dword ptr [rbx + 60]
	vfmadd213sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 32]
	jne	.LBB15_319
	jp	.LBB15_319
# BB#164:
	lea	rax, [rcx + 256]
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	mov	rdi, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymm2, ymmword ptr [rax + 64]
	vmovaps	ymm3, ymmword ptr [rax + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	mov	qword ptr [rsp + 864], rdi
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymm2, ymmword ptr [rax + 64]
	vmovaps	ymm3, ymmword ptr [rax + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdi
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 32]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vmovapd	ymm4, ymmword ptr [rsp + 96]
	vmovapd	ymm5, ymmword ptr [rsp + 128]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 704]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 736]
	vfmadd213pd	ymm4, ymm1, ymmword ptr [rsp + 768]
	vfmadd213pd	ymm5, ymm1, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 512], ymm2
	vmovapd	ymmword ptr [rsp + 544], ymm3
	vmovapd	ymmword ptr [rsp + 576], ymm4
	vmovapd	ymmword ptr [rsp + 608], ymm5
	lea	rdi, [rbx + 64]
	.p2align	4, 0x90
.LBB15_165:                             # =>This Inner Loop Header: Depth=1
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_178
	jp	.LBB15_178
# BB#166:                               #   in Loop: Header=BB15_165 Depth=1
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_178
	jp	.LBB15_178
# BB#167:                               #   in Loop: Header=BB15_165 Depth=1
	add	rbx, 8
	cmp	rbx, rdi
	jne	.LBB15_165
# BB#168:
	inc	dword ptr [r10]
	mov	rbx, qword ptr [rcx]
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymm2, ymmword ptr [rax + 64]
	vmovaps	ymm3, ymmword ptr [rax + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	mov	qword ptr [rsp + 864], rbx
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymm2, ymmword ptr [rax + 64]
	vmovaps	ymm3, ymmword ptr [rax + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rbx
	vpbroadcastq	ymm1, xmm0
	vmovapd	ymm2, ymmword ptr [rsp + 32]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vmovapd	ymm4, ymmword ptr [rsp + 96]
	vmovapd	ymm5, ymmword ptr [rsp + 128]
	vfmadd213pd	ymm2, ymm1, ymmword ptr [rsp + 704]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 736]
	vfmadd213pd	ymm4, ymm1, ymmword ptr [rsp + 768]
	vfmadd213pd	ymm5, ymm1, ymmword ptr [rsp + 800]
	vmovapd	ymmword ptr [rsp + 512], ymm2
	vmovapd	ymmword ptr [rsp + 544], ymm3
	vmovapd	ymmword ptr [rsp + 576], ymm4
	vmovapd	ymmword ptr [rsp + 608], ymm5
	movabs	rbx, _ZN6layoutI1YE1iE
	lea	rdi, [rbx + 64]
	.p2align	4, 0x90
.LBB15_169:                             # =>This Inner Loop Header: Depth=1
	movsxd	rsi, dword ptr [rbx]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 352] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_179
	jp	.LBB15_179
# BB#170:                               #   in Loop: Header=BB15_169 Depth=1
	movsxd	rsi, dword ptr [rbx + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 352] # xmm1 = mem[0],zero
	vmovdqa	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 160]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 512]
	jne	.LBB15_179
	jp	.LBB15_179
# BB#171:                               #   in Loop: Header=BB15_169 Depth=1
	add	rbx, 8
	cmp	rbx, rdi
	jne	.LBB15_169
# BB#172:
	inc	dword ptr [r10]
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 256], ymm3
	vmovaps	ymmword ptr [rsp + 224], ymm2
	vmovaps	ymmword ptr [rsp + 192], ymm1
	vmovaps	ymmword ptr [rsp + 160], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 448], ymm3
	vmovaps	ymmword ptr [rsp + 416], ymm2
	vmovaps	ymmword ptr [rsp + 384], ymm1
	vmovaps	ymmword ptr [rsp + 352], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymm2, ymmword ptr [rax + 64]
	vmovaps	ymm3, ymmword ptr [rax + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymm1, ymmword ptr [rcx + 32]
	vmovaps	ymm2, ymmword ptr [rcx + 64]
	vmovaps	ymm3, ymmword ptr [rcx + 96]
	vmovaps	ymmword ptr [rsp + 800], ymm3
	vmovaps	ymmword ptr [rsp + 768], ymm2
	vmovaps	ymmword ptr [rsp + 736], ymm1
	vmovaps	ymmword ptr [rsp + 704], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 608], ymm3
	vmovaps	ymmword ptr [rsp + 576], ymm2
	vmovaps	ymmword ptr [rsp + 544], ymm1
	vmovaps	ymmword ptr [rsp + 512], ymm0
	vmovaps	ymm0, ymmword ptr [rax]
	vmovaps	ymm1, ymmword ptr [rax + 32]
	vmovaps	ymm2, ymmword ptr [rax + 64]
	vmovaps	ymm3, ymmword ptr [rax + 96]
	vmovaps	ymmword ptr [rsp + 960], ymm3
	vmovaps	ymmword ptr [rsp + 928], ymm2
	vmovaps	ymmword ptr [rsp + 896], ymm1
	vmovaps	ymmword ptr [rsp + 864], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 704]
	vmovapd	ymm1, ymmword ptr [rsp + 736]
	vmovapd	ymm2, ymmword ptr [rsp + 768]
	vmovapd	ymm3, ymmword ptr [rsp + 800]
	vmovapd	ymm4, ymmword ptr [rsp + 512]
	vmovapd	ymm5, ymmword ptr [rsp + 544]
	vmovapd	ymm6, ymmword ptr [rsp + 576]
	vmovapd	ymm7, ymmword ptr [rsp + 608]
	vfmadd213pd	ymm4, ymm0, ymmword ptr [rsp + 864]
	vfmadd213pd	ymm5, ymm1, ymmword ptr [rsp + 896]
	vfmadd213pd	ymm6, ymm2, ymmword ptr [rsp + 928]
	vfmadd213pd	ymm7, ymm3, ymmword ptr [rsp + 960]
	vmovapd	ymmword ptr [rsp + 992], ymm4
	vmovapd	ymmword ptr [rsp + 1024], ymm5
	vmovapd	ymmword ptr [rsp + 1056], ymm6
	vmovapd	ymmword ptr [rsp + 1088], ymm7
	movabs	rax, _ZN6layoutI1YE1iE
	lea	rcx, [rax + 64]
	.p2align	4, 0x90
.LBB15_173:                             # =>This Inner Loop Header: Depth=1
	movsxd	rsi, dword ptr [rax]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 32] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 992]
	jne	.LBB15_182
	jp	.LBB15_182
# BB#174:                               #   in Loop: Header=BB15_173 Depth=1
	movsxd	rsi, dword ptr [rax + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 160] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 32] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 352]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 992]
	jne	.LBB15_182
	jp	.LBB15_182
# BB#175:                               #   in Loop: Header=BB15_173 Depth=1
	add	rax, 8
	cmp	rax, rcx
	jne	.LBB15_173
# BB#176:
	inc	dword ptr [r10]
	vmovaps	xmm6, xmmword ptr [rbp + 1008] # 16-byte Reload
	vmovaps	xmm7, xmmword ptr [rbp + 1024] # 16-byte Reload
	lea	rsp, [rbp + 1048]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB15_177:
	lea	r14, [rsp + 8*rsi + 512]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB15_181
.LBB15_178:
	lea	r14, [rsp + 8*rsi + 512]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB15_180
.LBB15_179:
	lea	r14, [rsp + 8*rsi + 512]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB15_180:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB15_181:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	jmp	.LBB15_190
.LBB15_182:
	lea	r14, [rsp + 8*rsi + 992]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 864]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 992]
	jmp	.LBB15_190
.LBB15_183:
	lea	r14, [rsp + 8*rsi + 32]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB15_186
.LBB15_184:
	lea	r14, [rsp + 8*rsi + 32]
.LBB15_185:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB15_186:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB15_189
.LBB15_187:
	lea	r14, [rsp + 8*rsi + 32]
.LBB15_188:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
.LBB15_189:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB15_190:
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
.LBB15_191:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
.LBB15_192:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB15_193:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
.LBB15_194:
	mov	r13d, r15d
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	jmp	.LBB15_212
.LBB15_195:
	mov	rax, qword ptr [rsp + 680] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, r9d
	jmp	.LBB15_212
.LBB15_196:
	lea	r15, [rsp + 8*rax + 32]
	jmp	.LBB15_212
.LBB15_197:
	lea	r15, [rsp + 8*rdi + 32]
	mov	r13d, r8d
	jmp	.LBB15_212
.LBB15_198:
	lea	r15, [rsp + 8*rdx + 32]
	jmp	.LBB15_211
.LBB15_199:
	mov	rax, qword ptr [rsp + 504] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, r14d
	jmp	.LBB15_212
.LBB15_200:
	mov	rax, qword ptr [rsp + 496] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, r11d
	jmp	.LBB15_212
.LBB15_201:
	lea	r15, [rsp + 8*r12 + 32]
	jmp	.LBB15_212
.LBB15_202:
	mov	rcx, qword ptr [rsp + 840] # 8-byte Reload
	jmp	.LBB15_207
.LBB15_203:
	mov	rax, qword ptr [rsp + 488] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, edi
	jmp	.LBB15_212
.LBB15_204:
	mov	rax, qword ptr [rsp + 480] # 8-byte Reload
	lea	r15, [rsp + 8*rax + 32]
	mov	r13d, esi
	jmp	.LBB15_212
.LBB15_205:
	lea	r15, [rsp + 8*r9 + 32]
	mov	r13d, esi
	jmp	.LBB15_212
.LBB15_206:
	mov	rcx, qword ptr [rsp + 832] # 8-byte Reload
.LBB15_207:
	lea	r15, [rsp + 8*rcx + 32]
	mov	r13d, eax
	jmp	.LBB15_212
.LBB15_208:
	lea	r15, [rsp + 8*r15 + 32]
	mov	r13d, edi
	jmp	.LBB15_212
.LBB15_209:
	lea	r15, [rsp + 8*r14 + 32]
	jmp	.LBB15_212
.LBB15_210:
	lea	r15, [rsp + 8*r8 + 32]
.LBB15_211:
	mov	r13d, r10d
.LBB15_212:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, r13d
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r15]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB15_193
.LBB15_213:
	mov	rax, qword ptr [rsp + 688] # 8-byte Reload
	lea	r14, [rsp + 8*rax + 512]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_214:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	mov	rax, qword ptr [rsp + 680] # 8-byte Reload
	lea	r14, [rsp + 8*rax + 512]
	jmp	.LBB15_229
.LBB15_215:
	lea	r14, [rsp + 8*rdi + 512]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_216:
	lea	r14, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_217:
	lea	r14, [rsp + 8*rax + 512]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_218:
	lea	r14, [rsp + 8*rax + 512]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_219:
	lea	r14, [rsp + 8*rdx + 512]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_220:
	lea	r14, [rsp + 8*r11 + 512]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_221:
	lea	r14, [rsp + 8*r12 + 512]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_222:
	lea	r14, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_223:
	lea	r14, [rsp + 8*rax + 512]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_224:
	lea	r14, [rsp + 8*r13 + 512]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_225:
	lea	r14, [rsp + 8*r9 + 512]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_226:
	lea	r14, [rsp + 8*r15 + 512]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_227:
	lea	r14, [rsp + 8*r14 + 512]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB15_229
.LBB15_228:
	lea	r14, [rsp + 8*r8 + 512]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB15_229:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	jmp	.LBB15_191
.LBB15_230:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_231:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 32]
	jmp	.LBB15_246
.LBB15_232:
	lea	rsi, [rsp + 8*rdi + 32]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_233:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_234:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_235:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_236:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_237:
	lea	rsi, [rsp + 8*r11 + 32]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_238:
	lea	rsi, [rsp + 8*r12 + 32]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_239:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_240:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_241:
	lea	rsi, [rsp + 8*r13 + 32]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_242:
	lea	rsi, [rsp + 8*r9 + 32]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_243:
	lea	rsi, [rsp + 8*r15 + 32]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_244:
	lea	rsi, [rsp + 8*r14 + 32]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB15_246
.LBB15_245:
	lea	rsi, [rsp + 8*r8 + 32]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB15_246:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	jmp	.LBB15_264
.LBB15_247:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_248:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 32]
	jmp	.LBB15_263
.LBB15_249:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_250:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_251:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_252:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_253:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_254:
	lea	rsi, [rsp + 8*r11 + 32]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_255:
	lea	rsi, [rsp + 8*r12 + 32]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_256:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_257:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_258:
	lea	rsi, [rsp + 8*r13 + 32]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_259:
	lea	rsi, [rsp + 8*r9 + 32]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_260:
	lea	rsi, [rsp + 8*r15 + 32]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_261:
	lea	rsi, [rsp + 8*r14 + 32]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB15_263
.LBB15_262:
	lea	rsi, [rsp + 8*r8 + 32]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB15_263:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB15_264:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB15_300
.LBB15_265:
	lea	rsi, [rsp + 8*rax + 512]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_266:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 512]
	jmp	.LBB15_281
.LBB15_267:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_268:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_269:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_270:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_271:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_272:
	lea	rsi, [rsp + 8*r11 + 512]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_273:
	lea	rsi, [rsp + 8*r12 + 512]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_274:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_275:
	lea	rsi, [rsp + 8*rsi + 512]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_276:
	lea	rsi, [rsp + 8*r13 + 512]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_277:
	lea	rsi, [rsp + 8*r9 + 512]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_278:
	lea	rsi, [rsp + 8*r15 + 512]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_279:
	lea	rsi, [rsp + 8*r14 + 512]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB15_281
.LBB15_280:
	lea	rsi, [rsp + 8*r8 + 512]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB15_281:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1Y
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	jmp	.LBB15_299
.LBB15_282:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_283:
	mov	ebx, dword ptr [rsp + 348] # 4-byte Reload
	lea	rsi, [rsp + 8*r10 + 32]
	jmp	.LBB15_298
.LBB15_284:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_285:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_286:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_287:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_288:
	lea	rsi, [rsp + 8*rdi + 32]
	mov	ebx, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_289:
	lea	rsi, [rsp + 8*r11 + 32]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_290:
	lea	rsi, [rsp + 8*r12 + 32]
	mov	ebx, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_291:
	lea	rsi, [rsp + 8*rsi + 32]
	mov	ebx, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_292:
	lea	rsi, [rsp + 8*rax + 32]
	mov	ebx, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_293:
	lea	rsi, [rsp + 8*r13 + 32]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_294:
	lea	rsi, [rsp + 8*r9 + 32]
	mov	ebx, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_295:
	lea	rsi, [rsp + 8*r15 + 32]
	mov	ebx, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_296:
	lea	rsi, [rsp + 8*r14 + 32]
	mov	ebx, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB15_298
.LBB15_297:
	lea	rsi, [rsp + 8*r8 + 32]
	mov	ebx, dword ptr [rsp + 288] # 4-byte Reload
.LBB15_298:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
.LBB15_299:
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB15_300:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
	jmp	.LBB15_192
.LBB15_301:
	lea	rbx, [rsp + 8*rax + 32]
	mov	esi, dword ptr [rsp + 336] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_302:
	lea	rbx, [rsp + 8*rax + 32]
	jmp	.LBB15_317
.LBB15_303:
	lea	rbx, [rsp + 8*rdi + 32]
	mov	esi, dword ptr [rsp + 344] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_304:
	lea	rbx, [rsp + 8*rax + 32]
	mov	esi, dword ptr [rsp + 308] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_305:
	lea	rbx, [rsp + 8*rsi + 32]
	mov	esi, dword ptr [rsp + 304] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_306:
	lea	rbx, [rsp + 8*rax + 32]
	mov	esi, dword ptr [rsp + 324] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_307:
	lea	rbx, [rsp + 8*rax + 32]
	mov	esi, dword ptr [rsp + 320] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_308:
	lea	rbx, [rsp + 8*r11 + 32]
	mov	esi, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_309:
	lea	rbx, [rsp + 8*r12 + 32]
	mov	esi, dword ptr [rsp + 332] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_310:
	lea	rbx, [rsp + 8*rsi + 32]
	mov	esi, dword ptr [rsp + 328] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_311:
	lea	rbx, [rsp + 8*rax + 32]
	mov	esi, dword ptr [rsp + 340] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_312:
	lea	rbx, [rsp + 8*r13 + 32]
	mov	esi, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_313:
	lea	rbx, [rsp + 8*r9 + 32]
	mov	esi, dword ptr [rsp + 300] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_314:
	lea	rbx, [rsp + 8*r15 + 32]
	mov	esi, dword ptr [rsp + 296] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_315:
	lea	rbx, [rsp + 8*r14 + 32]
	mov	esi, dword ptr [rsp + 292] # 4-byte Reload
	jmp	.LBB15_317
.LBB15_316:
	lea	rbx, [rsp + 8*r8 + 32]
	mov	esi, dword ptr [rsp + 288] # 4-byte Reload
.LBB15_317:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1Y
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 352]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 704]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 32]
	mov	rcx, rax
	call	_ZlsI1YERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rbx]   # xmm1 = mem[0],zero
	jmp	.LBB15_192
.LBB15_318:
	lea	r14, [rsp + 8*rsi + 32]
	vmovapd	xmm6, xmm0
	jmp	.LBB15_185
.LBB15_319:
	lea	r14, [rsp + 8*rsi + 32]
	vmovapd	xmm6, xmm0
	jmp	.LBB15_188
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarE1YEvPKT0_
.Lcfi164:
	.seh_endproc

	.def	 _ZlsI1YERSoS1_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsI1YERSoS1_7printerIT_E
	.globl	_ZlsI1YERSoS1_7printerIT_E
	.p2align	4, 0x90
_ZlsI1YERSoS1_7printerIT_E:             # @_ZlsI1YERSoS1_7printerIT_E
.Lcfi165:
.seh_proc _ZlsI1YERSoS1_7printerIT_E
# BB#0:
	push	rbp
.Lcfi166:
	.seh_pushreg 5
	push	rsi
.Lcfi167:
	.seh_pushreg 6
	push	rdi
.Lcfi168:
	.seh_pushreg 7
	sub	rsp, 160
.Lcfi169:
	.seh_stackalloc 160
	lea	rbp, [rsp + 128]
.Lcfi170:
	.seh_setframe 5, 128
.Lcfi171:
	.seh_endprologue
	and	rsp, -32
	mov	rsi, rcx
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymm1, ymmword ptr [rdx + 32]
	vmovaps	ymm2, ymmword ptr [rdx + 64]
	vmovaps	ymm3, ymmword ptr [rdx + 96]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymmword ptr [rsp + 96], ymm2
	vmovaps	ymmword ptr [rsp + 64], ymm1
	vmovaps	ymmword ptr [rsp + 32], ymm0
	movabs	rdi, _ZN6layoutI1YE1iE
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	vzeroupper
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 4]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 8]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 12]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 16]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 20]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 24]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 28]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 32]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 36]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 40]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 44]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 48]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 52]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 56]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 60]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	lea	rsp, [rbp + 32]
	pop	rdi
	pop	rsi
	pop	rbp
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsI1YERSoS1_7printerIT_E
.Lcfi172:
	.seh_endproc

	.def	 _Z12test_pack_spId1NEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spId1NEvPKT0_
	.globl	_Z12test_pack_spId1NEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spId1NEvPKT0_:            # @_Z12test_pack_spId1NEvPKT0_
.Lcfi173:
.seh_proc _Z12test_pack_spId1NEvPKT0_
# BB#0:
	push	rbp
.Lcfi174:
	.seh_pushreg 5
	push	r15
.Lcfi175:
	.seh_pushreg 15
	push	r14
.Lcfi176:
	.seh_pushreg 14
	push	r13
.Lcfi177:
	.seh_pushreg 13
	push	r12
.Lcfi178:
	.seh_pushreg 12
	push	rsi
.Lcfi179:
	.seh_pushreg 6
	push	rdi
.Lcfi180:
	.seh_pushreg 7
	push	rbx
.Lcfi181:
	.seh_pushreg 3
	sub	rsp, 632
.Lcfi182:
	.seh_stackalloc 632
	lea	rbp, [rsp + 128]
.Lcfi183:
	.seh_setframe 5, 128
	vmovapd	xmmword ptr [rbp + 480], xmm7 # 16-byte Spill
.Lcfi184:
	.seh_savexmm 7, 608
	vmovaps	xmmword ptr [rbp + 464], xmm6 # 16-byte Spill
.Lcfi185:
	.seh_savexmm 6, 592
.Lcfi186:
	.seh_endprologue
	and	rsp, -32
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 80], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	movabs	r11, _ZN6layoutI1NE1iE
	mov	r10d, dword ptr [r11]
	movsxd	r12, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*r12 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB17_97
	jp	.LBB17_97
# BB#1:
	mov	r9d, dword ptr [r11 + 4]
	movsxd	rdi, r9d
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB17_98
	jp	.LBB17_98
# BB#2:
	mov	r13d, dword ptr [r11 + 8]
	movsxd	rdx, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB17_99
	jp	.LBB17_99
# BB#3:
	mov	eax, dword ptr [r11 + 12]
	movsxd	rbx, eax
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB17_100
	jp	.LBB17_100
# BB#4:
	mov	esi, dword ptr [r11 + 16]
	movsxd	r14, esi
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB17_101
	jp	.LBB17_101
# BB#5:
	mov	dword ptr [rsp + 216], esi # 4-byte Spill
	mov	dword ptr [rsp + 220], eax # 4-byte Spill
	mov	eax, dword ptr [r11 + 20]
	mov	dword ptr [rsp + 212], eax # 4-byte Spill
	movsxd	r15, eax
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB17_102
	jp	.LBB17_102
# BB#6:
	movabs	rsi, count
	mov	r8d, dword ptr [rsi]
	lea	eax, [r8 + 1]
	mov	dword ptr [rsi], eax
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [rcx + 80]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 64]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vmulpd	xmm1, xmm1, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm0
	vmovapd	xmmword ptr [rsp + 352], xmm1
	vmovsd	xmm0, qword ptr [rsp + 8*r12 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 320]
	jne	.LBB17_104
	jp	.LBB17_104
# BB#7:
	vmovsd	xmm0, qword ptr [rsp + 8*rdi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 320]
	jne	.LBB17_105
	jp	.LBB17_105
# BB#8:
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 320]
	jne	.LBB17_106
	jp	.LBB17_106
# BB#9:
	vmovsd	xmm0, qword ptr [rsp + 8*rbx + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 320]
	jne	.LBB17_107
	jp	.LBB17_107
# BB#10:
	vmovsd	xmm0, qword ptr [rsp + 8*r14 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 320]
	jne	.LBB17_108
	jp	.LBB17_108
# BB#11:
	mov	dword ptr [rsp + 312], r13d # 4-byte Spill
	mov	dword ptr [rsp + 316], r10d # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*r15 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 320]
	jne	.LBB17_109
	jp	.LBB17_109
# BB#12:
	lea	r13, [rcx + 64]
	lea	eax, [r8 + 2]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	mov	r10, qword ptr [rcx]
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 384], r10
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovq	xmm3, r10
	vpbroadcastq	ymm4, xmm3
	vmovddup	xmm5, xmm3      # xmm5 = xmm3[0,0]
	vmulpd	ymm0, ymm4, ymmword ptr [rsp + 224]
	vmulpd	xmm1, xmm5, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	vmovapd	xmmword ptr [rsp + 96], xmm1
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB17_111
	jp	.LBB17_111
# BB#13:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB17_112
	jp	.LBB17_112
# BB#14:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB17_113
	jp	.LBB17_113
# BB#15:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB17_114
	jp	.LBB17_114
# BB#16:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB17_115
	jp	.LBB17_115
# BB#17:
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB17_116
	jp	.LBB17_116
# BB#18:
	lea	eax, [r8 + 3]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	r9, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 384], r9
	vmovq	xmm0, r9
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmulpd	ymm6, ymm1, ymmword ptr [rsp + 224]
	vmulpd	xmm7, xmm2, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm6
	vmovapd	xmmword ptr [rsp + 96], xmm7
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB17_119
	jp	.LBB17_119
# BB#19:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB17_120
	jp	.LBB17_120
# BB#20:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB17_121
	jp	.LBB17_121
# BB#21:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB17_122
	jp	.LBB17_122
# BB#22:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB17_123
	jp	.LBB17_123
# BB#23:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB17_124
	jp	.LBB17_124
# BB#24:
	lea	eax, [r8 + 4]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	vmovups	ymm6, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm6
	vmovaps	ymm6, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm6
	vmovups	ymm6, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 240], ymm6
	vmovaps	ymm6, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vmovaps	ymm6, ymmword ptr [rsp + 128]
	vmovaps	ymm7, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm7
	vmovaps	ymmword ptr [rsp + 64], ymm6
	vmovaps	ymm6, ymmword ptr [rsp + 224]
	vmovaps	ymm7, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm7
	vmovaps	ymmword ptr [rsp + 384], ymm6
	vmovapd	ymm6, ymmword ptr [rsp + 64]
	vaddpd	ymm6, ymm6, ymmword ptr [rsp + 384]
	vmovapd	xmm7, xmmword ptr [rsp + 96]
	vaddpd	xmm7, xmm7, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm6
	vmovapd	xmmword ptr [rsp + 352], xmm7
	vmovsd	xmm6, qword ptr [rsp + 8*r12 + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*r12 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 320]
	jne	.LBB17_127
	jp	.LBB17_127
# BB#25:
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*rdi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 320]
	jne	.LBB17_128
	jp	.LBB17_128
# BB#26:
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*rdx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 320]
	jne	.LBB17_129
	jp	.LBB17_129
# BB#27:
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*rbx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 320]
	jne	.LBB17_130
	jp	.LBB17_130
# BB#28:
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*r14 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 320]
	jne	.LBB17_131
	jp	.LBB17_131
# BB#29:
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*r15 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 320]
	jne	.LBB17_132
	jp	.LBB17_132
# BB#30:
	lea	eax, [r8 + 5]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	vmovups	ymm6, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm6
	vmovaps	ymm6, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm6
	mov	qword ptr [rsp + 384], r10
	vmovaps	ymm6, ymmword ptr [rsp + 128]
	vmovapd	ymm7, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 256], ymm7
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 224]
	vaddpd	xmm5, xmm5, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	xmmword ptr [rsp + 96], xmm5
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB17_135
	jp	.LBB17_135
# BB#31:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB17_136
	jp	.LBB17_136
# BB#32:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	movabs	r10, count
	jne	.LBB17_137
	jp	.LBB17_137
# BB#33:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB17_138
	jp	.LBB17_138
# BB#34:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB17_139
	jp	.LBB17_139
# BB#35:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB17_140
	jp	.LBB17_140
# BB#36:
	lea	eax, [r8 + 6]
	mov	dword ptr [r10], eax
	vmovups	ymm3, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm3
	vmovaps	ymm3, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymm3, ymmword ptr [rsp + 128]
	vmovaps	ymm4, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm4
	vmovaps	ymmword ptr [rsp + 224], ymm3
	mov	qword ptr [rsp + 384], r9
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 224]
	vaddpd	xmm4, xmm2, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	xmmword ptr [rsp + 96], xmm4
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB17_143
	jp	.LBB17_143
# BB#37:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB17_144
	jp	.LBB17_144
# BB#38:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB17_145
	jp	.LBB17_145
# BB#39:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB17_146
	jp	.LBB17_146
# BB#40:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB17_147
	jp	.LBB17_147
# BB#41:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB17_148
	jp	.LBB17_148
# BB#42:
	add	r8d, 7
	mov	dword ptr [r10], r8d
	vmovups	ymm3, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm3
	vmovaps	ymm3, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm3, ymmword ptr [rsp + 128]
	vmovaps	ymm4, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm4
	vmovaps	ymmword ptr [rsp + 224], ymm3
	mov	qword ptr [rsp + 384], r9
	mov	qword ptr [rsp + 320], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm3, rdx
	vpbroadcastq	ymm4, xmm3
	vmovddup	xmm5, xmm3      # xmm5 = xmm3[0,0]
	vfmadd132pd	ymm1, ymm4, ymmword ptr [rsp + 224]
	vfmadd132pd	xmm2, xmm5, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm1
	vmovapd	xmmword ptr [rsp + 96], xmm2
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_85
	jp	.LBB17_85
# BB#43:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_85
	jp	.LBB17_85
# BB#44:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_85
	jp	.LBB17_85
# BB#45:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_85
	jp	.LBB17_85
# BB#46:
	movsxd	rsi, dword ptr [r11 + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_85
	jp	.LBB17_85
# BB#47:
	movsxd	rsi, dword ptr [r11 + 20]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_85
	jp	.LBB17_85
# BB#48:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rbx, qword ptr [rcx + 128]
	mov	qword ptr [rsp + 384], rdx
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 320], rbx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vmovddup	xmm3, xmm0      # xmm3 = xmm0[0,0]
	vmovq	xmm1, rbx
	vpbroadcastq	ymm4, xmm1
	vmovddup	xmm5, xmm1      # xmm5 = xmm1[0,0]
	vfmadd231pd	ymm4, ymm2, ymmword ptr [rsp + 224]
	vfmadd231pd	xmm5, xmm3, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	xmmword ptr [rsp + 96], xmm5
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_86
	jp	.LBB17_86
# BB#49:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_86
	jp	.LBB17_86
# BB#50:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_86
	jp	.LBB17_86
# BB#51:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_86
	jp	.LBB17_86
# BB#52:
	movsxd	rsi, dword ptr [r11 + 16]
	vmulsd	xmm2, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm2, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_86
	jp	.LBB17_86
# BB#53:
	movsxd	rsi, dword ptr [r11 + 20]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, xmm1
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_86
	jp	.LBB17_86
# BB#54:
	inc	dword ptr [r10]
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	mov	qword ptr [rsp + 512], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vfmadd132pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vfmadd132pd	xmm1, xmm2, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm3
	vmovapd	xmmword ptr [rsp + 352], xmm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_88
	jp	.LBB17_88
# BB#55:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_88
	jp	.LBB17_88
# BB#56:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_88
	jp	.LBB17_88
# BB#57:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_88
	jp	.LBB17_88
# BB#58:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_88
	jp	.LBB17_88
# BB#59:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 128] # xmm1 = mem[0],zero
	vmulsd	xmm1, xmm1, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm1, xmm0
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_88
	jp	.LBB17_88
# BB#60:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	mov	rbx, qword ptr [rcx + 64]
	vmovups	ymm0, ymmword ptr [rcx + 144]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 384], rdx
	mov	qword ptr [rsp + 320], rbx
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbx
	vmulsd	xmm0, xmm0, xmm1
	vbroadcastsd	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vaddpd	ymm1, ymm1, ymmword ptr [rsp + 224]
	vaddpd	xmm2, xmm2, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm1
	vmovapd	xmmword ptr [rsp + 96], xmm2
	movsxd	rsi, dword ptr [r11]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_89
	jp	.LBB17_89
# BB#61:
	movsxd	rsi, dword ptr [r11 + 4]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_89
	jp	.LBB17_89
# BB#62:
	movsxd	rsi, dword ptr [r11 + 8]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_89
	jp	.LBB17_89
# BB#63:
	movsxd	rsi, dword ptr [r11 + 12]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_89
	jp	.LBB17_89
# BB#64:
	movsxd	rsi, dword ptr [r11 + 16]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_89
	jp	.LBB17_89
# BB#65:
	movsxd	rsi, dword ptr [r11 + 20]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB17_89
	jp	.LBB17_89
# BB#66:
	mov	rdx, rcx
	sub	rdx, -128
	inc	dword ptr [r10]
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rbx, qword ptr [rcx + 64]
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	mov	qword ptr [rsp + 512], rbx
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rbx
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vfmadd213pd	xmm1, xmm2, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm3
	vmovapd	xmmword ptr [rsp + 352], xmm1
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_91
	jp	.LBB17_91
# BB#67:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_91
	jp	.LBB17_91
# BB#68:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_91
	jp	.LBB17_91
# BB#69:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_91
	jp	.LBB17_91
# BB#70:
	movsxd	rsi, dword ptr [r11 + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_91
	jp	.LBB17_91
# BB#71:
	movsxd	rsi, dword ptr [r11 + 20]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_91
	jp	.LBB17_91
# BB#72:
	inc	dword ptr [r10]
	mov	rbx, qword ptr [rcx]
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 512], rbx
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rbx
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vfmadd213pd	xmm1, xmm2, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm3
	vmovapd	xmmword ptr [rsp + 352], xmm1
	movsxd	rsi, dword ptr [r11]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_92
	jp	.LBB17_92
# BB#73:
	movsxd	rsi, dword ptr [r11 + 4]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_92
	jp	.LBB17_92
# BB#74:
	movsxd	rsi, dword ptr [r11 + 8]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_92
	jp	.LBB17_92
# BB#75:
	movsxd	rsi, dword ptr [r11 + 12]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_92
	jp	.LBB17_92
# BB#76:
	movsxd	rsi, dword ptr [r11 + 16]
	vmulsd	xmm1, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_92
	jp	.LBB17_92
# BB#77:
	movsxd	rsi, dword ptr [r11 + 20]
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 128]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB17_92
	jp	.LBB17_92
# BB#78:
	inc	dword ptr [r10]
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 80], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 352], ymm1
	vmovaps	ymmword ptr [rsp + 320], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 64]
	vmovaps	ymm1, ymmword ptr [rsp + 96]
	vmovaps	ymmword ptr [rsp + 544], ymm1
	vmovaps	ymmword ptr [rsp + 512], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 384]
	vmovapd	ymm1, ymmword ptr [rsp + 320]
	vfmadd213pd	ymm1, ymm0, ymmword ptr [rsp + 512]
	vmovapd	xmm0, xmmword ptr [rsp + 416]
	vmovapd	xmm2, xmmword ptr [rsp + 352]
	vfmadd213pd	xmm2, xmm0, xmmword ptr [rsp + 544]
	vmovapd	ymmword ptr [rsp + 448], ymm1
	vmovapd	xmmword ptr [rsp + 480], xmm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB17_95
	jp	.LBB17_95
# BB#79:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB17_95
	jp	.LBB17_95
# BB#80:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB17_95
	jp	.LBB17_95
# BB#81:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB17_95
	jp	.LBB17_95
# BB#82:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB17_95
	jp	.LBB17_95
# BB#83:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm0, xmm0, qword ptr [rsp + 8*rsi + 224]
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 64]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB17_95
	jp	.LBB17_95
# BB#84:
	inc	dword ptr [r10]
	vmovaps	xmm6, xmmword ptr [rbp + 464] # 16-byte Reload
	vmovaps	xmm7, xmmword ptr [rbp + 480] # 16-byte Reload
	lea	rsp, [rbp + 504]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB17_85:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB17_87
.LBB17_86:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	r15, .L.str.10
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, r15
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB17_87:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB17_90
.LBB17_88:
	lea	r14, [rsp + 8*rsi + 320]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB17_94
.LBB17_89:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rdi, qword ptr [rcx + 8]
	lea	rbx, [rdi + 1]
	cmp	byte ptr [rdi], 42
	mov	rdx, rdi
	cmove	rdx, rbx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	cmp	byte ptr [rdi], 42
	cmove	rdi, rbx
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB17_90:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	jmp	.LBB17_96
.LBB17_91:
	lea	r14, [rsp + 8*rsi + 320]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	jmp	.LBB17_93
.LBB17_92:
	lea	r14, [rsp + 8*rsi + 320]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB17_93:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB17_94:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	jmp	.LBB17_96
.LBB17_95:
	lea	r14, [rsp + 8*rsi + 448]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 448]
.LBB17_96:
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB17_155
.LBB17_97:
	mov	ebx, r10d
	lea	rdi, [rsp + 8*r12 + 64]
	jmp	.LBB17_103
.LBB17_98:
	lea	rdi, [rsp + 8*rdi + 64]
	mov	ebx, r9d
	jmp	.LBB17_103
.LBB17_99:
	lea	rdi, [rsp + 8*rdx + 64]
	mov	ebx, r13d
	jmp	.LBB17_103
.LBB17_100:
	lea	rdi, [rsp + 8*rbx + 64]
	mov	ebx, eax
	jmp	.LBB17_103
.LBB17_101:
	lea	rdi, [rsp + 8*r14 + 64]
	mov	ebx, esi
	jmp	.LBB17_103
.LBB17_102:
	lea	rdi, [rsp + 8*r15 + 64]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_103:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB17_156
.LBB17_104:
	lea	rsi, [rsp + 8*r12 + 320]
	mov	ebx, r10d
	jmp	.LBB17_110
.LBB17_105:
	mov	ebx, r9d
	lea	rsi, [rsp + 8*rdi + 320]
	jmp	.LBB17_110
.LBB17_106:
	lea	rsi, [rsp + 8*rdx + 320]
	mov	ebx, r13d
	jmp	.LBB17_110
.LBB17_107:
	lea	rsi, [rsp + 8*rbx + 320]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB17_110
.LBB17_108:
	lea	rsi, [rsp + 8*r14 + 320]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB17_110
.LBB17_109:
	lea	rsi, [rsp + 8*r15 + 320]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_110:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	jmp	.LBB17_118
.LBB17_111:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB17_117
.LBB17_112:
	mov	ebx, r9d
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB17_117
.LBB17_113:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB17_117
.LBB17_114:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB17_117
.LBB17_115:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB17_117
.LBB17_116:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_117:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB17_118:
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	jmp	.LBB17_154
.LBB17_119:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB17_125
.LBB17_120:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB17_126
.LBB17_121:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB17_125
.LBB17_122:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB17_125
.LBB17_123:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB17_125
.LBB17_124:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_125:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB17_126:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB17_153
.LBB17_127:
	lea	rsi, [rsp + 8*r12 + 320]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB17_133
.LBB17_128:
	lea	rsi, [rsp + 8*rdi + 320]
	jmp	.LBB17_134
.LBB17_129:
	lea	rsi, [rsp + 8*rdx + 320]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB17_133
.LBB17_130:
	lea	rsi, [rsp + 8*rbx + 320]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB17_133
.LBB17_131:
	lea	rsi, [rsp + 8*r14 + 320]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB17_133
.LBB17_132:
	lea	rsi, [rsp + 8*r15 + 320]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_133:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB17_134:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	jmp	.LBB17_152
.LBB17_135:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB17_141
.LBB17_136:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB17_142
.LBB17_137:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB17_141
.LBB17_138:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB17_141
.LBB17_139:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB17_141
.LBB17_140:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_141:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB17_142:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	jmp	.LBB17_151
.LBB17_143:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB17_149
.LBB17_144:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB17_150
.LBB17_145:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB17_149
.LBB17_146:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB17_149
.LBB17_147:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB17_149
.LBB17_148:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB17_149:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB17_150:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rcx, _ZTId
	mov	rcx, qword ptr [rcx + 8]
	lea	rdx, [rcx + 1]
	cmp	byte ptr [rcx], 42
	cmovne	rdx, rcx
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIdERSoS0_7printerIT_E
.LBB17_151:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB17_152:
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB17_153:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, dword ptr [rsp + 60] # 4-byte Reload
.LBB17_154:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
.LBB17_155:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB17_156:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spId1NEvPKT0_
.Lcfi187:
	.seh_endproc

	.def	 _Z12test_pack_spIN4math6scalarE1NEvPKT0_;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarE1NEvPKT0_
	.globl	_Z12test_pack_spIN4math6scalarE1NEvPKT0_
	.p2align	4, 0x90
_Z12test_pack_spIN4math6scalarE1NEvPKT0_: # @_Z12test_pack_spIN4math6scalarE1NEvPKT0_
.Lcfi188:
.seh_proc _Z12test_pack_spIN4math6scalarE1NEvPKT0_
# BB#0:
	push	rbp
.Lcfi189:
	.seh_pushreg 5
	push	r15
.Lcfi190:
	.seh_pushreg 15
	push	r14
.Lcfi191:
	.seh_pushreg 14
	push	r13
.Lcfi192:
	.seh_pushreg 13
	push	r12
.Lcfi193:
	.seh_pushreg 12
	push	rsi
.Lcfi194:
	.seh_pushreg 6
	push	rdi
.Lcfi195:
	.seh_pushreg 7
	push	rbx
.Lcfi196:
	.seh_pushreg 3
	sub	rsp, 632
.Lcfi197:
	.seh_stackalloc 632
	lea	rbp, [rsp + 128]
.Lcfi198:
	.seh_setframe 5, 128
	vmovapd	xmmword ptr [rbp + 480], xmm7 # 16-byte Spill
.Lcfi199:
	.seh_savexmm 7, 608
	vmovaps	xmmword ptr [rbp + 464], xmm6 # 16-byte Spill
.Lcfi200:
	.seh_savexmm 6, 592
.Lcfi201:
	.seh_endprologue
	and	rsp, -32
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 80], ymm0
	vmovapd	ymm0, ymmword ptr [rcx]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	movabs	r11, _ZN6layoutI1NE1iE
	mov	r10d, dword ptr [r11]
	movsxd	r12, r10d
	vmovsd	xmm6, qword ptr [rsp + 8*r12 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB18_100
	jp	.LBB18_100
# BB#1:
	mov	r9d, dword ptr [r11 + 4]
	movsxd	rdi, r9d
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB18_101
	jp	.LBB18_101
# BB#2:
	mov	r13d, dword ptr [r11 + 8]
	movsxd	rdx, r13d
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB18_102
	jp	.LBB18_102
# BB#3:
	mov	eax, dword ptr [r11 + 12]
	movsxd	rbx, eax
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB18_103
	jp	.LBB18_103
# BB#4:
	mov	esi, dword ptr [r11 + 16]
	movsxd	r14, esi
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB18_104
	jp	.LBB18_104
# BB#5:
	mov	dword ptr [rsp + 216], esi # 4-byte Spill
	mov	dword ptr [rsp + 220], eax # 4-byte Spill
	mov	eax, dword ptr [r11 + 20]
	mov	dword ptr [rsp + 212], eax # 4-byte Spill
	movsxd	r15, eax
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 128] # xmm6 = mem[0],zero
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB18_105
	jp	.LBB18_105
# BB#6:
	movabs	rsi, count
	mov	r8d, dword ptr [rsi]
	lea	eax, [r8 + 1]
	mov	dword ptr [rsi], eax
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [rcx + 80]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 64]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	vmovapd	ymm0, ymmword ptr [rsp + 64]
	vmulpd	ymm0, ymm0, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vmulpd	xmm1, xmm1, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm0
	vmovapd	xmmword ptr [rsp + 352], xmm1
	vmovsd	xmm0, qword ptr [rsp + 8*r12 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 320]
	jne	.LBB18_107
	jp	.LBB18_107
# BB#7:
	vmovsd	xmm0, qword ptr [rsp + 8*rdi + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 320]
	jne	.LBB18_108
	jp	.LBB18_108
# BB#8:
	vmovsd	xmm0, qword ptr [rsp + 8*rdx + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 320]
	jne	.LBB18_109
	jp	.LBB18_109
# BB#9:
	vmovsd	xmm0, qword ptr [rsp + 8*rbx + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 320]
	jne	.LBB18_110
	jp	.LBB18_110
# BB#10:
	vmovsd	xmm0, qword ptr [rsp + 8*r14 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 320]
	jne	.LBB18_111
	jp	.LBB18_111
# BB#11:
	mov	dword ptr [rsp + 312], r13d # 4-byte Spill
	mov	dword ptr [rsp + 316], r10d # 4-byte Spill
	vmovsd	xmm0, qword ptr [rsp + 8*r15 + 128] # xmm0 = mem[0],zero
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 320]
	jne	.LBB18_112
	jp	.LBB18_112
# BB#12:
	lea	r13, [rcx + 64]
	lea	eax, [r8 + 2]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	mov	r10, qword ptr [rcx]
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 384], r10
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovq	xmm3, r10
	vpbroadcastq	ymm4, xmm3
	vmovddup	xmm5, xmm3      # xmm5 = xmm3[0,0]
	vmulpd	ymm0, ymm4, ymmword ptr [rsp + 224]
	vmulpd	xmm1, xmm5, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm0
	vmovapd	xmmword ptr [rsp + 96], xmm1
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB18_114
	jp	.LBB18_114
# BB#13:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB18_115
	jp	.LBB18_115
# BB#14:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB18_116
	jp	.LBB18_116
# BB#15:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB18_117
	jp	.LBB18_117
# BB#16:
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB18_118
	jp	.LBB18_118
# BB#17:
	mov	dword ptr [rsp + 60], r9d # 4-byte Spill
	vmulsd	xmm6, xmm3, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB18_119
	jp	.LBB18_119
# BB#18:
	lea	eax, [r8 + 3]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	r9, qword ptr [rcx + 64]
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 384], r9
	vmovq	xmm0, r9
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmulpd	ymm6, ymm1, ymmword ptr [rsp + 224]
	vmulpd	xmm7, xmm2, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm6
	vmovapd	xmmword ptr [rsp + 96], xmm7
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB18_122
	jp	.LBB18_122
# BB#19:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB18_123
	jp	.LBB18_123
# BB#20:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB18_124
	jp	.LBB18_124
# BB#21:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB18_125
	jp	.LBB18_125
# BB#22:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB18_126
	jp	.LBB18_126
# BB#23:
	vmulsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB18_127
	jp	.LBB18_127
# BB#24:
	lea	eax, [r8 + 4]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	vmovups	ymm6, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm6
	vmovaps	ymm6, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm6
	vmovups	ymm6, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 240], ymm6
	vmovaps	ymm6, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vmovaps	ymm6, ymmword ptr [rsp + 128]
	vmovaps	ymm7, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm7
	vmovaps	ymmword ptr [rsp + 64], ymm6
	vmovaps	ymm6, ymmword ptr [rsp + 224]
	vmovaps	ymm7, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm7
	vmovaps	ymmword ptr [rsp + 384], ymm6
	vmovapd	ymm6, ymmword ptr [rsp + 64]
	vaddpd	ymm6, ymm6, ymmword ptr [rsp + 384]
	vmovapd	xmm7, xmmword ptr [rsp + 96]
	vaddpd	xmm7, xmm7, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm6
	vmovapd	xmmword ptr [rsp + 352], xmm7
	vmovsd	xmm6, qword ptr [rsp + 8*r12 + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*r12 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 320]
	jne	.LBB18_130
	jp	.LBB18_130
# BB#25:
	vmovsd	xmm6, qword ptr [rsp + 8*rdi + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*rdi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 320]
	jne	.LBB18_131
	jp	.LBB18_131
# BB#26:
	vmovsd	xmm6, qword ptr [rsp + 8*rdx + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*rdx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 320]
	jne	.LBB18_132
	jp	.LBB18_132
# BB#27:
	vmovsd	xmm6, qword ptr [rsp + 8*rbx + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*rbx + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 320]
	jne	.LBB18_133
	jp	.LBB18_133
# BB#28:
	vmovsd	xmm6, qword ptr [rsp + 8*r14 + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*r14 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 320]
	jne	.LBB18_134
	jp	.LBB18_134
# BB#29:
	vmovsd	xmm6, qword ptr [rsp + 8*r15 + 128] # xmm6 = mem[0],zero
	vaddsd	xmm6, xmm6, qword ptr [rsp + 8*r15 + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 320]
	jne	.LBB18_135
	jp	.LBB18_135
# BB#30:
	lea	eax, [r8 + 5]
	movabs	rsi, count
	mov	dword ptr [rsi], eax
	vmovups	ymm6, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm6
	vmovaps	ymm6, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm6
	mov	qword ptr [rsp + 384], r10
	vmovaps	ymm6, ymmword ptr [rsp + 128]
	vmovapd	ymm7, ymmword ptr [rsp + 160]
	vmovapd	ymmword ptr [rsp + 256], ymm7
	vmovaps	ymmword ptr [rsp + 224], ymm6
	vaddpd	ymm4, ymm4, ymmword ptr [rsp + 224]
	vaddpd	xmm5, xmm5, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	xmmword ptr [rsp + 96], xmm5
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB18_138
	jp	.LBB18_138
# BB#31:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB18_139
	jp	.LBB18_139
# BB#32:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	movabs	r10, count
	jne	.LBB18_140
	jp	.LBB18_140
# BB#33:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB18_141
	jp	.LBB18_141
# BB#34:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB18_142
	jp	.LBB18_142
# BB#35:
	vaddsd	xmm6, xmm3, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB18_143
	jp	.LBB18_143
# BB#36:
	lea	eax, [r8 + 6]
	mov	dword ptr [r10], eax
	vmovups	ymm3, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm3
	vmovaps	ymm3, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	vmovaps	ymm3, ymmword ptr [rsp + 128]
	vmovaps	ymm4, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm4
	vmovaps	ymmword ptr [rsp + 224], ymm3
	mov	qword ptr [rsp + 384], r9
	vaddpd	ymm3, ymm1, ymmword ptr [rsp + 224]
	vaddpd	xmm4, xmm2, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	xmmword ptr [rsp + 96], xmm4
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r12 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r12 + 64]
	jne	.LBB18_146
	jp	.LBB18_146
# BB#37:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdi + 64]
	jne	.LBB18_147
	jp	.LBB18_147
# BB#38:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rdx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rdx + 64]
	jne	.LBB18_148
	jp	.LBB18_148
# BB#39:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*rbx + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rbx + 64]
	jne	.LBB18_149
	jp	.LBB18_149
# BB#40:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r14 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r14 + 64]
	jne	.LBB18_150
	jp	.LBB18_150
# BB#41:
	vaddsd	xmm6, xmm0, qword ptr [rsp + 8*r15 + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*r15 + 64]
	jne	.LBB18_151
	jp	.LBB18_151
# BB#42:
	add	r8d, 7
	mov	dword ptr [r10], r8d
	vmovups	ymm3, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm3
	vmovaps	ymm3, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm3
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm3, ymmword ptr [rsp + 128]
	vmovaps	ymm4, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm4
	vmovaps	ymmword ptr [rsp + 224], ymm3
	mov	qword ptr [rsp + 384], r9
	mov	qword ptr [rsp + 320], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; S c = u3.d[0];
	#NO_APP
	vmovq	xmm3, rdx
	vpbroadcastq	ymm4, xmm3
	vmovddup	xmm5, xmm3      # xmm5 = xmm3[0,0]
	vfmadd132pd	ymm1, ymm4, ymmword ptr [rsp + 224]
	vfmadd132pd	xmm2, xmm5, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm1
	vmovapd	xmmword ptr [rsp + 96], xmm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_85
	jp	.LBB18_85
# BB#43:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_85
	jp	.LBB18_85
# BB#44:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_85
	jp	.LBB18_85
# BB#45:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_85
	jp	.LBB18_85
# BB#46:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_85
	jp	.LBB18_85
# BB#47:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, xmm3
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_85
	jp	.LBB18_85
# BB#48:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rbx, qword ptr [rcx + 128]
	mov	qword ptr [rsp + 384], rdx
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 320], rbx
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm2, xmm0
	vmovddup	xmm3, xmm0      # xmm3 = xmm0[0,0]
	vmovq	xmm1, rbx
	vpbroadcastq	ymm4, xmm1
	vmovddup	xmm5, xmm1      # xmm5 = xmm1[0,0]
	vfmadd231pd	ymm4, ymm2, ymmword ptr [rsp + 224]
	vfmadd231pd	xmm5, xmm3, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm4
	vmovapd	xmmword ptr [rsp + 96], xmm5
	movsxd	rsi, dword ptr [r11]
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_89
	jp	.LBB18_89
# BB#49:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_89
	jp	.LBB18_89
# BB#50:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_89
	jp	.LBB18_89
# BB#51:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_89
	jp	.LBB18_89
# BB#52:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_89
	jp	.LBB18_89
# BB#53:
	movsxd	rsi, dword ptr [r11 + 20]
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_160
	jp	.LBB18_160
# BB#54:
	inc	dword ptr [r10]
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	rdx, qword ptr [rcx + 128]
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	mov	qword ptr [rsp + 512], rdx
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; S c = u3.d[0];
	#NO_APP
	vmovq	xmm0, rdx
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vfmadd132pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vfmadd132pd	xmm1, xmm2, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm3
	vmovapd	xmmword ptr [rsp + 352], xmm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_86
	jp	.LBB18_86
# BB#55:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_86
	jp	.LBB18_86
# BB#56:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_86
	jp	.LBB18_86
# BB#57:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_86
	jp	.LBB18_86
# BB#58:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_86
	jp	.LBB18_86
# BB#59:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_86
	jp	.LBB18_86
# BB#60:
	inc	dword ptr [r10]
	mov	rdx, qword ptr [rcx]
	mov	rbx, qword ptr [rcx + 64]
	vmovups	ymm0, ymmword ptr [rcx + 144]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx + 128]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	qword ptr [rsp + 384], rdx
	mov	qword ptr [rsp + 320], rbx
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 256], ymm1
	vmovaps	ymmword ptr [rsp + 224], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rdx
	vmovq	xmm1, rbx
	vmulsd	xmm2, xmm0, xmm1
	vbroadcastsd	ymm3, xmm2
	vmovddup	xmm2, xmm2      # xmm2 = xmm2[0,0]
	vaddpd	ymm3, ymm3, ymmword ptr [rsp + 224]
	vaddpd	xmm2, xmm2, xmmword ptr [rsp + 256]
	vmovapd	ymmword ptr [rsp + 64], ymm3
	vmovapd	xmmword ptr [rsp + 96], xmm2
	movsxd	rsi, dword ptr [r11]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_92
	jp	.LBB18_92
# BB#61:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_92
	jp	.LBB18_92
# BB#62:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_92
	jp	.LBB18_92
# BB#63:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_92
	jp	.LBB18_92
# BB#64:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovapd	xmm6, xmm0
	vfmadd213sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_92
	jp	.LBB18_92
# BB#65:
	movsxd	rsi, dword ptr [r11 + 20]
	vfmadd213sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 64]
	jne	.LBB18_161
	jp	.LBB18_161
# BB#66:
	mov	rdx, rcx
	sub	rdx, -128
	inc	dword ptr [r10]
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	mov	rbx, qword ptr [rcx + 64]
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	mov	qword ptr [rsp + 512], rbx
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; S b = u2.d[0]; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rbx
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vfmadd213pd	xmm1, xmm2, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm3
	vmovapd	xmmword ptr [rsp + 352], xmm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_87
	jp	.LBB18_87
# BB#67:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_87
	jp	.LBB18_87
# BB#68:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_87
	jp	.LBB18_87
# BB#69:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_87
	jp	.LBB18_87
# BB#70:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_87
	jp	.LBB18_87
# BB#71:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vfmadd213sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_87
	jp	.LBB18_87
# BB#72:
	inc	dword ptr [r10]
	mov	rbx, qword ptr [rcx]
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	mov	qword ptr [rsp + 512], rbx
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 96], ymm1
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	#APP
	# TEST3 a * b + c -- S a = u1.d[0]; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovq	xmm0, rbx
	vpbroadcastq	ymm1, xmm0
	vmovddup	xmm2, xmm0      # xmm2 = xmm0[0,0]
	vmovapd	ymm3, ymmword ptr [rsp + 64]
	vfmadd213pd	ymm3, ymm1, ymmword ptr [rsp + 384]
	vmovapd	xmm1, xmmword ptr [rsp + 96]
	vfmadd213pd	xmm1, xmm2, xmmword ptr [rsp + 416]
	vmovapd	ymmword ptr [rsp + 320], ymm3
	vmovapd	xmmword ptr [rsp + 352], xmm1
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 224] # xmm1 = mem[0],zero
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_95
	jp	.LBB18_95
# BB#73:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 224] # xmm1 = mem[0],zero
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_95
	jp	.LBB18_95
# BB#74:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 224] # xmm1 = mem[0],zero
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_95
	jp	.LBB18_95
# BB#75:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 224] # xmm1 = mem[0],zero
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_95
	jp	.LBB18_95
# BB#76:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 224] # xmm1 = mem[0],zero
	vmovapd	xmm6, xmm0
	vfmadd132sd	xmm6, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_95
	jp	.LBB18_95
# BB#77:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm1, qword ptr [rsp + 8*rsi + 224] # xmm1 = mem[0],zero
	vfmadd132sd	xmm0, xmm1, qword ptr [rsp + 8*rsi + 128]
	vucomisd	xmm0, qword ptr [rsp + 8*rsi + 320]
	jne	.LBB18_162
	jp	.LBB18_162
# BB#78:
	inc	dword ptr [r10]
	vmovups	ymm0, ymmword ptr [rcx + 16]
	vmovups	ymmword ptr [rsp + 144], ymm0
	vmovaps	ymm0, ymmword ptr [rcx]
	vmovaps	ymmword ptr [rsp + 128], ymm0
	vmovups	ymm0, ymmword ptr [r13 + 16]
	vmovups	ymmword ptr [rsp + 240], ymm0
	vmovaps	ymm0, ymmword ptr [r13]
	vmovaps	ymmword ptr [rsp + 224], ymm0
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 80], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 64], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 128]
	vmovaps	ymm1, ymmword ptr [rsp + 160]
	vmovaps	ymmword ptr [rsp + 416], ymm1
	vmovaps	ymmword ptr [rsp + 384], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 224]
	vmovaps	ymm1, ymmword ptr [rsp + 256]
	vmovaps	ymmword ptr [rsp + 352], ymm1
	vmovaps	ymmword ptr [rsp + 320], ymm0
	vmovaps	ymm0, ymmword ptr [rsp + 64]
	vmovaps	ymm1, ymmword ptr [rsp + 96]
	vmovaps	ymmword ptr [rsp + 544], ymm1
	vmovaps	ymmword ptr [rsp + 512], ymm0
	#APP
	# TEST3 a * b + c -- P a = u1.p; P b = u2.p; P c = u3.p;
	#NO_APP
	vmovapd	ymm0, ymmword ptr [rsp + 384]
	vmovapd	ymm1, ymmword ptr [rsp + 320]
	vfmadd213pd	ymm1, ymm0, ymmword ptr [rsp + 512]
	vmovapd	xmm0, xmmword ptr [rsp + 416]
	vmovapd	xmm2, xmmword ptr [rsp + 352]
	vfmadd213pd	xmm2, xmm0, xmmword ptr [rsp + 544]
	vmovapd	ymmword ptr [rsp + 448], ymm1
	vmovapd	xmmword ptr [rsp + 480], xmm2
	movsxd	rsi, dword ptr [r11]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB18_88
	jp	.LBB18_88
# BB#79:
	movsxd	rsi, dword ptr [r11 + 4]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB18_88
	jp	.LBB18_88
# BB#80:
	movsxd	rsi, dword ptr [r11 + 8]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB18_88
	jp	.LBB18_88
# BB#81:
	movsxd	rsi, dword ptr [r11 + 12]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB18_88
	jp	.LBB18_88
# BB#82:
	movsxd	rsi, dword ptr [r11 + 16]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB18_88
	jp	.LBB18_88
# BB#83:
	movsxd	rsi, dword ptr [r11 + 20]
	vmovsd	xmm6, qword ptr [rsp + 8*rsi + 128] # xmm6 = mem[0],zero
	vmovsd	xmm0, qword ptr [rsp + 8*rsi + 64] # xmm0 = mem[0],zero
	vfmadd132sd	xmm6, xmm0, qword ptr [rsp + 8*rsi + 224]
	vucomisd	xmm6, qword ptr [rsp + 8*rsi + 448]
	jne	.LBB18_88
	jp	.LBB18_88
# BB#84:
	inc	dword ptr [r10]
	vmovaps	xmm6, xmmword ptr [rbp + 464] # 16-byte Reload
	vmovaps	xmm7, xmmword ptr [rbp + 480] # 16-byte Reload
	lea	rsp, [rbp + 504]
	pop	rbx
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	vzeroupper
	ret
.LBB18_85:
	lea	r14, [rsp + 8*rsi + 64]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB18_91
.LBB18_86:
	lea	r14, [rsp + 8*rsi + 320]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB18_98
.LBB18_87:
	lea	r14, [rsp + 8*rsi + 320]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB18_97
.LBB18_88:
	lea	r14, [rsp + 8*rsi + 448]
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 448]
	jmp	.LBB18_99
.LBB18_89:
	lea	r14, [rsp + 8*rsi + 64]
.LBB18_90:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB18_91:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	jmp	.LBB18_94
.LBB18_92:
	lea	r14, [rsp + 8*rsi + 64]
.LBB18_93:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTSN4math6scalarE
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, .L.str.10
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB18_94:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	jmp	.LBB18_99
.LBB18_95:
	lea	r14, [rsp + 8*rsi + 320]
.LBB18_96:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.10
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 512]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rbx, .L.str.11
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB18_97:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
.LBB18_98:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
.LBB18_99:
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.14
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, esi
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [r14]   # xmm1 = mem[0],zero
	jmp	.LBB18_158
.LBB18_100:
	mov	ebx, r10d
	lea	rdi, [rsp + 8*r12 + 64]
	jmp	.LBB18_106
.LBB18_101:
	lea	rdi, [rsp + 8*rdi + 64]
	mov	ebx, r9d
	jmp	.LBB18_106
.LBB18_102:
	lea	rdi, [rsp + 8*rdx + 64]
	mov	ebx, r13d
	jmp	.LBB18_106
.LBB18_103:
	lea	rdi, [rsp + 8*rbx + 64]
	mov	ebx, eax
	jmp	.LBB18_106
.LBB18_104:
	lea	rdi, [rsp + 8*r14 + 64]
	mov	ebx, esi
	jmp	.LBB18_106
.LBB18_105:
	lea	rdi, [rsp + 8*r15 + 64]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_106:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rsi, .L.str.4
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.6
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rdi]   # xmm1 = mem[0],zero
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rsi
	jmp	.LBB18_159
.LBB18_107:
	lea	rsi, [rsp + 8*r12 + 320]
	mov	ebx, r10d
	jmp	.LBB18_113
.LBB18_108:
	mov	ebx, r9d
	lea	rsi, [rsp + 8*rdi + 320]
	jmp	.LBB18_113
.LBB18_109:
	lea	rsi, [rsp + 8*rdx + 320]
	mov	ebx, r13d
	jmp	.LBB18_113
.LBB18_110:
	lea	rsi, [rsp + 8*rbx + 320]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB18_113
.LBB18_111:
	lea	rsi, [rsp + 8*r14 + 320]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB18_113
.LBB18_112:
	lea	rsi, [rsp + 8*r15 + 320]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_113:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	jmp	.LBB18_121
.LBB18_114:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	ebx, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB18_120
.LBB18_115:
	mov	ebx, r9d
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB18_120
.LBB18_116:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	ebx, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB18_120
.LBB18_117:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	ebx, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB18_120
.LBB18_118:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	ebx, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB18_120
.LBB18_119:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	ebx, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_120:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB18_121:
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, ebx
	jmp	.LBB18_157
.LBB18_122:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB18_128
.LBB18_123:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB18_129
.LBB18_124:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB18_128
.LBB18_125:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB18_128
.LBB18_126:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB18_128
.LBB18_127:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_128:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB18_129:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.12
	jmp	.LBB18_156
.LBB18_130:
	lea	rsi, [rsp + 8*r12 + 320]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB18_136
.LBB18_131:
	lea	rsi, [rsp + 8*rdi + 320]
	jmp	.LBB18_137
.LBB18_132:
	lea	rsi, [rsp + 8*rdx + 320]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB18_136
.LBB18_133:
	lea	rsi, [rsp + 8*rbx + 320]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB18_136
.LBB18_134:
	lea	rsi, [rsp + 8*r14 + 320]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB18_136
.LBB18_135:
	lea	rsi, [rsp + 8*r15 + 320]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_136:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB18_137:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdi, _ZTS1N
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 320]
	jmp	.LBB18_155
.LBB18_138:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB18_144
.LBB18_139:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB18_145
.LBB18_140:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB18_144
.LBB18_141:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB18_144
.LBB18_142:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB18_144
.LBB18_143:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_144:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB18_145:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	jmp	.LBB18_154
.LBB18_146:
	lea	rsi, [rsp + 8*r12 + 64]
	mov	eax, dword ptr [rsp + 316] # 4-byte Reload
	jmp	.LBB18_152
.LBB18_147:
	lea	rsi, [rsp + 8*rdi + 64]
	jmp	.LBB18_153
.LBB18_148:
	lea	rsi, [rsp + 8*rdx + 64]
	mov	eax, dword ptr [rsp + 312] # 4-byte Reload
	jmp	.LBB18_152
.LBB18_149:
	lea	rsi, [rsp + 8*rbx + 64]
	mov	eax, dword ptr [rsp + 220] # 4-byte Reload
	jmp	.LBB18_152
.LBB18_150:
	lea	rsi, [rsp + 8*r14 + 64]
	mov	eax, dword ptr [rsp + 216] # 4-byte Reload
	jmp	.LBB18_152
.LBB18_151:
	lea	rsi, [rsp + 8*r15 + 64]
	mov	eax, dword ptr [rsp + 212] # 4-byte Reload
.LBB18_152:
	mov	dword ptr [rsp + 60], eax # 4-byte Spill
.LBB18_153:
	movabs	rcx, _ZSt4cerr
	movabs	rdx, .L.str.1
	vzeroupper
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTS1N
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.2
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, _ZTSN4math6scalarE
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.10
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.3
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 224]
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	movabs	rdi, .L.str.4
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.11
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 384]
	mov	rcx, rax
	call	_ZlsIN4math6scalarEERSoS2_7printerIT_E
.LBB18_154:
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.5
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rdx, [rsp + 64]
.LBB18_155:
	mov	rcx, rax
	call	_ZlsI1NERSoS1_7printerIT_E
	mov	rcx, rax
	mov	rdx, rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.13
.LBB18_156:
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movabs	rdx, .L.str.7
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	edx, dword ptr [rsp + 60] # 4-byte Reload
.LBB18_157:
	call	_ZNSolsEi
	movabs	rdx, .L.str.8
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	vmovapd	xmm1, xmm6
	call	_ZNSo9_M_insertIdEERSoT_
	movabs	rdx, .L.str.9
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	vmovsd	xmm1, qword ptr [rsi]   # xmm1 = mem[0],zero
.LBB18_158:
	mov	rcx, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rcx, rax
	mov	rdx, rdi
.LBB18_159:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	ecx, 1
	call	exit
	ud2
.LBB18_160:
	lea	r14, [rsp + 8*rsi + 64]
	vmovapd	xmm6, xmm0
	jmp	.LBB18_90
.LBB18_161:
	lea	r14, [rsp + 8*rsi + 64]
	vmovapd	xmm6, xmm0
	jmp	.LBB18_93
.LBB18_162:
	lea	r14, [rsp + 8*rsi + 320]
	vmovapd	xmm6, xmm0
	jmp	.LBB18_96
	.seh_handlerdata
	.section	.text,"xr",discard,_Z12test_pack_spIN4math6scalarE1NEvPKT0_
.Lcfi202:
	.seh_endproc

	.def	 _ZlsI1NERSoS1_7printerIT_E;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZlsI1NERSoS1_7printerIT_E
	.globl	_ZlsI1NERSoS1_7printerIT_E
	.p2align	4, 0x90
_ZlsI1NERSoS1_7printerIT_E:             # @_ZlsI1NERSoS1_7printerIT_E
.Lcfi203:
.seh_proc _ZlsI1NERSoS1_7printerIT_E
# BB#0:
	push	rbp
.Lcfi204:
	.seh_pushreg 5
	push	rsi
.Lcfi205:
	.seh_pushreg 6
	push	rdi
.Lcfi206:
	.seh_pushreg 7
	sub	rsp, 96
.Lcfi207:
	.seh_stackalloc 96
	lea	rbp, [rsp + 96]
.Lcfi208:
	.seh_setframe 5, 96
.Lcfi209:
	.seh_endprologue
	and	rsp, -32
	mov	rsi, rcx
	vmovups	ymm0, ymmword ptr [rdx + 16]
	vmovups	ymmword ptr [rsp + 48], ymm0
	vmovaps	ymm0, ymmword ptr [rdx]
	vmovaps	ymmword ptr [rsp + 32], ymm0
	movabs	rdi, _ZN6layoutI1NE1iE
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	vzeroupper
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 4]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 8]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 12]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 16]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, qword ptr [rsi]
	mov	rax, qword ptr [rax - 24]
	movsxd	rcx, dword ptr [rdi + 20]
	mov	qword ptr [rsi + rax + 16], 4
	vmovsd	xmm1, qword ptr [rsp + 8*rcx + 32] # xmm1 = mem[0],zero
	mov	rcx, rsi
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rax, rsi
	mov	rsp, rbp
	pop	rdi
	pop	rsi
	pop	rbp
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZlsI1NERSoS1_7printerIT_E
.Lcfi210:
	.seh_endproc

	.def	 _ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
	.globl	_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
	.p2align	4, 0x90
_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE: # @_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
.Lcfi211:
.seh_proc _ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
# BB#0:
	push	r15
.Lcfi212:
	.seh_pushreg 15
	push	r14
.Lcfi213:
	.seh_pushreg 14
	push	r13
.Lcfi214:
	.seh_pushreg 13
	push	r12
.Lcfi215:
	.seh_pushreg 12
	push	rsi
.Lcfi216:
	.seh_pushreg 6
	push	rdi
.Lcfi217:
	.seh_pushreg 7
	push	rbp
.Lcfi218:
	.seh_pushreg 5
	push	rbx
.Lcfi219:
	.seh_pushreg 3
	sub	rsp, 40
.Lcfi220:
	.seh_stackalloc 40
.Lcfi221:
	.seh_endprologue
	mov	r14, r8
	mov	rsi, rdx
	mov	r12, rcx
	mov	ecx, dword ptr [r14]
	mov	ebp, dword ptr [r14 + 4]
	sub	ebp, ecx
	cmp	ebp, 2147483644
	ja	.LBB20_4
# BB#1:
	inc	ebp
	mov	eax, 2147483645
	xor	edx, edx
	div	ebp
	mov	r8d, eax
	imul	ebp, r8d
	mov	edi, dword ptr [rsi]
	.p2align	4, 0x90
.LBB20_2:                               # =>This Inner Loop Header: Depth=1
	mov	eax, edi
	imul	rax, rax, 110892733
	shr	rax, 32
	mov	edx, edi
	sub	edx, eax
	shr	edx
	add	edx, eax
	shr	edx, 16
	imul	eax, edx, 127773
	sub	edi, eax
	imul	eax, edi, 16807
	imul	edx, edx, 2836
	mov	edi, edx
	xor	edi, 2147483647
	mov	ebx, edx
	neg	ebx
	cmp	eax, edx
	cmovb	ebx, edi
	lea	edi, [rbx + rax]
	lea	eax, [rbx + rax - 1]
	cmp	eax, ebp
	jae	.LBB20_2
# BB#3:
	mov	dword ptr [rsi], edi
	xor	edx, edx
	div	r8d
	jmp	.LBB20_9
.LBB20_4:
	cmp	ebp, 2147483645
	jne	.LBB20_5
# BB#10:
	mov	eax, dword ptr [rsi]
	imul	rdx, rax, 110892733
	shr	rdx, 32
	mov	ebp, eax
	sub	ebp, edx
	shr	ebp
	add	ebp, edx
	shr	ebp, 16
	imul	edx, ebp, 127773
	sub	eax, edx
	imul	eax, eax, 16807
	imul	edx, ebp, 2836
	mov	ebp, edx
	xor	ebp, 2147483647
	mov	ebx, edx
	neg	ebx
	cmp	eax, edx
	cmovb	ebx, ebp
	lea	edx, [rbx + rax]
	mov	dword ptr [rsi], edx
	lea	eax, [rbx + rax - 1]
	jmp	.LBB20_9
.LBB20_5:
	mov	eax, ebp
	shr	eax
	mov	r13d, 2147483651
	imul	r13, rax
	shr	r13, 61
	lea	r15, [rsp + 32]
	.p2align	4, 0x90
.LBB20_6:                               # =>This Inner Loop Header: Depth=1
	mov	dword ptr [rsp + 32], 0
	mov	dword ptr [rsp + 36], r13d
	mov	rcx, r12
	mov	rdx, rsi
	mov	r8, r15
	call	_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
	imul	ecx, eax, 2147483646
	mov	eax, dword ptr [rsi]
	imul	rdx, rax, 110892733
	shr	rdx, 32
	mov	ebx, eax
	sub	ebx, edx
	shr	ebx
	add	ebx, edx
	shr	ebx, 16
	imul	edx, ebx, 127773
	sub	eax, edx
	imul	eax, eax, 16807
	imul	edx, ebx, 2836
	mov	ebx, edx
	xor	ebx, 2147483647
	mov	edi, edx
	neg	edi
	cmp	eax, edx
	cmovb	edi, ebx
	add	edi, eax
	mov	dword ptr [rsi], edi
	lea	eax, [rcx + rdi - 1]
	cmp	eax, ebp
	ja	.LBB20_6
# BB#7:                                 #   in Loop: Header=BB20_6 Depth=1
	cmp	eax, ecx
	jb	.LBB20_6
# BB#8:
	mov	ecx, dword ptr [r14]
.LBB20_9:
	add	ecx, eax
	mov	eax, ecx
	add	rsp, 40
	pop	rbx
	pop	rbp
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.seh_handlerdata
	.section	.text,"xr",discard,_ZNSt24uniform_int_distributionIiEclISt26linear_congruential_engineIjLj16807ELj0ELj2147483647EEEEiRT_RKNS0_10param_typeE
.Lcfi222:
	.seh_endproc

	.def	 _GLOBAL__sub_I_test_math.cpp;
	.scl	3;
	.type	32;
	.endef
	.text
	.p2align	4, 0x90
_GLOBAL__sub_I_test_math.cpp:           # @_GLOBAL__sub_I_test_math.cpp
.Lcfi223:
.seh_proc _GLOBAL__sub_I_test_math.cpp
# BB#0:
	push	rsi
.Lcfi224:
	.seh_pushreg 6
	sub	rsp, 32
.Lcfi225:
	.seh_stackalloc 32
.Lcfi226:
	.seh_endprologue
	movabs	rsi, _ZStL8__ioinit
	mov	rcx, rsi
	call	_ZNSt8ios_base4InitC1Ev
	movabs	rcx, _ZNSt8ios_base4InitD1Ev
	movabs	r8, __dso_handle
	movabs	rax, __imp___cxa_atexit
	mov	rdx, rsi
	add	rsp, 32
	pop	rsi
	rex64 jmp	qword ptr [rax] # TAILCALL
	.seh_handlerdata
	.text
.Lcfi227:
	.seh_endproc

	.lcomm	_ZStL8__ioinit,1        # @_ZStL8__ioinit
	.data
	.globl	_ZN6layoutI1XE1iE       # @_ZN6layoutI1XE1iE
	.p2align	4
_ZN6layoutI1XE1iE:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.long	4                       # 0x4
	.long	5                       # 0x5
	.long	6                       # 0x6
	.long	7                       # 0x7

	.globl	_ZN6layoutI1YE1iE       # @_ZN6layoutI1YE1iE
	.p2align	4
_ZN6layoutI1YE1iE:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.long	4                       # 0x4
	.long	5                       # 0x5
	.long	6                       # 0x6
	.long	7                       # 0x7
	.long	8                       # 0x8
	.long	9                       # 0x9
	.long	10                      # 0xa
	.long	11                      # 0xb
	.long	12                      # 0xc
	.long	13                      # 0xd
	.long	14                      # 0xe
	.long	15                      # 0xf

	.globl	_ZN6layoutI1NE1iE       # @_ZN6layoutI1NE1iE
	.p2align	4
_ZN6layoutI1NE1iE:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.long	4                       # 0x4
	.long	5                       # 0x5

	.bss
	.globl	_ZN6layoutIN4math6scalarEE1iE # @_ZN6layoutIN4math6scalarEE1iE
	.p2align	2
_ZN6layoutIN4math6scalarEE1iE:
	.zero	4

	.globl	_ZN6layoutIdE1iE        # @_ZN6layoutIdE1iE
	.p2align	2
_ZN6layoutIdE1iE:
	.zero	4

	.data
	.globl	_ZN6layoutIN4math6pack4dEE1iE # @_ZN6layoutIN4math6pack4dEE1iE
	.p2align	4
_ZN6layoutIN4math6pack4dEE1iE:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3

	.globl	_ZN6layoutIN4math6pack2dEE1iE # @_ZN6layoutIN4math6pack2dEE1iE
	.p2align	2
_ZN6layoutIN4math6pack2dEE1iE:
	.long	0                       # 0x0
	.long	1                       # 0x1

	.bss
	.globl	count                   # @count
	.p2align	2
count:
	.long	0                       # 0x0

	.section	.rdata,"dr"
.L.str:                                 # @.str
	.asciz	" tests passed.\n"

.L.str.1:                               # @.str.1
	.asciz	"ERROR test_pack:\n"

	.section	.rdata,"dr",discard,_ZTSN4math6scalarE
	.globl	_ZTSN4math6scalarE      # @_ZTSN4math6scalarE
_ZTSN4math6scalarE:
	.asciz	"N4math6scalarE"

	.section	.rdata,"dr"
.L.str.2:                               # @.str.2
	.asciz	" a;\n"

.L.str.3:                               # @.str.3
	.asciz	"a "

.L.str.4:                               # @.str.4
	.asciz	"\n"

.L.str.5:                               # @.str.5
	.asciz	"= "

.L.str.6:                               # @.str.6
	.asciz	"a"

.L.str.7:                               # @.str.7
	.asciz	": at index "

.L.str.8:                               # @.str.8
	.asciz	", expected "

.L.str.9:                               # @.str.9
	.asciz	", got "

.L.str.10:                              # @.str.10
	.asciz	" b;\n"

.L.str.11:                              # @.str.11
	.asciz	"b "

.L.str.12:                              # @.str.12
	.asciz	"a * b"

.L.str.13:                              # @.str.13
	.asciz	"a + b"

.L.str.14:                              # @.str.14
	.asciz	"a * b + c"

	.section	.rdata,"dr",discard,_ZTSN4math6pack2dE
	.globl	_ZTSN4math6pack2dE      # @_ZTSN4math6pack2dE
_ZTSN4math6pack2dE:
	.asciz	"N4math6pack2dE"

	.section	.rdata,"dr",discard,_ZTSN4math6pack4dE
	.globl	_ZTSN4math6pack4dE      # @_ZTSN4math6pack4dE
_ZTSN4math6pack4dE:
	.asciz	"N4math6pack4dE"

	.section	.rdata,"dr",discard,_ZTS1X
	.globl	_ZTS1X                  # @_ZTS1X
_ZTS1X:
	.asciz	"1X"

	.section	.rdata,"dr",discard,_ZTS1Y
	.globl	_ZTS1Y                  # @_ZTS1Y
_ZTS1Y:
	.asciz	"1Y"

	.section	.rdata,"dr",discard,_ZTS1N
	.globl	_ZTS1N                  # @_ZTS1N
_ZTS1N:
	.asciz	"1N"

	.section	.ctors,"dw"
	.p2align	3
	.quad	_GLOBAL__sub_I_test_math.cpp

