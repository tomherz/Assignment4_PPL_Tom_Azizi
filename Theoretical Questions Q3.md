### b. Success or failure tree? Finite or infinite?

1. **Success tree:** the tree contains success paths, in fact, all paths are in branch A.
2. **Infinite tree:** there are two independent sources of infiniteness:
   * **Branch A:** unary_number(X) with X free enumerates every unary number (left branch).
   * **Branch B:** unary_plus([1|X], T, X) recurses forever, while fails on the occurs-check at every level.

Hence, by the course material this is an infinite success tree, an infinite tree that contains a finite success path.

#### c. Is the query provable?

**Yes.**, since there exists a finite success path from the root to a success leaf for example the path ending in $\{X=[],\ Y=[]\}$.