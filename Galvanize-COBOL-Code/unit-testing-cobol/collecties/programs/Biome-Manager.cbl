       IDENTIFICATION DIVISION.
       PROGRAM-ID. Biome-Manager.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  BIOMES-TABLE.
           05 BIOME OCCURS 12 TIMES PIC X(64) VALUE SPACES.
       01  IDX PIC 99 VALUE 1.
         
       LINKAGE SECTION.
       01  CURRENT-BIOME PIC X(64) VALUE SPACES.
       
       PROCEDURE DIVISION.
           ENTRY 'INIT-BIOMES'.
               MOVE 'RAINFOREST' TO BIOME(1).
               MOVE 'TAIGA' TO BIOME(2).
               MOVE 'WOODLAND' TO BIOME(3).
               MOVE 'SAVANNA' TO BIOME(4).
               MOVE 'PLAINS' TO BIOME(5).
               MOVE 'TUNDRA' TO BIOME(6).
               MOVE 'DESERT' TO BIOME(7).
               MOVE 'BOG' TO BIOME(8).
               MOVE 'OCEANIC' TO BIOME(9).
               MOVE 'BEACH' TO BIOME(10).
               MOVE 'MOUNTAIN_RANGE' TO BIOME(11).
               MOVE 'VOLCANIC' TO BIOME(12).
               GOBACK.

           ENTRY 'GET-RANDOM-BIOME' USING CURRENT-BIOME.
      *        TODO: randomize. Just iterate for now.     
               MOVE BIOME(IDX) TO CURRENT-BIOME.
               ADD 1 TO IDX.
               IF IDX > 12 THEN
                   MOVE 1 TO IDX
               END-IF.
               GOBACK.
               
      *    TODO
      *You found a Rextore Claws Energy Drink while exploring.
      *It has been added to your consumables. 
      