"""
Advent of Code 2022: Day 2
https://adventofcode.com/2022/day/2
"""

function rps_score_a(hand_pair)
    if hand_pair == ('A', 'X') # rock, rock
        score = 1 + 3
    elseif hand_pair == ('A', 'Y')
        score = 2 + 6
    elseif hand_pair == ('A', 'Z')
        score = 3 + 0      
    elseif hand_pair == ('B', 'X')
        score = 1 + 0
    elseif hand_pair == ('B', 'Y')
        score = 2 + 3
    elseif hand_pair == ('B', 'Z')
        score = 3 + 6
    elseif hand_pair == ('C', 'X')
        score = 1 + 6
    elseif hand_pair == ('C', 'Y')
        score = 2 + 0
    elseif hand_pair == ('C', 'Z')
        score = 3 + 3
    end
    return score
end

function rps_score_b(hand_pair)
    # X: lose, Y: draw, Z: win
    if hand_pair == ('A', 'X') # rock, lose (scissors)
        score = 3 + 0
    elseif hand_pair == ('A', 'Y') # rock, draw (rock)
        score = 1 + 3
    elseif hand_pair == ('A', 'Z') # rock, win (paper)
        score = 2 + 6
    elseif hand_pair == ('B', 'X') # paper, lose (rock)
        score = 1 + 0
    elseif hand_pair == ('B', 'Y') # paper, draw (paper)
        score = 2 + 3
    elseif hand_pair == ('B', 'Z') # paper, win (scissors)
        score = 3 + 6
    elseif hand_pair == ('C', 'X') # scissors, lose (paper)
        score = 2 + 0
    elseif hand_pair == ('C', 'Y') # scissors, draw (scissors)
        score = 3 + 3
    elseif hand_pair == ('C', 'Z') # scissors, win (rock)
        score = 1 + 6
    end
    return score
end

function read_pairs(fpath)
    s = open(FPATH) do f
        s = readlines(FPATH)
    end
    return [(l[1], l[3]) for l in s]
end

function sol_a(rps_pairs)
    return sum([rps_score_a(p) for p in rps_pairs])
end

function sol_b(rps_pairs)
    return sum([rps_score_b(p) for p in rps_pairs])
end

FPATH = "data/02.txt"
# FPATH = "data/02-demo.txt"

rps_pairs = read_pairs(FPATH)

@time ans_a = sol_a(rps_pairs)
println("sol a: ", ans_a)

@time ans_b = sol_b(rps_pairs)
println("sol b: ", ans_b)