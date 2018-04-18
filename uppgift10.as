	//input
	word xone 0xfd
	word xzero 0xfe 
	word yone 0x09
	word yzero  0x07
	
	//output
	word zone
	word zzero

	//Ladda x0, y0, x1, y1 i varsitt register
	load r1 xzero
	load r2 yzero	
	load r3 xone
	load r4 yone
	
	
	add r5 r1 r2 // r5 = z0 = x0 + y0
	
	//Jämför om x0 eller y0 är större än x0+y0,
	//om så är fallet —> Carry
	//Alltså har vi skapat en ”carry flag”.
	move r1 r0
	jumpl r5 Carry //Om r5(x0+y0) < r1(x0): Carry+=1
	move r2 r0
	jumpl r5 Carry //Om r5(x0+y0) < r2(y0) : Carry+=1

	//z1 = x1 + y1 (+carry)
Next:	add r6 r3 r4 // r6 = x1 + y1
	add r6 r6 r7 //Adderar eventuell carry

	//Sparar z1z0 i minne
	store r5 zzero
	store r6 zone	

	halt

Carry:	addc r7 1
	jump Next //Fortsätter till nästa addition (y1 + y0)
	