#XVIII FUGE. G-moll.
#Programmed by Static Method https://static-method.com/

use_bpm 80

FULL_STEP = 2
HALF_STEP = 1
WHOLE_NOTE = 4
HALF_NOTE = 2
QUARTER_NOTE = 1
EIGHTH_NOTE = 0.5
SIXTEENTH_NOTE = 0.25
THIRTY_SECOND_NOTE = 0.125

#terse names of the clearly named constants above for less typing when transcribing
HN = HALF_NOTE
WN = WHOLE_NOTE
QN = QUARTER_NOTE
EN = EIGHTH_NOTE
SN = SIXTEENTH_NOTE
TN = THIRTY_SECOND_NOTE
HS = HALF_STEP
FS = FULL_STEP

#tersely named version of the play function
define :p do |note = :r, len = QUARTER_NOTE|
  play note, release: len
  sleep len
end

define :whole do |note = :r|
 p note, WHOLE_NOTE
end

define :half do |note = :r|
 p note, HALF_NOTE
end

define :quarter do |note = :r|
 p note, QUARTER_NOTE
end

define :eighth do |note = :r|
 p note, EIGHTH_NOTE
end

define :sixteenth do |note = :r|
 p note, SIXTEENTH_NOTE
end

define :thirtysecond do |note = :r|
 p note, THIRTY_SECOND_NOTE
end

define :w do |note = :r|
 whole note
end

define :h do |note = :r|
 half note
end

define :q do |note = :r|
 quarter note
end

# e breaks, so ei it is
define :ei do |note = :r|
 eighth note
end

define :s do |note = :r|
 sixteenth note
end

define :t do |note = :r|
 thirtysecond note
end

#play trills
define :trill do |note = :r, len = QUARTER_NOTE, steps = FULL_STEP, speed = THIRTY_SECOND_NOTE|
  #make the trill amplitude quieter... less shrill
  quieter_amp = current_synth_defaults[:amp] - 0.2
  #number of loops is the length of the note,
  #  divided by how fast the 2 notes of each trill cycle are played
  count = len / (speed * 2)
  count.times do
    play note, amp: quieter_amp, release: speed
    sleep speed
    play note + steps, amp: quieter_amp, release: speed
    sleep speed
  end  #the trill is gone
end

#tersely named trill function
define :tr do |note = :r, len = QUARTER_NOTE, steps = FULL_STEP, speed = THIRTY_SECOND_NOTE|
 trill note, len, steps, speed
end

