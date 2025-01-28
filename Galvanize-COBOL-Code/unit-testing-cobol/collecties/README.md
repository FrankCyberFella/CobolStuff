# Collecties - COBOL

Early stages, but is playable.

## Steps to run

> cobc -x MainProgram.cbl IO.cbl   programs/Collectie-Manager.cbl programs/Biome-Manager.cbl programs/Consumable-Manager.cbl utils/Randomizer.cbl && ./MainProgram

## Steps to test

There's no ability to call all the test suites at moment. So you'll need to tweak command line arguments to target each suite individually for now. E.g.

> cobc -x tests/Consumable-Manager-Tests.cbl programs/Consumable-Manager.cbl ../GUnit-Galvanize-Testing-Framework/GUnit.cbl tests/Mock-Randomizer.cbl && ./Consumable-Manager-Tests
