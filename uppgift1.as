        word pattern 0xff	// pattern = ff
		
        load  r0 pattern       // Laddar in mönstret i registret (r0).
	store r0 0xee	// Sparar bit pattern från r0 (ff) i adress ee
	store r1 0xee	// Sparar bit pattern från r1 (00) i adress ee
	store r0 0xec
	store r1 0xec
	store r0 0xea
	store r1 0xea
	store r0 0xe8
	store r1 0xe8
	store r0 0xe6
	store r1 0xe6
	store r0 0xe4
	store r1 0xe4
	store r0 0xe6
	store r1 0xe6
	store r0 0xe8
	store r1 0xe8
	store r0 0xea
	store r1 0xea
	store r0 0xec
	store r1 0xec
	store r0 0xee
	