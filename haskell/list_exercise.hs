
Check if an element exists
exists :: (Eq a) => a -> [a] -> Bool

exists _ [] = False 
exists a (x:xs) = (a==x) || (exists a xs)




# Removing duplicates
nub :: (Eq a) => [a] -> [a]


nub a = check a []
    where
        check [] a = a
        check (x:xs) ls
            | pred==False = check xs (ls ++ [x])
            | pred==True = check xs ls
            where
            pred = (or [x==el | el <- ls])  

# If we are reusing exists

nub [] = []
nub (x:xs)
    | x `exists` xs == True = nub xs
    | otherwise = x:nub xs

#  The first one preserves the order though and the second one looks much cleaner


# Check for ascending (not strict) list

isAsc [] = True
isAsc (x:xs)
    | xs == [] = True
    | x<=head(xs) = isAsc xs
    | otherwise = False

# Using two colors
isAsc [] = True
isAsc [x] = True
isAsc (x:y:xs) = (x<=y) && isAsc(y:xs)


# Check path in directed graph

hasPath :: [(Int,Int)] -> Int -> Int -> Bool

util toVisit visited

util [] _ _ _ = False
util (x:xs) visited graph end
    | x == end = True
    -- | exists end reachable = True
    | otherwise = util (xs ++ reachable) (visited ++ reachable) graph end 
    where 
        reachable = [ n | (m,n) <- graph, m==x && not (exists n visited)]

hasPath graph start end = util [start] [start] graph end

hasPath [(1,2),(2,3),(3,2),(4,3),(4,5)] 1 4