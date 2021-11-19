import os
import numpy as np

with open('fail_url.txt', 'r') as f:
    lines = f.readlines()

    failed_nums = []

    for kong_url in lines:
        num = kong_url.split('public/')[1].split('/')[0]
        failed_nums = np.append(failed_nums, num)

with open("fail.txt", 'w') as f:
    for num in  failed_nums:
        f.write(str(num))
        f.write('\n')
