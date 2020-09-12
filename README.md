Perfect Perl Command-line Interfaces
====================================

_Don't get hung up on the "perfect" part. It's of course categorically
impossible to make a "perfect" CLI, it just flows better than "pretty good Perl
CLIs." `;)`_

A brief review of "Unix toolkit" philosophy and "pipe-and-filter" programming,
followed by advice about how to provide command-line applications that are easy
to get started with, make obvious their affordances, and provide help and
support for newbie through expert users.


Running the slideshow
---------------------

Individual slides are written in Markdown, and [`slides.md`](slides.md) is all
of the slides concatenated together. There's a [PDF version](slides.pdf), too.

If you want to _run_ the slideshow in a terminal session, just `source .env`
after cloning the repository (or use [autoenv][], which does this automatically
when you `cd` into the directory).

The commands `s` and `vs` take an integer slide number to either show or edit
(in your `$EDITOR`) the specific slide number in `slides/*.md`; with no
argument they show or edit the current slide. Use `n` and `b` to advance to the
next and previous slides.


Stuff mentioned during the 10 September Cinci.pm meeting
--------------------------------------------------------

* [chat transcript](transcript/20200910.md)
* "[affordances][af]"
  > "When affordances are taken advantage of, the user knows what to do
  > just by looking: no picture, label, or instruction needed."
  > — [Don Norman][dn], Grand Old Man of User Experience 
* [The Heirloom Project][hp] - _man pages for POSIX utils_
    * Heirloom Bourne Shell - [sh(1)][sh1]
* Hash::Util ≥5.8.0 supports "[restricted hashes][rh]"; _e.g._, you can use
  `lock_keys` to restrict a hash to a certain set of keys)
* `mkwhatis` doesn't seem to be a thing on modern Linux systems anymore, but
  `mandb -c PATH` (create) is, and `apropos` works when it can find those
  indexes
* where to put bash-completion scripts?
    * `$XDG_DATA_HOME/bash-completion` or `~/.local/share/bash-completion`
    * [reference][bcfaq]
* does [Term::ANSIColor][tac] account for actual terminal color capabilities by
  querying termio/termcap/terminfo database?
    * well, no, it doesn't look like it:

            (TERM=dumb; perl -E 'use Term::ANSIColor; say colored("RED!", "bold red")')

* Mike C. updated his [Exporter::Extensible][ee] CPAN module in August,
  improving performance


See also
--------

* [Unix philsophy][up]
* [The Unix Chainsaw][yt1] - _by Gary Bernhardt, ~30 minutes_
* [Truly Terrific Terminal Apps (in Python)][tttapy] - _most of the material
  here is language-agnostic_


[10rec]: https://academic.oup.com/gigascience/article/2/1/2047-217X-2-15/2656133
[autoenv]: https://github.com/inishchith/autoenv
[up]: https://en.wikipedia.org/wiki/Unix_philosophy
[yt1]: https://www.youtube.com/watch?v=sCZJblyT_XM
[tttapy]: https://bit.ly/tttapy
[af]: https://www.interaction-design.org/literature/topics/affordances
[dn]: https://en.wikipedia.org/wiki/Don_Norman
[hp]: http://heirloom.sourceforge.net/index.html
[sh1]: http://heirloom.sourceforge.net/sh/sh.1.html
[rh]: https://metacpan.org/pod/Hash::Util#Restricted-hashes
[bcfaq]: https://github.com/scop/bash-completion#faq
[tac]: https://metacpan.org/pod/Term::ANSIColor
[ee]: https://metacpan.org/pod/distribution/Exporter-Extensible/lib/Exporter/Extensible.pm
