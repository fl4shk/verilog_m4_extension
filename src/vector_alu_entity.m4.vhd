include(src/util.m4)

define(<:ExtAdcInp:>,
	<:ExtStruct(
		Com(<:Data in 0:>),
		Memb(a, ExtUnsigned(<:$1:>)),

		Com(<:Data in 1:>),
		Memb(b, ExtUnsigned(<:$1:>)),

		Com(<:Carry in:>),
		Memb(carry, ExtStdLogic),
	):>)dnl
define(<:ExtAdcOutp:>,
	<:ExtStruct(
		Com(<:Data out:>),
		Memb(sum, ExtUnsigned(<:$1:>)),

		Com(<:Carry out:>),
		Memb(carry, ExtStdLogic),
	):>)dnl

define(<:ExtAluInp_Op:>, <:ExtUnsigned(2 - 1 downto 0):>)dnl


define(<:ExtAluInp:>,
	<:ExtStruct(
		Memb(data, ExtAdcInp(<:$1:>)),
		Memb(op, ExtAluInp_Op),
	):>)dnl

define(<:ExtAluOutp:>, <:ExtAdcOutp($@):>)dnl

define(<:ExtVectorAluInp:>,
	<:ExtStruct(
		Memb(data, ExtArray(<:$1:>, ExtAdcInp(<:$2:>)):>),
		Memb(op, ExtAluInp_Op),
	):>)dnl
define(<:ExtVectorAluOutp:>,
	<:ExtArray(<:$1:>, ExtAluOutp(shift($@))):>)dnl

indir(<:define:>, <:w2r:>, <:<:$1:> - 1 downto 0:>)dnl
indir(<:define:>, <:as2r:>, <:0 to <:$1:> - 1:>)dnl

define(<:SomeVectorAluInp:>, ExtVectorAluInp(0 to ARR_SIZE - 1,
	WIDTH - 1 downto 0))

_BuildType(SomeVectorAluInp)

_For(<:_I:>, 0, _Tables_FuncGetCurr(bt), <:
_I():
_Tables_FuncGetElem(type,_I(),type)
_Tables_FuncGetElem(type,_I(),id)
_Tables_FuncGetElem(type,_I(),subtype)

:>)


--library ieee;
--use ieee.STD_LOGIC_1164.all;
--use ieee.NUMERIC_STD.all;
--
--entity alu is
--	generic
--	(
--		constant WIDTH: natural := 8
--	);
--	port
--	(
--	);
--end entity;
