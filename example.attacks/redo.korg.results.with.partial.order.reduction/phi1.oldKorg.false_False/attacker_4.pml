/* spin -t4 -s -r -p -g phi1.oldKorg.false_daisy_check.pml */
active proctype attacker() {
	
	NtoA ! ACK;
	NtoB ! SYN;
	BtoN ? SYN_ACK;
	NtoB ! ACK;
	BtoN ? FIN;
	NtoB ! ACK;
	NtoB ! FIN;
	BtoN ? ACK;
	NtoB ! SYN;
	NtoB ! ACK;
	NtoB ! ACK;
	// Acceptance Cycle part of attack
}