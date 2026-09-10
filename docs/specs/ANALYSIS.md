# Enchanted Castle (EC.COM / EC.DAT) — Reverse-Engineering Report

## What this actually is

Your three files are **"Enchanted Castle," a 1986 DOS text adventure by Michael R.
Wilk** (this copy is "Release 1" — the copyright banner is embedded in the
binary). It's freeware/shareware; the author explicitly invited copying and
even still answers questions about it decades later on abandonware sites. The
setup, per the author and period reviews: you wake at midnight in a medieval
castle with nothing, and must escape — while also recovering the **Star
Diamond**, rescuing a princess (who may actually be a cursed frog), and
destroying the castle on your way out.

- `EC.COM` — the game engine, compiled with **Borland Turbo Pascal 3.0**
  (1985) straight to a DOS `.COM` executable. 54,842 bytes.
- `EC.DAT` — the game's content database (room text, object names, and
  world-structure tables). 152,576 bytes, loaded whole into memory at startup.
- `PERSONAE` — a tiny 6-byte save file. It's not mysterious: it's your
  remembered 3-letter initials from a previous session (`03 71 6b 6f ff 00`
  decodes to length=3, "qko", terminator). The engine prints "Your initials:"
  and offers to remember them here.

## The honest scope of "reverse engineer this"

I want to set expectations correctly rather than oversell this. `EC.COM` has
**no symbol table, no debug info, and no comments** — that information is
permanently gone; compilation is lossy. What I *can* do, and have done, is
real reverse engineering: recover the program's structure, its exact
string/data content, and enough of its logic to rebuild it cleanly. What I
can't do is hand you back Michael Wilk's original `.PAS` source file
verbatim — nobody can, from the binary alone.

Given that, "modernize" is better served by **treating this as a spec to
re-implement cleanly**, not a scan-and-restore job. That's the plan below,
and I made a real start on the data-extraction side, which is the part with
the highest payoff-per-effort.

## What I did, concretely

1. **Identified the toolchain and layout.** The `.COM` starts with `JMP` over
   an 11,388-byte region that is Borland's Turbo Pascal 3 runtime library
   (string handling, the console/keyboard driver, DOS file I/O, the
   `Run-time error` / `User Break` handlers you can see as plain strings near
   the top of the file). Everything after that jump target (file offset
   `0x2C7C`) is Wilk's own compiled game code.

2. **Cracked the compiler's string-literal calling convention**, which is the
   single most useful trick for this kind of binary. Turbo Pascal compiles a
   `Write('some text')` as `CALL <helper>` followed *immediately* by the
   literal string's raw bytes (length byte + characters) sitting in the
   instruction stream as data — the helper routine pops its own return
   address off the stack, reads and prints the string, and jumps back to
   right after it. I found and verified two such helpers:
   - `sub_295d` — `WriteInlineString` (prints the text)
   - `sub_11e5` — `PushInlineString` (copies the text as a string argument,
     e.g. for `Assign(f, 'EC.DAT')`)

   Once you know that trick, you can find *every* literal string in the
   binary by scanning for calls to those two addresses, whether or not a
   static disassembler's control-flow analysis ever reaches that call site.
   I did a full scan of the file on that basis and recovered
   **439 literal strings with 100%/97% confidence** (validated by
   printability and, in dozens of cases, by cross-checking that execution
   resumes exactly where the string length predicts it should).
   → `extracted_literal_strings.txt` / `.json`

   This single technique recovered the game's title, author/copyright line,
   win/lose messages, the full "magic word" syllable system (`abra`, `sham`,
   `alacka`, `bala`, `zam`...), a set of Sanskrit epithets of Krishna from the
   Bhagavad Gita used as an oracle password (`hrsikesa`, `acyuta`, `madhava`,
   `varsneya`...), the potion-color system, and essentially all of the
   game's "engine" prose (death messages, parser error messages, monster
   encounter text, etc).

