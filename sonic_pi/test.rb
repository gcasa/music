# Welcome to Sonic Pi

live_loop :flibble do
  sample :ambi_drone, rate: 0.3
  sample :bd_haus, rate: 1
  # play 75
  sleep 1
end

live_loop :second do
  sample :bass_thick_c
  sleep 0.5
end

i = 20
live_loop :third do
  play i
  i = i + 1
  sleep 0.5
end

