def part1
  notes = scale(:Eb2, :minor_pentatonic, num_octaves: 3)
  play(notes.choose,
       release: 0.5,
       attack: 0.2,
       sustain: 5.0,
       amp: rand * 0.25
      )
  sleep 0.5
end


use_synth :supersaw
with_fx :reverb, mix: 0.8 do
  with_fx :lpf, cutoff: 80 do
    loop do
      part1
    end
  end
end
