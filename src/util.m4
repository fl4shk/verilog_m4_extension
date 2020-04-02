changecom(/*,*/)dnl
changequote(<:,:>)dnl
define(<:_For:>,<:ifelse($#,0,<:<:$0:>:>,<:ifelse(eval($2<=$3),1,
<:pushdef(<:$1:>,$2)$4<::>popdef(<:$1:>)$0(<:$1:>,incr($2),$3,<:$4:>):>):>):>)dnl
dnl
define(<:_Foreach:>,<:ifelse(eval($#>2),1,
<:pushdef(<:_Last_$1:>,eval($#==3))dnl
<::>pushdef(<:$1:>,<:$3:>)$2<::>popdef(<:$1:>)dnl
<::>popdef(<:_Last_$1:>)dnl
<::>ifelse(eval($#>3),1,<:$0(<:$1:>,<:$2:>,shift(shift(shift($@)))):>):>):>)dnl
dnl
define(<:_While:>,<:ifelse($#,0,<:<:$0:>:>,eval($1+0),1,<:$2<::>$0($@):>):>)dnl
define(<:_List:>, <:$@:>)dnl
define(<:_Antishift:>, <:ifelse($#, 0, <::>, $#, 1, <::>, $#, 2, <:$1:>, <:_List(<:$1:>,$0(shift($@))):>):>)dnl
define(<:_LastListItem:>, <:ifelse($#, 0, <::>, $#, 1, <:$1:>, <:$0(shift($@)):>):>)dnl
define(<:_MultiShift:>, <:ifelse(<:$1:>, 0, <:shift($@):>, <:$1:>, 1, <:shift(shift($@)):>, <:_List($0(decr(<:$1:>), shift(shift($@)))):>):>)dnl
define(<:_FirstOf:>, <:ifelse(<:$1:>, 0, <::>, <:$1:>, 1, <:$2:>, <:_List(<:$2:>, $0(decr(<:$1:>), shift(shift($@)))):>):>)dnl
dnl for shell scripts
define(<:Stringify:>, <:ifelse($#, 0, <::>, $#, 1, <:'$1':>, <:_List($0(<:$1:>), $0(shift($@))):>):>)
dnl
define(<:_Cat:>, <:ifelse($#, 0, <::>, $#, 1, <:$1:>, $#, 2, <:$1$2:>, <:$0(_FirstOf(2, $@))$0(_MultiShift(2, $@)):>):>)dnl
define(<:_IndCat:>, <:ifelse($#, 0, <::>, $#, 1, <:$1:>, $#, 2, <:$1[$2]:>,
	<:$0($0(<:$1:>, <:$2:>), _MultiShift(2, $@)):>):>)dnl
define(<:_ScoCat:>, <:ifelse($#, 0, <::>, $#, 1, <:$1:>, $#, 2, <:$1::$2:>,
	<:$0($0(<:$1:>, <:$2:>), _MultiShift(2, $@)):>):>)dnl
define(<:_AccCat:>, <:ifelse($#, 0, <::>, $#, 1, <:$1:>, $#, 2, <:$1.$2:>,
	<:$0($0(<:$1:>, <:$2:>), _MultiShift(2, $@)):>):>)dnl
define(<:_Incr:>, <:define(<:$1:>, incr(<:$1:>)):>)dnl
define(<:_Decr:>, <:define(<:$1:>, decr(<:$1:>)):>)dnl
dnl
dnl
define(<:ExtStruct:>, <:_List(<:__EXT_STRUCT_BEGIN__:>, $@, <:__EXT_STRUCT_END__:>):>)dnl
define(<:Memb:>, <:_List(<:__EXT_MEMBER_BEGIN__:>, $@, <:__EXT_MEMBER_END__:>):>)dnl
define(<:Com:>, <:_List(<:__EXT_COMMENT_BEGIN__:>, $@, <:__EXT_COMMENT_END__:>):>)dnl
define(<:ExtStdLogic:>, <:__EXT_STD_LOGIC__:>)dnl
define(<:ExtUnsigned:>, <:_List(<:__EXT_UNSIGNED_BEGIN__:>, $@, <:__EXT_UNSIGNED_END__:>):>)dnl
define(<:ExtSigned:>, <:_List(<:__EXT_SIGNED_BEGIN__:>, $@, <:__EXT_SIGNED_END__:>):>)dnl
define(<:ExtInteger:>, <:__EXT_INTEGER__:>)dnl
define(<:ExtNatural:>, <:__EXT_NATURAL__:>)dnl
define(<:ExtArray:>, <:_List(<:__EXT_ARRAY_BEGIN__:>, $@, <:__EXT_ARRAY_END__:>):>)dnl
dnl
define(<:_Convert:>, <:syscmd(<:../convert.py Stringify($@):>):>)dnl
define(<:ExtPort:>, <:_Convert(_List(<:__EXT_PORT_BEGIN__:>, $@, <:__EXT_PORT_END__:>)):>)dnl
define(<:ExtSigPort:>, <:_Convert(_List(<:__EXT_SIG_PORT_BEGIN__:>, $@, <:__EXT_SIG_PORT_END__:>)):>)dnl
define(<:ExtVarPort:>, <:_Convert(_List(<:__EXT_VAR_PORT_BEGIN__:>, $@, <:__EXT_VAR_PORT_END__:>)):>)dnl
define(<:ExtSig:>, <:_Convert(_List(<:__EXT_SIG_BEGIN__:>, $@, <:__EXT_SIG_END__:>)):>)dnl
define(<:ExtVar:>, <:_Convert(_List(<:__EXT_VAR_BEGIN__:>, $@, <:__EXT_VAR_END__:>)):>)dnl
define(<:ExtMap:>, <:_Convert(_List(<:__EXT_MAP_BEGIN__:>, $@, <:__EXT_MAP_END__:>)):>)dnl
define(<:ExtDefVhdlTypes:>, <:_Convert(_List(<:__EXT_DEF_VHDL_TYPES_BEGIN__:>, $@, <:__EXT_DEF_VHDL_TYPES_END__:>)):>)dnl
define(<:mbr:>, <:ifelse($#, 0, <::>, $#, 1, <:$1:>, $#, 2, <:_Cat(<:$1:>, <:_:>, <:$2:>):>, <:$0($0(<:$1:>, <:$2:>), shift(shift($@))):>):>)dnl
dnl
dnl
dnl define(<:_Stacks_Str:>, <:_IndCat(__stacks__,$@):>)dnl
dnl define(<:_Stacks_StrList:>, <:_Stacks_Str(list,$@):>)dnl
dnl define(<:_Stacks_StrTop:>, <:_Stacks_Str(top,<:$1:>):>)dnl
dnl define(<:_Stacks_FuncInit:>, <:define(_Stacks_StrTop(<:$1:>), -1):>)dnl
dnl define(<:_Stacks_FuncGetTop:>, <:defn(_Stacks_StrTop(<:$1:>)):>)dnl
dnl define(<:_Stacks_StrGetTopElem:>, <:_Stacks_StrList(<:$1:>,_Stacks_FuncGetTop(<:$1:>)):>)dnl
dnl dnl
dnl define(<:_Stacks_FuncPush:>, <:define(<:_Void:>,
dnl 	_Incr(_Stacks_StrTop(<:$1:>))
dnl 	define(_Stacks_StrGetTopElem(<:$1:>), <:$2:>)
dnl 	):>)dnl
dnl define(<:_Stacks_FuncPop:>, <:_Decr(_Stacks_StrTop(<:$1:>)):>)dnl
dnl dnl
dnl dnl
dnl define(<:_Tables_Str:>, <:_IndCat(__tables__,$@):>)dnl
dnl define(<:_Tables_StrList:>, <:_Tables_Str(<:$1:>,list,shift($@)):>)dnl
dnl define(<:_Tables_StrNext:>, <:_Tables_Str(<:$1:>,next):>)dnl
dnl define(<:_Tables_FuncInit:>, <:define(_Tables_StrNext(<:$1:>), 0):>)dnl
dnl define(<:_Tables_FuncGetNext:>, <:defn(_Tables_StrNext(<:$1:>)):>)dnl
dnl define(<:_Tables_FuncGetCurr:>, <:eval(_Tables_FuncGetNext(<:$1:>) - 1):>)dnl
dnl define(<:_Tables_StrElemNext:>, <:_Tables_StrList(<:$1:>,_Tables_FuncGetNext(<:$1:>),shift($@)):>)dnl
dnl define(<:_Tables_FuncGetElem:>, <:_Tables_StrList($@):>)dnl
dnl define(<:_Tables_FuncAppendElem:>, <:define(<:_Void:>,
dnl 	$1(shift($@))
dnl 	_Incr(_Tables_StrNext(<:$2:>))
dnl 	):>)dnl
dnl dnl
dnl dnl
dnl define(<:_BuildType_Inner_StdLogic_MetaFunc:>, <:define(<:_Void:>,
dnl 	define(_Tables_StrElemNext(<:$1:>,type), type)
dnl 	define(_Tables_StrElemNext(<:$1:>,subtype), std_logic)
dnl 	):>)dnl
dnl define(<:_BuildType_Inner_StdLogic:>, <:define(<:_Void:>,
dnl 	_Tables_MetaFuncAppendElem(<:_BuildType_Inner_StdLogic_MetaFunc:>,
dnl 		<:$1:>,)
dnl 	):>)dnl
dnl dnl
dnl dnl
dnl define(<:_BuildType_Inner:>, <:eval(
dnl 	ifelse(
dnl 		<:$2:>, __EXT_STRUCT_BEGIN__
dnl 		<:_BuildType_Inner_Struct($@):>,
dnl 
dnl 		<:$2:>, __EXT_STD_LOGIC__,
dnl 		<:_BuildType_Inner_StdLogic($@):>,
dnl 
dnl 		<:$2:>, __EXT_UNSIGNED_BEGIN__,
dnl 		<:_BuildType_Inner_UnsgnOrSgn($@):>,
dnl 
dnl 		<:$2:>, __EXT_SIGNED_BEGIN__,
dnl 		<:_BuildType_Inner_UnsgnOrSgn($@):>,
dnl 
dnl 		<:$2:>, __EXT_INTEGER__,
dnl 		<:_BuildType_Inner_IntOrNat($@):>,
dnl 
dnl 		<:$2:>, __EXT_NATURAL__,
dnl 		<:_BuildType_Inner_IntOrNat($@):>,
dnl 
dnl 		<:$2:>, __EXT_ARRAY_BEGIN__,
dnl 		<:_BuildType_Inner_Array($@):>,
dnl 
dnl 		<:-1:>
dnl 	)
dnl 	):>)dnl
dnl dnl
dnl dnl
dnl dnl
dnl define(<:_BuildType:>, <:eval(define(<:_Void:>,
dnl 	_Stacks_FuncInit(type)
dnl 	_Tables_FuncInit(type)
dnl 	_Foreach(<:_One:>,
dnl 		<:define(_Tables_StrElemNext(type,count,_One()), 0):>,
dnl 		struct, std_logic, unsigned, signed, integer, natural, array)
dnl 	)_BuildType_Inner($@)):>)dnl
