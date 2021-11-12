/* spin -t6 -s -r -p -g TCP.2_daisy_check.pml */
active proctype attacker() {
	
	if
	:: NtoB ! SYN;
	fi unless timeout;
	if
	:: BtoN ? SYN;
	fi unless timeout;
	if
	:: BtoN ? ACK;
	fi unless timeout;
	if
	:: NtoB ! ACK;
	fi unless timeout;
	if
	:: NtoB ! ACK;
	fi unless timeout;
	if
	:: NtoB ! FIN;
	fi unless timeout;
// recovery to N
// N begins here ... 

	do
	:: AtoN ? SYN -> 
		if
		:: NtoB ! SYN;
		fi unless timeout;
	:: BtoN ? SYN -> 
		if
		:: NtoA ! SYN;
		fi unless timeout;
	:: AtoN ? FIN -> 
		if
		:: NtoB ! FIN;
		fi unless timeout;
	:: BtoN ? FIN -> 
		if
		:: NtoA ! FIN;
		fi unless timeout;
	:: AtoN ? ACK -> 
		if
		:: NtoB ! ACK;
		fi unless timeout;
	:: BtoN ? ACK -> 
		if
		:: NtoA ! ACK;
		fi unless timeout;
	:: _nr_pr < 3 -> break;
	od
end:

}