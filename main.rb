require "colorize"


def read_file(filename:)
    unmarked_text = ""
    f = File.open(filename, "r")
    f.each_line do |line|
        unmarked_text << line#.chomp
    end
  f.close
  return unmarked_text
end

def indices(haystack: , needle:)
 i = 0
  output = []
  progress = 0
  while progress < haystack.to_s.length 
    if i + needle.length < haystack.length
      i += 1
      part = haystack[i,needle.length]   
      if part == needle
       progress += 1
       output << i
      end
    else
      progress += 1
    end
  end
 return output
end



def print_highlighted_text(haystack:, indices_list:, needle:)
   progress = 0 #haystack.length
   index = 0
  # index = indices_list.length
  while progress < haystack.length
     
      if progress == haystack[progress]
         outputarray = haystack.split(' ')
         #progress += 1 
      else
        outputarray = haystack.split(' ')
            progress += 1 
      end
      while index < outputarray.length
        
        if needle == outputarray[index]
           print outputarray[index].on_green + " "
           index +=1
        else
           print outputarray[index]  +" "
           index +=1
      end
     # puts outputarray
    end

  end

end

def main
  if ARGV[0] == "-h"
    system("cls")
    puts "This program is case-sensitive"
  else
    filename = ARGV[0] 
    needle = ARGV[1]
        haystack = read_file(filename:filename)
        system("cls")
        indices_list = indices(haystack:haystack, needle:needle)
        print_highlighted_text(haystack:haystack ,indices_list:indices_list ,needle:needle)
  end
    # needle = ARGV[1]
    #     haystack = read_file(filename:filename)
    #     system("cls")
    #     indices_list = indices(haystack:haystack, needle:needle)
    #     print_highlighted_text(haystack:haystack ,indices_list:indices_list ,needle:needle)
end

main