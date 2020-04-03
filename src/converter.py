#!/usr/bin/env python3

import enum
from enum import auto
import sys

class Blank:
	pass

def psconcat(*args):
	return str().join([str(arg) for arg in args])

def lsconcat(lst):
	return str().join([str(elem) for elem in lst])

def fprintout(file, *args, flush=False):
	print(psconcat(*args), sep="", end="", file=file, flush=flush)

def printout(*args):
	fprintout(sys.stdout, *args)

def printerr(*args):
	fprintout(sys.stderr, *args)

def convert_enum_to_str(to_conv):
	return str(to_conv)[str(to_conv).find(".") + 1:]


class Token(enum.Enum):
	KwExtStructBegin = auto()
	KwExtStructEnd = auto()
	KwExtCommentBegin = auto()
	KwExtCommentEnd = auto()
	KwExtMemberBegin = auto()
	KwExtMemberEnd = auto()

	KwExtStdLogic = auto()
	KwExtUnsignedBegin = auto()
	KwExtUnsignedEnd = auto()
	KwExtSignedBegin = auto()
	KwExtSignedEnd = auto()

	KwExtInteger = auto()
	KwExtNatural = auto()

	KwExtArrayBegin = auto()
	KwExtArrayEnd = auto()

	KwExtPortBegin = auto()
	KwExtPortEnd = auto()
	KwExtSigPortBegin = auto()
	KwExtSigPortEnd = auto()
	KwExtVarPortBegin = auto()
	KwExtVarPortEnd = auto()

	KwPortDir = auto()

	KwExtSigBegin = auto()
	KwExtSigEnd = auto()
	KwExtAssignSplitToSigBegin = auto()
	KwExtAssignSplitToSigEnd = auto()
	KwExtAssignSigToSplitBegin = auto()
	KwExtAssignSigToSplitEnd = auto()

	KwExtVarBegin = auto()
	KwExtVarEnd = auto()
	KwExtAssignSplitToVarBegin = auto()
	KwExtAssignSplitToVarEnd = auto()
	KwExtAssignVarToSplitBegin = auto()
	KwExtAssignVarToSplitEnd = auto()

	KwExtMapBegin = auto()
	KwExtMapEnd = auto()

	KwExtDefVhdlTypesBegin = auto()
	KwExtDefVhdlTypesEnd = auto()

	MiscIdent = auto()
	MiscOther = auto()

class TokAndText:
	def __init__(self, tok, text):
		self._tok, self._text = tok, text
	def tok(self):
		return self._tok
	def text(self):
		return self._text


class Converter:
	def __init__(self):
		self._data = {}
		self._line_list = []

	def lex(self, text):
		for item in \
		[
			(Token.KwExtStructBegin, "__EXT_STRUCT_BEGIN__"),
			(Token.KwExtStructEnd, "__EXT_STRUCT_BEGIN__"),
			(Token.KwExtCommentBegin, "__EXT_COMMENT_BEGIN__"),
			(Token.KwExtCommentEnd, "__EXT_COMMENT_END__"),
			(Token.KwExtMemberBegin, "__EXT_MEMBER_BEGIN__"),
			(Token.KwExtMemberEnd, "__EXT_MEMBER_END__"),

			(Token.KwExtStdLogic, "__EXT_STD_LOGIC__"),
			(Token.KwExtUnsignedBegin, "__EXT_UNSIGNED_BEGIN__"),
			(Token.KwExtUnsignedEnd, "__EXT_UNSIGNED_END__"),
			(Token.KwExtSignedBegin, "__EXT_SIGNED_BEGIN__"),
			(Token.KwExtSignedEnd, "__EXT_SIGNED_END__"),

			(Token.KwExtInteger, "__EXT_INTEGER__"),
			(Token.KwExtNatural, "__EXT_NATURAL__"),

			(Token.KwExtArrayBegin, "__EXT_ARRAY_BEGIN__"),
			(Token.KwExtArrayEnd, "__EXT_ARRAY_END__"),

			(Token.KwExtPortBegin, "__EXT_PORT_BEGIN__"),
			(Token.KwExtPortEnd, "__EXT_PORT_END__"),
			(Token.KwExtSigPortBegin, "__EXT_SIG_PORT_BEGIN__"),
			(Token.KwExtSigPortEnd, "__EXT_SIG_PORT_END__"),
			(Token.KwExtVarPortBegin, "__EXT_VAR_PORT_BEGIN__"),
			(Token.KwExtVarPortEnd, "__EXT_VAR_PORT_END__"),

			(Token.KwExtSigBegin, "__EXT_SIG_BEGIN__"),
			(Token.KwExtSigEnd, "__EXT_SIG_END__"),
			(Token.KwExtAssignSplitToSigBegin,
				"__EXT_ASSIGN_SPLIT_TO_SIG_BEGIN__"),
			(Token.KwExtAssignSplitToSigEnd,
				"__EXT_ASSIGN_SPLIT_TO_SIG_END__"),
			(Token.KwExtAssignSigToSplitBegin,
				"__EXT_ASSIGN_SIG_TO_SPLIT_BEGIN__"),
			(Token.KwExtAssignSigToSplitEnd,
				"__EXT_ASSIGN_SIG_TO_SPLIT_END__"),

			(Token.KwExtVarBegin, "__EXT_VAR_BEGIN__"),
			(Token.KwExtVarEnd, "__EXT_VAR_END__"),
			(Token.KwExtAssignSplitToVarBegin,
				"__EXT_ASSIGN_SPLIT_TO_VAR_BEGIN__"),
			(Token.KwExtAssignSplitToVarEnd,
				"__EXT_ASSIGN_SPLIT_TO_VAR_END__"),
			(Token.KwExtAssignVarToSplitBegin,
				"__EXT_ASSIGN_VAR_TO_SPLIT_BEGIN__"),
			(Token.KwExtAssignVarToSplitEnd,
				"__EXT_ASSIGN_VAR_TO_SPLIT_END__"),

			(Token.KwExtMapBegin, "__EXT_MAP_BEGIN__"),
			(Token.KwExtMapEnd, "__EXT_MAP_BEGIN__"),

			(Token.KwExtDefVhdlTypesBegin, "__EXT_DEF_VHDL_TYPES_BEGIN__"),
			(Token.KwExtDefVhdlTypesEnd, "__EXT_DEF_VHDL_TYPES_END"),
		]:
			if text == item[1]:
				return TokAndText(item[0], text)
		if (text == "in") or (text == "IN") \
			or (text == "out") or (text == "out") \
			or (text == "inout") or (text == "INOUT"):
			return TokAndText(Token.KwPortDir, text)
		elif text[0].isalpha():
			return TokAndText(Token.MiscIdent, text)
		else:
			return TokAndText(Tok.MiscOther, text)

	def parseExtCommand(self, 
