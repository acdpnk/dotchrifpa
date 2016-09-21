#!/usr/bin/env python
# -*- coding: utf-8 -*-

from sys import argv
from sys import stdout

flipTable = {
    "a" : u'\u0250',
    "b" : "q",
    "c" : u'\u0254',
    "d" : "p",
    "e" : u'\u01DD',
    "f" : u'\u025F',
    "g" : u'\u0183',
    "h" : u'\u0265',
    "i" : u'\u0131',
    "j" : u'\u027E',
    "k" : u'\u029E',
    "l" : "|",
    "m" : u'\u026F',
    "n" : "u",
    "o" : "o",
    "p" : "d",
    "q" : "b",
    "r" : u'\u0279',
    "s" : "s",
    "t" : u'\u0287',
    "u" : "n",
    "v" : u'\u028C',
    "w" : u'\u028D',
    "x" : "x",
    "y" : u'\u028E',
    "z" : "z",
    "A" : u'\u0250',
    "B" : "q",
    "C" : u'\u0254',
    "D" : "p",
    "E" : u'\u01DD',
    "F" : u'\u025F',
    "G" : u'\u0183',
    "H" : u'\u0265',
    "I" : u'\u0131',
    "J" : u'\u027E',
    "K" : u'\u029E',
    "L" : "|",
    "M" : u'\u026F',
    "N" : "u",
    "O" : "o",
    "P" : "d",
    "Q" : "b",
    "R" : u'\u0279',
    "S" : "s",
    "T" : u'\u0287',
    "U" : "n",
    "V" : u'\u028C',
    "W" : u'\u028D',
    "X" : "x",
    "Y" : u'\u028E',
    "Z" : "z",
    "." : u'\u02D9',
    "[" : "]",
    "'" : ",",
    "," : "'",
    "(" : ")",
    "{" : "}",
    "?" : u'\u00BF',
    "!" : u'\u00A1',
    "\"" : ",",
    "<" : ">",
    "_" : u'\u203E',
    ";" : u'\u061B',
    u'\u203F' : u'\u2040',
    u'\u2045' : u'\u2046',
    u'\u2234' : u'\u2235',
    "\r" : "\n",
    " " : " "
}

# while ( <> ) {
#     my $string = reverse( $_ );
#     while ($string =~ /(.)/g) {
#     print $flipTable{$1};
#     }
#     print qq(\n);
# }

before = u' '.join(argv[1:])
after = u''
for char in before:
    if char in flipTable:
        after = unicode(flipTable[char] + after)
    else:

        after = unicode(char + after)


#print(after.encode("utf-8", "replace"))
stdout.write(after.encode("utf-8", "replace"))
