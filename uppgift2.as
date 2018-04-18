	loadc r7 kodlangd 	//Laddar konstant, motsvarar kodens längd -4
	addc r7 4		//r7 = kodens längd
	add r0 r0 r7	//r0 = Håller reda på var nästa loop startar (+kodlängd varje varv)

			//r5 pekar på det som ska kopieras. 00 första loopen.
loop:	loadr r1 r5	//Sparar det som ska kopieras i registret
	move r5 r6	//Sparar startadressen I slutadressen
	add r6 r6 r7	//Beräkna store-adress (kopieringsadress + längden på koden)
	storer r1 r6	//Sparar kopian i memory (plats r6)
	addc r5 2	//lägger till 2 på startadress (flyttar två steg framåt)
adress:	jumpn r5 loop	//När startadressen=längden på koden har vi kopierat allting ett varv
	
	loadc r8 loop	//Laddar r8 med loop adress
	add r8 r8 r0	//Adderar kodlängden till r8 för att beräkna ny jump-adress
	addc r8 1	//Ty jumpn behöver jumpadress+1
	loadc r9 adress	//Sparar gammal jump-adress I r9
	addc r9 2	//beräknar på vilken plats som den nya jump-adressen ska sparas i (f5 x x)
	add r9 r9 r0

kodlangd: storer r8 r9 	//Placerar den nya jumpadressen i jump-instruktionen (f5 2 2)