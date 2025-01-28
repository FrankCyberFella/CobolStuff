# LightSaber TDD

## Instructions
1. TODO: Coming Soon

## Description

**TODO** adjust for COBOL

A Light Saber has the following state:

- `EFFICIENCY` - The percentage of charge the lightsaber uses up per hour of use. This is static. Default value is `10.0f`.
- `charge` - The percentage of charge left on the lightsaber. Default is `100.0f`.
- `color` - The color of the lightsaber. Default is `"green"`.
- `jediSerialNumber` - A jedi serial number is used to instantiate a lightsaber &mdash; a lightsaber can only belong to one jedi

It has the following behavior:

- `setCharge()` - A method to set the charge to a particular value
- `getCharge()` - A method to return the amount of charge remaining
- `setColor()` - A method to set the lightsaber color
- `getColor()` - A method to return the current color
- `getJediSerialNumber()` - A method to return the serial number of the jedi owner
- `use(float minutes)` - A method to "use" the lightsaber for the given number of minutes. It drains the battery based on its efficiency and how long it's used
- `getMinutesRemaining()` - A method to calculate the amount of use remaining base on remaining charge and efficiency
- `recharge()` - A method to charge the lightsaber back up to 100%

## Steps to run "driver"
> cobc -x Light-Saber-Driver.cbl Light-Saber.cbl Randomizer.cbl  && ./Light-Saber-Driver

## Steps to run tests
> cobc -x tests/Light-Saber-Tests.cbl Light-Saber.cbl tests/Mock-Randomizer.cbl ../GUnit.cbl && ./Light-Saber-Tests