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

	| extCreateVhdlTypes
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
extIntegerVector:
	KwExtIntegerVectorBegin
		identOrOtherList
	KwExtIntegerVectorEnd
	;
extNatural:
	KwExtNatural
	;

extTypename:
	extStruct
	| extStdLogic
	| extUnsigned
	| extSigned
	| extInteger
	| extNatural
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

extCreateVhdlTypes:
	KwExtCreateVhdlTypesBegin
		MiscIdent extTypename
	KwExtCreateVhdlTypesEnd
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
KwExtIntegerVectorBegin: '__EXT_INTEGER_VECTOR_BEGIN__' ;
KwExtIntegerVectorEnd: '__EXT_INTEGER_VECTOR_END__' ;
KwExtNatural: '__EXT_NATURAL__' ;

//KwExtArrayBegin: '__EXT_ARRAY_BEGIN__' ;
//KwExtArrayEnd: '__EXT_ARRAY_END__' ;

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

KwExtCreateVhdlTypesBegin: '__EXT_DEF_VHDL_TYPES_BEGIN__' ;
KwExtCreateVhdlTypesEnd: '__EXT_DEF_VHDL_TYPES_END' ;

MiscIdent: [A-Za-z] ('_'? [A-Za-z0-9])*  ;
MiscOther: . ;
