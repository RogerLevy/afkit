# Keyboard

An optional library for reading the keyboard.  For these to work you need to either use the Piston or call `pollkb` regularly.

Key codes are defined in allegro5_03_keys.f.

| kstate    | ( n -- n ) | current state of key
| klast     | ( n -- n ) | state of key from last frame
| kdelta    | ( n -- n ) | change of key state ( -1 = released, 0 = unchanged, 1 = pressed )
| kpressed  | ( n -- flag ) |
| kreleased | ( n -- flag ) |
| alt?      | ( -- flag ) |
| ctrl?     | ( -- flag ) |
| shift?    | ( -- flag ) |       