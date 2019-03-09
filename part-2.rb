def part2
  notes = [39, 42, 46].map { |x| x + 12  * 4}
  play(notes.choose,
       release: 0.2,
       amp: rand * 0.5,
       divisor: 6,
       depth: 0.5,
       cutoff: 75
      )
  sleep rand * 0.2
end


use_synth :fm 
with_fx :reverb, mix: 0.2 do
  with_fx :echo do
    loop do
      part2
    end
  end
end
