import os
import sys
import numpy as np

def getFailedNums():
    with open('clean-kong/fail.txt', 'r') as f:
        lines = f.readlines()
        failed_nums = []

        for kong_url in lines:
            num = kong_url.split('public/')[1].split('/')[0]
            failed_nums = np.append(failed_nums, num)

    return failed_nums

def getCleanedNums():
    cleaned_nums = []
    for clean_kong in os.listdir('clean_gorillas_2'):
        num = clean_kong.split('_clean')[0]
        cleaned_nums = np.append(cleaned_nums, num)
    #for clean_kong in os.listdir('clean_gorillas'):
        #num = clean_kong.split('_clean')[0]
        #cleaned_nums = np.append(cleaned_nums, num)

    return cleaned_nums

def main():
    failed_nums = getFailedNums()
    cleaned_nums = getCleanedNums()
    skipped_nums = []
    skipped_nums = np.append(skipped_nums, '886')

    for i in range(6833, 14099):
        if str(i) in failed_nums:
            #print(str(i) + " in failed_nums, ignoring")
            continue
        if str(i) not in cleaned_nums:
            #print(str(i) +  " is not cleaned or failed but range has been completed")
            skipped_nums = np.append(skipped_nums, str(i))

    print(skipped_nums)
    print("size:  " + str(len(skipped_nums)))
    for i in range(0, len(skipped_nums), 500):
        skipped_filename = 'skipped_' + str(i) + '.txt'
        with open(skipped_filename, 'w') as f:
            for j in range(i, i+500):
                if (j == len(skipped_nums)):
                    break
                num = skipped_nums[j]
                f.write(str(num))
                f.write('\n')


if __name__ == "__main__":
    main()