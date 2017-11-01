
import System.Random

data Suit = Clubs | Spades | Hearts | Diamonds deriving (Show, Enum, Eq, Ord)
-- should probably be called rank
data Value = Seven | Eight | Nine | Ten | King | Ace | Jack | Queen deriving (Show, Enum, Eq, Ord)

data Card = Card Value Suit deriving (Show)


main :: IO()
main = do
  putStrLn "Hello Sheepshead"
  putStrLn $ "Here is my first card: " ++ (show $ Card Queen Spades )
  
--removeAt :: (Eq a, Num a) => a -> [t] -> (t,[t])
removeAt 0 (x:xs) = (Just x,xs)
removeAt _ [] = (Nothing, []) -- should do something more for out of bounds
removeAt n (x:xs) = let (out, rest) = removeAt (n-1) xs
                    in (out, x:rest)

allSuits = [Clubs ..]
allValues = [Seven ..]

makeDeck = [Card v s | v <- allValues, s <- allSuits ]

generateHandIdexes = take 10 $ randomRs (1::Int ,32) $ mkStdGen 100

createHand = constructHand makeDeck generateHandIdexes

-- constructHand deck handIdexes
constructHand [] _ = []
constructHand _ [] = []
constructHand deck (i:is) = let (aCard, restDeck) = removeAt i deck
                            in aCard : constructHand restDeck is
