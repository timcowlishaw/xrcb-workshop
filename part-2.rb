def part2(sensor)
  notes = [39, 42, 46].map { |x| x + 12  * 4}
  play(notes.choose,
       release: 0.2,
       amp: rand * 0.5,
       divisor: 6,
       depth: 0.5,
       sustain: 0,
       attack: 0,
       cutoff: sensor,
      )
  sleep (rand * 0.5)
end

def scale(x)
  p "In scale"
  y  = ((x/150.0)*100).to_i
  p "Scaled: #{y}"
  return y
end

use_synth :fm
with_fx :reverb, mix: 0.5 do
  with_fx :echo do
    loop do
      sensor,_ = get "/osc/xrcb/ldr"
      p "Sensor: #{sensor}"
      scaled = scale(sensor)
      p "Scaled: #{scaled}"
      part2(scaled)
    end
  end
end
