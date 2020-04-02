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

	KwExtVarBegin = auto()
	KwExtVarEnd = auto()

	KwExtMapBegin = auto()
	KwExtMapEnd = auto()

	KwExtDefVhdlTypeBegin = auto()
	KwExtDefVhdlTypeEnd = auto()

	MiscIdent = auto()
	MiscOther = auto()

def lex(tok):