3. **Reverse-engineered `EC.DAT`'s object table.** It's two parallel arrays:
   a table of 4-character internal object codes (e.g. `torc`, `oboe`,
   `diam`), and a pool of length-prefixed, space-padded-to-16-bytes display
   names ("burning torch", "The Star Diamond", ...). Objects with two
   physical states (torch lit/unlit, oboe dusty/shiny, cross whole/broken,
   flask full/empty, frog alive/dead, frog/prince) get two name entries.
   Pure scenery and monsters (dragon, troll, witch, basilisk, "Zimbu") don't
   need inventory names, so they only appear as short codes.
   → `objects.json`

4. **Partially cracked the room-record format.** Rooms are stored as
   variable-length records, but I found and fully decoded one clean,
   self-consistent 63-byte fixed-record run: a 5-room maze where every room's
   location phrase is literally **"in the thicket"** (a deliberate
   twisty-little-passages maze, straight out of the Colossal Cave Adventure
   tradition). Confirmed layout per record:
   - byte 0: length-prefix for the phrase
   - bytes 1–39: the phrase, space-padded
   - byte 40: `0xFF` sentinel
   - bytes 41–62: ~10 words of exit/flag data, with `0x0091` (145) recurring
     in a fixed position — almost certainly a "no exit this way" sentinel
     (my best guess: those are the Up/Down slots, which a hedge maze
     wouldn't use).

   Rooms *with* objects present appear to use longer, variable-size records
   (the fixed 63-byte stride breaks down as soon as the maze ends), so this
   schema needs more work to generalize. → `rooms_partial_thicket_maze.json`

5. **Produced an annotated disassembly** of everything the recursive-descent
   pass could statically reach (~7,000 instructions, ~700 candidate
   subroutines, with a call/caller cross-reference). Coverage is partial —
   Pascal `CASE` statements compile to long `CMP`/`JE` chains rather than
   jump tables in this compiler version, so the gap is mostly literal string
   data and a few register-indirect calls a static pass can't resolve
   without dynamic tracing. → `ec_com_disassembly_annotated.asm`,
   `routine_xref_summary.txt`

## What's genuinely unresolved

- **The full room graph.** I know the record format's *shape* but not yet
  the exact meaning of each field outside the one maze I fully cracked. This
  is the piece that actually turns the extracted text into a playable map.
- **The verb/command parser's exact grammar** (which words map to which verb
  IDs) — I have strong message-level evidence (GET/DROP/GO/INVENTORY/LOOK,
  directions, "In what direction?", etc.) but haven't traced the parser
  routine itself.
- **Puzzle logic specifics** — e.g. exactly what secateurs cut, what the
  potion-color puzzle requires, how the Sanskrit oracle is triggered. I have
  strong contextual clues (extracted above) but not the exact conditionals.

The most efficient way to close these gaps isn't more static byte-staring —
it's **dynamic**: run the original game (in DOSBox, which is trivial — it's
one `.COM` file) and just play it while logging output, or, if you want me
to keep going, I can continue the static approach on the exit-table format
specifically, now that I know its general shape.

## Files in this delivery

| File | Contents |
|---|---|
| `ANALYSIS.md` | this report |
| `objects.json` | full object table: codes, display names, notes |
| `rooms_partial_thicket_maze.json` | the one fully-decoded room-record example, with the schema |
| `extracted_literal_strings.txt` / `.json` | all 439 recovered engine strings, in file order |
| `ec_com_disassembly_annotated.asm` | annotated x86 disassembly with routine labels and inline string call-outs |
| `routine_xref_summary.txt` | every candidate subroutine and who calls it (busiest = core runtime helpers) |

## Suggested path to an actual "modernized" game

Rather than fighting the compiler's output further, I'd build a clean new
engine (Python is a natural fit) that:

1. Loads `objects.json` and the extracted string library directly — no need
   to touch the binary again for content that's already fully recovered.
2. Defines rooms as plain data (a Python dict/dataclass per room: name,
   description, exits, objects present) — hand-authored by playing the
   original in DOSBox and transcribing, which will be faster and far more
   reliable than finishing the byte-level room-table reverse engineering.
3. Re-implements the parser, inventory, and puzzle logic from the recovered
   message text and vocabulary, which describes almost all of the game's
   behavior already (e.g. the exact wording of every failure/success message
   tells you what the corresponding rule must be).

I'm glad to keep going on any piece of this — the exit-table format
specifically, building out the object/message data further, or starting the
actual Python engine — just say which.
