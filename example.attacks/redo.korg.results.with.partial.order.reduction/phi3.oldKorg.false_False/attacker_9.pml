/* spin -t9 -s -r -p -g phi3.oldKorg.false_daisy_check.pml */
active proctype attacker() {
	
	NtoA ! SYN;
	NtoB ! SYN;
	AtoN ? SYN_ACK;
	BtoN ? SYN_ACK;
	NtoA ! FIN;
	NtoB ! SYN_ACK;
	// Acceptance Cycle part of attack
}