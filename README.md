# Motivation
1. I had a small c++ flashcard program at one time.  I miss it!
2. Memorization is fun.
3. Since I am a math major and software engineer who loves statistics, it seemed like a shame that I didn't know R.  It's a pirate's favorite language!
4. I like the idea of using computers to make you better at something rather than doing something for you so that you forget how to do it.

Flashcards are a great application for computers.  Suppose you're working through a set of flashcards, and you want to make a rule that every time you get one wrong it has to be done three more times.  You could make a mental note to keep putting it back in the deck.  But a virtual flashcard program could just add three to that cards count instead of subtracting one.

It seems like there is a smallish number of ways that data can be structured.  Some examples:  Chemical element names and numbers are a bijection, and can be quizzed in either direction.  State birds are key-value but there are repeats, so one can imagine a quiz strategy that first asks for the state bird of each state and then asks for all the states for a given bird.  Digits of pi is sequential data, but you could chunk it into key-value pairs.  Taxonomy is hierarchical.  Geological eons, eras, epochs, periods, and ages are hierarchical, too, but ordered.

For each way that data can be structured, one can devise a variety of quiz strategies, from a single pass to starting with very small partitions and combining them until the quizzee is doing the wholde data set.

What I'd like is to have a simple a DSL for different structure types, a program that can read the DSL, infer data structure, 
offer appropriate quiz types, and administer the quiz.  Imagine if all the data in wikipedia from Beatles albums to Chinese dynasties could be easily rendered as a flashcard quiz!

Since R is good with tables, and since it's both functional and object-oriented, maybe the quiz types could be represented as functions, and the structure types could be represented as polymorphic.  Or something.  I have a long way to go to get there but this is currently working.
