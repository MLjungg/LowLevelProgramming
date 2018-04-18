	word far 73 //Input (Grader Fahrenheit)
	word cel //Svar (Grader Celcius)
	load r1 far //r1 = input
	
	loadc r6 32 //32 behövs i formel
	sub r1 r1 r6 // (Input - 32)
	
	//Antal steg som behöver shiftas
	loadc r7 1 //1 steg höger
	loadc r8 4 //4 steg höger

	//shifta för approximering
	shift r2 r1 r7 //r2 = r1/2
	shift r3 r1 r8 //r3 = r1/16
	add r4 r2 r3 //r4 = r2 + r3
	addc r4 1 //Addera ett för att minimera ”absolutfel”
	store r4 cel