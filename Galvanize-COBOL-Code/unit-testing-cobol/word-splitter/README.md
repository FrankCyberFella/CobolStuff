# Word Splitter Kata

Cobol exercise to  get up to speed on language, suggested in training session by Attila.

To run tests

> cobc -x word-splitter-tests.cbl word-splitter.cbl ../GUnit-Demo/GUnit-V2.cbl && ./word-splitter-tests

Note: In current version of GUnit you will get a file path error when searching for GUnit-Test-Fields.cpy. Easiest way to resolve for now is to run

> cp ../GUnit-Demo/GUnit-Test-Fields.cpy .

The included `.gitignore` will keep the copied file out of your commits.

