/*:
 Cats 'n Hats
 ===
 
 You have 100 cats (You are quite lucky to own so many cats!).
​
 You have arranged all your cats in a line. Initially, none of your cats have any hats. You take 100 rounds walking around the cats, always starting at the beginning. Every time you stop at a cat, you put a hat on it if it doesn't have one, and you take its hat off if it has one on.
 
 The first round, you stop at every cat. The second round, you only stop at every 2nd cat (#2, #4, #6, #8, etc.). The third round, you only stop at every 3rd cat (#3, #6, #9, #12, etc.). You continue this process until the 100th round (i.e. you only visit the 100th cat).
 
 Write a program that prints which cats have hats at the end.
 
 In Ruby:
 
     def cats_in_hats
      cats = Array.new(100,false)
      answer = []
    ​
      100.times do |num|
        round = num + 1
        cats.each_with_index do |cat,index|
          current_cat = index + 1
          cats[index] ? cats[index] = false : cats[index] = true if current_cat % round == 0
        end
      end
      ​
      cats.each_with_index {|cat, index| answer << index if cats[index]}

      answer
    end
    ​
    p cats_in_hats == [0,3,8,15,24,35,48,63,80,99]
 
 In Swift:
*/
do {
    struct Cat {
        var isWearingHat = false
    }
    
    var cats = Array(count: 100, repeatedValue: Cat(isWearingHat: false))
    
    for intervalLength in 1...100 {
        for i in 1...100 {
            let index = (i * intervalLength) - 1
            guard index < cats.count else {
                break
            }
            cats[index].isWearingHat = !cats[index].isWearingHat
        }
    }
    
    print(cats.enumerate().filter { return $1.isWearingHat }.map { return $0.index })
}