in_thread(name: :soprano) do
  use_synth :beep
  use_synth_defaults pan: 0.3, attack: 0.069, amp: 0.40
  with_fx :reverb do
    # PAGE 1
    q:G4; q:D5; p:Bb4, QN + EN; ei:A4
    ei:G4; ei:Bb4; ei:A4; ei:G4; ei:Fs4; ei:A4; q:D4
    ei:G4; ei:D4; ei:A4; ei:D4; ei:Bb4; s:A4; s:G4; ei:A4; ei:D4
    ei:G4; s:D4; s:G4; ei:A4; s:D4; s:A4; ei:Bb4; s:A4; s:G4; s:A4; s:D4; s:D5; s:C5
    s:Bb4; s:A4; s:G4; s:Bb4; s:A4; s:G4; s:Fs4; s:A4; s:G4; s:D4; s:G4; s:A4; s:Bb4; s:C5; s:D5; s:E5
    s:F5; s:E5; s:D5; s:F5; s:E5; s:D5; s:Cs5; s:E5; ei:D5; ei:A4; ei:D5; ei:E5
    s:F5; s:G5; s:F5; s:G5; tr:G5, EN + SN; t:F5; t:G5; s:A5; s:G5; s:A5; s:Bb5; s:A5; s:G5; s:F5; s:E5
    s:F5; s:A5; s:G5; s:A5; s:Cs5; s:A5; s:G5; s:A5; s:D5; s:A5; s:G5; s:A5; s:Cs5; s:A5; s:G5; s:A5
    s:F5; s:D5; s:Cs5; s:D5; s:G5; s:D5; s:Cs5; s:D5; s:A5; s:D5; s:Cs5; s:D5; s:G5; s:D5; s:Cs5; s:D5
    ei:A4; ei:F5; ei:G4; ei:E5; ei:F4; ei:A4; ei:D5; ei:F5
    ei:Eb5; ei:A5; ei:r; ei:Eb5; ei:D5; ei:G5; ei:r; ei:D5  
    s:C5; s:Bb4; s:C5; s:D5; s:C5; s:A5; s:G5; s:A5; s:Bb4; s:G5; s:Fs5; s:G5; s:A4; s:Fs5; s:E5; s:Fs5
    h:G5; h:r
    h:r; s:Bb4; s:D5; s:C5; s:D5; s:Fs4; s:D5; s:C5; s:D5
    s:G4; s:D5; s:C5; s:D5; s:Fs4; s:D5; s:C5; s:D5; q:Bb4; q:C5
    q:D5; q:C5; ei:r; ei:Bb4; ei:r; ei:A4
    #PAGE 2
    ei:r; ei:D4; s:G4; s:A4; s:Bb4; s:G4; ei:A4; ei:D5; ei:Cs5; ei:E5
    s:A5; s:Bb5; s:A5; s:G5; s:F5; s:E5; s:D5; s:Cs5; ei:D5; ei:r; ei:Bb5; ei:r
    ei:E5; q:r; ei:A5; tr:A5, HN, HS
    tr:A5, WN, HS
    tr:A5, HN, HS; s:A5; s:G5; s:A5; s:Bb5; s:A5; s:G5; s:F5; s:E5
    h:F5; ei:r; ei:D5; ei:G5; ei:F5
    p:Eb5, HN + EN; ei:C5; ei:F5; ei:Eb5
    p:D5, QN + SN; s:G5; s:Fs5; s:G5; p:C5, QN + SN; s:Bb4; s:A4; s:C5
    s:Bb4; s:A4; s:G4; s:Bb4; s:A4; s:G4; s:Fs4; s:A4; s:G4; s:D4; s:E4; s:Fs4; s:G4; s:D4; s:G4; s:A4
    s:Bb4; s:G4; s:Bb4; s:C5; s:D5; s:A4; s:D5; s:C5; p:Bb4, QN + EN; ei:A4
    ei:G4; ei:Bb4; ei:A4; ei:G4; ei:Fs4; ei:A4; q:D4
    ei:G4; ei:D4; ei:A4; ei:D4; ei:Bb4; s:A4; s:G4; ei:A4; ei:D4
    ei:G4; s:D4; s:G4; ei:A4; s:D4; s:A4; ei:Bb4; s:A4; s:G4; s:A4; s:D4; s:D5; s:C5
    s:Bb4; s:A4; s:G4; s:Bb4; s:A4; s:G4; s:Fs4; s:A4; s:G4; s:Bb4; s:C5; s:D5; s:Eb5; s:Bb4; s:A4; s:G4
    s:Fs4; s:A4; s:Bb4; s:C5; s:D5; s:A4; s:G4; s:F4; s:Eb4; s:G4; s:A4; s:Bb4; s:C5; s:G4; s:F4; s:Eb4
    # PAGE 3
    s:D4; s:F4; s:G4; s:A4; s:Bb4; s:D5; s:C5; s:Bb4; s:A4; s:C5; s:D5; s:Eb5; s:F5; s:G5; s:F5; s:Eb5 
    s:D5; s:F5; s:Eb5; s:D5; s:C5; s:Bb4; s:A4; s:C5; s:Bb4; s:F4; s:G4; s:A4; s:Bb4; s:C5; s:Bb4; s:A4
    s:D5; s:E5; s:D5; s:E5; tr:E5, EN, HS; tr:E5, SN, HS; t:D5; t:E5; s:F5; s:Eb5; s:F5; s:G5; s:F5; s:Eb5; s:D5; s:C5
    s:D5; s:F5; s:Eb5; s:F5; s:A4; s:F5; s:Eb5; s:F5; s:Bb4; s:F5; s:Eb5; s:F5; s:A4; s:F5; s:Eb5; s:F5
    s:D5; s:Bb4; s:A4; s:Bb4; s:Eb5; s:Bb4; s:A4; s:Bb4; s:F5; s:Bb4; s:A4; s:Bb4; s:Eb5; s:Bb4; s:A4; s:Bb4
    s:Bb4; s:C5; s:D5; s:Bb4; s:Eb5; s:D5; s:C5; s:Eb5; s:D5; s:C5; s:D5; s:Eb5; s:D5; s:C5; s:Bb4; s:D5
    s:C5; s:Bb4; s:C5; s:D5; s:C5; s:Bb4; s:A4; s:C5; s:Bb4; s:A4; s:Bb4; s:C5; s:Bb4; s:A4; s:G4; s:Bb4
    ei:A4; ei:F5; ei:r; ei:Ab4; ei:G4; ei:Eb5; ei:r; ei:G4
    ei:F4; ei:D5; ei:r; ei:F4; s:Eb4; s:G4; s:C5; s:Bb4; s:A4; s:G4; s:F4; s:Eb4
    s:D4; s:Eb4; s:F4; s:G4; s:A4; s:Bb4; s:C5; s:A4; s:Bb4; s:F4; s:G4; s:A4; s:Bb4; s:C5; s:Bb4; s:C5
    # PAGE 4
    s:D5; s:E5; s:D5; s:E5; tr:E5, EN + SN, HS; t:D5; t:E5; s:F5; s:E5; s:F5; s:G5; ei:F5; ei:F5
    tr:F5, WN + WN + SN;  #spans 3 measures/lines 
    #whole note tied on this measure/line
    s:Eb5; s:F5; s:G5; p:C5, EN + SN; s:A5; s:Bb5; s:A5; s:Bb5; s:C6; s:Bb5; s:A5; s:G5; s:F5
    s:Eb5; s:D5; s:Eb5; s:F5; s:Eb5; s:D5; s:C5; s:Bb4; s:A5; s:G5; s:A5; s:Bb5; s:A5; s:G5; s:F5; s:Eb5
    s:D5; s:C5; s:D5; s:Eb5; s:D5; s:C5; s:Bb4; s:A4; s:G5; s:F5; s:G5; s:Ab5; s:G5; s:F5; s:Eb5; s:D5
    s:C5; s:B4; s:C5; s:D5; s:C5; s:D5; s:Eb5; s:C5; p:F5, QN + SN; s:Ab5; s:G5; s:F5
    p:Eb5, HN + SN; s:C5; s:D5; s:Eb5; s:F5; s:G5; s:Ab5; s:F5
    s:B4; s:C5; s:D5; s:B4; ei:G4; ei:r; q:C5; q:G5
    p:Eb5, QN + EN; ei:D5; ei:C5; ei:Eb5; ei:D5; ei:C5
    ei:B4; ei:D5; q:G4; ei:C5; ei:G4; ei:D5; ei:G4
    ei:Eb5; s:D5; s:C5; ei:D5; ei:G4; ei:C5; s:G4; s:C5; ei:D5; s:G4; s:D5
    # PAGE 5
    ei:Eb5; s:D5; s:C5; s:D5; s:G4; s:G5; s:F5; s:Eb5; s:D5; s:C5; s:Eb5; s:D5; s:C5; s:B4; s:D5
    s:C5; s:G5; s:Eb5; s:G5; s:C5; s:Eb5; s:G4; s:Bb4; s:A4; s:C5; s:A4; s:C5; s:F4; s:A4; s:C4; s:Eb4
    s:D4; s:F5; s:D5; s:F5; s:Bb4; s:D5; s:F4; s:A4; s:G4; s:Bb4; s:G4; s:Bb4; s:Eb4; s:G4; s:Bb3; s:D4
    s:C4; s:Eb5; s:C5; s:Eb5; s:A4; s:C5; s:E4; s:G4; s:Fs4; s:A4; s:Fs4; s:A4; s:D4; s:Fs4; s:A3; s:C4
    ei:Bb3; ei:G4; ei:A3; ei:Fs4; q:G4; q:r
    s:G4; s:Bb4; s:A4; s:G4; s:D5; s:A4; s:D4; s:C5; s:Bb4; s:D5; s:C5; s:Bb4; s:F5; s:C5; s:F4; s:Eb5
    s:D5; s:F5; s:Eb5; s:D5; s:G5; s:D5; s:G4; s:F5; s:E5; s:G5; s:F5; s:E5; s:A5; s:E5; s:A5; s:G5
    q:Fs5; ei:G5; ei:A5; p:Bb5, HN + QN #tied over to next measure/line 
    h:A5; p:G5, QN + QN; #tied over to next measure/line
    q:Fs5; q:G5; q:r
    ei:r; ei:D5; ei:G5; ei:A5; s:Bb5; s:A5; s:G5; s:A5; s:Fs5; s:G5; s:Fs5; s:G5
    s:A5; s:G5; s:Fs5; s:E5; s:D5; s:C5; s:Bb4; s:A4; s:Bb4; s:D5; s:C5; s:D5; s:Fs4; s:D5; s:C5; s:D5
    s:G4; s:D5; s:C5; s:D5; s:Fs4; s:D5; s:C5; s:D5; s:Bb4; s:G4; s:Fs4; s:G4; s:C5; s:G4; s:Fs4; s:G4
    s:D5; s:G4; s:Fs4; s:G4; s:C5; s:G4; s:Fs4; s:G4; ei:Bb4; ei:G5; ei:A4; ei:Fs5
    w:G5
  end
