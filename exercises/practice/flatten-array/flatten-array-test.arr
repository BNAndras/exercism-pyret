use context essentials2020

include file("flatten-array.arr")

#|
  When working offline, all tests except the first one are skipped by default.
  Once you get the first test running, unskip the next one until all tests pass locally.
  Check the block comment below for further details.
|#

fun empty-array():
  check "empty":
    input = [list: ]

    expected = [list: ]

    flatten(input) is expected
  end
end

fun no-nesting():
  check "no nesting":
    input = [list: 0, 1, 2]

    expected = [list: 0, 1, 2]

    flatten(input) is expected
  end
end

fun nested-array():
  check "flattens a nested array":
    input = [list: [list: ]]

    expected = [list: ]

    flatten(input) is expected
  end
end

fun numeric-array():
  check "flattens array with just integers present":
    input = [list: 1, [list: 2, 3, 4, 5, 6, 7], 8]

    expected = [list: 1, 2, 3, 4, 5, 6, 7, 8]

    flatten(input) is expected
  end
end

fun five-levels():
  check "5 level nesting":
    input = [list:
      0,
      2,
      [list:
        [list: 2, 3],
        8,
        100,
        4,
        [list:
          [list:
            [list: 50]]]],
      -2]

    expected = [list:
      0,
      2,
      2,
      3,
      8,
      100,
      4,
      50,
      -2]

    flatten(input) is expected
  end
end

fun six-levels():
  check "6 level nesting":
    input = [list:
      1,
      [list:
        2,
        [list: [list: 3]],
        [list:
        4,
        [list: [list: 5]]],
        6,
        7],
      8]

    expected = [list:
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8]

    flatten(input) is expected
  end
end

fun omit-a-nothing():
  check "nothing values are omitted from the final result":
    input = [list: 1, 2, nothing]

    expected = [list: 1, 2]

    flatten(input) is expected
  end
end

fun omit-nothings-from-beginning():
  check "consecutive nothing values at the front of the array are omitted from the final result":
    input = [list: nothing, nothing, 3]

    expected = [list: 3]

    flatten(input) is expected
  end
end

fun omit-nothings-from-middle():
  check "consecutive nothing values in the middle of the array are omitted from the final result":
    input = [list: 1, nothing, nothing, 4]

    expected = [list: 1, 4]

    flatten(input) is expected
  end
end

fun six-levels-with-nothings():
  check "6 level nest array with nothing values":
    input = [list:
      0,
      2,
      [list:
        [list: 2, 3],
        8,
        [list: [list: 100 ]],
        nothing,
        [list: [list: nothing]]],
      -2]

    expected = [list:
      0,
      2,
      2,
      3,
      8,
      100,
      -2]

    flatten(input) is expected
  end
end

fun all-nothings():
  check "all values in nested array are nothing":
    input = [list:
      nothing,
      [list:
        [list:
          [list: nothing]]],
      nothing,
      nothing,
      [list:
        [list:
          nothing,
          nothing],
        nothing],
      nothing]

    expected = [list: ]

    flatten(input) is expected
  end
end

#|
  Code to run each test. Each line corresponds to a test above and whether it should be run.
  To mark a test to be run, replace `false` with `true` on that same line after the comma.
  test(test-a, true) will be run. test(test-a, false) will be skipped.
|#

data TestRun: test(run, active) end

[list: 
  test(empty-array, true),
  test(no-nesting, false),
  test(nested-array, false),
  test(numeric-array, false),
  test(five-levels, false),
  test(six-levels, false),
  test(omit-a-nothing, false),
  test(omit-nothings-from-beginning, false),
  test(omit-nothings-from-middle, false),
  test(six-levels-with-nothings, false),
  test(all-nothings, false)
].each(lam(t): when t.active: t.run() end end)