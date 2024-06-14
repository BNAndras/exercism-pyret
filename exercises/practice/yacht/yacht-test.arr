use context essentials2020

include file("yacht.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun yacht-is-50():
  check "Yacht":
    score([list: 5, 5, 5, 5, 5], "yacht") is 50
  end
end

fun not-yacht-is-0():
  check "Not Yacht":
    score([list: 1, 3, 3, 2, 5], "yacht") is 0
  end
end

fun ones():
  check "Ones":
    score([list: 1, 1, 1, 3, 5], "ones") is 3
  end
end

fun ones-out-of-order():
  check "Ones, out of order":
    score([list: 3, 1, 1, 5, 1], "ones") is 3
  end
end

fun no-ones():
  check "No ones":
    score([list: 4, 3, 6, 5, 5], "ones") is 0
  end
end

fun twos():
  check "Twos":
    score([list: 2, 3, 4, 5, 6], "twos") is 2
  end
end

fun fours():
  check "Fours":
    score([list: 1, 4, 1, 4, 1], "fours") is 8
  end
end

fun yacht-counted-as-threes():
  check "Yacht counted as threes":
    score([list: 3, 3, 3, 3, 3], "threes") is 15
  end
end

fun yacht-of-threes-counted-as-fives():
  check "Yacht of threes counted as fives":
    score([list: 3, 3, 3, 3, 3], "fives") is 0
  end
end

fun fives():
  check "Fives":
    score([list: 1, 5, 3, 5, 3], "fives") is 10
  end
end

fun sixes():
  check "Sixes":
    score([list: 2, 3, 4, 5, 6], "sixes") is 6
  end
end

fun full-house-two-small-three-big():
  check "Full house two small, three big":
    score([list: 2, 2, 4, 4, 4], "full house") is 16
  end
end

fun full-house-three-small-two-big():
  check "Full house three small, two big":
    score([list: 5, 3, 3, 5, 3], "full house") is 19
  end
end

fun two-pair-is-not-a-full-house():
  check "Two pair is not a full house":
    score([list: 2, 2, 4, 4, 5], "full house") is 0
  end
end

fun four-of-a-kind-is-not-a-full-house():
  check "Four of a kind is not a full house":
    score([list: 1, 4, 4, 4, 4], "full house") is 0
  end
end

fun yacht-is-not-a-full-house():
  check "Yacht is not a full house":
    score([list: 2, 2, 2, 2, 2], "full house") is 0
  end
end

fun four-of-a-kind():
  check "Four of a Kind":
    score([list: 6, 6, 4, 6, 6], "four of a kind") is 24
  end
end

fun yacht-can-be-scored-as-four-of-a-kind():
  check "Yacht can be scored as Four of a Kind":
    score([list: 3, 3, 3, 3, 3], "four of a kind") is 12
  end
end

fun full-house-is-not-four-of-a-kind():
  check "Full house is not Four of a Kind":
    score([list: 3, 3, 3, 5, 5], "four of a kind") is 0
  end
end

fun little-straight():
  check "Little Straight":
    score([list: 3, 5, 4, 1, 2], "little straight") is 30
  end
end

fun little-straight-as-big-straight():
  check "Little Straight as Big Straight":
    score([list: 1, 2, 3, 4, 5], "big straight") is 0
  end
end

fun four-in-order-but-not-a-little-straight():
  check "Four in order but not a little straight":
    score([list: 1, 1, 2, 3, 4], "little straight") is 0
  end
end

fun no-pairs-but-not-a-little-straight(): 
  check "No pairs but not a little straight":
    score([list: 1, 2, 3, 4, 6], "little straight") is 0
  end
end

fun minimum-is-1-maximum-is-5-but-not-a-little-straight():
  check "Minimum is 1, maximum is 5, but not a little straight":
    score([list: 1, 1, 3, 4, 5], "little straight") is 0
  end
end

fun big-straight():
  check "Big Straight":
    score([list: 4, 6, 2, 5, 3], "big straight") is 30
  end
end

fun big-straight-as-little-straight():
  check "Big Straight as little straight":
    score([list: 6, 5, 4, 3, 2], "little straight") is 0
  end
end

fun no-pairs-but-not-a-big-straight():
  check "No pairs but not a big straight":
    score([list: 6, 5, 4, 3, 1], "big straight") is 0
  end
end

fun choice():
  check "Choice":
    score([list: 3, 3, 5, 6, 6], "choice") is 23
  end
end

fun yacht-as-choice():
  check "Yacht as choice":
    score([list: 2, 2, 2, 2, 2], "choice") is 10
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(yacht-is-50, true),
  test(not-yacht-is-0, false),
  test(ones, false),
  test(ones-out-of-order, false),
  test(no-ones, false),
  test(twos, false),
  test(fours, false),
  test(yacht-counted-as-threes, false),
  test(yacht-of-threes-counted-as-fives, false),
  test(fives, false),
  test(sixes, false),
  test(full-house-two-small-three-big, false),
  test(full-house-three-small-two-big, false),
  test(two-pair-is-not-a-full-house, false),
  test(four-of-a-kind-is-not-a-full-house, false),
  test(yacht-is-not-a-full-house, false),
  test(four-of-a-kind, false),
  test(yacht-can-be-scored-as-four-of-a-kind, false),
  test(full-house-is-not-four-of-a-kind, false),
  test(little-straight, false),
  test(little-straight-as-big-straight, false),
  test(four-in-order-but-not-a-little-straight, false),
  test(no-pairs-but-not-a-little-straight, false),
  test(minimum-is-1-maximum-is-5-but-not-a-little-straight, false),
  test(big-straight, false),
  test(big-straight-as-little-straight, false),
  test(no-pairs-but-not-a-big-straight, false),
  test(choice, false),
  test(yacht-as-choice, false)
].each(lam(t): when t.active: t.run() end end)