end

in_thread(name: :alto) do
  use_synth :square
  use_synth_defaults pan: -0.3, amp: 0.5, cutoff: 70, attack: 0.069
  with_fx :reverb do
    #Page 1
    w:r
    w:r
    w:r
    w:r
    w:r
    q:D4; q:A4; p:F4, QN + EN; ei:E4
    ei:D4; ei:F4; ei:E4; ei:D4; ei:Cs4; ei:E4; q:A3
    ei:D4; ei:A3; ei:E4; ei:A3; ei:F4; s:E4; s:D4; ei:E4; ei:A3
    ei:D4; s:A3; s:D4; ei:E4; s:A3; s:E4; ei:F4; s:E4; s:D4; s:E4; s:A3; s:A4; s:G4
    s:F4; s:E4; s:D4; s:F4; s:E4; s:D4; s:Cs4; s:E4; s:D4; s:A3; s:D4; s:E4; s:F4; s:G4; s:A4; s:B4
    s:C5; s:Bb4; s:C5; s:D5; s:C5; s:Bb4; s:A4; s:C5; s:Bb4; s:A4; s:Bb4; s:C5; s:Bb4; s:A4; s:G4; s:Bb4
    ei:A4; ei:G4; ei:Fs4; ei:D4; q:G4; q:r
    ei:r; ei:D4; ei:G4; ei:A4; s:Bb4; s:C5; s:Bb4; s:C5; tr:C5, EN + SN; t:Bb4; t:C5
    s:D5; s:C5; s:D5; s:Eb5; s:D5; s:C5; s:Bb4; s:A4; ei:D4; ei:r; ei:C4; ei:r
    ei:D4; ei:r; ei:C4; ei:r; s:r; s:G4; s:Fs4; s:G4; s:r; s:G4; s:Fs4; s:G4
    s:r; s:G4; s:Fs4; s:G4; s:r; s:G4; s:Fs4; s:G4; q:D4; q:C4
    #PAGE 2
    q:Bb3; q:r; h:r
    w:r
    w:r
    w:r
    w:r
    ei:r; ei:A4; ei:D5; ei:C5; p:Bb4, HN + EN #tied over to next measure/line 
    ei:G4; ei:C5; ei:Bb4; p:A4, HN+ QN  #tied over to next measure/line
    h:G4; q:Fs4; 
    ei:G4; ei:r; q:r; h:r
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    #PAGE 3
    w:r
    q:Bb3; q:F4; p:D4, QN + EN; ei:C4
    ei:Bb3; ei:D4; ei:C4; ei:Bb3; ei:A3; ei:C4; ei:r; ei:F4   #tricky line in the sheet music - jump up
    p:F4, WN + WN  #whole note ties through next measure/line
    #whole note tied over
    w:r
    w:r
    w:r
    w:r
    w:r
    #PAGE 4
    w:r 
    w:r
    w:r
    h:r; ei:r; ei:F4; ei:Bb4; ei:A4
    p:G4, HN + EN; ei:C4; ei:A4; ei:G4
    p:F4, HN + EN; ei:Bb3; ei:G4; ei:F4
    p:Eb4, HN + SN; s:Eb4; s:D4; s:C4; q:B3
    q:C4; q:r; ei:r; ei:C4; ei:Ab4; p:F4, EN + QN + SN; #Quarter note and sixteenth notes tie over to next measure/line
    s:F4; s:Eb4; s:D4; s:Eb4; s:D4; s:C4; s:Eb4; s:D4; s:C4; s:B3; s:D4
    s:C4; s:G3; s:C4; s:D4; s:Eb4; s:F4; s:Eb4; s:F4; s:G4; s:Eb4; s:C4; s:G4; s:Ab4; s:F4; s:G4; s:Ab4
    s:D4; s:Eb4; s:D4; s:C4; ei:B3; ei:D4; p:G3, HN + WN + HN + EN  #Half note and eith notes tie over to...
    #   ...next measure and into next page too!
    #PAGE 5
    ei:G4; s:F4; s:Eb4; s:D4; s:F4
    q:Eb4; q:r; ei:r; ei:C4; ei:A3; ei:F3
    p:Bb3, HN + EN; ei:Bb3; ei:G3; ei:Eb3
    p:A3, HN + EN; ei:A3; ei:Fs3; ei:D3;
    q:G3; q:r; s:G3; s:Bb3; s:A3; s:G3; s:D4; s:A3; s:D3; s:C4
    ei:Bb3; ei:D3; ei:A3; p:Bb3, EN + EN; ei:G4; ei:C4; p:F4, EN + EN #eigth note tied over to next measure/line
    ei:F4; ei:D4; p:G4, EN + EN; ei:G4; ei:E4; p:A4, EN  + SN; #eigth note tied over to next measure/line
    s:Eb5; s:D5; s:C5; s:Bb4; s:D5; s:A4; s:D5; s:G4; s:Ab5; s:G5; s:F5; s:G5; s:F5; s:Eb5; s:D5
    h:Eb5; h:D5
    h:C5; s:Bb4; s:D5; s:C5; s:Bb4; s:D4; s:Bb4; s:G4; s:A4
    s:Bb4; s:C5; s:Bb4; s:C5; s:D5; s:Eb5; s:D5; s:C5; ei:Bb4; ei:D5; ei:C5; ei:Bb4
    q:A4; ei:r; ei:D4; tr:D4, HN + WN + HN + EN  #trill ties over to...
    # ...whole note tying over this measure/line
    p:Eb4, EN + EN; ei:D4
    w:D4
  end
