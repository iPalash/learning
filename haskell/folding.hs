-- revere a list using just one fold

rev :: [a] -> [a]

rev = foldr (\x acc -> acc ++ [x])) []
rev = foldl (\acc x -> x:acc) []

rev = foldl (flip (:)) [] -- FLIP flips the arg order

-- generate all prefix list 

prefixes :: [a] -> [[a]]

prefixes ls = (filter (\x -> (length x)>0)) (foldl (\acc x -> (x:head(acc)):acc ) [[]] ls) 

prefixes = foldr (\x acc-> [x]:(map ((:) x) acc )) []

-- interpolation poly in the lagarange form

-- Generate all except self

allX -> [a] -> [[a]]

allX [1,2,3]
    => [[2,3],[1,3],[1,2]]


util _ [] = []
util prev (x:xs) = (prev ++ xs) : (util (x:prev) xs)

allX = util [] 

map (\el2 -> (x-el2)/(el1-el2)) allX


merge ls = zip ls (allX ls)

l x2 ls2 = (foldr (\el acc -> acc*(x-el)/(x2-el)) 1) ls2


lag :: [(Float,Float)] -> Float -> Float


-- Separate x y arrays

sep xy=
    let 
    xarr = [x | [x,y] <- xy]
    yarr = [y | [x,y] <- xy]
    in 
    [xarr,yarr]

lagr xs x = foldl (\acc (xj,y) -> acc + (y* l xj)) 0 xs
    where 
        l xj = foldl (\acc (xk,_) -> if xk==xj then acc else acc*(x-xk)/(xj-xk) ) 1 xs


-- Data for a trie

data Leaf
data Node

data Trie a = Leaf a | Node a [Trie a]

-- foldtrie -> fold the element of a trie in a preorder traversal

foldtrie :: (b->a->b) -> a -> Trie a -> b

foldtrie f acc (Leaf x) = f acc x
foldtrie f acc (Node x xs) = foldl f' (f acc x) xs
    where 
        f' acc t = foldtrie f acc t

-- or

foldtrie f acc (Node x xs) = foldl (foldtrie f) (f acc x) xs

t = Node 'a' [ (Node 'b' [Leaf 'c',Leaf 'd']) , (Node 'c' [Leaf 'e', Leaf 'f'] )]

-- preorder print
foldtrie (\acc el -> acc ++ [el]) ""  t
