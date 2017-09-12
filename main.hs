
data Suit = Clubs | Spades | Hearts | Diamonds deriving (Show, Enum)
data Value = Seven | Eight | Nine | Ten | King | Jack | Queen deriving (Show, Enum)

data Card = Card Value Suit deriving (Show)

main = do
	putStrLn "Hello Sheepshead"
	putStrLn $ "Here is my first card: " ++ (show $ Card Queen Spades )

allSuits = [Clubs ..]
allValues = [Seven ..]
