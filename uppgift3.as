        word multiplicationFactor 0x03	// multiplication = 3
	word lengthArray 7		// Length of array  
	word array 1 2 3 4 5 6 7	// En array [x0,x7]
	
	//compute start adress of array
        loadc r0 array       // r0 = memory location of first index in array

	//Store how many indexes in array
	load r9 lengthArray   // r9 = 7

	// compute end adress
	add r2 r9 r9	//r2 = How many steps between start and end adress
	add r1 r0 r2	//r1 = First adress after array
	
	// Store multiplier
	load r8 multiplicationFactor //r8 = 3

	//loop
Loop:	loadr r3 r0 //Loads the value of array 1 and place in r3
	mul r4 r3 r8 //multiplies value in list with mul.factor and saves in r4
	storer r4 r0 //Stores output in the input address
	addc r0 2 //Move the startadress by 2
	jumpn r1 Loop //When startadress is equal to first adress of array the programs 			halts

	