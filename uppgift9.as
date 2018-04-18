	word right 7 		 //Steg att shifta höger
	word shiftLimit -8 	//Gräns för hur långt som ska shiftas vänster
	word finalend 200 	//Antal bytes som ska beräknas
	
	//Output
	word cone 0xd0
	word czero 0xd2

	//Laddar in word i registret
	load rb shiftLimit 
	load rc finalend

	//laddar in outputadresserna i register
	load rd czero
	load re cone
	
Loop2:	
	//Sparar antal ettor i c1c0
	storer r4 rd
	storer r5 re

	loadr r2 r1 	//Laddar in värdet i adressen (i r1) som ska beräknas	
	loadc r9 0 	//antalet steg som ska shiftas vänster
	
	//Shiftar talet för att isolera eventuella ettor
Loop:	move r2 r3
	shift r3 r3 r9
	shift r3 r3 ra 	//r3 = värdet av den sökta biten (1/0)
	
	//Kollar om carry uppstår
	loadc r0 0xff
	jumpn r4 Next 	//Hoppar till Next om antalet ettor inte är ff
	jumpe r3 Carry //Hoppar till carry om vi har en etta (Och föregående gäller)

Next:	sub r4 r4 r3 	//Adderar etta på totalen

AC:	addc r9 -1 	//Ändra shiftvillkor (ett extra steg till vänster)
	move r9 r0 
	
	jumpn rb Loop	 //När r0=rb är alla bitar kontrollerade (annars jump Loop)

	move r1 r0 	// Sparar nuvarande adress i r0
	jumpe rc done 	//Om adressen är samma som ”finalend” —> halt
	
	addc r1 2 	//Addera två till adress för att ta fram nästkommande ord.
	jump Loop2
	
done:	halt

Carry:	addc r5 1	//Lägger till en etta i ”c1”
	loadc r4 0 	//Nollställer antalet ettor i ”c0”
	jump AC

