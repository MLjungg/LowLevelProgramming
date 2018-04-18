	word input 15 //Siffra att räkna
	word right 7 //Steps right
	word end -8


	load r1 input // Valt tal

//Where to stop
	load r5 right //Steg att hoppa till höger
	load r8 end //r8 = -8

	//Beräknas ettor
Loop:	move r1 r2
	shift r2 r2 r0 //shifta r1 r0 steg och spara i r2
	shift r2 r2 r5 //shifta r2 7 steg till höger och spara i r2
	sub r3 r3 r2
	addc r0 -1
	jumpn r8 Loop //Fortsätt tills r0 = -8

	//Konverterar till positivt
//	move r3 r0 //Kopiera r3 i r0
//Lop:	addc r0 1 //addera 1 till r0
//	addc r4 1 //addera 1 till r4
//	jumpn r9 Lop //Kör tills r0 = 0 (Då r0 = 0 har vi rätt antal ettor)