end

in_thread(name: :tenor) do
  use_synth :saw
  use_synth_defaults cutoff: 70, attack: 0.1, amp: 0.5
  with_fx :reverb do
    # Page 1
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    w:r
    h:r; q:G3; q:D4
    p:Bb3, QN + EN; ei:A3; ei:G3; ei:Bb3; ei:A3; ei:G3
    ei:Fs3; ei:A3; q:D3; ei:G3; ei:D3; ei:A3; ei:D3
    ei:Bb3; s:A3; s:G3; ei:A3; ei:D3; ei:G3; s:D3; s:G3; ei:A3; s:D3; s:A3
    ei:Bb3; s:A3; s:G3; s:A3; s:D3; s:D4; s:C4; s:Bb3; s:A3; s:G3; s:Bb3; s:A3; s:G3; s:Fs3; s:A3
    # PAGE 2
    s:G3; s:D3; s:G3; s:A3; s:Bb3; s:C4; s:D4; s:E4; s:F4; s:E4; s:D4; s:F4; s:E4; s:D4; s:Cs4; s:E4
    ei:D4; ei:A3; ei:D4; ei:E4; s:F4; s:G4; s:F4; s:G4; tr:G4, EN + SN; t:F4; t:G4
    s:A4; s:G4; s:A4; s:Bb4; s:A4; s:G4; s:F4; s:E4; s:F4; s:A4; s:G4; s:A4; s:Cs4; s:A4; s:G4; s:A4
    s:D4; s:A4; s:G4; s:A4; s:Cs4; s:A4; s:G4; s:A4; s:F4; s:D4; s:Cs4; s:D4; s:G4; s:D4; s:Cs4; s:D4
    s:A4; s:D4; s:Cs4; s:D4; s:G4; s:D4; s:Cs4; s:D4; ei:F4; s:E4; s:D4; tr:Cs4, EN + SN, HS; s:D4
    s:D4; s:C4; s:D4; s:E4; s:D4; s:C4; s:Bb3; s:A3; s:G3; s:F3; s:G3; s:A3; s:G3; s:F3; s:Eb3; s:D3
    s:C4; s:Bb3; s:C4; s:D4; s:C4; s:Bb3; s:A3; s:G3; s:F3; s:Eb3; s:F3; s:G3; s:F3; s:Eb3; s:D3; s:C3
    s:Bb2; s:Bb3; s:C4; s:D4; q:Eb4; s:r; s:A3; s:Bb3; s:C4; q:D4
    q:G3; q:D4; p:Bb3, QN + EN; ei:A3
    s:G3; s:Bb3; s:A3; s:G3; s:Fs3; s:G3; s:E3; s:Fs3; s:G3; s:D3; s:E3; s:Fs3; s:G3; s:D3; s:G3; s:A3
    s:Bb3; s:C4; s:Bb3; s:C4; tr:C4, EN + SN; t:Bb3; t:C4; s:D4; s:C4; s:D4; s:Eb4; s:D4; s:C4; s:Bb3; s:A3
    s:Bb3; s:D4; s:C4; s:D4; s:Fs3; s:D4; s:C4; s:D4; s:G3; s:D4; s:C4; s:D4; s:Fs3; s:D4; s:C4; s:D4
    s:Bb3; s:G3; s:Fs3; s:G3; s:C4; s:G3; s:Fs3; s:G3; s:D4; s:G3; s:Fs3; s:G3; s:C4; s:G3; s:Fs3; s:G3
    ei:G3; ei:Bb3; s:C4; s:Bb3; s:A3; s:C4; p:Bb3, QN + SN; s:D4; s:C4; s:Bb3
    p:A3, QN + SN; s:C4; s:Bb3; s:A3; p:G3, QN + SN; s:Bb3; s:A3; s:G3 
    #PAGE 3
    p:F3, QN + EN; ei:E3; ei:F3; ei:Eb3; ei:D3; ei:C3
    q:Bb2; q:r; ei:r; ei:C4; ei:Bb3; ei:A3
    h:G3; q:F3; q:F3
    ei:Bb3; ei:F3; ei:C4; ei:F3; ei:D4; s:C4; s:Bb3; ei:C; ei:F3
    ei:Bb3; s:F3; s:Bb3; ei:C4; s:F3; s:C4; ei:D4; s:C4; s:Bb3; s:C4; s:F3; s:F4; s:Eb4
    s:D4; s:C4; s:Bb3; s:D4; s:C4; s:Bb3; s:A3; s:C4; ei:Bb3; ei:G4; ei:r; ei:G3
    ei:A3; ei:F4; ei:r; ei:F3; ei:G3; ei:F4; ei:C4; ei:E4
    s:F4; s:Eb4; s:F4; s:G4; s:F4; s:Eb4; s:D4; s:F4; s:Eb4; s:D4; s:Eb4; s:F4; s:Eb4; s:D4; s:C4; s:Eb4
    s:D4; s:C4; s:D4; s:Eb4; s:D4; s:C4; s:Bb3; s:D4; s:C4; s:Bb3; s:C4; s:D4; s:C4; s:Bb3; s:A3; s:C4
    s:Bb3; s:C4; s:D4; s:Bb3; s:C4; s:D4; s:Eb4; s:C4; s:D4; s:C4; s:Bb3; s:C4; s:D4; s:Eb4; s:D4; s:Eb4
    #PAGE 4
    s:F4; s:G4; s:F4; s:G4; tr:G4, EN + SN; t:F4; t:G4; s:A4; s:G4; s:A4; s:Bb4; s:A4; s:G4; s:F4; s:Eb4
    s:D4; s:F4; s:Eb4; s:F4; s:A3; s:F4; s:Eb4; s:F4; s:Bb3; s:F4; s:Eb4; s:F4; s:A3; s:F4; s:Eb4; s:F4
    s:D4; s:Bb4; s:A4; s:Bb4; s:Eb4; s:Bb4; s:A4; s:Bb4; s:F4; s:Bb4; s:A4; s:Bb4; s:Eb4; s:Bb4; s:A4; s:Bb4
    s:Bb4; s:D5; s:C5; s:Bb4; s:A4; s:G4; s:F4; s:Eb4; p:D4, HN + EN   #eigth ties over to next measure/line 
    ei:G3; ei:C4; ei:Bb3; p:A3, HN + EN; #eighth ties over to next measuer/line
    ei:F3; ei:Bb3; ei:A3; p:G3, HN + EN #eighth ties over to next measure/line
    ei:Eb3; ei:Ab3; ei:G3; q:F3; p:G3, QN + SN; #sixteenth ties over to next measure/line
    s:G3; s:A3; s:B3; s:C4; s:D4; s:Eb4; s:C4; h:Ab3
    ei:G3; ei:A3; q:B3; ei:C4; ei:r; q:r
    w:r
    w:r
    w:r
    #PAGE 5
    w:r
    ei:r; ei:G3; ei:Eb3; ei:C3; q:F3; q:r
    ei:r; ei:F3; ei:D3; ei:Bb2; q:Eb3; q:r
    ei:r; ei:Eb3; ei:C3; ei:A2; q:D3; q:r
    s:G2; s:Bb2; s:A2; s:G2; s:D3; s:A2; s:D2; s:C3; ei:Bb2; ei:D3; ei:Fs2; ei:D3
    q:G3; q:Fs3; q:G3; q:A3
    q:Bb3; q:B3; q:C4; q:Cs4
    q:D4; ei:E4; ei:Fs4; q:G4; ei:A4; ei:Bb4
    s:C5; s:G4; s:F4; s:Eb4; s:C5; s:A4; s:F4; s:A4; s:Bb3; s:F4; s:Eb4; s:D4; s:Bb4; s:G4; s:Eb4; s:G4
    s:A3; s:Eb4; s:D4; s:C4; s:A4; s:Fs4; s:D4; s:Fs4; s:G3; s:Bb3; s:D4; s:G4; s:Fs4; s:G4; s:E4; s:Fs4
    p:G4, QN + EN; ei:Fs4; q:G4; ei:A4; ei:D4
    q:D4; ei:r; ei:Fs3; ei:G3; ei:r; ei:C4; ei:r 
    ei:Bb3; ei:r; ei:C4; ei:r; ei:Bb3; ei:r; ei:A3; ei:r
    ei:G3; ei:r; ei:A3; ei:r; ei:G3; ei:Bb3; ei:C4; ei:A3
    w:B3 
  end
