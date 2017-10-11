
data Suit = Clubs | Spades | Hearts | Diamonds deriving (Show, Enum)
-- should probably be called rank
data Value = Seven | Eight | Nine | Ten | King | Ace | Jack | Queen deriving (Show, Enum)

data Card = Card Value Suit deriving (Show)

main :: IO()
main = do
  putStrLn "Hello Sheepshead"
  putStrLn $ "Here is my first card: " ++ (show $ Card Queen Spades )
  
removeAt 0 (x:xs) = (x,xs)
removeAt n [] = (0, []) -- should do something more for out of bounds
removeAt n (x:xs) = let (out, rest) = removeAt (n-1) xs
                    in (out, x:rest)

allSuits = [Clubs ..]
allValues = [Seven ..]

makeDeck = [Card v s | v <- allValues, s <- allSuits ]
