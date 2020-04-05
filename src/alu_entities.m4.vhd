include(src/util.m4)

define(<:ExtAluInpData:>,
	<:ExtStruct(
		Com(<:Data in 0:>),
		Memb(a, ExtUnsigned(<:$1:>)),

		Com(<:Data in 1:>),
		Memb(b, ExtUnsigned(<:$1:>)),

		Com(<:Carry in:>),
		Memb(carry, ExtStdLogic),
	):>)dnl

indir(<:define:>, <:ExtAluInpOp_WIDTH:>, 2)dnl
indir(<:define:>, <:ExtAluInpOp_RANGE:>, <:w2r(ExtAluInpOp_WIDTH):>)dnl
define(<:ExtAluInpOp:>, <:ExtUnsigned(ExtAluInpOp_RANGE):>)dnl

define(<:ExtAluInp:>,
	<:ExtStruct(
		Com(<:Data:>),
		Memb(data, ExtAluInpData(<:$1:>)),

		Com(<:Opcode:>),
		Memb(op, ExtAluInpOp)
	):>)dnl

define(<:ExtAluOutp:>,
	<:ExtStruct(
		Com(<:Data out:>),
		Memb(result, ExtUnsigned(<:$1:>)),

		Com(<:Carry out:>),
		Memb(carry, ExtStdLogic),
	):>)dnl


library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

package alu_pkg is
	ExtEnum(ExtAluInp_Op_WIDTH,
		OP_ADD, OP_ADC, OP_SUB, OP_SBC)
end package;



library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

use work.alu_pkg.all;

entity alu is
	generic
	(
		constant WIDTH: natural := 8
	);
	port
	(
		ExtPort(p_inp, in, ExtAluInp(WIDTH));
		ExtPort(p_outp, out, ExtAluOutp(WIDTH))
	);
end entity;

architecture behav of alu is
	ExtCreateVhdlTypes(p_inp, ExtAluInp(WIDTH));
	ExtSig(inp, p_inp, ExtAluInp(WIDTH));

	ExtCreateVhdlTypes(p_outp, ExtAluOutp(WIDTH));
	ExtSig(outp, p_outp, ExtAluOutp(WIDTH));
begin
	everything:
	process(all) is
		variable temp_sum: Unsigned(WIDTH + 1);
	begin
		case inp.op is
		--------
		when OP_ADD =>
		when OP_ADC =>
		when OP_SUB =>
		when OP_SBC =>
		when others =>
			null;
		--------
		end case;

		outp.result
	end process;
end architecture;