end

in_thread(name: :bass) do
  use_synth :saw
  use_synth_defaults attack: 0.1, cutoff: 50, amp: 1
  # Page 1
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  #PAGE 2
  h:r; q:D3; q:A3
  p:F3, QN + EN; ei:E3; ei:D3; ei:F3; ei:E3; ei:D3
  ei:Cs3; ei:E3; q:A2; ei:D3; ei:A2; ei:E3; ei:A2
  ei:F3; s:E3; s:D3; ei:E3; ei:A2; ei:D3; s:A2; s:D3; ei:E3; s:A2; s:E3
  ei:F3; s:E3; s:D3; ei:E3; ei:A2; ei:D3; ei:G2; q:A2
  q:D2; q:r; h:r
  w:r 
  w:r 
  w:r
  h:r; ei:r; ei:G2; ei:G3; ei:F3
  ei:Eb3; ei:r; ei:Eb2; ei:r; ei:D2; ei:D3; tr:D3, QN + WN + WN + HN + QN; #2 whole notes tie over
  # ... to this measure/line
  # ... and to this measure/line, and half note and quarter not tie over to next measure/line
  p:C3, QN + QN   #quarter note ties over to next measure/line
  h:Bb2; q:A2
  #PAGE 3
  ei:Bb2; ei:A2; q:G2; q:F2; q:r
  w:r 
  w:r
  w:r
  w:r 
  w:r 
  w:r 
  w:r 
  w:r 
  q:Bb2; q:F3; p:D3, QN + EN; ei:C3
  #PAGE 4
  ei:Bb2; ei:D3; ei:C3; ei:Bb2; ei:A2; ei:C3; q:F2
  ei:Bb2; ei:F2; ei:C3; ei:F2; ei:D3; s:C3; s:Bb2; ei:C3; ei:F2
  ei:Bb2; s:F2; s:Bb2; ei:C3; s:F2; s:C3; ei:D3; s:C3; s:Bb2; ei:C3; ei:F2
  ei:D3; ei:Eb3; ei:F3; ei:F2; q:Bb2; q:r
  q:C3; q:r; q:F2; q:r
  q:Bb2; q:r; q:Eb2; q:r
  q:Ab2; q:r; q:D2; q:G2
  q:C2; q:r; q:F2; q:r
  w:G2;
  ei:C2; ei:G2; ei:C3; ei:D3; q:Eb3; q:F3
  p:G3, QN + SN; s:G3; s:F3; s:G3; s:Eb3; s:G3; s:F3; s:G3; s:B2; s:G3; s:F3; s:G3
  s:C3; s:G3; s:F3; s:G3; s:B2; s:G3; s:F3; s:G3; s:Eb3; s:C4; s:B3; s:C4; s:F3; s:C4; s:B3; s:C4
  #PAGE 5
  s:G3; s:C4; s:B3; s:C4; s:G3; s:B3; s:A3; s:B3; ei:C3; ei:Eb3; ei:F3; ei:G3
  q:C3; q:r; h:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r
  w:r 
  h:r; q:G3; q:D4
  p:Bb3, QN + EN; ei:A3; ei:G3; ei:Bb3; ei:A3; ei:G3
  ei:Fs3; ei:A3; q:D3; ei:G3; ei:D3; ei:A3; ei:D3
  ei:Bb3; s:A3; s:G3; ei:A3; ei:D3; ei:G3; s:D3; s:G3; ei:A3; s:D3; s:A3
  ei:Bb3; s:A3; s:G3; ei:A3; ei:D3; ei:G3; ei:Eb3; ei:C3; ei:D3
  w:G2
end