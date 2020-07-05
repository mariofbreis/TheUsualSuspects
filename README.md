# The Usual Suspects
 Project for the Logic for Programming course

The project aims to develop a program in Prolog that, based on a set of clues, allows to answer the challenge of a detective. That said, seven different predicates had to be represented, which allowed learning to work with various functions that manipulate lists in Prolog using recursion. These predicates allow not only to specify characteristics of the Suspects list, but also to describe the relationships between the positions occupied by the suspects.

# Implemented features:

1) exists (Suspect, Suspects)

- Indicates whether the Suspect is an element that belongs to the Suspects list.

- For the realization of this predicate, the “member” function of Prolog was used, which returns true if the Suspect is an element of the list, otherwise it returns false.


2) side (Suspect1, Suspect2, Suspects)

- Indicates that Suspect1 and Suspect2 are next to each other (regardless of being on the left / right), in the Suspects list.

- For the realization of this predicate, the “nextto” function of the Prolog was used, which returns true if the second element comes after the first in the list, otherwise it returns false.


3) between (Suspect1, Suspect2, Suspect3, Suspects)

- Indicates that a suspect2 is between Suspect1 and Suspect3 in the Suspects list. Nothing is said about what is on the left / right, but it can be inferred that the three suspects are followed (s1 s2 s3 or s3 s2 s1).

- For the realization of this predicate, we searched for the 3 suspects in a row and recursively called the rest of the list, returning true if Suspect2 is between Suspect1 and Suspect3, otherwise it returns false.


4) left (Suspect1, Suspect2, Suspects)

- Indicates that Suspect1 is to the left of Suspect2 (not necessarily in the position immediately following).

- For the realization of this predicate, the list of suspects was searched for suspect2 in the second position of the list and recursively called the rest of the list until reaching the end, returning true if Suspect1 is to the left of Suspect2, otherwise it returns false.


5) right (Suspect1, Suspect2, Suspects)

- Indicates that Suspect1 is to the right of Suspect2 (not necessarily in the position immediately following).

- For the realization of this predicate, the “left” predicate created previously was called and the position suspects were changed, returning true if Suspect1 is to the right of Suspect2, otherwise it returns false.


6) Don't Enter (Suspect1, Suspect2, Suspect3, Suspects)

- Indicates that Suspect2 is not between Suspect1 and Suspect3. Nothing is said about what is left / right. However, it can be inferred that between Suspect1 and Suspect3 there is only one position.

- For the realization of this predicate, the predicate “between” was created previously with another variable and was denied, saying that this variable is different from Suspect2, returning true if Suspect2 is not between Suspect1 and Suspect3, otherwise returns false.


7) or (Suspect1, Suspect2, Suspect3, Suspects)

- Indicates that Suspect1 is "the same" as Suspect2 or Suspect3, but not both.

- For the realization of this predicate, it was initially seen if all Suspects existed in the list, using the predicate “exists”. Then it was verified whether Suspect1 is equal to Suspect2 and Suspect1 is different from Suspect3, or if Suspect1 is different from Suspect2 and Suspect1 is equal to Suspect3. If one of these two conditions occurs, it returns true, otherwise it returns false.
