"""
Advent of Code 2022: Day 1
https://adventofcode.com/2022/day/1
"""

function get_elf_calories(fpath)
    s = open(FPATH) do f
        s = strip(read(f, String), '\n')
        split(s, "\n\n")
    end
    elf_calories = Int[]
    for i in s
        elf_calories_i = [parse(Int, ss) for ss in split(i, "\n")]
        elf_calories_i_sum = sum(elf_calories_i)
        append!(elf_calories, elf_calories_i_sum)
    end
    sort!(elf_calories, rev=true)
    return elf_calories
end

function sol_a(elf_calories)
    return maximum(elf_calories)
end

function sol_b(elf_calories)
    return sum(elf_calories[1:3])
end

FPATH = "data/01.txt"
# FPATH = "data/01-demo.txt"

elf_calories = get_elf_calories(FPATH)

@time ans_a = sol_a(elf_calories)
println("sol a: ", ans_a)

@time ans_b = sol_b(elf_calories)
println("sol b: ", ans_b)
