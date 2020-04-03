extCommand:
	extPort
	| extSigPort
	| extVarPort

	| extSig
	| extAssignSplitToSig
	| extAssignSigToSplit

	| extVar
	| extAssignSplitToVar
	| extAssignVarToSplit

	| extMap

	| extDefVhdlTypes
	;
extStruct:
	KwExtStructBegin
		extStruct_ComAndMemb+
	KwExtStructEnd
	;
extStruct_ComAndMemb:
	extCom? extMemb
	;

extCom:
	KwExtCommentBegin
		identOrOtherList
	KwExtCommentEnd
	;

extMemb:
	KwExtMemberBegin
		MiscIdent extTypename
	KwExtMemberEnd
	;

extStdLogic:
	KwExtStdLogic
	;

extUnsigned:
	KwExtUnsignedBegin
		identOrOtherList
	KwExtUnsignedEnd
	;

extSigned:
	KwExtSignedBegin
		identOrOtherList
	KwExtSignedEnd
	;

extInteger:
	KwExtInteger
	;
extNatural:
	KwExtNatural
	;
extArray:
	KwExtArrayBegin
		identOrOtherList extTypename
	KwExtArrayEnd
	;

extTypename:
	extStruct
	| extStdLogic
	| extUnsigned
	| extSigned
	| extInteger
	| extNatural
	| extArray
	;

extPort:
	KwExtPortBegin
		MiscIdent KwPortDir extTypename
	KwExtPortEnd
	;
extSigPort:
	KwExtSigPortBegin
		MiscIdent KwPortDir extTypename
	KwExtSigPortEnd
	;
extVarPort:
	KwExtVarPortBegin
		MiscIdent KwPortDir extTypename
	KwExtVarPortEnd
	;

extSig:
	KwExtSigBegin
		MiscIdent extTypename
	KwExtSigEnd
	;
extAssignSplitToSig:
	KwExtAssignSplitToSigBegin
		MiscIdent MiscIdent extTypename
	KwExtAssignSplitToSigEnd
	;
extAssignSigToSplit:
	KwExtAssignSigToSplitBegin
		MiscIdent MiscIdent extTypename
	KwExtAssignSigToSplitEnd
	;

extVar:
	KwExtVarBegin
		MiscIdent extTypename
	KwExtVarEnd
	;
extAssignSplitToVar:
	KwExtAssignSplitToVarBegin
		MiscIdent MiscIdent extTypename
	KwExtAssignSplitToVarEnd
	;
extAssignVarToSplit:
	KwExtAssignVarToSplitBegin
		MiscIdent MiscIdent extTypename
	KwExtAssignVarToSplitEnd
	;

extMap:
	KwExtMapBegin
		identOrOtherList identOrOtherList extTypename
	KwExtMapEnd
	;

extDefVhdlTypes:
	KwExtDefVhdlTypesBegin
		MiscIdent extTypename
	KwExtDefVhdlTypesEnd
	;



identOrOther:
	MiscIdent | MiscOther
	;
identOrOtherList:
	identOrOther+
	;


KwExtStructBegin: '__EXT_STRUCT_BEGIN__' ;
KwExtStructEnd: '__EXT_STRUCT_BEGIN__' ;
KwExtCommentBegin: '__EXT_COMMENT_BEGIN__' ;
KwExtCommentEnd: '__EXT_COMMENT_END__' ;
KwExtMemberBegin: '__EXT_MEMBER_BEGIN__' ;
KwExtMemberEnd: '__EXT_MEMBER_END__' ;

KwExtStdLogic: '__EXT_STD_LOGIC__' ;
KwExtUnsignedBegin: '__EXT_UNSIGNED_BEGIN__' ;
KwExtUnsignedEnd: '__EXT_UNSIGNED_END__' ;
KwExtSignedBegin: '__EXT_SIGNED_BEGIN__' ;
KwExtSignedEnd: '__EXT_SIGNED_END__' ;

KwExtInteger: '__EXT_INTEGER__' ;
KwExtNatural: '__EXT_NATURAL__' ;

KwExtArrayBegin: '__EXT_ARRAY_BEGIN__' ;
KwExtArrayEnd: '__EXT_ARRAY_END__' ;

KwExtPortBegin: '__EXT_PORT_BEGIN__' ;
KwExtPortEnd: '__EXT_PORT_END__' ;
KwExtSigPortBegin: '__EXT_SIG_PORT_BEGIN__' ;
KwExtSigPortEnd: '__EXT_SIG_PORT_END__' ;
KwExtVarPortBegin: '__EXT_VAR_PORT_BEGIN__' ;
KwExtVarPortEnd: '__EXT_VAR_PORT_END__' ;

KwPortDir: 'in' | 'IN' | 'out' | 'OUT' | 'inout' | 'INOUT' ;

KwExtSigBegin: '__EXT_SIG_BEGIN__' ;
KwExtSigEnd: '__EXT_SIG_END__' ;
KwExtAssignSplitToSigBegin: '__EXT_ASSIGN_SPLIT_TO_SIG_BEGIN__' ;
KwExtAssignSplitToSigEnd: '__EXT_ASSIGN_SPLIT_TO_SIG_END__' ;
KwExtAssignSigToSplitBegin: '__EXT_ASSIGN_SIG_TO_SPLIT_BEGIN__' ;
KwExtAssignSigToSplitEnd: '__EXT_ASSIGN_SIG_TO_SPLIT_END__' ;

KwExtVarBegin: '__EXT_VAR_BEGIN__' ;
KwExtVarEnd: '__EXT_VAR_END__' ;
KwExtAssignSplitToVarBegin: '__EXT_ASSIGN_SPLIT_TO_VAR_BEGIN__' ;
KwExtAssignSplitToVarEnd: '__EXT_ASSIGN_SPLIT_TO_VAR_END__' ;
KwExtAssignVarToSplitBegin: '__EXT_ASSIGN_VAR_TO_SPLIT_BEGIN__' ;
KwExtAssignVarToSplitEnd: '__EXT_ASSIGN_VAR_TO_SPLIT_END__' ;

KwExtMapBegin: '__EXT_MAP_BEGIN__' ;
KwExtMapEnd: '__EXT_MAP_BEGIN__' ;

KwExtDefVhdlTypesBegin: '__EXT_DEF_VHDL_TYPES_BEGIN__' ;
KwExtDefVhdlTypesEnd: '__EXT_DEF_VHDL_TYPES_END' ;

MiscIdent: [A-Za-z] ('_'? [A-Za-z0-9])*  ;
MiscOther: . ;
