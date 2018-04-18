	loadc ra 0xe0	 //Startadress
	
	loadc r5 -1 	//När r5 är 1 rör den sig uppåt, -1 rör den sig neråt
	loadc r6 1 	//När r6 är 1 rör sig till höger, -1 rör sig till vänster

	addc rb 0x01 	//Lägger en etta (Kommer vara boll) i rb

	loadc r7 -1	//För att kunna ändra riktning
	loadc r1 0x11  //För att kolla höger/vänster
	loadc r3 0xfe

	jump Main

	//Neråt
down:	addc ra 16 //addera 16 på address
	jumpe r6 right //om r0 = r6 —> hoppa höger
	jump left

	//Uppåt
up:	addc ra -16
	jumpe r6 right
	jump left	

	//Höger
right:	jumpe rb ar  //Word byte

	loadc rb 0x01
	jump Main	

ar:	addc ra 2
 	loadc rb 0x10
	jump Main

	//Vänster
left:	jumpe rb al  //Icke word byte

	loadc rb 0x01
	addc ra -2 
	jump Main

al:	loadc rb 0x10

Main:
	storer rb ra	//Placerar bollen på given startaddress

	move ra r9	//Sparar gammal bolladress (För att sen kunna radera gammal boll)
	
	//Check om spelet ska avslutas
	loadc r0 13 //13 varv innan bollen nått kritisk linje på andra sidan.
	jumpe r2 halt
	
saved:	addc r2 1 //Lägg till 1 på ”varv”
	loadc r0 0xdf	//Up boundary
	jumple ra dir

	loadc r0 0xf0	//Down boundary
	jumple	ra player
	mul r5 r5 r7

player:	loadc r0 17
	loadr r4 ra
	jumpn r4 exec 
	mul r6 r6 r7
	
exec:	storer r8 r9	//Tar bort gammal boll
	loadc r0 1
	jumpe r5 up
 	jump down

dir: 
	mul r5 r5 r7
	jump player

halt:	loadr r0 ra //Värdet sparat på nuvarande adress (Om både boll och ”spelare” är värdet 0x11)
	loadc r2 0 //Nollställ varvräknare
	jumpe r1 saved //Om värdet är 0x11 är boll räddad och spelet kan fortsätta, annars halt
	halt
	
