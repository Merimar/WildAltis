Take:
- Item in Uniform aufnehmen (Action: Take Count: 1)
- Item in Weste aufnehmen (Action: Take Count: 1)
- Item in Rucksack aufnehmen (Action: Take Count: 1)
- Item in AssignedItems aufnehmen (Action: Take Count: 1)
- Item auf die Waffe aufnehmen (Action: Take Count: 1)

- Uniform aufnehmen (Action: Take Count: 1)
- Weste aufnehmen (Action: Take Count: 1)
- Rucksack aufnehmen (Action: Take Count: 1)
- Helm aufnehmen (Action: Take Count: 1)
- Brille aufnehmen (Action: Take Count: 1)
- Waffe aufnehmen (Action: Take Count: 1/2)

Put:
- Item aus Uniform ablegen (Action: Put Count: 1)
- Item aus Weste ablegen (Action: Put Count: 1)
- Item aus Rucksack ablegen (Action: Put Count: 1)
- Item aus AssignedItems ablegen (Action: Put Count: 1)
- Item von der Waffe ablegen (Action: Put Count: 1)

- Uniform ablegen (Action: Put Count: 1/3)
- Weste ablegen (Action: Put Count: 1/3)
- Rucksack ablegen (Action: Put Count: 1/3)
- Waffe ablegen (Action: Put Count: 1/2)
- Helm ablegen (Action: Put Count: 1)
- Brille ablegen (Action: Put Count: 1)

Switched:

- Item aus Uniform nach Weste/Rucksack (Action: Put Count: 2)
- Item aus Weste nach Uniform/Rucksack (Action: Put Count: 2)
- Item aus Rucksack nach Uniform/Weste (Action: Put Count: 2)

- Kleidung aus Rucksack/Weste anziehen  (Action: Take Count: 2)
- Weste aus Rucksack anziehen  (Action: Take Count: 2)

- Helm/Brille aus Kleidung auf Helm/Brille Slot (Action: Take Count: 2)
- Helm/Brille von Helm/Brille Slot in Kleidung (Action: Put Count: 2)

- AssignedItem in Kleidung ablegen (Action: Put Count: 2)
- AssignedItem in Kleidung aufnehmen (Action: Take Count: 2)

- Waffe in Rucksack/Weste ablegen/aufnehmen (Action: Put Count: 3)
- Items von Waffe in Uniform/Weste/Rucksack ablegen/aufnehmen (Action: Put Count: 2)

Changed:

	Von Boden:
		- Uniform mit einer Uniform tauschen
		- Weste mit einer Weste tauschen
		- Rucksack mit einem Rucksack tauschen
		
		- Waffe vom Boden aus tauschen
		- Attachment von Boden mit Attachment von Waffe tauschen
		
		- Helm/Brile mit Helm/Brille tauschen
		- Assigned Items tauschen
		
	Aus Inventar:
		- Uniform mit Uniform aus Kleidung tauschen (Action: Take Count: 0/2)
		- Weste mit Weste aus Kleidung tauschen (Action: Take Count: 0/2)
		- Helm/Brile mit Helm/Brille tauschen (Action: Take Count: 2)
		- Waffe mit Waffe aus Kleidung tauschen (Action: Take Count: 1/2/3/4)
		- Attachment mit Attachment aus Kleidung tauschen
		- Assigned Items tauschen
		