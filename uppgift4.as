<<<<<<< HEAD
// Adds fibonacci
	word L 13 //Antalet tal i fibonacciserien som som ska skrivas ut.
	word Fib 1 1 0 0 0 0 0 0 0 0 0 0 0

	// Compute start address
	loadc r0 Fib  // r0 = adressen Fib[0]
	
	// Compute where to stop
	loadc r7 Fib  // Start
	load r6 L     // L (Längden)
	add r6 r6 r6  // L + L = (Antalet bitar i Fib)
	add r7 r7 r6  // r7 = r7 + r6 
	addc r7 -4    // r7 = r7 - 4 (Slutpunkt)


Loop:	move r0 r1    // r1 = r0 (Address Fib[i])
	addc r1 2     // r1 = r0 + 2 (Adress Fib[i+1])
	move r0 r2    // r2 = r0 (Address Fib[i])
	addc r2 4     // r2 = r0 + 4 (Adress Fib[i+2]
	
	loadr r3 r0   // Laddar in Fib[i]
	loadr r4 r1   // Laddar in Fib[i+1])
	add r5 r3 r4  // Fib[i] + Fib[i+1] = Fib[1+2]
	storer r5 r2  // Fib[i+2] sparas i memory på rätt adress
	addc r0 2     // i++
	jumpn r7 Loop

	
	



	
	
=======
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
>>>>>>> 5516602403cbfe73d151a354897b7853a666ef65
