class RailFenceCipher

  def self.encode(phrase, rails, output="")
    return phrase if phrase == "" || rails>phrase.length || rails == 1
    rail_array=Array.new(rails) {Array.new}
    count=0
    add=true
    phrase.chars.each do |char|
      rail_array[count]<<char
      add==true ? count+=1 : count-=1
      add=false if count==(rails-1)
      add=true if count==0
    end
    rail_array.join
  end

  def self.decode(phrase, rails, output=Array.new(phrase.length), start=0, final_rail=rails)
    return phrase if (phrase == "" || rails==1) && start == 0
    return output.join if output.size == output.compact.size
    index=start
    slice_count=0
    phrase.chars.each do |char|
      output[index]=char
      rails == 1 ? index+=SPACERS[final_rail] : index+=SPACERS[rails]
      break if index>output.length-1
      slice_count+=1
    end
    phrase.slice!(0..slice_count)
    self.decode(phrase, rails-1, output, start+1, final_rail)
  end

  SPACERS={1=>1, 2=>2, 3=>4}
  VERSION = 1
end
