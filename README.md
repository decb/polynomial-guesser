# polynomial-guesser

Think of a polynomial in _x_ of arbitrary degree with non-negative integer coefficients, this program can guess it given just two points on the polynomial.

For example, given _x<sup>2</sup> + 3x + 9_:

```
$ polynomial-guesser
What is the value for x = 1? 13
What is the value for x = 14? 247
[9,3,1]
```

## Installing and running

Requires the Haskell tool [Stack](https://docs.haskellstack.org/en/stable/README/).

```bash
stack build
stack exec polynomial-guesser
```

## References

1. Math &cap; Programming, _Learning a single-variable polynomial, or the power of adaptive queries_
