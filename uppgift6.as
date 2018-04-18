	word input 3
	word output
	loadc r7 output	//Sparar undan adressen till output i r7

	//Beräknar resten
	load r1 input	//r1= input-value
	loadc r2 2	//r2=2
modulo:	move r1 r9 	//Resten sparas i r9	
subloop: sub r9 r9 r2	//Subtraherar input-value med 2 (görs upprepade gng)
	loadc r0 0	//r0=0
	jumpl r9 rest	//När r9 är negativ (mindre än r0 (0)) hoppa till rest
	jump subloop	//Om r9 inte är negativ fortsätt subtrahera med 2.

rest:	add r9 r9 r2	//När r9 är negativ addera 2 för att ta fram rest
	
	jumpe r9 jamn 	//Om r9 (resten) är 0 (jämn) hoppa till jämn-loop annars fortsätt.

	//Ojämn beräknar 3ai+1 
	loadc r3 3
	mul r1 r1 r3	//3ai
	addc r1 1	//3ai+1
	storer r1 r7	//Sparar det beräknade värdet i memory
	addc r7 2 	//Beräknar ny outputadress
	jump modulo
	
	//Jämn loop
jamn:	loadc r8 1	
	loadc r0 1	//Utifall vi är på 1 -> avbryt	
	shift r1 r1 r8 	//Halverar
	storer r1 r7
	addc r7 2	//Beräknar ny outputadress	
	jumpn r1 modulo
	halt

