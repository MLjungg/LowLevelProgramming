	word lenArray 9
	word array 1 2 3 4 5 6 7 8 9
	
	//Compute start adress
	loadc r1 array 		//r1 = start adress of array
	
	//Compute end adress
	load r0 lenArray 	//r0 = Length of array
	add r0 r0 r0 		//r0 = amount of steps til last adress of array
	add r0 r1 r0 		//r0 = Two steps to far
	addc r0 -2		//r0 = End adress

	//Swap loop
Loop:	loadr r2 r0		//r2 = value from the the adress stored in r0.
	loadr r3 r1
	storer r2 r1		// Swaps the values
	storer r3 r0
	addc r0 -2		//Sub two to start adress
	addc r1 2		//Adds 	 - || -
	jumpl r1 Loop