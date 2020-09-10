Perfect Perl Command-line Interfaces
====================================

NAME
----

Don't get hung up on the "perfect" part; it just flows better than "pretty
good Perl CLIs."


SYNOPSIS
--------

A brief review of "Unix toolkit" philosophy and "pipe-and-filter" programming,
followed by advice about how to provide command-line applications that are easy
to get started with, make obvious their affordances, and provide help and
support for newbie through expert users.


DESCRIPTION
-----------

- [ ] Unix "toolkit," pipe-and-filter programming
- [ ] ten recommendations paper
- [ ] GetOpt::Long, Pod::Usage (`pod2usage`)
- [ ] when to print an error if no input, or just wait for input
- [ ] why not ANSI all the things?
- [ ] write a man page (POD after script's `__END__`)
- [ ] Makefile.PL (how to handle dependencies)
- [ ] just a plain Makefile (say, for just a script and a man page)
- [ ] executable Perl modules (`caller or main`)
- [ ] Bash programmable completion
- [ ] https://github.com/docopt


BUGS
----

- [ ] only GetOpt::Long is discussed; are there interesting alternatives?


SEE ALSO
--------

* [Unix philsophy][wp1]
* [The Unix Chainsaw][yt1] - _by Gary Bernhardt, ~30 minutes_
* [Truly Terrific Terminal Apps (in Python)][tttapy] - _most of the material
  here is language-agnostic_


[wp1]: https://en.wikipedia.org/wiki/Unix_philosophy
[yt1]: https://www.youtube.com/watch?v=sCZJblyT_XM
[tttapy]: https://bit.ly/tttapy
