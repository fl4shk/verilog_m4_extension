#!/usr/bin/env python3

#import enum
#from enum import auto
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
			("KwExtStructBegin", "__EXT_STRUCT_BEGIN__"),
			("KwExtStructEnd", "__EXT_STRUCT_BEGIN__"),
			("KwExtCommentBegin", "__EXT_COMMENT_BEGIN__"),
			("KwExtCommentEnd", "__EXT_COMMENT_END__"),
			("KwExtMemberBegin", "__EXT_MEMBER_BEGIN__"),
			("KwExtMemberEnd", "__EXT_MEMBER_END__"),

			("KwExtStdLogic", "__EXT_STD_LOGIC__"),
			("KwExtUnsignedBegin", "__EXT_UNSIGNED_BEGIN__"),
			("KwExtUnsignedEnd", "__EXT_UNSIGNED_END__"),
			("KwExtSignedBegin", "__EXT_SIGNED_BEGIN__"),
			("KwExtSignedEnd", "__EXT_SIGNED_END__"),

			("KwExtInteger", "__EXT_INTEGER__"),
			("KwExtNatural", "__EXT_NATURAL__"),

			("KwExtArrayBegin", "__EXT_ARRAY_BEGIN__"),
			("KwExtArrayEnd", "__EXT_ARRAY_END__"),

			("KwExtPortBegin", "__EXT_PORT_BEGIN__"),
			("KwExtPortEnd", "__EXT_PORT_END__"),
			("KwExtSigPortBegin", "__EXT_SIG_PORT_BEGIN__"),
			("KwExtSigPortEnd", "__EXT_SIG_PORT_END__"),
			("KwExtVarPortBegin", "__EXT_VAR_PORT_BEGIN__"),
			("KwExtVarPortEnd", "__EXT_VAR_PORT_END__"),

			("KwExtSigBegin", "__EXT_SIG_BEGIN__"),
			("KwExtSigEnd", "__EXT_SIG_END__"),

			("KwExtAssignSplitToSigBegin",
				"__EXT_ASSIGN_SPLIT_TO_SIG_BEGIN__"),

			("KwExtAssignSplitToSigEnd",
				"__EXT_ASSIGN_SPLIT_TO_SIG_END__"),

			("KwExtAssignSigToSplitBegin",
				"__EXT_ASSIGN_SIG_TO_SPLIT_BEGIN__"),

			("KwExtAssignSigToSplitEnd",
				"__EXT_ASSIGN_SIG_TO_SPLIT_END__"),

			("KwExtVarBegin", "__EXT_VAR_BEGIN__"),
			("KwExtVarEnd", "__EXT_VAR_END__"),

			("KwExtAssignSplitToVarBegin",
				"__EXT_ASSIGN_SPLIT_TO_VAR_BEGIN__"),

			("KwExtAssignSplitToVarEnd",
				"__EXT_ASSIGN_SPLIT_TO_VAR_END__"),

			("KwExtAssignVarToSplitBegin",
				"__EXT_ASSIGN_VAR_TO_SPLIT_BEGIN__"),

			("KwExtAssignVarToSplitEnd",
				"__EXT_ASSIGN_VAR_TO_SPLIT_END__"),

			("KwExtMapBegin", "__EXT_MAP_BEGIN__"),
			("KwExtMapEnd", "__EXT_MAP_BEGIN__"),

			("KwExtCreateVhdlTypesBegin",
				"__EXT_CREATE_VHDL_TYPES_BEGIN__"),
			("KwExtCreateVhdlTypesEnd",
				"__EXT_CREATE_VHDL_TYPES_END"),
		]:
			if text == item[1]:
				return TokAndText(item[0], text)
		if (text == "in") or (text == "IN") \
			or (text == "out") or (text == "out") \
			or (text == "inout") or (text == "INOUT"):
			return TokAndText("KwPortDir", text)
		elif text[0].isalpha():
			return TokAndText("MiscIdent", text)
		else:
			return TokAndText("MiscOther", text)

	def parseExtCommand(self, 
