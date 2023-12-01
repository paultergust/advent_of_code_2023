def digits(foo):
    nums = []
    for c in foo:
        try:
            nums.append(int(c))
        except:
            continue

    if len(nums) < 1:
        return 0

    a = str(nums[0]) + str(nums[-1])
    return int(a)

if __name__ == "__main__":
    with open("input_1.txt", "r") as f:
        lines = f.readlines()
        calibrations = []
        for line in lines:
            calibrations.append(digits(line))

        print(sum(calibrations))
