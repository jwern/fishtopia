REEL_1 = <<END
                /\\
               /  \\
            0 8    J
            |/____
/\\//\\/\\    //     |


END

REEL_2 = <<END

         /\\
        /  J
        \\
          8 0
           \\|____
/\\//\\/\\    //    |


END

REEL_3 = <<END
    ___
   |   \\
   J    \\   0
         \\8>|____
/\\//\\/\\    //    |


END

REEL_4 = <<END
    ___
   |   \\
   |    \\   0
   |     \\8>|____
/\\/|/\\/\\   //    |
   |
   J
END

FISH_1 = <<END


   <*)))<
     \\0/
      |
   ___ʌ___
         |
END

GARBAGE = <<END

    |*%)|
    |>=*|
     \\0/
      |
   ___ʌ___
         |
END

def casting_visual
  puts REEL_1
  sleep(1)
  puts REEL_2
  sleep(1)
  puts REEL_3
  sleep(1)
  puts REEL_4
  sleep(1)
end

def still_fishing_visual
  puts REEL_4
  sleep(1)
end
