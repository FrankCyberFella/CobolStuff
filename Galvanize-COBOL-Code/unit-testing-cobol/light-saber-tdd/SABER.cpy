      *--------------------------------------------------------------*
      * Copybook: SABER.CPY                                          *
      * Description: This copybook defines the structure of a saber   *
      *              object used in Star Wars programs.              *
      * Fields:                                                      *
      *   - EFFICIENCY        : A numeric field (COMP-1) to represent*
      *     the efficiency of the saber.                             *
      *   - CHARGE            : A numeric field (COMP-1) to represent*
      *     the charge level of the saber.                           *
      *   - SABER-COLOR       : A string (PIC X(20)) that holds the  *
      *     color of the saber.                                      *
      *   - SERIAL-NUMBER     : A string (PIC X(20)) that holds the  *
      *     serial number of the saber.                              *
      *   - JEDI-SERIAL-NUMBER: A string (PIC X(20)) that holds the  *
      *     Jedi-specific serial number of the saber.                *
      * Usage: This copybook is included in programs that require    *
      *        saber-related information.                            *
      *--------------------------------------------------------------*
       01  SABER.
           05  EFFICIENCY         COMP-1.
           05  CHARGE             COMP-1.
           05  SABER-COLOR        PIC X(64).
           05  SERIAL-NUMBER      PIC X(64).
           05  REGISTERED-JEDI    PIC X(64).
      